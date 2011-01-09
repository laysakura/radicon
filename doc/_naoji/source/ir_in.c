/*==============================================================================
*   PROJECT NAME   : 赤外線リモコン 学習キット
*   FILE    NAME   : ir_in.c
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===============================================================================*/

/*==============================================================================*/
/*  include                                                                     */
/*==============================================================================*/
#include<pic.h>
#include<string.h>
#include<pic16f887.h>
#include"ir_main.h"

/*==============================================================================*/
/*  グローバル変数宣言                                                          */
/*==============================================================================*/
extern unsigned char   rcv_data[TBL_CODE_SIZE];    /* IR 受信受信データ         */
extern unsigned char   pre_data[TBL_CODE_SIZE];    /* IR 比較用データ           */
extern unsigned char   rx_format;                  /* IR フォーマット種別       */

/*==============================================================================
*   MODULE        : Timer_Reset
*   FUNCTION      : Timer 1 Reset (Timer 値 / 割込み Flag 初期化)
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void Timer_Reset(void)
{
    TMR1L   = 0;        /* Timer Value MSB 8bit Clear   */
    TMR1H   = 0;        /* Timer Value LSB 8bit Clear   */
    TMR1IF  = 0;        /* Timer 1 Interrupt Flag Clear */
    TMR1IE  = 1;        /* Timer 1 Interrupt Enable     */
    return;
}


/*==============================================================================
*   MODULE        : ir_recieve
*   FUNCTION      : 赤外線受信処理
*   ARGUMENT      : none
*   RETURN        : 受信状態
*                 :     対応可能な赤外線フォーマット    -> 受信成功
*                 :     未対応の赤外線フォーマット      -> 不明なフォーマット
*                 :     リーダーコードの部分が1ms以下   -> ノイズ or リピートコード
*   NOTE          : 受信側では信号が反転しています
*                 :     送信側で Hi の部分が 受信側では Low になります
*===============================================================================*/
unsigned char ir_recieve(void)
{
    unsigned char   i;
    unsigned char   s_data;
    unsigned char   time_out;

    /* 受信データ初期化 */
    memset(&rcv_data, 0x00, sizeof(rcv_data));

    /***********************************************************
    *   IRデータ入力待ち
    ************************************************************/
    /* IR_IN が Low になるまで回る      */
    /* リーダーコードの開始を監視する   */
    while (PORTC & 0x01);

    /***********************************************************
    *   リーダーコード検出（判定）
    ************************************************************/
    /* Low 時間測定開始 -> Timer Reset          */
    Timer_Reset();
    /* IR_IN が Hi になるまで回る               */
    /* リーダーコードの最初の Hi 終了を監視     */
    while (!(PORTC & 0x01));

    /* Low の長さによりフォーマットを判定       */
    /* 規定値よりマージンを持って判定しています */
    if ((TMR1H >= 0x0C) && (TMR1H <= 0x10)) {
        /* Low：2.5ms以上 4.5ms以下  ⇒ 家電協  */
        rx_format = FORM_KDN;
    } else if ((TMR1H >= 0x1F) && (TMR1H <= 0x27)) {
        /* Low：8.0ms以上 10.0ms以下 ⇒ NEC     */
        rx_format = FORM_NEC;
    } else if (TMR1H >= 0x04) {
        /* 上記の判定に当てはまらずに 1.0ms以上 */
        /* 対応可能なフォーマットではない       */
        return UNKNOWN;
    } else {
        /* 1.0ms未満 => ノイズだと思われる      */
        return FAIL;
    }
    /* NECフォーマットの場合のみリーダーコードの Low 測定   */
    /* リピートコードだった場合は無視する                   */
    Timer_Reset();
    while (PORTC & 0x01);
    if ((rx_format == FORM_NEC) && (TMR1H <=0x0F)) {
            return FAIL;
    }

    /***********************************************************
    *   データコード判定（デコード）
    ************************************************************/
    s_data = 0x01;  /* Shift Data 2byte以上の Shift が出来ない */

    /* NEC format   */
    if (rx_format == FORM_NEC) {
        /* 32bit分繰り返す      */
        for (i = 0; i < 32; i++) {
            /* Hi 時間で bit 判定               */
            /* IR_IN の Lo を読み飛ばす         */
            while (!(PORTC & 0x01));

            /* Hi 時間測定開始 -> Timer Reset   */
            Timer_Reset();
            while (PORTC & 0x01);

            /* Hi が 1ms 以上続いた -> 1b       */
            if (TMR1H >= 0x04) {
                /* 1byte */
                if (i<8) {
                    rcv_data[0] |= ((s_data & 0x01) << (7 - i));
                }
                /* 2byte */
                else if (i<16) {
                    rcv_data[1] |= ((s_data & 0x01) << (7 - (i-8)));
                }
                /* 3byte */
                else if (i<24) {
                    rcv_data[2] |= ((s_data & 0x01) << (7 - (i-16)));
                }
                /* 4byte */
                else {
                    rcv_data[3] |= ((s_data & 0x01) << (7 - (i-24)));
                }
            } else {
                ;   /* 0b */
            }
        }
    }
    /* 家電協 format    */
    else if (rx_format == FORM_KDN) {
        /* 48bit    */
        for (i = 0; i < 48; i++) {
            /* 家電協 format は IR_IN : Hi 時間で bit 判定 */
            /* 従って、IR_IN の Lo を読み飛ばす        */
            while (!(PORTC & 0x01));

            /* Hi 時間測定開始 -> Timer Reset   */
            Timer_Reset();
            while (PORTC & 0x01);

            /* Hi が 800us 以上続いた -> 1b     */
            if (TMR1H >= 0x03) {
                /* 1byte */
                if (i<8) {
                    rcv_data[0] |= ((s_data & 0x01) << (7 - i));
                }
                /* 2byte */
                else if (i<16) {
                    rcv_data[1] |= ((s_data & 0x01) << (7 - (i-8)));
                }
                /* 3byte */
                else if (i<24) {
                    rcv_data[2] |= ((s_data & 0x01) << (7 - (i-16)));
                }
                /* 4byte */
                else if (i<32) {
                    rcv_data[3] |= ((s_data & 0x01) << (7 - (i-24)));
                }
                /* 5byte */
                else if (i<40) {
                    rcv_data[4] |= ((s_data & 0x01) << (7 - (i-32)));
                }
                /* 6byte */
                else {
                    rcv_data[5] |= ((s_data & 0x01) << (7 - (i-40)));
                }
            } else {
                ;   /* 0b */
            }
        }
    }
    /* IR_IN の Lo を読み飛ばす (STOP Bit)  */
    while (!(PORTC & 0x01));
    /* Hi 時間測定開始 -> Timer Reset       */
    Timer_Reset();
    /* STOP bit 以降の Data 送信有無確認    */
    while (PORTC & 0x01) {
        /* 規定時間内に Data 無し -> 正常   */
        if (TMR1H >= 0x08) {
            return SUCCESS;
        }
    };
    return UNKNOWN;
}

