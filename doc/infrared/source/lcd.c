/*==========================================================================
*   PROJECT NAME   : 赤外線リモコン 学習キット
*   FILE    NAME   : lcd.c
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===========================================================================*/

/*==============================================================================*/
/*  include                                                                     */
/*==============================================================================*/
#include"lcd.h"
#include<pic.h>
#include<string.h>
#include<pic16f887.h>


/*==============================================================================
*   MODULE        : lcd_init
*   FUNCTION      : LCD Driver 初期化処理
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_init(void)
{
    /* 8bit通信モード    */
    __delay_ms(20);             /* wait:15ms以上*/
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LED_INIT_8BIT;     /* 4bit 送信    */
    toggle_E();                 /* Eパルス生成  */
    __delay_ms(5);              /* wait:5ms以上 */

    /* 8bit通信モード    */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LED_INIT_8BIT;     /* 4bit 送信    */
    toggle_E();                 /* Eパルス生成  */
    __delay_us(100);            /* wait:100u以上*/

    /* 8bit通信モード    */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LED_INIT_8BIT;     /* 4bit 送信    */
    toggle_E();                 /* Eパルス生成  */
    __delay_us(100);            /* wait:100u以上*/

    /* 4bit通信モードへ  */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LED_INIT_4BIT;     /* 4bit 送信    */
    toggle_E();                 /* Eパルス生成  */
    __delay_us(100);            /* wait:100u以上*/

    /* イニシャルセット */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INIT_FC_MSB;   /* 上位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INIT_FC_LSB;   /* 下位4bit送信 */
                                /* 4bit通信/2行表示/5*7dotフォント  */
    toggle_E();                 /* Eパルス生成  */
    __delay_us(100);            /* wait:100u以上*/

    /* 表示モード       */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INICON_MSB;    /* 上位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    PORTC &= LCD_BITD_CLR;      /* 下位4bit送信 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INICON_LSB;    /* 上位4bit送信 */
                                /* 表示OFF/カーソルOFF/ブリンクOFF  */
    toggle_E();                 /* Eパルス生成  */
    __delay_us(100);            /* wait:100u以上*/

    /* 表示クリア       */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CLR_MSB;       /* 上位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CLR_LSB;       /* 下位4bit送信 */
                                /* 表示クリア   */
    toggle_E();                 /* Eパルス生成  */
    __delay_ms(2);              /* wait:1.7m以上*/

    /* 移動モード       */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INIT_ENT_MSB;  /* 上位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INIT_ENT_LSB;  /* 下位4bit送信 */
                                /* インクリメント/表示移動なし      */
    toggle_E();                 /* Eパルス生成  */
    __delay_us(100);            /* wait:100u以上*/

    /* 表示モード       */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CON_MSB;       /* 上位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CON_LSB;       /* 下位4bit送信 */
                                /* 表示OON/カーソルOFF/ブリンクOFF      */
    toggle_E();                 /* Eパルス生成  */
    __delay_us(100);            /* wait:100u以上*/

    return;
}


/*==============================================================================
*   MODULE        : lcd_clear
*   FUNCTION      : LCD 全消去
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_clear(void)
{
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CLR_MSB;       /* 上位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CLR_LSB;       /* 下位4bit送信 */
                                /* 表示クリア   */
    toggle_E();                 /* Eパルス生成  */
    __delay_ms(2);              /* wait:1.7m以上*/

    return;
}


/*==============================================================================
*   MODULE        : lcd_goto_posi
*   FUNCTION      : DD RAM アドレス指定
*   ARGUMENT      : addr : LCD へ表示したいアドレス
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_goto_posi(unsigned char addr)
{
    unsigned char   temp;

    temp = (addr & 0xF0);       /* アドレス取得 */
    temp = (temp >> 2);         /* データシフト */
    temp |= 0x20;               /* 固定データ   */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= temp;              /* 上位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    temp = (addr & 0x0F);       /* アドレス取得 */
    temp = (temp << 2);         /* データシフト */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= temp;              /* 下位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    __delay_us(40);             /* wait:40u以上 */

    return;
}


/*==============================================================================
*   MODULE        : lcd_put_char
*   FUNCTION      : Data を LCD へ表示
*   ARGUMENT      : data : LCD へ表示したい Data (ASCII コード)
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_put_char(unsigned char data)
{
    unsigned char   temp;

    temp = (data & 0xF0);       /* ASCII取得    */
    temp = (temp >> 2);         /* データシフト */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 1;                 /* RS -> Low    */
    PORTC |= temp;              /* 上位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    temp = (data & 0x0F);       /* ASCII取得    */
    temp = (temp << 2);         /* データシフト */
    PORTC &= LCD_BITD_CLR;      /* PortC 初期化 */
    BIT_RS = 1;                 /* RS -> Low    */
    PORTC |= temp;              /* 下位4bit送信 */
    toggle_E();                 /* Eパルス生成  */
    __delay_us(40);             /* wait:40u以上 */

    return;
}

/*==============================================================================
*   MODULE        : lcd_put_hex
*   FUNCTION      : Data を16進数として LCD へ表示
*   ARGUMENT      : data : LCD へ表示したい Data (16進数値)
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_put_hex(unsigned char data)
{
    unsigned char   hi, lo;

    /* 上位 4bit 取出し */
    hi = (data & 0xF0);
    hi = (hi >> 4);
    /* ASCII コード変換 */
    hi = (hi + '0');    /* 0x00~0x90        */
    if (hi > '9') {     /* 0xA0~0xF0        */
        hi = (hi + 7);
    }

    /* 上位 4bit 取出し */
    lo = (data & 0x0F);
    /* ASCII コード変換 */
    lo = (lo + '0');    /* 0x00~0x09        */
    if (lo > '9') {     /* 0x0A~0x0F        */
        lo = (lo + 7);
    }
    lcd_put_char(hi);   /* 上位 4bit 表示   */
    lcd_put_char(lo);   /* 下位 4bit 表示   */

    return;
}

/*==============================================================================
*   MODULE        : lcd_put_ir_format
*   FUNCTION      : 受信した IR format 種別を LCD へ表示
*   ARGUMENT      : format : 受信した IR format 種別
*   RETURN        : none
*   NOTE          : 1行目の左端へ表示
*===============================================================================*/
void lcd_put_ir_format(unsigned char format)
{
    unsigned char nec[3] = {0x4E, 0x45, 0x43};          /* "NEC"        */
    unsigned char ukn[7] = {0x55, 0x4E, 0x4B, 0x4E,     /* "UNKNOWN"    */
                            0x4F, 0x57, 0x4E};
    unsigned char kdn[8] = {0x4B, 0x41, 0x44, 0x45,     /* "KADENKYO"   */
                            0x4E, 0x4B, 0x59, 0x4F};
    unsigned char i;

    /* IR format Type は1行目に表示 */
    lcd_goto_posi(0x00);

    switch (format) {
      case FORM_NEC:
        /* "NEC" 表示       */
        for (i = 0; i < FORMAT_CHAR_NEC; i++) {
            lcd_put_char(nec[i]);
        }
        break;
      case FORM_KDN:
        /* "KADENKYO" 表示  */
        for (i = 0; i < FORMAT_CHAR_KDN; i++) {
            lcd_put_char(kdn[i]);
        }
        break;
      default:
        /* "UNKNOWN" 表示   */
        for (i = 0; i < FORMAT_CHAR_UKN; i++) {
            lcd_put_char(ukn[i]);
        }
        break;
    };

    return;
}


/*==============================================================================
*   MODULE        : lcd_put_ir_data
*   FUNCTION      : 受信した IR Data を LCD へ表示
*   ARGUMENT      : ir_data : 表示を行う16進数値 先頭アドレス
*                 : size    : 表示を行う Data Size
*   RETURN        : none
*   NOTE          : 2行目の左端へ表示
*===============================================================================*/
void lcd_put_ir_data(unsigned char* ir_data, unsigned char size)
{
    unsigned char   i;
    unsigned char   ir_char;

    if (size > 0x00) {
        /* IR Data は2行目に表示    */
        lcd_goto_posi(0x40);

        /* size 分 ASCII コードへ変換しながら表示   */
        for (i = 0; i < size; i++) {
            ir_char = *ir_data;     /* Data 取出し  */
            lcd_put_hex(ir_char);   /* LCD 表示     */
            ir_data++;              /* アドレス Up  */
        }
    }
    return;
}


/*==============================================================================
*   MODULE        : toggle_E
*   FUNCTION      : E 端子 Hパルス処理
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : Data Sheet -> MIN:280ns
*===============================================================================*/
void toggle_E(void)
{
    /* CPU:4MHz -> 実測 980ns   */
    /* 2サイクル 使用してる？   */
    BIT_E = 1;      /* E=1 */
    BIT_E = 0;      /* E=0 */

    return;
}

