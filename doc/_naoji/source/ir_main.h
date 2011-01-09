/*==============================================================================
*   PROJECT NAME   : 赤外線リモコン 学習キット
*   FILE    NAME   : ir_main.h
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===============================================================================*/

/*==============================================================================*/
/*  Delay関数用 PIC動作周波数定義 (4MHz)                                        */
/*==============================================================================*/
#define _XTAL_FREQ 4000000

/*==============================================================================*/
/*  GPIO PIN 定義                                                               */
/*==============================================================================*/
/* GPIO定義 (PORT A) */
#define KEY_IN_0    0x01
#define KEY_IN_1    0x02
#define KEY_IN_2    0x04
#define KEY_IN_3    0x08
#define DIP_SW_2    0x40
#define DIP_SW_1    0x80

/* GPIO定義 (PORT B) */
#define INT_KEY     0x01
#define KEY_OUT_0   0x04
#define KEY_OUT_1   0x08
#define KEY_OUT_2   0x10
#define KEY_OUT_3   0x20

/* GPIO定義 (PORT C) */
#define IR_INPUT    0x01
#define IR_OUTPUT   0x02
#define LEDO_1      0x04
#define LEDO_2      0x08
#define LEDO_3      0x10
#define LEDO_4      0x20

/*==============================================================================*/
/* 戻り値定義                                                                   */
/*==============================================================================*/
#define SUCCESS                 0x00        /* Function : 正常終了              */
#define UNKNOWN                 0x0F
#define FAIL                    0xFF        /* Function : 異常終了              */

/*==============================================================================*/
/* ポート制御定義                                                               */
/*==============================================================================*/
#define ON                      1           /* Port : High                      */
#define OFF                     0           /* Port : Low                       */

/*==============================================================================*/
/* 動作モード定義                                                               */
/*==============================================================================*/
#define MODE_MASK               0xC0        /* 動作モードSW マスクデータ        */
#define RUN_MODE_1              0xC0        /* 送信専用モード                   */
#define RUN_MODE_2              0x40        /* 受信(記憶)モード(EEPROM書込み)   */
#define RUN_MODE_3              0x80        /* 学習(送信)モード(EEPROM送信)     */
#define RUN_MODE_4              0x00        /* 表示モード(LCD表示)              */

/*==============================================================================*/
/* LED制御定義                                                                  */
/*==============================================================================*/
#define ALL_ON                  0x3C        /* LED All On                       */
#define ALL_OFF                 0xC3        /* LED All Off                      */
#define LED_MASK                0x04        /* LED Mask -> Shift して使う       */

/////////////////////////////////////////////////////////////////////////////////////////////追加！！
/*==============================================================================*/
/* KEY制御定義                                                                  */
/*==============================================================================*/
#define KEY_INPUT_NUM_SHO		2
#define KEY_INPUT_NUM           4           /* Key Matrix (4 * 4)               */
#define KEY_NUM                 0x0C        /* 動作キー数           : 12個      */
#define FUNC_KEY_NUM            0x04        /* ファンクションキー数 :  4個      */

/*==============================================================================*/
/* PWM制御定義                                                                  */
/*==============================================================================*/
/* 上位4bitは、PWMのDuty比(0x35)のLSB 2bit(01b)である   */
/* 下位4bitは、CCP2をPWMとして使用するための制御値      */
#define PWM_START               0x2C        /* PWMモードStart                   */
#define PWM_STOP                0x20        /* PWMモードStop                    */

/*==============================================================================*/
/* IR制御共通定義                                                               */
/*==============================================================================*/
#define BYTE_SIZE               0x08        /* 1byte                : 8bit      */
#define NEC_CODE_SIZE           0x04        /* NEC Data Size        : 4byte     */
#define KDN_CODE_SIZE           0x06        /* 家電協 Data Size     : 6byte     */
/* IR Data MAX Size     : 家電協    */
#define TBL_CODE_SIZE           0x08        /* アライメント問題？               */

/* IR Format Type */
#define FORM_NEC                0x10        /* NEC format                       */
#define FORM_KDN                0x20        /* 家電協 format                    */
#define FORM_UKN                0x30        /* 家電協 format                    */

/*==============================================================================*/
/*  IR Port ON/OFF Time                                                         */
/*==============================================================================*/
/* NECフォーマット Port制御     */
#define NEC_READER_ON           9000        /* Reader Code Hi    : 9.0ms        */
#define NEC_READER_OFF          4500        /* Reader Code Low   : 4.5ms        */
#define NEC_DATA_ON              570        /* Data Code Hi      : 0.56ms       */
#define NEC_DATA_BITON          1600        /* Data Code Low(1b) : 1.7ms        */
#define NEC_DATA_BITOFF          510        /* Data Code Low(0b) : 0.56ms       */
#define NEC_DATA_END              28        /* 全体で108ms                      */

/* 家電協フォーマット Port制御  */
#define KDN_READER_ON           3250        /* Reader Code Hi    : 3.2ms        */
#define KDN_READER_OFF          1500        /* Reader Code Low   : 1.6ms        */
#define KDN_DATA_ON              420        /* Data Code Hi      : 0.4ms        */
#define KDN_DATA_BITON          1100        /* Data Code Low(1b) : 1.2ms        */
#define KDN_DATA_BITOFF          300        /* Data Code Low(0b) : 0.4ms        */
#define KDN_DATA_END              63        /* 次のコードまで    :  75ms        */

/*==============================================================================*/
/* EEPROM 制御共通定義                                                          */
/*==============================================================================*/
#define EEPROM_KEY_NUM          0x04        /* EEPROM 保持 Key = Function Key   */
#define EEPROM_DATA_SIZE        0x07        /* Format Type(1byte) + Data(6byte) */
/* EEPROM Table Data -> Data Size * Key NUM */
#define EEPROM_TABLE_SIZE       (EEPROM_DATA_SIZE * EEPROM_KEY_NUM)

/*==============================================================================*/
/*  変数宣言                                                                    */
/*==============================================================================*/
/* KEY Code Data Type   */
enum {
    KEY_CODE01 = 0,     /* key： 1 -> ファンクションキー： 1 *///今回ではSTOPに対応
    KEY_CODE02,         /* key： 2 -> ファンクションキー： 2 *///GO
    KEY_CODE03,         /* key： 3 -> ファンクションキー： 3 *///BACK
    KEY_CODE04,         /* key： 4 -> ファンクションキー： 4 *///RIGHT
    KEY_CODE05,         /* key： 5 -> 動作キー          ： 1 *///LEFT
    KEY_CODE06,         /* key： 6 -> 動作キー          ： 2 */
    KEY_CODE07,         /* key： 7 -> 動作キー          ： 3 */
    KEY_CODE08,         /* key： 8 -> 動作キー          ： 4 */
    KEY_CODE09,         /* key： 9 -> 動作キー          ： 5 */
    KEY_CODE10,         /* key：10 -> 動作キー          ： 6 */
    KEY_CODE11,         /* key：11 -> 動作キー          ： 7 */
    KEY_CODE12,         /* key：12 -> 動作キー          ： 8 */
    KEY_CODE13,         /* key：13 -> 動作キー          ： 9 */
    KEY_CODE14,         /* key：14 -> 動作キー          ：10 */
    KEY_CODE15,         /* key：15 -> 動作キー          ：11 */
    KEY_CODE16,         /* key：16 -> 動作キー          ：12 */
    KEY_OFF = 0xFF
};


/*==============================================================================*/
/*  構造体宣言                                                                  */
/*==============================================================================*/
/* EEPROM Data Table */
typedef struct {
    unsigned char format;   /* 赤外線フォーマット種別 */
    unsigned char data[6];  /* 赤外線データコード     */
} EEP_DATA;

