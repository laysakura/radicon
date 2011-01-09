/*==========================================================================
*   PROJECT NAME   : �ԊO�������R�� �w�K�L�b�g
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
*   FUNCTION      : LCD Driver ����������
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_init(void)
{
    /* 8bit�ʐM���[�h    */
    __delay_ms(20);             /* wait:15ms�ȏ�*/
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LED_INIT_8BIT;     /* 4bit ���M    */
    toggle_E();                 /* E�p���X����  */
    __delay_ms(5);              /* wait:5ms�ȏ� */

    /* 8bit�ʐM���[�h    */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LED_INIT_8BIT;     /* 4bit ���M    */
    toggle_E();                 /* E�p���X����  */
    __delay_us(100);            /* wait:100u�ȏ�*/

    /* 8bit�ʐM���[�h    */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LED_INIT_8BIT;     /* 4bit ���M    */
    toggle_E();                 /* E�p���X����  */
    __delay_us(100);            /* wait:100u�ȏ�*/

    /* 4bit�ʐM���[�h��  */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LED_INIT_4BIT;     /* 4bit ���M    */
    toggle_E();                 /* E�p���X����  */
    __delay_us(100);            /* wait:100u�ȏ�*/

    /* �C�j�V�����Z�b�g */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INIT_FC_MSB;   /* ���4bit���M */
    toggle_E();                 /* E�p���X����  */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INIT_FC_LSB;   /* ����4bit���M */
                                /* 4bit�ʐM/2�s�\��/5*7dot�t�H���g  */
    toggle_E();                 /* E�p���X����  */
    __delay_us(100);            /* wait:100u�ȏ�*/

    /* �\�����[�h       */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INICON_MSB;    /* ���4bit���M */
    toggle_E();                 /* E�p���X����  */
    PORTC &= LCD_BITD_CLR;      /* ����4bit���M */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INICON_LSB;    /* ���4bit���M */
                                /* �\��OFF/�J�[�\��OFF/�u�����NOFF  */
    toggle_E();                 /* E�p���X����  */
    __delay_us(100);            /* wait:100u�ȏ�*/

    /* �\���N���A       */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CLR_MSB;       /* ���4bit���M */
    toggle_E();                 /* E�p���X����  */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CLR_LSB;       /* ����4bit���M */
                                /* �\���N���A   */
    toggle_E();                 /* E�p���X����  */
    __delay_ms(2);              /* wait:1.7m�ȏ�*/

    /* �ړ����[�h       */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INIT_ENT_MSB;  /* ���4bit���M */
    toggle_E();                 /* E�p���X����  */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_INIT_ENT_LSB;  /* ����4bit���M */
                                /* �C���N�������g/�\���ړ��Ȃ�      */
    toggle_E();                 /* E�p���X����  */
    __delay_us(100);            /* wait:100u�ȏ�*/

    /* �\�����[�h       */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CON_MSB;       /* ���4bit���M */
    toggle_E();                 /* E�p���X����  */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CON_LSB;       /* ����4bit���M */
                                /* �\��OON/�J�[�\��OFF/�u�����NOFF      */
    toggle_E();                 /* E�p���X����  */
    __delay_us(100);            /* wait:100u�ȏ�*/

    return;
}


/*==============================================================================
*   MODULE        : lcd_clear
*   FUNCTION      : LCD �S����
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_clear(void)
{
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CLR_MSB;       /* ���4bit���M */
    toggle_E();                 /* E�p���X����  */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= LCD_CLR_LSB;       /* ����4bit���M */
                                /* �\���N���A   */
    toggle_E();                 /* E�p���X����  */
    __delay_ms(2);              /* wait:1.7m�ȏ�*/

    return;
}


/*==============================================================================
*   MODULE        : lcd_goto_posi
*   FUNCTION      : DD RAM �A�h���X�w��
*   ARGUMENT      : addr : LCD �֕\���������A�h���X
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_goto_posi(unsigned char addr)
{
    unsigned char   temp;

    temp = (addr & 0xF0);       /* �A�h���X�擾 */
    temp = (temp >> 2);         /* �f�[�^�V�t�g */
    temp |= 0x20;               /* �Œ�f�[�^   */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= temp;              /* ���4bit���M */
    toggle_E();                 /* E�p���X����  */
    temp = (addr & 0x0F);       /* �A�h���X�擾 */
    temp = (temp << 2);         /* �f�[�^�V�t�g */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 0;                 /* RS -> Low    */
    PORTC |= temp;              /* ����4bit���M */
    toggle_E();                 /* E�p���X����  */
    __delay_us(40);             /* wait:40u�ȏ� */

    return;
}


/*==============================================================================
*   MODULE        : lcd_put_char
*   FUNCTION      : Data �� LCD �֕\��
*   ARGUMENT      : data : LCD �֕\�������� Data (ASCII �R�[�h)
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_put_char(unsigned char data)
{
    unsigned char   temp;

    temp = (data & 0xF0);       /* ASCII�擾    */
    temp = (temp >> 2);         /* �f�[�^�V�t�g */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 1;                 /* RS -> Low    */
    PORTC |= temp;              /* ���4bit���M */
    toggle_E();                 /* E�p���X����  */
    temp = (data & 0x0F);       /* ASCII�擾    */
    temp = (temp << 2);         /* �f�[�^�V�t�g */
    PORTC &= LCD_BITD_CLR;      /* PortC ������ */
    BIT_RS = 1;                 /* RS -> Low    */
    PORTC |= temp;              /* ����4bit���M */
    toggle_E();                 /* E�p���X����  */
    __delay_us(40);             /* wait:40u�ȏ� */

    return;
}

/*==============================================================================
*   MODULE        : lcd_put_hex
*   FUNCTION      : Data ��16�i���Ƃ��� LCD �֕\��
*   ARGUMENT      : data : LCD �֕\�������� Data (16�i���l)
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void lcd_put_hex(unsigned char data)
{
    unsigned char   hi, lo;

    /* ��� 4bit ��o�� */
    hi = (data & 0xF0);
    hi = (hi >> 4);
    /* ASCII �R�[�h�ϊ� */
    hi = (hi + '0');    /* 0x00~0x90        */
    if (hi > '9') {     /* 0xA0~0xF0        */
        hi = (hi + 7);
    }

    /* ��� 4bit ��o�� */
    lo = (data & 0x0F);
    /* ASCII �R�[�h�ϊ� */
    lo = (lo + '0');    /* 0x00~0x09        */
    if (lo > '9') {     /* 0x0A~0x0F        */
        lo = (lo + 7);
    }
    lcd_put_char(hi);   /* ��� 4bit �\��   */
    lcd_put_char(lo);   /* ���� 4bit �\��   */

    return;
}

/*==============================================================================
*   MODULE        : lcd_put_ir_format
*   FUNCTION      : ��M���� IR format ��ʂ� LCD �֕\��
*   ARGUMENT      : format : ��M���� IR format ���
*   RETURN        : none
*   NOTE          : 1�s�ڂ̍��[�֕\��
*===============================================================================*/
void lcd_put_ir_format(unsigned char format)
{
    unsigned char nec[3] = {0x4E, 0x45, 0x43};          /* "NEC"        */
    unsigned char ukn[7] = {0x55, 0x4E, 0x4B, 0x4E,     /* "UNKNOWN"    */
                            0x4F, 0x57, 0x4E};
    unsigned char kdn[8] = {0x4B, 0x41, 0x44, 0x45,     /* "KADENKYO"   */
                            0x4E, 0x4B, 0x59, 0x4F};
    unsigned char i;

    /* IR format Type ��1�s�ڂɕ\�� */
    lcd_goto_posi(0x00);

    switch (format) {
      case FORM_NEC:
        /* "NEC" �\��       */
        for (i = 0; i < FORMAT_CHAR_NEC; i++) {
            lcd_put_char(nec[i]);
        }
        break;
      case FORM_KDN:
        /* "KADENKYO" �\��  */
        for (i = 0; i < FORMAT_CHAR_KDN; i++) {
            lcd_put_char(kdn[i]);
        }
        break;
      default:
        /* "UNKNOWN" �\��   */
        for (i = 0; i < FORMAT_CHAR_UKN; i++) {
            lcd_put_char(ukn[i]);
        }
        break;
    };

    return;
}


/*==============================================================================
*   MODULE        : lcd_put_ir_data
*   FUNCTION      : ��M���� IR Data �� LCD �֕\��
*   ARGUMENT      : ir_data : �\�����s��16�i���l �擪�A�h���X
*                 : size    : �\�����s�� Data Size
*   RETURN        : none
*   NOTE          : 2�s�ڂ̍��[�֕\��
*===============================================================================*/
void lcd_put_ir_data(unsigned char* ir_data, unsigned char size)
{
    unsigned char   i;
    unsigned char   ir_char;

    if (size > 0x00) {
        /* IR Data ��2�s�ڂɕ\��    */
        lcd_goto_posi(0x40);

        /* size �� ASCII �R�[�h�֕ϊ����Ȃ���\��   */
        for (i = 0; i < size; i++) {
            ir_char = *ir_data;     /* Data ��o��  */
            lcd_put_hex(ir_char);   /* LCD �\��     */
            ir_data++;              /* �A�h���X Up  */
        }
    }
    return;
}


/*==============================================================================
*   MODULE        : toggle_E
*   FUNCTION      : E �[�q H�p���X����
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : Data Sheet -> MIN:280ns
*===============================================================================*/
void toggle_E(void)
{
    /* CPU:4MHz -> ���� 980ns   */
    /* 2�T�C�N�� �g�p���Ă�H   */
    BIT_E = 1;      /* E=1 */
    BIT_E = 0;      /* E=0 */

    return;
}

