/*==========================================================================
*   PROJECT NAME   : 赤外線リモコン 学習キット
*   FILE    NAME   : lcd.h
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===========================================================================*/

/*==========================================================================*/
/*  Delay関数用 PIC動作周波数定義                                           */
/*==========================================================================*/
#define _XTAL_FREQ 4000000

/*==========================================================================*/
/*  GPIO PIN 定義                                                           */
/*  ※Bit:RW は回路設計にて Low 固定となり、PICマイコンに接続されていません */
/*==========================================================================*/
/* GPIO定義 (PORT A) */
#define BIT_RS      RA4             /* Bit:RS       */
#define BIT_E       RA5             /* Bit:E        */

/* GPIO定義 (PORT C) */
#define BIT_D4      RC2             /* DataBit:4    */
#define BIT_D5      RC3             /* DataBit:5    */
#define BIT_D6      RC4             /* DataBit:6    */
#define BIT_D7      RC5             /* DataBit:7    */

#define TRIS_LCD    0xC3            /* PORTC 入出力設定 0:出力  1:入力      */

/*==========================================================================*/
/*  インストラクションコマンド定義                                          */
/*==========================================================================*/
/* PORTC MASK Data      */
#define LCD_BITD_CLR            0xC3
/* 表示クリア           */
#define LCD_CLR_MSB             0x00
#define LCD_CLR_LSB             0x04        /* LCD All Clear                */
/* コマンド転送モード   */
#define LED_INIT_8BIT           0x0C        /* 8bit 転送                    */
#define LED_INIT_4BIT           0x08        /* 4bit 転送                    */
/* イニシャルセット     */
#define LCD_INIT_FC_MSB         0x08        /* 4bit 転送                    */
#define LCD_INIT_FC_LSB         0x20        /* 2行表示 / 5*7dot             */
/* 表示モード:LCD OFF   */
#define LCD_INICON_MSB          0x00
#define LCD_INICON_LSB          0x20        /* LCD:OFF/Cursor:OFF/Blink:OFF */
/* 移動モード           */
#define LCD_INIT_ENT_MSB        0x00
#define LCD_INIT_ENT_LSB        0x18        /* Cursor インクリメント        */
/* 表示モード:LCD ON    */
#define LCD_CON_MSB             0x00
#define LCD_CON_LSB             0x30        /* LCD:ON/Cursor:OFF/Blink:OFF  */

/*==========================================================================*/
/*  フォーマット種別宣言  ※akizuki.h と同じ値とする (includeでもOK)        */
/*==========================================================================*/
#define FORM_NEC                0x10        /* NEC format                   */
#define FORM_KDN                0x20        /* 家電協 format                */

/*==========================================================================*/
/*  IR Data LCD 表示文字数定義                                              */
/*==========================================================================*/
#define FORMAT_DISP_SIZE_NEC    0x04        /* NEC format    4byte          */
#define FORMAT_DISP_SIZE_KDN    0x06        /* 家電協 format 6byte          */
#define FORMAT_DISP_SIZE_UKN    0x00        /* 未対応 format   2byte        */

/*==========================================================================*/
/*  フォーマット種別 LCD 表示文字数定義                                     */
/*==========================================================================*/
#define FORMAT_CHAR_NEC         0x03        /* NEC format    "NEC"          */
#define FORMAT_CHAR_KDN         0x08        /* 家電協 format "KADENKYO"     */
#define FORMAT_CHAR_UKN         0x07        /* SONY format   "UNKNOWN"      */

/*==========================================================================*/
/*  プロトタイプ宣言                                                        */
/*==========================================================================*/
void lcd_init(void);
void lcd_clear(void);
void lcd_goto_posi(unsigned char addr);
void lcd_put_char(unsigned char data);
void lcd_put_hex(unsigned char data);
void lcd_put_ir_format(unsigned char format);
void lcd_put_ir_data(unsigned char* ir_data, unsigned char size);
void toggle_E(void);



