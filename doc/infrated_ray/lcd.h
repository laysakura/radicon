/*==========================================================================
*   PROJECT NAME   : �ԊO�������R�� �w�K�L�b�g
*   FILE    NAME   : lcd.h
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===========================================================================*/

/*==========================================================================*/
/*  Delay�֐��p PIC������g����`                                           */
/*==========================================================================*/
#define _XTAL_FREQ 4000000

/*==========================================================================*/
/*  GPIO PIN ��`                                                           */
/*  ��Bit:RW �͉�H�݌v�ɂ� Low �Œ�ƂȂ�APIC�}�C�R���ɐڑ�����Ă��܂��� */
/*==========================================================================*/
/* GPIO��` (PORT A) */
#define BIT_RS      RA4             /* Bit:RS       */
#define BIT_E       RA5             /* Bit:E        */

/* GPIO��` (PORT C) */
#define BIT_D4      RC2             /* DataBit:4    */
#define BIT_D5      RC3             /* DataBit:5    */
#define BIT_D6      RC4             /* DataBit:6    */
#define BIT_D7      RC5             /* DataBit:7    */

#define TRIS_LCD    0xC3            /* PORTC ���o�͐ݒ� 0:�o��  1:����      */

/*==========================================================================*/
/*  �C���X�g���N�V�����R�}���h��`                                          */
/*==========================================================================*/
/* PORTC MASK Data      */
#define LCD_BITD_CLR            0xC3
/* �\���N���A           */
#define LCD_CLR_MSB             0x00
#define LCD_CLR_LSB             0x04        /* LCD All Clear                */
/* �R�}���h�]�����[�h   */
#define LED_INIT_8BIT           0x0C        /* 8bit �]��                    */
#define LED_INIT_4BIT           0x08        /* 4bit �]��                    */
/* �C�j�V�����Z�b�g     */
#define LCD_INIT_FC_MSB         0x08        /* 4bit �]��                    */
#define LCD_INIT_FC_LSB         0x20        /* 2�s�\�� / 5*7dot             */
/* �\�����[�h:LCD OFF   */
#define LCD_INICON_MSB          0x00
#define LCD_INICON_LSB          0x20        /* LCD:OFF/Cursor:OFF/Blink:OFF */
/* �ړ����[�h           */
#define LCD_INIT_ENT_MSB        0x00
#define LCD_INIT_ENT_LSB        0x18        /* Cursor �C���N�������g        */
/* �\�����[�h:LCD ON    */
#define LCD_CON_MSB             0x00
#define LCD_CON_LSB             0x30        /* LCD:ON/Cursor:OFF/Blink:OFF  */

/*==========================================================================*/
/*  �t�H�[�}�b�g��ʐ錾  ��akizuki.h �Ɠ����l�Ƃ��� (include�ł�OK)        */
/*==========================================================================*/
#define FORM_NEC                0x10        /* NEC format                   */
#define FORM_KDN                0x20        /* �Ɠd�� format                */

/*==========================================================================*/
/*  IR Data LCD �\����������`                                              */
/*==========================================================================*/
#define FORMAT_DISP_SIZE_NEC    0x04        /* NEC format    4byte          */
#define FORMAT_DISP_SIZE_KDN    0x06        /* �Ɠd�� format 6byte          */
#define FORMAT_DISP_SIZE_UKN    0x00        /* ���Ή� format   2byte        */

/*==========================================================================*/
/*  �t�H�[�}�b�g��� LCD �\����������`                                     */
/*==========================================================================*/
#define FORMAT_CHAR_NEC         0x03        /* NEC format    "NEC"          */
#define FORMAT_CHAR_KDN         0x08        /* �Ɠd�� format "KADENKYO"     */
#define FORMAT_CHAR_UKN         0x07        /* SONY format   "UNKNOWN"      */

/*==========================================================================*/
/*  �v���g�^�C�v�錾                                                        */
/*==========================================================================*/
void lcd_init(void);
void lcd_clear(void);
void lcd_goto_posi(unsigned char addr);
void lcd_put_char(unsigned char data);
void lcd_put_hex(unsigned char data);
void lcd_put_ir_format(unsigned char format);
void lcd_put_ir_data(unsigned char* ir_data, unsigned char size);
void toggle_E(void);



