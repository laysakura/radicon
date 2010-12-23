/*==============================================================================
*   PROJECT NAME   : �ԊO�������R�� �w�K�L�b�g
*   FILE    NAME   : ir_out.h
*   FUNCTION       : Remote Controller Project (PIC16F886)
*===============================================================================*/

/*==============================================================================*/
/*  �v���g�^�C�v�錾                                                            */
/*==============================================================================*/

/* NEC format �֘A              */
void IR_NEC_ReaderCode_Send(void);
void IR_NEC_DataCode_BitOn_Send(void);
void IR_NEC_DataCode_BitOff_Send(void);
void IR_NEC_DataCode_StopBit_Send(void);
void IR_NEC_format(unsigned char* tbl_p);

/* �Ɠd�� format �֘A           */
void IR_KDN_ReaderCode_Send(void);
void IR_KDN_DataCode_BitOn_Send(void);
void IR_KDN_DataCode_BitOff_Send(void);
void IR_KDN_DataCode_StopBit_Send(void);
void IR_KDN_format(unsigned char* tbl_p);

/* �ԊO�����M�������C��         */
void ir_out_start(unsigned char func_key, unsigned char key_code);

