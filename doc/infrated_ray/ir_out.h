/*==============================================================================
*   PROJECT NAME   : 赤外線リモコン 学習キット
*   FILE    NAME   : ir_out.h
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===============================================================================*/

/*==============================================================================*/
/*  プロトタイプ宣言                                                            */
/*==============================================================================*/

/* NEC format 関連              */
void IR_NEC_ReaderCode_Send(void);
void IR_NEC_DataCode_BitOn_Send(void);
void IR_NEC_DataCode_BitOff_Send(void);
void IR_NEC_DataCode_StopBit_Send(void);
void IR_NEC_format(unsigned char* tbl_p);

/* 家電協 format 関連           */
void IR_KDN_ReaderCode_Send(void);
void IR_KDN_DataCode_BitOn_Send(void);
void IR_KDN_DataCode_BitOff_Send(void);
void IR_KDN_DataCode_StopBit_Send(void);
void IR_KDN_format(unsigned char* tbl_p);

/* 赤外線送信処理メイン         */
void ir_out_start(unsigned char func_key, unsigned char key_code);

