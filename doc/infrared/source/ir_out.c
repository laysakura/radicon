/*==============================================================================
*   PROJECT NAME   : �ԊO�������R�� �w�K�L�b�g
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
*   FUNCTION      : NEC format �ɏ]���� Reader Code ���o
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_ReaderCode_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(NEC_READER_ON);      /* 9.0ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low �ŏI��  */
    __delay_us(NEC_READER_OFF);     /* 4.5ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_NEC_DataCode_BitOn_Send
*   FUNCTION      : NEC format �ɏ]���� Data Code (Bit:ON) ���o
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_DataCode_BitOn_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(NEC_DATA_ON);        /* 0.56ms : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low �ŏI��  */
    __delay_us(NEC_DATA_BITON);     /* 1.7ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_NEC_DataCode_BitOff_Send
*   FUNCTION      : NEC format �ɏ]���� Data Code (Bit:OFF) ���o
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_DataCode_BitOff_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(NEC_DATA_ON);        /* 0.56ms : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low �ŏI��  */
    __delay_us(NEC_DATA_BITOFF);    /* 0.56ms : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_NEC_DataCode_StopBit_Send
*   FUNCTION      : NEC format �ɏ]���� Stop Bit ���o
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_DataCode_StopBit_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(NEC_DATA_ON);        /* 0.56ms : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low �ŏI��  */

    return;
}


/*==============================================================================
*   MODULE        : IR_NEC_format
*   FUNCTION      : Key_code �ɑΉ����� Data�� NEC format�ŏo��
*   ARGUMENT      : *tbl_p : Function Key�ɉ����� IR Data �̐擪�A�h���X
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_NEC_format(unsigned char* tbl_p)
{
    unsigned char  i, j;

    /* Reader Code Output */
    IR_NEC_ReaderCode_Send();

    /* �J�X�^���R�[�h/�f�[�^�R�[�h (4byte) �o�� */
    for (i=0;i<NEC_CODE_SIZE;i++)
    {
        /* 1bit���Ƀf�[�^�o�� */
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
    /* 1�t���[���I����� Wait Time  */
    __delay_ms(NEC_DATA_END);

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_ReaderCode_Send
*   FUNCTION      : �Ɠd�� format �ɏ]���� Reader Code ���o
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_ReaderCode_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(KDN_READER_ON);      /* 3.2ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low �ŏI��  */
    __delay_us(KDN_READER_OFF);     /* 1.6ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_DataCode_BitOn_Send
*   FUNCTION      : �Ɠd�� format �ɏ]���� Data Code (Bit:ON) ���o
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_DataCode_BitOn_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(KDN_DATA_ON);        /* 0.4ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low �ŏI��  */
    __delay_us(KDN_DATA_BITON);     /* 1.2ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_DataCode_BitOff_Send
*   FUNCTION      : �Ɠd�� format �ɏ]���� Data Code (Bit:OFF) ���o
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_DataCode_BitOff_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(KDN_DATA_ON);        /* 0.4ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low �ŏI��  */
    __delay_us(KDN_DATA_BITOFF);    /* 0.4ms  : Low         */

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_DataCode_StopBit_Send
*   FUNCTION      : �Ɠd�� format �ɏ]���� Stop Bit ���o
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_DataCode_StopBit_Send(void)
{
    CCP2CON = PWM_START;            /* 38KHz PWM Start      */
    __delay_us(KDN_DATA_ON);        /* 0.4ms  : Hi          */
    CCP2CON = PWM_STOP;             /* PWM Stop             */
    PORTC &= ~IR_OUTPUT;            /* IR Pin : Low �ŏI��  */

    return;
}


/*==============================================================================
*   MODULE        : IR_KDN_format
*   FUNCTION      : Key_code �ɑΉ����� Data�� �Ɠd�� format�ŏo��
*   ARGUMENT      : *tbl_p : Function Key�ɉ����� Data �̐擪�A�h���X
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void IR_KDN_format(unsigned char* tbl_p)
{
    unsigned char  i, j;

    /* Reader Code Output */
    IR_KDN_ReaderCode_Send();

    /* �J�X�^���R�[�h/�f�[�^�R�[�h (6byte) �o�� */
    for (i=0;i<KDN_CODE_SIZE;i++)
    {
        /* 1bit���Ƀf�[�^�o�� */
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
    /* 1�t���[���I����� Wait Time  */
    __delay_ms(KDN_DATA_END);

    return;
}

/*==============================================================================
*   MODULE        : ir_out_start
*   FUNCTION      : �ԊO���t�H�[�}�b�g�ɏ]���ă����R���R�[�h���M
*   ARGUMENT      : func_key : ���ݐݒ肳��Ă���t�@���N�V�����L�[
*                 : key_code : �������ꂽ����L�[�� key_code
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void ir_out_start(unsigned char func_key, unsigned char key_code)
{
    unsigned char   format;
    unsigned char*  data_p;

    /* �t�@���N�V�����L�[�ɑΉ����� */
    /* �ԊO���t�H�[�}�b�g���擾     */
    format = ir_format_tbl[func_key];

    /* �t�@���N�V�����L�[�ɑΉ������A�e�[�u���f�[�^�擪�A�h���X�擾 */
    if (func_key == KEY_CODE01) {
        /* �t�@���N�V�����P�̃e�[�u���擪�A�h���X   */
        data_p = (unsigned char*)&ir_func1_code_tbl[(key_code-4)][0];
    } else if (func_key == KEY_CODE02) {
        /* �t�@���N�V�����Q�̃e�[�u���擪�A�h���X   */
        data_p = (unsigned char*)&ir_func2_code_tbl[(key_code-4)][0];
    } else if (func_key == KEY_CODE03) {
        /* �t�@���N�V�����R�̃e�[�u���擪�A�h���X   */
        data_p = (unsigned char*)&ir_func3_code_tbl[(key_code-4)][0];
    } else {
        /* �t�@���N�V�����S�̃e�[�u���擪�A�h���X   */
        data_p = (unsigned char*)&ir_func4_code_tbl[(key_code-4)][0];
    }

    /* �t�H�[�}�b�g���ɈႤ���M�������Ăяo��   */
    if (format == FORM_NEC) {
        /* NEC      */
        IR_NEC_format(data_p);
    } else {
        /* �Ɠd��   */
        IR_KDN_format(data_p);
    }
    return;
}



