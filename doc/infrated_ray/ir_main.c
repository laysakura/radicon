/*==============================================================================
*   PROJECT NAME   : �ԊO�������R�� �w�K�L�b�g
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
/*  �R���t�B�O���[�V����                                                        */
/*==============================================================================*/
/* �����N���b�N���U(RA7/RA6:I/O), �E�H�b�`�h�b�O�^�C�}���g�p    */
/* �p���[�A�b�v�^�C�}���g�p, MCLR�g�p                           */
/* �u���E���A�E�g���Z�b�g���g�p, ��d���v���O�������g�p         */
__CONFIG(INTIO & WDTDIS & PWRTDIS & MCLREN & BORDIS & LVPDIS);

/*==============================================================================*/
/*  �v���g�^�C�v�錾                                                            */
/*==============================================================================*/
unsigned char key_input_check(void);            /* Key Check ����               */
void led_control(unsigned char led_state);      /* LED ���䏈��                 */
void motion_control(unsigned char motion_state);      /* LED ���䏈��               */    /* masa */
void cpu_sleep(void);                           /* Sleep �� Wake Up ����        */

/*==============================================================================*/
/*  �O���[�o���ϐ��錾                                                          */
/*==============================================================================*/
unsigned char   rcv_data[TBL_CODE_SIZE];        /* ��M�f�[�^                   */
unsigned char   pre_data[TBL_CODE_SIZE];        /* ��M�f�[�^��r�p             */
unsigned char   rx_format;                      /* ��M�f�[�^�t�H�[�}�b�g���   */
unsigned char   eep_rdata[EEPROM_TABLE_SIZE];   /* EEPROM�Ǐo���pRAM�̈�        */
EEP_DATA        eep_wdata;                      /* EEPROM�ۑ��p RAM�̈�         */

/*==============================================================================
*   MODULE        : key_input_check
*   FUNCTION      : KEY���͂��L�[�}�g���N�X�ɂČ��o(KEY Output:4PIN)
*   ARGUMENT      : none
*   RETURN        : code : �L�[������ԁi��������Ă���� Key_Code��Ԃ��j
*   NOTE          : Key Output Pin �� Hi �ɂ��� Key Input Pin ���`�F�b�N
*===============================================================================*/
unsigned char key_input_check(void)
{
    unsigned char   code = KEY_OFF; /* Code �� Key Off �ŏ�����     */
    unsigned char   i;              /* �`�F�b�N���J�E���^           */

    PORTB = 0x00;                   /* Outout Pin : ALL Low */

    for (i=0; i<KEY_INPUT_NUM; i++) {
        switch (i) {
          case 0:
            PORTB |= KEY_OUT_0;     /* Output Pin 0 : Hi    */
            __delay_us(10);         /* �ꉞ���艻�҂�       */
            /* Hi �ɂȂ� Input PIN �ɂ�� Key Code ����     */
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
            __delay_us(10);         /* �ꉞ���艻�҂�       */
            /* Hi �ɂȂ� Input PIN �ɂ�� Key Code ����     */
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
            __delay_us(10);         /* �ꉞ���艻�҂�       */
            /* Hi �ɂȂ� Input PIN �ɂ�� Key Code ����     */
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
            __delay_us(10);         /* �ꉞ���艻�҂�       */
            /* Hi �ɂȂ� Input PIN �ɂ�� Key Code ����     */
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
            break;  /* ���ꂩ�̃L�[��F�������瑦���I��     */
        }
    }
    return code;
}


/*==============================================================================
*   MODULE        : led_control
*   FUNCTION      : LED�S���� / �w�肳�ꂽ LED �̓_������
*   ARGUMENT      : led_state : LED �_��/�����w��
*   RETURN        : none
*   NOTE          : LED �̏����� ALL OFF �̂�
*===============================================================================*/
void led_control(unsigned char led_state)
{
    PORTC &= ALL_OFF;               /* �܂��͑S���� */
    if (led_state != ALL_OFF) {
        PORTC |= led_state;         /* �_���̕K�v������ LED ��_��  */
    }
}

void motion_control(unsigned char motion_state)/*This is written by masa*/
{
    PORTB = motion_state;         /* �_���̕K�v������ LED ��_��  */
}


/*==============================================================================
*   MODULE        : cpu_sleep
*   FUNCTION      : CPU Sleep �� Wake Up ����
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void cpu_sleep(void)
{
    PORTA = 0x0F;   /* Key Input/Output : Hi        */
    PORTB = 0x3C;   /* Key Input/Output : Hi        */

    INTEDG  = 1;    /* INT�s���̗����Ŋ����ݔ���  */
    INTF    = OFF;  /* �O�������݃t���O �N���A      */
    INTE    = ON;   /* INT�s�� �O�������݋���       */

    asm("sleep");   /* �O�������ݔ����܂� SLEEP��� */

    __delay_ms(1);  /* SLEEP���A�� 1���ߋ󂯂�      */
    INTF    = OFF;  /* �O�������݃t���O �N���A      */
    INTE    = OFF;  /* INT�s�� �O�������݋֎~       */

    return;
}



/*==============================================================================
*   MODULE        : main
*   FUNCTION      : IR Remocon �����R�����C���֐�
*   ARGUMENT      : none
*   RETURN        : none
*   NOTE          : none
*===============================================================================*/
void main()
{
    unsigned char   i;              /* LED �_�ŉ񐔃J�E���^         */
    unsigned char   ir_state;       /* ��M��� (����/�s��/�m�C�Y)  */
    unsigned char   key_code;       /* �L�[�R�[�h�擾�p             */
    unsigned char   func_key_type;  /* �t�@���N�V�����L�[���       */
    unsigned char   eep_offset;     /* EEPROM�ۑ��� �I�t�Z�b�g      */


    /* PORT A/B/C ���o�͐ݒ� (1b:Input 0b:Output)   */
    TRISA   = 0xCF; /* Port A ���o�͐ݒ�            */
	TRISB   = 0x00; /* Port B ���o�͐ݒ�            */    /* masa ���ׂĂ�PORT��OUTPUT�ɂ���B*/
    //TRISB   = 0xC1; /* Port B ���o�͐ݒ�            */
    TRISC   = 0x81; /* Port C ���o�͐ݒ�            */

    /* A/D�R���o�[�^�ݒ�                            */
    ADCON0  = 0x00; /* AD�R���o�[�^�d��OFF(���g�p)  */
    ANSEL   = 0x00; /* AN0~AN7  Pin Digital I/O     */
    ANSELH  = 0x00; /* AN8~AN13 Pin Digital I/O     */

    /* �R���p���[�^�ݒ�                             */
    CM1CON0 = 0x07; /* Comparator 1 Disable         */
    CM2CON0 = 0x07; /* Comparator 2 Disable         */

    /* �L�����A���g���ݒ� (PWM�p TIMER2 �̐ݒ�)     */
    PR2     = 0x19; /* 38KHz (1cycle = 25~26us)     */
    T2CON   = 0x0C; /* Postscaler   -> 1:2          */
                    /* Timer2       -> ON           */
                    /* Prescaler    -> 1            */
    CCPR2L  = 0x0C; /* Duty         -> 50% (0x32)   */
                    /* CCPR2L:1100b                 */
                    /* CCP2CON(bit5~4):10b->110010b */
    CCP2CON = PWM_STOP; /* PWM      -> OFF          */
                        /* 2LSB of duty cycle->10b  */

    /* ��M�f�[�^��͗p TIMER1 �ݒ�                 */
    T1CON   = 0x01; /* Prescaler      -> 1:1 (65ms) */
                    /* Clock Source   -> Internal   */
                    /* Timer1        -> Start       */
    TMR1L   = 0;    /* Timer1 Value MSB 8bit Clear  */
    TMR1H   = 0;    /* Timer1 Value LSB 8bit Clear  */
    TMR1IF  = 0;    /* Timer1 Interrupt Flag Clear  */
    TMR1IE  = 1;    /* Timer1 Interrupt Enable      */

    /* Port ������ */
    PORTA   = 0x00; /* PortA RA7~0:Lo               */
    PORTB   = 0x00; /* PortB RB7~1:Lo    RB0:Hi     */    /* masa */
	//PORTB   = 0x01; /* PortB RB7~1:Lo    RB0:Hi     */
    PORTC   = 0x01; /* PortC RC7~1:Lo    RC0:Hi     */

    /****************************************************************/
    /* Dip SW ������ Hi �� ���M���[�h                               */
    /****************************************************************/
    if ((PORTA & MODE_MASK) == RUN_MODE_1) {
        /* Function Type Init (Function 1 �ŏ�����) */
        func_key_type = KEY_CODE01;
        /* Function1 LED On */
        led_control(LED_MASK);

        for (;;)
        {
            /* Key Check */
            key_code = key_input_check();

            /* Key �����Ȃ� -> CPU Sleep    */
            if (key_code == KEY_OFF) {
                /* CPU Sleep -> Wake Up     */
                cpu_sleep();
            }
            /* Key �������� -> ���ꂩ�̓��� */
            else {
                /* Function Key �������ꂽ  */
                if (key_code <= KEY_CODE04) {
                    /* Function Type �ێ�   */
                    func_key_type = key_code;
                    /* �Ή����� LED On      */
                    led_control((LED_MASK << key_code));
                }
                /* ����L�[���������ꂽ     */
                else {
                    /* �Ή������R�[�h�𑗐M */
                    ir_out_start(func_key_type, key_code);
                }
            }
        }
    }

    /****************************************************************/
    /* Dip SW 1:Lo  Dip SW 2:Hi �� ��M���[�h (EEPROM�ւ̕ۑ�)      */
    /****************************************************************/
    if ((PORTA & MODE_MASK) == RUN_MODE_2) {
        /* Function LED All Off */
        led_control(ALL_ON);

        for (;;) {
            /* Key Check */
            key_code = key_input_check();
            /* Function Key �������ꂽ���M���[�h��    */
            if (key_code <= KEY_CODE04) {
                /* Function Key Code �ێ�               */
                func_key_type = key_code;
                /* Key �ɑΉ����� LED �_��              */
                led_control((LED_MASK << key_code));
                break;
            } else {
                /* Key ���������܂Ń`�F�b�N�𑱂���   */
                ;
            }
        }

        /* ������M����܂�IR�`�F�b�N */
        for (;;) {
            /* �ԊO���R�[�h��M                         */
            ir_state = ir_recieve();
            /* ��M���� (NEC/�Ɠd���t�H�[�}�b�g)        */
            if (ir_state == SUCCESS) {
                /* LED���� & �f�[�^�ۑ������֑J��       */
                break;
            }
            /* �s���̃t�H�[�}�b�g����M                 */
            else if (ir_state == UNKNOWN) {
                for (;;) {
                    /* �d��OFF�܂� 150ms �Ԋu�őSLED�_��    */
                    led_control(ALL_OFF);
                    __delay_ms(150);
                    led_control(ALL_ON);
                    __delay_ms(150);
                }
            }
            /* ���炩�̃m�C�Y����M                     */
            else {
                /* ������x��M����                     */
                ;
            }
        }

        /* ��M������Ԓʒm */
        for (i=0; i<2; i++) {
            /* �I������ Key �ɑΉ����� LED �_�� (2��)   */
            /* 150ms �Ԋu�œ_��                         */
            led_control(ALL_OFF);
            __delay_ms(150);
            led_control((LED_MASK << func_key_type));
            __delay_ms(150);
        }
        /* IR format �ꎞ�ێ�       */
        eep_wdata.format = rx_format;
        /* ��M�f�[�^�ꎞ�ێ�       */
        memcpy(&eep_wdata.data, &rcv_data, sizeof(rcv_data));
        /* EEPROM �����ݐ�擾      */
        eep_offset = (key_code * EEPROM_DATA_SIZE);
        /* Format��EEPROM�֏�����   */
        EEPROM_WRITE(eep_offset, eep_wdata.format);
        /* �����񂾕��I�t�Z�b�g�ړ� */
        eep_offset++;
        /* DataCode��EEPROM�֏����� */
        for (i=0; i < TBL_CODE_SIZE; i++) {
            /* HI-TECH C �W���֐�   */
            /* 1byte ��������     */
            EEPROM_WRITE((eep_offset + i), eep_wdata.data[i]);
        }
        /* IR Data �L�^�㖳�����[�v */
        for (;;);
    }

    /****************************************************************/
    /* Dip SW 1:Hi  Dip SW 2:Lo �� �w�K���[�h (EEPROM Data ���M)    */
    /****************************************************************/
    if ((PORTA & MODE_MASK) == RUN_MODE_3) {
        /* EEPROM Data �� RAM �֓W�J */
        for (i = 0; i < EEPROM_TABLE_SIZE; i++) {
            eep_rdata[i] = EEPROM_READ(i);
        }

        for (;;)
        {
            /* Key Check */
            key_code = key_input_check();

            /* KEY��������ĂȂ�������Sleep�ɂ���   */
            if (key_code == KEY_OFF) {
                /* CPU Sleep -> Key INT -> Wake Up  */
                cpu_sleep();
            }
            else {
                /* Function Key (4��) �̂ݑΉ�      */
                if (key_code <= KEY_CODE04) {
                    /* Key �ɑΉ�����RAM�Ǎ���擾  */
                    eep_offset = (key_code * EEPROM_DATA_SIZE);
                    /* Data���݂���ꍇ�̂ݑ��M     */
                    if ((eep_rdata[eep_offset] == FORM_NEC) ||
                        (eep_rdata[eep_offset] == FORM_KDN)) {
                        /* ���M�� -> �Ή�����LED On */
                        led_control((LED_MASK << key_code));
                        /* �t�H�[�}�b�g -> NEC      */
                        if (eep_rdata[eep_offset] == FORM_NEC) {
                            /* Key�ɑΉ�����Data��  */
                            /* NEC format�ő��M     */
                            /* �Ǎ��񂾕��I�t�Z�b�g�ړ� */
                            eep_offset++;
                            IR_NEC_format((unsigned char*)&eep_rdata[eep_offset]);
                        }
                        /* �t�H�[�}�b�g -> �Ɠd��   */
                        else {
                            /* Key�ɑΉ�����Data��  */
                            /* �Ɠd�� format�ő��M  */
                            /* �Ǎ��񂾕��I�t�Z�b�g�ړ� */
                            eep_offset++;
                            IR_KDN_format((unsigned char*)&eep_rdata[eep_offset]);
                        }
                        /* ���M�I�� -> LED Off      */
                        led_control(ALL_OFF);
                    }
                }
            }
        }
    }
    /****************************************************************/
    /* Dip SW 1:Lo  Dip SW 2:Lo �� LCD�\�����[�h                   */
	/* ���̃��[�h��main�̖�ڂ��ʂ���                              */
    /****************************************************************/
    if ((PORTA & MODE_MASK) == RUN_MODE_4) {
        /* LCD Initialize       */
        lcd_init();
        /* IR ��r�f�[�^������  */
        memset(&pre_data, 0x00, sizeof(pre_data));
        for (;;)
        {
            /* IR��M */
            ir_state = ir_recieve();

        	
        	/*�ȉ���motion control�𐧌䂷��part  masa */
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
        	/* �����܂�   masa  */
        	
        	
        	/* ��M�f�[�^�Ɣ�r�f�[�^���قȂ�ꍇ�̂ݕ\�����X�V         */
//            if ((memcmp(&pre_data, &rcv_data, sizeof(rcv_data))) != 0) {    /* comment out �J�� masa  */
            if ((memcmp(&pre_data, &rcv_data, sizeof(rcv_data))) != 0) {
                if (ir_state == SUCCESS) {
                    lcd_clear();                    /* LCD All Clear        */
                    lcd_put_ir_format(rx_format);   /* IR format Type �\��  */
                    switch (rx_format) {
                      case FORM_NEC:        /* ��M�R�[�h = NEC format      */
                        /* NEC format �� IR ��M�f�[�^�\��                  */
                        lcd_put_ir_data(&rcv_data, FORMAT_DISP_SIZE_NEC);
                        break;
                      case FORM_KDN:        /* ��M�R�[�h = �Ɠd�� format   */
                        /* �Ɠd�� format �� IR ��M�f�[�^�\��               */
                        lcd_put_ir_data(&rcv_data, FORMAT_DISP_SIZE_KDN);
                        break;
                      default:              /* ��M�R�[�h = ���Ή� format   */
                        break;
                    }
                } else if (ir_state == UNKNOWN) {
                    /* ���Ή� format �� IR ��M�f�[�^�\��               */
                    lcd_clear();                    /* LCD All Clear        */
                    lcd_put_ir_format(FORM_UKN);   /* IR format Type �\��  */
//                    lcd_put_ir_data(&rcv_data, FORMAT_DISP_SIZE_UKN);
                } else {
                    ;   /* �m�C�Y�ׁ̈A������x��M���� */
                }
                /* IR ��r�f�[�^�ێ� */
                memcpy(&pre_data, &rcv_data, sizeof(rcv_data));
            }
        }
    }
}


