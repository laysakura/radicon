/*==============================================================================
*   PROJECT NAME   : �ԊO�������R�� �w�K�L�b�g
*   FILE    NAME   : ir_main.h
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===============================================================================*/

/*==============================================================================*/
/*  Delay�֐��p PIC������g����` (4MHz)                                        */
/*==============================================================================*/
#define _XTAL_FREQ 4000000

/*==============================================================================*/
/*  GPIO PIN ��`                                                               */
/*==============================================================================*/
/* GPIO��` (PORT A) */
#define KEY_IN_0    0x01
#define KEY_IN_1    0x02
#define KEY_IN_2    0x04
#define KEY_IN_3    0x08
#define DIP_SW_2    0x40
#define DIP_SW_1    0x80

/* GPIO��` (PORT B) */
#define INT_KEY     0x01
#define KEY_OUT_0   0x04
#define KEY_OUT_1   0x08
#define KEY_OUT_2   0x10
#define KEY_OUT_3   0x20

/* GPIO��` (PORT C) */
#define IR_INPUT    0x01
#define IR_OUTPUT   0x02
#define LEDO_1      0x04
#define LEDO_2      0x08
#define LEDO_3      0x10
#define LEDO_4      0x20

/*==============================================================================*/
/* �߂�l��`                                                                   */
/*==============================================================================*/
#define SUCCESS                 0x00        /* Function : ����I��              */
#define UNKNOWN                 0x0F
#define FAIL                    0xFF        /* Function : �ُ�I��              */

/*==============================================================================*/
/* �|�[�g�����`                                                               */
/*==============================================================================*/
#define ON                      1           /* Port : High                      */
#define OFF                     0           /* Port : Low                       */

/*==============================================================================*/
/* ���샂�[�h��`                                                               */
/*==============================================================================*/
#define MODE_MASK               0xC0        /* ���샂�[�hSW �}�X�N�f�[�^        */
#define RUN_MODE_1              0xC0        /* ���M��p���[�h                   */
#define RUN_MODE_2              0x40        /* ��M(�L��)���[�h(EEPROM������)   */
#define RUN_MODE_3              0x80        /* �w�K(���M)���[�h(EEPROM���M)     */
#define RUN_MODE_4              0x00        /* �\�����[�h(LCD�\��)              */

/*==============================================================================*/
/* LED�����`                                                                  */
/*==============================================================================*/
#define ALL_ON                  0x3C        /* LED All On                       */
#define ALL_OFF                 0xC3        /* LED All Off                      */
#define LED_MASK                0x04        /* LED Mask -> Shift ���Ďg��       */

/////////////////////////////////////////////////////////////////////////////////////////////�ǉ��I�I
/*==============================================================================*/
/* KEY�����`                                                                  */
/*==============================================================================*/
#define KEY_INPUT_NUM_SHO		2
#define KEY_INPUT_NUM           4           /* Key Matrix (4 * 4)               */
#define KEY_NUM                 0x0C        /* ����L�[��           : 12��      */
#define FUNC_KEY_NUM            0x04        /* �t�@���N�V�����L�[�� :  4��      */

/*==============================================================================*/
/* PWM�����`                                                                  */
/*==============================================================================*/
/* ���4bit�́APWM��Duty��(0x35)��LSB 2bit(01b)�ł���   */
/* ����4bit�́ACCP2��PWM�Ƃ��Ďg�p���邽�߂̐���l      */
#define PWM_START               0x2C        /* PWM���[�hStart                   */
#define PWM_STOP                0x20        /* PWM���[�hStop                    */

/*==============================================================================*/
/* IR���䋤�ʒ�`                                                               */
/*==============================================================================*/
#define BYTE_SIZE               0x08        /* 1byte                : 8bit      */
#define NEC_CODE_SIZE           0x04        /* NEC Data Size        : 4byte     */
#define KDN_CODE_SIZE           0x06        /* �Ɠd�� Data Size     : 6byte     */
/* IR Data MAX Size     : �Ɠd��    */
#define TBL_CODE_SIZE           0x08        /* �A���C�����g���H               */

/* IR Format Type */
#define FORM_NEC                0x10        /* NEC format                       */
#define FORM_KDN                0x20        /* �Ɠd�� format                    */
#define FORM_UKN                0x30        /* �Ɠd�� format                    */

/*==============================================================================*/
/*  IR Port ON/OFF Time                                                         */
/*==============================================================================*/
/* NEC�t�H�[�}�b�g Port����     */
#define NEC_READER_ON           9000        /* Reader Code Hi    : 9.0ms        */
#define NEC_READER_OFF          4500        /* Reader Code Low   : 4.5ms        */
#define NEC_DATA_ON              570        /* Data Code Hi      : 0.56ms       */
#define NEC_DATA_BITON          1600        /* Data Code Low(1b) : 1.7ms        */
#define NEC_DATA_BITOFF          510        /* Data Code Low(0b) : 0.56ms       */
#define NEC_DATA_END              28        /* �S�̂�108ms                      */

/* �Ɠd���t�H�[�}�b�g Port����  */
#define KDN_READER_ON           3250        /* Reader Code Hi    : 3.2ms        */
#define KDN_READER_OFF          1500        /* Reader Code Low   : 1.6ms        */
#define KDN_DATA_ON              420        /* Data Code Hi      : 0.4ms        */
#define KDN_DATA_BITON          1100        /* Data Code Low(1b) : 1.2ms        */
#define KDN_DATA_BITOFF          300        /* Data Code Low(0b) : 0.4ms        */
#define KDN_DATA_END              63        /* ���̃R�[�h�܂�    :  75ms        */

/*==============================================================================*/
/* EEPROM ���䋤�ʒ�`                                                          */
/*==============================================================================*/
#define EEPROM_KEY_NUM          0x04        /* EEPROM �ێ� Key = Function Key   */
#define EEPROM_DATA_SIZE        0x07        /* Format Type(1byte) + Data(6byte) */
/* EEPROM Table Data -> Data Size * Key NUM */
#define EEPROM_TABLE_SIZE       (EEPROM_DATA_SIZE * EEPROM_KEY_NUM)

/*==============================================================================*/
/*  �ϐ��錾                                                                    */
/*==============================================================================*/
/* KEY Code Data Type   */
enum {
    KEY_CODE01 = 0,     /* key�F 1 -> �t�@���N�V�����L�[�F 1 *///����ł�STOP�ɑΉ�
    KEY_CODE02,         /* key�F 2 -> �t�@���N�V�����L�[�F 2 *///GO
    KEY_CODE03,         /* key�F 3 -> �t�@���N�V�����L�[�F 3 *///BACK
    KEY_CODE04,         /* key�F 4 -> �t�@���N�V�����L�[�F 4 *///RIGHT
    KEY_CODE05,         /* key�F 5 -> ����L�[          �F 1 *///LEFT
    KEY_CODE06,         /* key�F 6 -> ����L�[          �F 2 */
    KEY_CODE07,         /* key�F 7 -> ����L�[          �F 3 */
    KEY_CODE08,         /* key�F 8 -> ����L�[          �F 4 */
    KEY_CODE09,         /* key�F 9 -> ����L�[          �F 5 */
    KEY_CODE10,         /* key�F10 -> ����L�[          �F 6 */
    KEY_CODE11,         /* key�F11 -> ����L�[          �F 7 */
    KEY_CODE12,         /* key�F12 -> ����L�[          �F 8 */
    KEY_CODE13,         /* key�F13 -> ����L�[          �F 9 */
    KEY_CODE14,         /* key�F14 -> ����L�[          �F10 */
    KEY_CODE15,         /* key�F15 -> ����L�[          �F11 */
    KEY_CODE16,         /* key�F16 -> ����L�[          �F12 */
    KEY_OFF = 0xFF
};


/*==============================================================================*/
/*  �\���̐錾                                                                  */
/*==============================================================================*/
/* EEPROM Data Table */
typedef struct {
    unsigned char format;   /* �ԊO���t�H�[�}�b�g��� */
    unsigned char data[6];  /* �ԊO���f�[�^�R�[�h     */
} EEP_DATA;

