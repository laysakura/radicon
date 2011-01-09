/*==============================================================================
*   PROJECT NAME   : 赤外線リモコン 学習キット
*   FILE    NAME   : ir_main.c
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===============================================================================*/

/*==============================================================================*/
/*  include                                                                     */
/*==============================================================================*/
#include<pic.h>
#include<string.h>
#include<pic16f887.h>
#include"ir_main.h"
#include"lcd.h"
#include"ir_out.h"
#include"ir_in.h"
#include"ir_data.h"

/*==============================================================================*/
/*  コンフィグレーション                                                        */
/*==============================================================================*/
/* 内部クロック発振(RA7/RA6:I/O), ウォッチドッグタイマ未使用    */
/* パワーアップタイマ未使用, MCLR使用                           */
/* ブラウンアウトリセット未使用, 低電圧プログラム未使用         */
__CONFIG(INTIO & WDTDIS & PWRTDIS & MCLREN & BORDIS & LVPDIS);

/*==============================================================================*/
/*  プロトタイプ宣言                                                            */
/*==============================================================================*/
unsigned char key_input_check(void);            /* Key Check 処理               */
void led_control(unsigned char led_state);      /* LED 制御処理                 */
void motion_control(unsigned char motion_state);      /* LED 制御処理               */    /* masa */
void cpu_sleep(void);                           /* Sleep ⇔ Wake Up 処理        */

/*==============================================================================*/
/*  グローバル変数宣言                                                          */
/*==============================================================================*/
unsigned char   rcv_data[TBL_CODE_SIZE];        /* 受信データ                   */
unsigned char   pre_data[TBL_CODE_SIZE];        /* 受信データ比較用             */
unsigned char   rx_format;                      /* 受信データフォーマット種別   */
unsigned char   eep_rdata[EEPROM_TABLE_SIZE];   /* EEPROM読出し用RAM領域        */
EEP_DATA        eep_wdata;                      /* EEPROM保存用 RAM領域         */

/*==============================================================================
*   MODULE        : key_input_check
*   FUNCTION      : KEY入力をキーマトリクスにて検出(KEY Output:4PIN)
*   ARGUMENT      : none
*   RETURN        : code : キー押下状態（押下されていれば Key_Codeを返す）
*   NOTE          : Key Output Pin を Hi にして Key Input Pin をチェック
*===============================================================================*/
unsigned char key_input_check(void)
{
    unsigned char   code = KEY_OFF; /* Code を Key Off で初期化     */
    unsigned char   i;              /* チェック数カウンタ           */

    PORTB = 0x00;                   /* Outout Pin : ALL Low */

    for (i=0; i<KEY_INPUT_NUM; i++) {
        switch (i) {
          case 0:
            PORTB |= KEY_OUT_0;     /* Output Pin 0 : Hi    */
            __delay_us(10);         /* 一応安定化待ち       */
            /* Hi になる Input PIN により Key Code 決定     */
            if (PORTA & KEY_IN_0) {
                code = KEY_CODE01;
            } else if (PORTA & KEY_IN_1) {
                code = KEY_CODE02;
            } else if (PORTA & KEY_IN_2) {
                code = KEY_CODE03;
            } else if (PORTA & KEY_IN_3) {
                code = KEY_CODE04;
            }
            PORTB &= ~KEY_OUT_0;    /* Output Pin 0 : Low   */
            break;

          case 1:
            PORTB |= KEY_OUT_1;     /* Output Pin 1 : Hi    */
            __delay_us(10);         /* 一応安定化待ち       */
            /* Hi になる Input PIN により Key Code 決定     */
            if (PORTA & KEY_IN_0) {
                code = KEY_CODE05;
            } else if (PORTA & KEY_IN_1) {
                code = KEY_CODE06;
            } else if (PORTA & KEY_IN_2) {
                code = KEY_CODE07;
            } else if (PORTA & KEY_IN_3) {
                code = KEY_CODE08;
            }
            PORTB &= ~KEY_OUT_1;    /* Output Pin 1 : Low   */
            break;

          case 2:
            PORTB |= KEY_OUT_2;     /* Output Pin 2 : Hi    */
            __delay_us(10);         /* 一応安定化待ち       */
            /* Hi になる Input PIN により Key Code 決定     */
            if (PORTA & KEY_IN_0) {
                code = KEY_CODE09;
            } else if (PORTA & KEY_IN_1) {
                code = KEY_CODE10;
            } else if (PORTA & KEY_IN_2) {
                code = KEY_CODE11;
            } else if (PORTA & KEY_IN_3) {
                code = KEY_CODE12;
            }
            PORTB &= ~KEY_OUT_2;    /* Output Pin 2 : Low   */
            break;

          case 3:
            PORTB |= KEY_OUT_3;     /* Output Pin 3 : Hi    */
            __delay_us(10);         /* 一応安定化待ち       */
            /* Hi になる Input PIN により Key Code 決定     */
            if (PORTA & KEY_IN_0) {
                code = KEY_CODE13;
            } else if (PORTA & KEY_IN_1) {
                code = KEY_CODE14;
            } else if (PORTA & KEY_IN_2) {
                code = KEY_CODE15;
            } else if (PORTA & KEY_IN_3) {
                code = KEY_CODE16;
            }
            PORTB &= ~KEY_OUT_3;    /* Output Pin 3 : Low   */
            break;
        }
        if (code != KEY_OFF) {
            break;  /* 何れかのキーを認識したら即時終了     */
        }
    }
    return code;
}


/*==============================================================================
*   MODULE        : led_control
*   FUNCTION      : LED全消灯 / 指定された LED の点灯処理
*   ARGUMENT      : led_state : LED 点灯/消灯指定
*   RETURN        : none
*   NOTE          : LED の消灯は ALL OFF のみ
*===============================================================================*/
void led_control(unsigned char led_state)
{
    PORTC &= ALL_OFF;               /* まずは全消灯 */
    if (led_state != ALL_OFF) {
        PORTC |= led_state;         /* 点灯の必要がある LED を点灯  */
    }
}

void motion_control(unsigned char motion_state)/*This is written by masa*/
{
    PORTB = motion_state;         /* 点灯の必要がある LED を点灯  */
}


/*==============================================================================
*   MODULE        : cpu_sleep
*   FUNCTION      : CPU Sleep ⇔ Wake Up 処理
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void cpu_sleep(void)
{
    PORTA = 0x0F;   /* Key Input/Output : Hi        */
    PORTB = 0x3C;   /* Key Input/Output : Hi        */

    INTEDG  = 1;    /* INTピンの立上りで割込み発生  */
    INTF    = OFF;  /* 外部割込みフラグ クリア      */
    INTE    = ON;   /* INTピン 外部割込み許可       */

    asm("sleep");   /* 外部割込み発生まで SLEEP状態 */

    __delay_ms(1);  /* SLEEP復帰後 1命令空ける      */
    INTF    = OFF;  /* 外部割込みフラグ クリア      */
    INTE    = OFF;  /* INTピン 外部割込み禁止       */

    return;
}



/*==============================================================================
*   MODULE        : main
*   FUNCTION      : IR Remocon リモコンメイン関数
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void main()
{
    unsigned char   i;              /* LED 点滅回数カウンタ         */
    unsigned char   ir_state;       /* 受信状態 (成功/不明/ノイズ)  */
    unsigned char   key_code;       /* キーコード取得用             */
    unsigned char   func_key_type;  /* ファンクションキー種別       */
    unsigned char   eep_offset;     /* EEPROM保存先 オフセット      */


    /* PORT A/B/C 入出力設定 (1b:Input 0b:Output)   */
    TRISA   = 0xCF; /* Port A 入出力設定            */
	TRISB   = 0x00; /* Port B 入出力設定            */    /* masa すべてのPORTをOUTPUTにする。*/
    //TRISB   = 0xC1; /* Port B 入出力設定            */
    TRISC   = 0x81; /* Port C 入出力設定            */

    /* A/Dコンバータ設定                            */
    ADCON0  = 0x00; /* ADコンバータ電源OFF(未使用)  */
    ANSEL   = 0x00; /* AN0~AN7  Pin Digital I/O     */
    ANSELH  = 0x00; /* AN8~AN13 Pin Digital I/O     */

    /* コンパレータ設定                             */
    CM1CON0 = 0x07; /* Comparator 1 Disable         */
    CM2CON0 = 0x07; /* Comparator 2 Disable         */

    /* キャリア周波数設定 (PWM用 TIMER2 の設定)     */
    PR2     = 0x19; /* 38KHz (1cycle = 25~26us)     */
    T2CON   = 0x0C; /* Postscaler   -> 1:2          */
                    /* Timer2       -> ON           */
                    /* Prescaler    -> 1            */
    CCPR2L  = 0x0C; /* Duty         -> 50% (0x32)   */
                    /* CCPR2L:1100b                 */
                    /* CCP2CON(bit5~4):10b->110010b */
    CCP2CON = PWM_STOP; /* PWM      -> OFF          */
                        /* 2LSB of duty cycle->10b  */

    /* 受信データ解析用 TIMER1 設定                 */
    T1CON   = 0x01; /* Prescaler      -> 1:1 (65ms) */
                    /* Clock Source   -> Internal   */
                    /* Timer1        -> Start       */
    TMR1L   = 0;    /* Timer1 Value MSB 8bit Clear  */
    TMR1H   = 0;    /* Timer1 Value LSB 8bit Clear  */
    TMR1IF  = 0;    /* Timer1 Interrupt Flag Clear  */
    TMR1IE  = 1;    /* Timer1 Interrupt Enable      */

    /* Port 初期化 */
    PORTA   = 0x00; /* PortA RA7~0:Lo               */
    PORTB   = 0x00; /* PortB RB7~1:Lo    RB0:Hi     */    /* masa */
	//PORTB   = 0x01; /* PortB RB7~1:Lo    RB0:Hi     */
    PORTC   = 0x01; /* PortC RC7~1:Lo    RC0:Hi     */

    /****************************************************************/
    /* Dip SW が両方 Hi ⇒ 送信モード                               */
    /****************************************************************/
    if ((PORTA & MODE_MASK) == RUN_MODE_1) {
        /* Function Type Init (Function 1 で初期化) */
        func_key_type = KEY_CODE01;
        /* Function1 LED On */
        led_control(LED_MASK);

        for (;;)
        {
            /* Key Check */
            key_code = key_input_check();

            /* Key 押下なし -> CPU Sleep    */
            if (key_code == KEY_OFF) {
                /* CPU Sleep -> Wake Up     */
                cpu_sleep();
            }
            /* Key 押下あり -> 何れかの動作 */
            else {
                /* Function Key 押下された  */
                if (key_code <= KEY_CODE04) {
                    /* Function Type 保持   */
                    func_key_type = key_code;
                    /* 対応した LED On      */
                    led_control((LED_MASK << key_code));
                }
                /* 動作キーが押下された     */
                else {
                    /* 対応したコードを送信 */
                    ir_out_start(func_key_type, key_code);
                }
            }
        }
    }

    /****************************************************************/
    /* Dip SW 1:Lo  Dip SW 2:Hi ⇒ 受信モード (EEPROMへの保存)      */
    /****************************************************************/
    if ((PORTA & MODE_MASK) == RUN_MODE_2) {
        /* Function LED All Off */
        led_control(ALL_ON);

        for (;;) {
            /* Key Check */
            key_code = key_input_check();
            /* Function Key が押されたら受信モードへ    */
            if (key_code <= KEY_CODE04) {
                /* Function Key Code 保持               */
                func_key_type = key_code;
                /* Key に対応した LED 点灯              */
                led_control((LED_MASK << key_code));
                break;
            } else {
                /* Key 押下されるまでチェックを続ける   */
                ;
            }
        }

        /* 何か受信するまでIRチェック */
        for (;;) {
            /* 赤外線コード受信                         */
            ir_state = ir_recieve();
            /* 受信成功 (NEC/家電協フォーマット)        */
            if (ir_state == SUCCESS) {
                /* LED制御 & データ保存処理へ遷移       */
                break;
            }
            /* 不明のフォーマットを受信                 */
            else if (ir_state == UNKNOWN) {
                for (;;) {
                    /* 電源OFFまで 150ms 間隔で全LED点滅    */
                    led_control(ALL_OFF);
                    __delay_ms(150);
                    led_control(ALL_ON);
                    __delay_ms(150);
                }
            }
            /* 何らかのノイズを受信                     */
            else {
                /* もう一度受信処理                     */
                ;
            }
        }

        /* 受信完了状態通知 */
        for (i=0; i<2; i++) {
            /* 選択した Key に対応した LED 点滅 (2回)   */
            /* 150ms 間隔で点滅                         */
            led_control(ALL_OFF);
            __delay_ms(150);
            led_control((LED_MASK << func_key_type));
            __delay_ms(150);
        }
        /* IR format 一時保持       */
        eep_wdata.format = rx_format;
        /* 受信データ一時保持       */
        memcpy(&eep_wdata.data, &rcv_data, sizeof(rcv_data));
        /* EEPROM 書込み先取得      */
        eep_offset = (key_code * EEPROM_DATA_SIZE);
        /* FormatをEEPROMへ書込み   */
        EEPROM_WRITE(eep_offset, eep_wdata.format);
        /* 書込んだ分オフセット移動 */
        eep_offset++;
        /* DataCodeをEEPROMへ書込み */
        for (i=0; i < TBL_CODE_SIZE; i++) {
            /* HI-TECH C 標準関数   */
            /* 1byte ずつ書込み     */
            EEPROM_WRITE((eep_offset + i), eep_wdata.data[i]);
        }
        /* IR Data 記録後無限ループ */
        for (;;);
    }

    /****************************************************************/
    /* Dip SW 1:Hi  Dip SW 2:Lo ⇒ 学習モード (EEPROM Data 送信)    */
    /****************************************************************/
    if ((PORTA & MODE_MASK) == RUN_MODE_3) {
        /* EEPROM Data を RAM へ展開 */
        for (i = 0; i < EEPROM_TABLE_SIZE; i++) {
            eep_rdata[i] = EEPROM_READ(i);
        }

        for (;;)
        {
            /* Key Check */
            key_code = key_input_check();

            /* KEYが押されてなかったらSleepにする   */
            if (key_code == KEY_OFF) {
                /* CPU Sleep -> Key INT -> Wake Up  */
                cpu_sleep();
            }
            else {
                /* Function Key (4つ) のみ対応      */
                if (key_code <= KEY_CODE04) {
                    /* Key に対応したRAM読込先取得  */
                    eep_offset = (key_code * EEPROM_DATA_SIZE);
                    /* Data存在する場合のみ送信     */
                    if ((eep_rdata[eep_offset] == FORM_NEC) ||
                        (eep_rdata[eep_offset] == FORM_KDN)) {
                        /* 送信中 -> 対応したLED On */
                        led_control((LED_MASK << key_code));
                        /* フォーマット -> NEC      */
                        if (eep_rdata[eep_offset] == FORM_NEC) {
                            /* Keyに対応したDataを  */
                            /* NEC formatで送信     */
                            /* 読込んだ分オフセット移動 */
                            eep_offset++;
                            IR_NEC_format((unsigned char*)&eep_rdata[eep_offset]);
                        }
                        /* フォーマット -> 家電協   */
                        else {
                            /* Keyに対応したDataを  */
                            /* 家電協 formatで送信  */
                            /* 読込んだ分オフセット移動 */
                            eep_offset++;
                            IR_KDN_format((unsigned char*)&eep_rdata[eep_offset]);
                        }
                        /* 送信終了 -> LED Off      */
                        led_control(ALL_OFF);
                    }
                }
            }
        }
    }
    /****************************************************************/
    /* Dip SW 1:Lo  Dip SW 2:Lo ⇒ LCD表示モード                   */
	/* このモードがmainの役目を果たす                              */
    /****************************************************************/
    if ((PORTA & MODE_MASK) == RUN_MODE_4) {
        /* LCD Initialize       */
        lcd_init();
        /* IR 比較データ初期化  */
        memset(&pre_data, 0x00, sizeof(pre_data));
        for (;;)
        {
            /* IR受信 */
            ir_state = ir_recieve();

        	
        	/*以下がmotion controlを制御するpart  masa */
        	switch(rcv_data[5]){
        	case FORWARD:
        		motion_control(MOVE_FORWARD);
        		break;
        	case BACKWARD:
        		motion_control(MOVE_BACKWARD);
        		break;
        	case STOP:
        		motion_control(MOVE_STOP);
        		break;
        	case LEFT:
        		motion_control(MOVE_LEFT);
        		break;
        	case RIGHT:
        		motion_control(MOVE_RIGHT);
        		break;
        	}
        	/* ここまで   masa  */
        	
        	
        	/* 受信データと比較データが異なる場合のみ表示を更新         */
//            if ((memcmp(&pre_data, &rcv_data, sizeof(rcv_data))) != 0) {    /* comment out 開放 masa  */
            if ((memcmp(&pre_data, &rcv_data, sizeof(rcv_data))) != 0) {
                if (ir_state == SUCCESS) {
                    lcd_clear();                    /* LCD All Clear        */
                    lcd_put_ir_format(rx_format);   /* IR format Type 表示  */
                    switch (rx_format) {
                      case FORM_NEC:        /* 受信コード = NEC format      */
                        /* NEC format の IR 受信データ表示                  */
                        lcd_put_ir_data(&rcv_data, FORMAT_DISP_SIZE_NEC);
                        break;
                      case FORM_KDN:        /* 受信コード = 家電協 format   */
                        /* 家電協 format の IR 受信データ表示               */
                        lcd_put_ir_data(&rcv_data, FORMAT_DISP_SIZE_KDN);
                        break;
                      default:              /* 受信コード = 未対応 format   */
                        break;
                    }
                } else if (ir_state == UNKNOWN) {
                    /* 未対応 format の IR 受信データ表示               */
                    lcd_clear();                    /* LCD All Clear        */
                    lcd_put_ir_format(FORM_UKN);   /* IR format Type 表示  */
//                    lcd_put_ir_data(&rcv_data, FORMAT_DISP_SIZE_UKN);
                } else {
                    ;   /* ノイズの為、もう一度受信処理 */
                }
                /* IR 比較データ保持 */
                memcpy(&pre_data, &rcv_data, sizeof(rcv_data));
            }
        }
    }
}


