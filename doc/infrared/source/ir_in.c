/*==============================================================================
*   PROJECT NAME   : �ԊO�������R�� �w�K�L�b�g
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
/*  �O���[�o���ϐ��錾                                                          */
/*==============================================================================*/
extern unsigned char   rcv_data[TBL_CODE_SIZE];    /* IR ��M��M�f�[�^         */
extern unsigned char   pre_data[TBL_CODE_SIZE];    /* IR ��r�p�f�[�^           */
extern unsigned char   rx_format;                  /* IR �t�H�[�}�b�g���       */

/*==============================================================================
*   MODULE        : Timer_Reset
*   FUNCTION      : Timer 1 Reset (Timer �l / ������ Flag ������)
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
*   FUNCTION      : �ԊO����M����
*   ARGUMENT      : none
*   RETURN        : ��M���
*                 :     �Ή��\�ȐԊO���t�H�[�}�b�g    -> ��M����
*                 :     ���Ή��̐ԊO���t�H�[�}�b�g      -> �s���ȃt�H�[�}�b�g
*                 :     ���[�_�[�R�[�h�̕�����1ms�ȉ�   -> �m�C�Y or ���s�[�g�R�[�h
*   NOTE          : ��M���ł͐M�������]���Ă��܂�
*                 :     ���M���� Hi �̕����� ��M���ł� Low �ɂȂ�܂�
*===============================================================================*/
unsigned char ir_recieve(void)
{
    unsigned char   i;
    unsigned char   s_data;
    unsigned char   time_out;

    /* ��M�f�[�^������ */
    memset(&rcv_data, 0x00, sizeof(rcv_data));

    /***********************************************************
    *   IR�f�[�^���͑҂�
    ************************************************************/
    /* IR_IN �� Low �ɂȂ�܂ŉ��      */
    /* ���[�_�[�R�[�h�̊J�n���Ď�����   */
    while (PORTC & 0x01);

    /***********************************************************
    *   ���[�_�[�R�[�h���o�i����j
    ************************************************************/
    /* Low ���ԑ���J�n -> Timer Reset          */
    Timer_Reset();
    /* IR_IN �� Hi �ɂȂ�܂ŉ��               */
    /* ���[�_�[�R�[�h�̍ŏ��� Hi �I�����Ď�     */
    while (!(PORTC & 0x01));

    /* Low �̒����ɂ��t�H�[�}�b�g�𔻒�       */
    /* �K��l���}�[�W���������Ĕ��肵�Ă��܂� */
    if ((TMR1H >= 0x0C) && (TMR1H <= 0x10)) {
        /* Low�F2.5ms�ȏ� 4.5ms�ȉ�  �� �Ɠd��  */
        rx_format = FORM_KDN;
    } else if ((TMR1H >= 0x1F) && (TMR1H <= 0x27)) {
        /* Low�F8.0ms�ȏ� 10.0ms�ȉ� �� NEC     */
        rx_format = FORM_NEC;
    } else if (TMR1H >= 0x04) {
        /* ��L�̔���ɓ��Ă͂܂炸�� 1.0ms�ȏ� */
        /* �Ή��\�ȃt�H�[�}�b�g�ł͂Ȃ�       */
        return UNKNOWN;
    } else {
        /* 1.0ms���� => �m�C�Y���Ǝv����      */
        return FAIL;
    }
    /* NEC�t�H�[�}�b�g�̏ꍇ�̂݃��[�_�[�R�[�h�� Low ����   */
    /* ���s�[�g�R�[�h�������ꍇ�͖�������                   */
    Timer_Reset();
    while (PORTC & 0x01);
    if ((rx_format == FORM_NEC) && (TMR1H <=0x0F)) {
            return FAIL;
    }

    /***********************************************************
    *   �f�[�^�R�[�h����i�f�R�[�h�j
    ************************************************************/
    s_data = 0x01;  /* Shift Data 2byte�ȏ�� Shift ���o���Ȃ� */

    /* NEC format   */
    if (rx_format == FORM_NEC) {
        /* 32bit���J��Ԃ�      */
        for (i = 0; i < 32; i++) {
            /* Hi ���Ԃ� bit ����               */
            /* IR_IN �� Lo ��ǂݔ�΂�         */
            while (!(PORTC & 0x01));

            /* Hi ���ԑ���J�n -> Timer Reset   */
            Timer_Reset();
            while (PORTC & 0x01);

            /* Hi �� 1ms �ȏ㑱���� -> 1b       */
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
    /* �Ɠd�� format    */
    else if (rx_format == FORM_KDN) {
        /* 48bit    */
        for (i = 0; i < 48; i++) {
            /* �Ɠd�� format �� IR_IN : Hi ���Ԃ� bit ���� */
            /* �]���āAIR_IN �� Lo ��ǂݔ�΂�        */
            while (!(PORTC & 0x01));

            /* Hi ���ԑ���J�n -> Timer Reset   */
            Timer_Reset();
            while (PORTC & 0x01);

            /* Hi �� 800us �ȏ㑱���� -> 1b     */
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
    /* IR_IN �� Lo ��ǂݔ�΂� (STOP Bit)  */
    while (!(PORTC & 0x01));
    /* Hi ���ԑ���J�n -> Timer Reset       */
    Timer_Reset();
    /* STOP bit �ȍ~�� Data ���M�L���m�F    */
    while (PORTC & 0x01) {
        /* �K�莞�ԓ��� Data ���� -> ����   */
        if (TMR1H >= 0x08) {
            return SUCCESS;
        }
    };
    return UNKNOWN;
}

