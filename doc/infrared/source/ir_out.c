/*==============================================================================
*   PROJECT NAME   : 赤外線リモコン 学習キット
*   FILE    NAME   : ir_out.c
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===============================================================================*/

/*==============================================================================*/
/*  include                                                                     */
/*==============================================================================*/
#include<pic.h>
#include<string.h>
#include<pic16f887.h>
#include"ir_main.h"
#include"ir_data.h"


/*==============================================================================
*   MODULE        : IR_NEC_ReaderCode_Send
*   FUNCTION      : NEC format に従った Reader Code 送出
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_ReaderCode_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(NEC_READER_ON);      /* 9.0ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low で終了  */
    __delay_us(NEC_READER_OFF);     /* 4.5ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_NEC_DataCode_BitOn_Send
*   FUNCTION      : NEC format に従った Data Code (Bit:ON) 送出
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_DataCode_BitOn_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(NEC_DATA_ON);        /* 0.56ms : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low で終了  */
    __delay_us(NEC_DATA_BITON);     /* 1.7ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_NEC_DataCode_BitOff_Send
*   FUNCTION      : NEC format に従った Data Code (Bit:OFF) 送出
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_DataCode_BitOff_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(NEC_DATA_ON);        /* 0.56ms : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low で終了  */
    __delay_us(NEC_DATA_BITOFF);    /* 0.56ms : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_NEC_DataCode_StopBit_Send
*   FUNCTION      : NEC format に従った Stop Bit 送出
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_DataCode_StopBit_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(NEC_DATA_ON);        /* 0.56ms : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low で終了  */

    return;
}


/*==============================================================================
*   MODULE        : IR_NEC_format
*   FUNCTION      : Key_code に対応した Dataを NEC formatで出力
*   ARGUMENT      : *tbl_p : Function Keyに応じた IR Data の先頭アドレス
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_format(unsigned char* tbl_p)
{
    unsigned char  i, j;

    /* Reader Code Output */
    IR_NEC_ReaderCode_Send();

    /* カスタムコード/データコード (4byte) 出力 */
    for (i=0;i<NEC_CODE_SIZE;i++)
    {
        /* 1bit毎にデータ出力 */
        for(j=0;j<BYTE_SIZE;j++)
        {
            /* Bit ON   */
            if (*(tbl_p + i) & (0x80 >> j)) {
                IR_NEC_DataCode_BitOn_Send();
            }
            /* Bit OFF  */
            else {
                IR_NEC_DataCode_BitOff_Send();
            }
        }
    }
    /* Stop Bit Send */
    IR_NEC_DataCode_StopBit_Send();
    /* 1フレーム終了後の Wait Time  */
    __delay_ms(NEC_DATA_END);

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_ReaderCode_Send
*   FUNCTION      : 家電協 format に従った Reader Code 送出
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_ReaderCode_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(KDN_READER_ON);      /* 3.2ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low で終了  */
    __delay_us(KDN_READER_OFF);     /* 1.6ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_DataCode_BitOn_Send
*   FUNCTION      : 家電協 format に従った Data Code (Bit:ON) 送出
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_DataCode_BitOn_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(KDN_DATA_ON);        /* 0.4ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low で終了  */
    __delay_us(KDN_DATA_BITON);     /* 1.2ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_DataCode_BitOff_Send
*   FUNCTION      : 家電協 format に従った Data Code (Bit:OFF) 送出
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_DataCode_BitOff_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(KDN_DATA_ON);        /* 0.4ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low で終了  */
    __delay_us(KDN_DATA_BITOFF);    /* 0.4ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_DataCode_StopBit_Send
*   FUNCTION      : 家電協 format に従った Stop Bit 送出
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_DataCode_StopBit_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(KDN_DATA_ON);        /* 0.4ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low で終了  */

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_format
*   FUNCTION      : Key_code に対応した Dataを 家電協 formatで出力
*   ARGUMENT      : *tbl_p : Function Keyに応じた Data の先頭アドレス
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_format(unsigned char* tbl_p)
{
    unsigned char  i, j;

    /* Reader Code Output */
    IR_KDN_ReaderCode_Send();

    /* カスタムコード/データコード (6byte) 出力 */
    for (i=0;i<KDN_CODE_SIZE;i++)
    {
        /* 1bit毎にデータ出力 */
        for(j=0;j<BYTE_SIZE;j++)
        {
            /* Bit ON   */
            if (*(tbl_p + i) & (0x80 >> j)) {
                IR_KDN_DataCode_BitOn_Send();
            }
            /* Bit OFF  */
            else {
                IR_KDN_DataCode_BitOff_Send();
            }
        }
    }
    /* Stop Bit Send */
    IR_KDN_DataCode_StopBit_Send();
    /* 1フレーム終了後の Wait Time  */
    __delay_ms(KDN_DATA_END);

    return;
}

/*==============================================================================
*   MODULE        : ir_out_start
*   FUNCTION      : 赤外線フォーマットに従ってリモコンコード送信
*   ARGUMENT      : func_key : 現在設定されているファンクションキー
*                 : key_code : 押下された動作キーの key_code
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void ir_out_start(unsigned char func_key, unsigned char key_code)
{
    unsigned char   format;
    unsigned char*  data_p;

    /* ファンクションキーに対応した */
    /* 赤外線フォーマットを取得     */
    format = ir_format_tbl[func_key];

    /* ファンクションキーに対応した、テーブルデータ先頭アドレス取得 */
    if (func_key == KEY_CODE01) {
        /* ファンクション１のテーブル先頭アドレス   */
        data_p = (unsigned char*)&ir_func1_code_tbl[(key_code-4)][0];
    } else if (func_key == KEY_CODE02) {
        /* ファンクション２のテーブル先頭アドレス   */
        data_p = (unsigned char*)&ir_func2_code_tbl[(key_code-4)][0];
    } else if (func_key == KEY_CODE03) {
        /* ファンクション３のテーブル先頭アドレス   */
        data_p = (unsigned char*)&ir_func3_code_tbl[(key_code-4)][0];
    } else {
        /* ファンクション４のテーブル先頭アドレス   */
        data_p = (unsigned char*)&ir_func4_code_tbl[(key_code-4)][0];
    }

    /* フォーマット毎に違う送信処理を呼び出す   */
    if (format == FORM_NEC) {
        /* NEC      */
        IR_NEC_format(data_p);
    } else {
        /* 家電協   */
        IR_KDN_format(data_p);
    }
    return;
}



