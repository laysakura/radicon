opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 5239"

opt pagewidth 120

	opt lm

	processor	16F886
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 25 "C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
	psect config,class=CONFIG,delta=2 ;#
# 25 "C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
	dw 0x3FFC & 0x3FF7 & 0x3FFF & 0x3FFF & 0x3CFF & 0x2FFF ;#
;COMMON:	_main->_IR_NEC_format
;COMMON:	_IR_NEC_format->_IR_NEC_ReaderCode_Send
;BANK0:	_IR_NEC_ReaderCode_Send->__delay
;BANK0:	_IR_NEC_format->__delay
;BANK0:	_main->_lcd_put_ir_format
;COMMON:	_lcd_put_ir_format->_lcd_goto_posi
;BANK0:	_lcd_goto_posi->__delay
;BANK0:	_lcd_put_ir_format->_lcd_put_char
;BANK0:	_lcd_put_char->__delay
	FNCALL	_main,_led_control
	FNCALL	_main,_key_input_check
	FNCALL	_main,_cpu_sleep
	FNCALL	_main,_ir_out_start
	FNCALL	_main,_ir_recieve
	FNCALL	_main,_memcpy
	FNCALL	_main,___bmul
	FNCALL	_main,_IR_NEC_format
	FNCALL	_main,_IR_KDN_format
	FNCALL	_main,_lcd_init
	FNCALL	_main,_memset
	FNCALL	_main,_motion_control
	FNCALL	_main,_memcmp
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_lcd_put_ir_format
	FNCALL	_main,_lcd_put_ir_data
	FNCALL	_lcd_put_ir_format,_lcd_goto_posi
	FNCALL	_lcd_put_ir_format,_lcd_put_char
	FNCALL	_lcd_clear,_toggle_E
	FNCALL	_lcd_init,_toggle_E
	FNCALL	_ir_recieve,_memset
	FNCALL	_ir_recieve,_Timer_Reset
	FNCALL	_ir_out_start,_IR_NEC_format
	FNCALL	_ir_out_start,_IR_KDN_format
	FNCALL	_lcd_put_ir_data,_lcd_goto_posi
	FNCALL	_lcd_put_ir_data,_lcd_put_hex
	FNCALL	_lcd_goto_posi,_toggle_E
	FNCALL	_IR_NEC_format,_IR_NEC_ReaderCode_Send
	FNCALL	_IR_NEC_format,_IR_NEC_DataCode_BitOn_Send
	FNCALL	_IR_NEC_format,_IR_NEC_DataCode_BitOff_Send
	FNCALL	_IR_NEC_format,_IR_NEC_DataCode_StopBit_Send
	FNCALL	_IR_KDN_format,_IR_KDN_ReaderCode_Send
	FNCALL	_IR_KDN_format,_IR_KDN_DataCode_BitOn_Send
	FNCALL	_IR_KDN_format,_IR_KDN_DataCode_BitOff_Send
	FNCALL	_IR_KDN_format,_IR_KDN_DataCode_StopBit_Send
	FNCALL	_lcd_put_hex,_lcd_put_char
	FNCALL	_lcd_put_char,_toggle_E
	FNROOT	_main
	global	lcd_put_ir_format@F848
	global	lcd_put_ir_format@F846
	global	lcd_put_ir_format@F844
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	245

;initializer for lcd_put_ir_format@F848
	retlw	04Bh
	retlw	041h
	retlw	044h
	retlw	045h
	retlw	04Eh
	retlw	04Bh
	retlw	059h
	retlw	04Fh
	line	243

;initializer for lcd_put_ir_format@F846
	retlw	055h
	retlw	04Eh
	retlw	04Bh
	retlw	04Eh
	retlw	04Fh
	retlw	057h
	retlw	04Eh
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	242

;initializer for lcd_put_ir_format@F844
	retlw	04Eh
	retlw	045h
	retlw	043h
	global	_ir_format_tbl
psect	strings,class=CODE,delta=2,reloc=256
global __pstrings
__pstrings:
	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	movwf	(btemp)&07Fh
	btfss	(btemp)&07Fh,7
	goto	stringcode
	bcf	status,7
	btfsc	btemp&7Fh,0
	bsf	status,7
	movf	indf,w
	return
stringcode:
	movwf	pclath
	movf	fsr,w
stringdir:
	movwf pc
__stringbase:
psect	stringtext1,class=CODE,delta=2
global __pstringtext1
__pstringtext1:
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_data.h"
	line	28
_ir_format_tbl:
	retlw	010h
	retlw	010h
	retlw	020h
	retlw	020h
	global	_ir_func1_code_tbl
psect	stringtext2,class=CODE,delta=2
global __pstringtext2
__pstringtext2:
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_data.h"
	line	36
_ir_func1_code_tbl:
	retlw	02h
	retlw	0FDh
	retlw	048h
	retlw	0B7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	0F0h
	retlw	0Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	058h
	retlw	0A7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	078h
	retlw	087h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	0D8h
	retlw	027h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	0F8h
	retlw	07h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	080h
	retlw	07Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	040h
	retlw	0BFh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	020h
	retlw	0DFh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	0A0h
	retlw	05Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	060h
	retlw	09Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	0FDh
	retlw	010h
	retlw	0EFh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_ir_func2_code_tbl
psect	stringtext3,class=CODE,delta=2
global __pstringtext3
__pstringtext3:
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_data.h"
	line	52
_ir_func2_code_tbl:
	retlw	0Ah
	retlw	0F5h
	retlw	0E8h
	retlw	017h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	090h
	retlw	06Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	048h
	retlw	0B7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	0A8h
	retlw	057h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	098h
	retlw	067h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	018h
	retlw	0A7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	0B0h
	retlw	04Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	0F0h
	retlw	0Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	038h
	retlw	0C7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	078h
	retlw	087h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	020h
	retlw	0DFh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ah
	retlw	0F5h
	retlw	060h
	retlw	09Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_ir_func3_code_tbl
psect	stringtext4,class=CODE,delta=2
global __pstringtext4
__pstringtext4:
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_data.h"
	line	68
_ir_func3_code_tbl:
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	068h
	retlw	08Bh
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	0C8h
	retlw	081h
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	028h
	retlw	08Fh
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	0A8h
	retlw	087h
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	088h
	retlw	085h
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	048h
	retlw	089h
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	080h
	retlw	08Dh
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	0C0h
	retlw	089h
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	020h
	retlw	087h
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	060h
	retlw	083h
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	010h
	retlw	084h
	retlw	0
	retlw	0
	retlw	055h
	retlw	05Ah
	retlw	0F1h
	retlw	048h
	retlw	050h
	retlw	080h
	retlw	0
	retlw	0
	global	_ir_func4_code_tbl
psect	stringtext5,class=CODE,delta=2
global __pstringtext5
__pstringtext5:
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_data.h"
	line	84
_ir_func4_code_tbl:
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	0BCh
	retlw	0BDh
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	0A0h
	retlw	0A1h
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	04h
	retlw	05h
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	084h
	retlw	085h
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	02Ch
	retlw	02Dh
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	0ACh
	retlw	0ADh
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	08h
	retlw	09h
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	048h
	retlw	049h
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	0C8h
	retlw	0C9h
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	0A8h
	retlw	0A9h
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	0E8h
	retlw	0E9h
	retlw	0
	retlw	0
	retlw	040h
	retlw	04h
	retlw	01h
	retlw	0
	retlw	098h
	retlw	099h
	retlw	0
	retlw	0
	global	_ir_format_tbl
	global	_ir_func1_code_tbl
	global	_ir_func2_code_tbl
	global	_ir_func3_code_tbl
	global	_ir_func4_code_tbl
	global	_rx_format
	global	_pre_data
	global	_rcv_data
	global	_eep_wdata
	global	_eep_rdata
	global	_ADCON0
_ADCON0  equ     31
	global	_ADRESH
_ADRESH  equ     30
	global	_CCP1CON
_CCP1CON  equ     23
	global	_CCP2CON
_CCP2CON  equ     29
	global	_CCPR1H
_CCPR1H  equ     22
	global	_CCPR1L
_CCPR1L  equ     21
	global	_CCPR2H
_CCPR2H  equ     28
	global	_CCPR2L
_CCPR2L  equ     27
	global	_FSR
_FSR  equ     4
	global	_INDF
_INDF  equ     0
	global	_INTCON
_INTCON  equ     11
	global	_PCL
_PCL  equ     2
	global	_PCLATH
_PCLATH  equ     10
	global	_PIR1
_PIR1  equ     12
	global	_PIR2
_PIR2  equ     13
	global	_PORTA
_PORTA  equ     5
	global	_PORTB
_PORTB  equ     6
	global	_PORTC
_PORTC  equ     7
	global	_PORTE
_PORTE  equ     9
	global	_RCREG
_RCREG  equ     26
	global	_RCSTA
_RCSTA  equ     24
	global	_SSPBUF
_SSPBUF  equ     19
	global	_SSPCON
_SSPCON  equ     20
	global	_STATUS
_STATUS  equ     3
	global	_T1CON
_T1CON  equ     16
	global	_T2CON
_T2CON  equ     18
	global	_TMR0
_TMR0  equ     1
	global	_TMR1H
_TMR1H  equ     15
	global	_TMR1L
_TMR1L  equ     14
	global	_TMR2
_TMR2  equ     17
	global	_TXREG
_TXREG  equ     25
	global	_ADCS0
_ADCS0  equ     254
	global	_ADCS1
_ADCS1  equ     255
	global	_ADDEN
_ADDEN  equ     195
	global	_ADIF
_ADIF  equ     102
	global	_ADON
_ADON  equ     248
	global	_BCLIF
_BCLIF  equ     107
	global	_C1IF
_C1IF  equ     109
	global	_C2IF
_C2IF  equ     110
	global	_CARRY
_CARRY  equ     24
	global	_CCP1IF
_CCP1IF  equ     98
	global	_CCP1M0
_CCP1M0  equ     184
	global	_CCP1M1
_CCP1M1  equ     185
	global	_CCP1M2
_CCP1M2  equ     186
	global	_CCP1M3
_CCP1M3  equ     187
	global	_CCP2IF
_CCP2IF  equ     104
	global	_CCP2M0
_CCP2M0  equ     232
	global	_CCP2M1
_CCP2M1  equ     233
	global	_CCP2M2
_CCP2M2  equ     234
	global	_CCP2M3
_CCP2M3  equ     235
	global	_CCP2X
_CCP2X  equ     237
	global	_CCP2Y
_CCP2Y  equ     236
	global	_CHS0
_CHS0  equ     250
	global	_CHS1
_CHS1  equ     251
	global	_CHS2
_CHS2  equ     252
	global	_CHS3
_CHS3  equ     253
	global	_CKP
_CKP  equ     164
	global	_CREN
_CREN  equ     196
	global	_DC
_DC  equ     25
	global	_DC1B0
_DC1B0  equ     188
	global	_DC1B1
_DC1B1  equ     189
	global	_EEIF
_EEIF  equ     108
	global	_FERR
_FERR  equ     194
	global	_GIE
_GIE  equ     95
	global	_GODONE
_GODONE  equ     249
	global	_INTE
_INTE  equ     92
	global	_INTF
_INTF  equ     89
	global	_IRP
_IRP  equ     31
	global	_OERR
_OERR  equ     193
	global	_OSFIF
_OSFIF  equ     111
	global	_P1M0
_P1M0  equ     190
	global	_P1M1
_P1M1  equ     191
	global	_PD
_PD  equ     27
	global	_PEIE
_PEIE  equ     94
	global	_RA0
_RA0  equ     40
	global	_RA1
_RA1  equ     41
	global	_RA2
_RA2  equ     42
	global	_RA3
_RA3  equ     43
	global	_RA4
_RA4  equ     44
	global	_RA5
_RA5  equ     45
	global	_RA6
_RA6  equ     46
	global	_RA7
_RA7  equ     47
	global	_RABIE
_RABIE  equ     91
	global	_RABIF
_RABIF  equ     88
	global	_RB0
_RB0  equ     48
	global	_RB1
_RB1  equ     49
	global	_RB2
_RB2  equ     50
	global	_RB3
_RB3  equ     51
	global	_RB4
_RB4  equ     52
	global	_RB5
_RB5  equ     53
	global	_RB6
_RB6  equ     54
	global	_RB7
_RB7  equ     55
	global	_RBIE
_RBIE  equ     91
	global	_RBIF
_RBIF  equ     88
	global	_RC0
_RC0  equ     56
	global	_RC1
_RC1  equ     57
	global	_RC2
_RC2  equ     58
	global	_RC3
_RC3  equ     59
	global	_RC4
_RC4  equ     60
	global	_RC5
_RC5  equ     61
	global	_RC6
_RC6  equ     62
	global	_RC7
_RC7  equ     63
	global	_RCIF
_RCIF  equ     101
	global	_RE3
_RE3  equ     75
	global	_RP0
_RP0  equ     29
	global	_RP1
_RP1  equ     30
	global	_RX9
_RX9  equ     198
	global	_RX9D
_RX9D  equ     192
	global	_SPEN
_SPEN  equ     199
	global	_SREN
_SREN  equ     197
	global	_SSPEN
_SSPEN  equ     165
	global	_SSPIF
_SSPIF  equ     99
	global	_SSPM0
_SSPM0  equ     160
	global	_SSPM1
_SSPM1  equ     161
	global	_SSPM2
_SSPM2  equ     162
	global	_SSPM3
_SSPM3  equ     163
	global	_SSPOV
_SSPOV  equ     166
	global	_T0IE
_T0IE  equ     93
	global	_T0IF
_T0IF  equ     90
	global	_T1CKPS0
_T1CKPS0  equ     132
	global	_T1CKPS1
_T1CKPS1  equ     133
	global	_T1GINV
_T1GINV  equ     135
	global	_T1OSCEN
_T1OSCEN  equ     131
	global	_T1SYNC
_T1SYNC  equ     130
	global	_T2CKPS0
_T2CKPS0  equ     144
	global	_T2CKPS1
_T2CKPS1  equ     145
	global	_TMR1CS
_TMR1CS  equ     129
	global	_TMR1GE
_TMR1GE  equ     134
	global	_TMR1IF
_TMR1IF  equ     96
	global	_TMR1ON
_TMR1ON  equ     128
	global	_TMR2IF
_TMR2IF  equ     97
	global	_TMR2ON
_TMR2ON  equ     146
	global	_TO
_TO  equ     28
	global	_TOUTPS0
_TOUTPS0  equ     147
	global	_TOUTPS1
_TOUTPS1  equ     148
	global	_TOUTPS2
_TOUTPS2  equ     149
	global	_TOUTPS3
_TOUTPS3  equ     150
	global	_TXIF
_TXIF  equ     100
	global	_ULPWUIF
_ULPWUIF  equ     106
	global	_WCOL
_WCOL  equ     167
	global	_ZERO
_ZERO  equ     26
	global	_ADCON1
_ADCON1  equ     159
	global	_ADRESL
_ADRESL  equ     158
	global	_ECCPAS
_ECCPAS  equ     156
	global	_IOCB
_IOCB  equ     150
	global	_OPTION
_OPTION  equ     129
	global	_OSCCON
_OSCCON  equ     143
	global	_OSCTUNE
_OSCTUNE  equ     144
	global	_PCON
_PCON  equ     142
	global	_PIE1
_PIE1  equ     140
	global	_PIE2
_PIE2  equ     141
	global	_PR2
_PR2  equ     146
	global	_PSTRCON
_PSTRCON  equ     157
	global	_PWM1CON
_PWM1CON  equ     155
	global	_SPBRG
_SPBRG  equ     153
	global	_SPBRGH
_SPBRGH  equ     154
	global	_SSPADD
_SSPADD  equ     147
	global	_SSPCON2
_SSPCON2  equ     145
	global	_SSPMSK
_SSPMSK  equ     147
	global	_SSPSTAT
_SSPSTAT  equ     148
	global	_TRISA
_TRISA  equ     133
	global	_TRISB
_TRISB  equ     134
	global	_TRISC
_TRISC  equ     135
	global	_TRISE
_TRISE  equ     137
	global	_TXSTA
_TXSTA  equ     152
	global	_VRCON
_VRCON  equ     151
	global	_WPUB
_WPUB  equ     149
	global	_ACKDT
_ACKDT  equ     1165
	global	_ACKEN
_ACKEN  equ     1164
	global	_ACKSTAT
_ACKSTAT  equ     1166
	global	_ADFM
_ADFM  equ     1279
	global	_ADIE
_ADIE  equ     1126
	global	_BCLIE
_BCLIE  equ     1131
	global	_BF
_BF  equ     1184
	global	_BOR
_BOR  equ     1136
	global	_BRG0
_BRG0  equ     1224
	global	_BRG1
_BRG1  equ     1225
	global	_BRG10
_BRG10  equ     1234
	global	_BRG11
_BRG11  equ     1235
	global	_BRG12
_BRG12  equ     1236
	global	_BRG13
_BRG13  equ     1237
	global	_BRG14
_BRG14  equ     1238
	global	_BRG15
_BRG15  equ     1239
	global	_BRG2
_BRG2  equ     1226
	global	_BRG3
_BRG3  equ     1227
	global	_BRG4
_BRG4  equ     1228
	global	_BRG5
_BRG5  equ     1229
	global	_BRG6
_BRG6  equ     1230
	global	_BRG7
_BRG7  equ     1231
	global	_BRG8
_BRG8  equ     1232
	global	_BRG9
_BRG9  equ     1233
	global	_BRGH
_BRGH  equ     1218
	global	_C1IE
_C1IE  equ     1133
	global	_C2IE
_C2IE  equ     1134
	global	_CCP1IE
_CCP1IE  equ     1122
	global	_CCP2IE
_CCP2IE  equ     1128
	global	_CKE
_CKE  equ     1190
	global	_CSRC
_CSRC  equ     1223
	global	_DA
_DA  equ     1189
	global	_ECCPAS0
_ECCPAS0  equ     1252
	global	_ECCPAS1
_ECCPAS1  equ     1253
	global	_ECCPAS2
_ECCPAS2  equ     1254
	global	_ECCPASE
_ECCPASE  equ     1255
	global	_EEIE
_EEIE  equ     1132
	global	_GCEN
_GCEN  equ     1167
	global	_HTS
_HTS  equ     1146
	global	_INTEDG
_INTEDG  equ     1038
	global	_IOCB0
_IOCB0  equ     1200
	global	_IOCB1
_IOCB1  equ     1201
	global	_IOCB2
_IOCB2  equ     1202
	global	_IOCB3
_IOCB3  equ     1203
	global	_IOCB4
_IOCB4  equ     1204
	global	_IOCB5
_IOCB5  equ     1205
	global	_IOCB6
_IOCB6  equ     1206
	global	_IOCB7
_IOCB7  equ     1207
	global	_IRCF0
_IRCF0  equ     1148
	global	_IRCF1
_IRCF1  equ     1149
	global	_IRCF2
_IRCF2  equ     1150
	global	_LTS
_LTS  equ     1145
	global	_OSFIE
_OSFIE  equ     1135
	global	_OSTS
_OSTS  equ     1147
	global	_PDC0
_PDC0  equ     1240
	global	_PDC1
_PDC1  equ     1241
	global	_PDC2
_PDC2  equ     1242
	global	_PDC3
_PDC3  equ     1243
	global	_PDC4
_PDC4  equ     1244
	global	_PDC5
_PDC5  equ     1245
	global	_PDC6
_PDC6  equ     1246
	global	_PEN
_PEN  equ     1162
	global	_POR
_POR  equ     1137
	global	_PRSEN
_PRSEN  equ     1247
	global	_PS0
_PS0  equ     1032
	global	_PS1
_PS1  equ     1033
	global	_PS2
_PS2  equ     1034
	global	_PSA
_PSA  equ     1035
	global	_PSSAC0
_PSSAC0  equ     1250
	global	_PSSAC1
_PSSAC1  equ     1251
	global	_PSSBD0
_PSSBD0  equ     1248
	global	_PSSBD1
_PSSBD1  equ     1249
	global	_RABPU
_RABPU  equ     1039
	global	_RBPU
_RBPU  equ     1039
	global	_RCEN
_RCEN  equ     1163
	global	_RCIE
_RCIE  equ     1125
	global	_RSEN
_RSEN  equ     1161
	global	_RW
_RW  equ     1186
	global	_SBOREN
_SBOREN  equ     1140
	global	_SCS
_SCS  equ     1144
	global	_SEN
_SEN  equ     1160
	global	_SENDB
_SENDB  equ     1219
	global	_SMP
_SMP  equ     1191
	global	_SSPIE
_SSPIE  equ     1123
	global	_START
_START  equ     1187
	global	_STOP
_STOP  equ     1188
	global	_STRA
_STRA  equ     1256
	global	_STRB
_STRB  equ     1257
	global	_STRC
_STRC  equ     1258
	global	_STRD
_STRD  equ     1259
	global	_STRSYNC
_STRSYNC  equ     1260
	global	_SYNC
_SYNC  equ     1220
	global	_T0CS
_T0CS  equ     1037
	global	_T0SE
_T0SE  equ     1036
	global	_TMR1IE
_TMR1IE  equ     1120
	global	_TMR2IE
_TMR2IE  equ     1121
	global	_TRISA0
_TRISA0  equ     1064
	global	_TRISA1
_TRISA1  equ     1065
	global	_TRISA2
_TRISA2  equ     1066
	global	_TRISA3
_TRISA3  equ     1067
	global	_TRISA4
_TRISA4  equ     1068
	global	_TRISA5
_TRISA5  equ     1069
	global	_TRISA6
_TRISA6  equ     1070
	global	_TRISA7
_TRISA7  equ     1071
	global	_TRISB0
_TRISB0  equ     1072
	global	_TRISB1
_TRISB1  equ     1073
	global	_TRISB2
_TRISB2  equ     1074
	global	_TRISB3
_TRISB3  equ     1075
	global	_TRISB4
_TRISB4  equ     1076
	global	_TRISB5
_TRISB5  equ     1077
	global	_TRISB6
_TRISB6  equ     1078
	global	_TRISB7
_TRISB7  equ     1079
	global	_TRISC0
_TRISC0  equ     1080
	global	_TRISC1
_TRISC1  equ     1081
	global	_TRISC2
_TRISC2  equ     1082
	global	_TRISC3
_TRISC3  equ     1083
	global	_TRISC4
_TRISC4  equ     1084
	global	_TRISC5
_TRISC5  equ     1085
	global	_TRISC6
_TRISC6  equ     1086
	global	_TRISC7
_TRISC7  equ     1087
	global	_TRISE3
_TRISE3  equ     1099
	global	_TRMT
_TRMT  equ     1217
	global	_TUN0
_TUN0  equ     1152
	global	_TUN1
_TUN1  equ     1153
	global	_TUN2
_TUN2  equ     1154
	global	_TUN3
_TUN3  equ     1155
	global	_TUN4
_TUN4  equ     1156
	global	_TX9
_TX9  equ     1222
	global	_TX9D
_TX9D  equ     1216
	global	_TXEN
_TXEN  equ     1221
	global	_TXIE
_TXIE  equ     1124
	global	_UA
_UA  equ     1185
	global	_ULPWUE
_ULPWUE  equ     1141
	global	_ULPWUIE
_ULPWUIE  equ     1130
	global	_VCFG0
_VCFG0  equ     1276
	global	_VCFG1
_VCFG1  equ     1277
	global	_VR0
_VR0  equ     1208
	global	_VR1
_VR1  equ     1209
	global	_VR2
_VR2  equ     1210
	global	_VR3
_VR3  equ     1211
	global	_VREN
_VREN  equ     1215
	global	_VROE
_VROE  equ     1214
	global	_VRR
_VRR  equ     1213
	global	_VRSS
_VRSS  equ     1212
	global	_WPUB0
_WPUB0  equ     1192
	global	_WPUB1
_WPUB1  equ     1193
	global	_WPUB2
_WPUB2  equ     1194
	global	_WPUB3
_WPUB3  equ     1195
	global	_WPUB4
_WPUB4  equ     1196
	global	_WPUB5
_WPUB5  equ     1197
	global	_WPUB6
_WPUB6  equ     1198
	global	_WPUB7
_WPUB7  equ     1199
	global	_CM1CON0
_CM1CON0  equ     263
	global	_CM2CON0
_CM2CON0  equ     264
	global	_CM2CON1
_CM2CON1  equ     265
	global	_EEADR
_EEADR  equ     269
	global	_EEADRH
_EEADRH  equ     271
	global	_EEADRL
_EEADRL  equ     269
	global	_EEDAT
_EEDAT  equ     268
	global	_EEDATA
_EEDATA  equ     268
	global	_EEDATH
_EEDATH  equ     270
	global	_WDTCON
_WDTCON  equ     261
	global	_C1CH0
_C1CH0  equ     2104
	global	_C1CH1
_C1CH1  equ     2105
	global	_C1OE
_C1OE  equ     2109
	global	_C1ON
_C1ON  equ     2111
	global	_C1OUT
_C1OUT  equ     2110
	global	_C1POL
_C1POL  equ     2108
	global	_C1R
_C1R  equ     2106
	global	_C1RSEL
_C1RSEL  equ     2125
	global	_C2CH0
_C2CH0  equ     2112
	global	_C2CH1
_C2CH1  equ     2113
	global	_C2OE
_C2OE  equ     2117
	global	_C2ON
_C2ON  equ     2119
	global	_C2OUT
_C2OUT  equ     2118
	global	_C2POL
_C2POL  equ     2116
	global	_C2R
_C2R  equ     2114
	global	_C2RSEL
_C2RSEL  equ     2124
	global	_C2SYNC
_C2SYNC  equ     2120
	global	_MC1OUT
_MC1OUT  equ     2127
	global	_MC2OUT
_MC2OUT  equ     2126
	global	_SWDTEN
_SWDTEN  equ     2088
	global	_T1GSS
_T1GSS  equ     2121
	global	_WDTPS0
_WDTPS0  equ     2089
	global	_WDTPS1
_WDTPS1  equ     2090
	global	_WDTPS2
_WDTPS2  equ     2091
	global	_WDTPS3
_WDTPS3  equ     2092
	global	_ANSEL
_ANSEL  equ     392
	global	_ANSELH
_ANSELH  equ     393
	global	_BAUDCTL
_BAUDCTL  equ     391
	global	_EECON1
_EECON1  equ     396
	global	_EECON2
_EECON2  equ     397
	global	_SRCON
_SRCON  equ     389
	global	_ABDEN
_ABDEN  equ     3128
	global	_ABDOVF
_ABDOVF  equ     3135
	global	_ANS0
_ANS0  equ     3136
	global	_ANS1
_ANS1  equ     3137
	global	_ANS10
_ANS10  equ     3146
	global	_ANS11
_ANS11  equ     3147
	global	_ANS12
_ANS12  equ     3148
	global	_ANS13
_ANS13  equ     3149
	global	_ANS2
_ANS2  equ     3138
	global	_ANS3
_ANS3  equ     3139
	global	_ANS4
_ANS4  equ     3140
	global	_ANS8
_ANS8  equ     3144
	global	_ANS9
_ANS9  equ     3145
	global	_BRG16
_BRG16  equ     3131
	global	_C1SEN
_C1SEN  equ     3117
	global	_C2REN
_C2REN  equ     3116
	global	_EEPGD
_EEPGD  equ     3175
	global	_FVREN
_FVREN  equ     3112
	global	_PULSR
_PULSR  equ     3114
	global	_PULSS
_PULSS  equ     3115
	global	_RCIDL
_RCIDL  equ     3134
	global	_RD
_RD  equ     3168
	global	_SCKP
_SCKP  equ     3132
	global	_SR0
_SR0  equ     3118
	global	_SR1
_SR1  equ     3119
	global	_WR
_WR  equ     3169
	global	_WREN
_WREN  equ     3170
	global	_WRERR
_WRERR  equ     3171
	global	_WUE
_WUE  equ     3129
	file	"infrated_ray_project.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_rx_format:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	242
lcd_put_ir_format@F844:
       ds      3

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_pre_data:
       ds      8

_rcv_data:
       ds      8

_eep_wdata:
       ds      7

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	245
lcd_put_ir_format@F848:
       ds      8

psect	dataBANK0
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	243
lcd_put_ir_format@F846:
       ds      7

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_eep_rdata:
       ds      28

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+017h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+01Ch)
	fcall	clear_ram
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to COMMON
psect cinit,class=CODE,delta=2
global init_ram, __pidataCOMMON
	movlw low(__pdataCOMMON+3)
	movwf btemp-1,f
	movlw high(__pidataCOMMON)
	movwf btemp,f
	movlw low(__pidataCOMMON)
	movwf btemp+1,f
	movlw low(__pdataCOMMON)
	movwf fsr,f
	fcall init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	movlw low(__pdataBANK0+15)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initationation code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	main@func_key_type
main@func_key_type:	; 1 bytes @ 0x0
	ds	1
	global	main@ir_state
main@ir_state:	; 1 bytes @ 0x1
	ds	1
	global	main@eep_offset
main@eep_offset:	; 1 bytes @ 0x2
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x3
	ds	1
	global	main@key_code
main@key_code:	; 1 bytes @ 0x4
	ds	1
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_memset
??_memset: ;@ 0x0
	global	??_key_input_check
??_key_input_check: ;@ 0x0
	global	?_Timer_Reset
?_Timer_Reset: ;@ 0x0
	global	??_lcd_goto_posi
??_lcd_goto_posi: ;@ 0x0
	global	??_Timer_Reset
??_Timer_Reset: ;@ 0x0
	global	??___bmul
??___bmul: ;@ 0x0
	global	??_memcpy
??_memcpy: ;@ 0x0
	global	??_lcd_init
??_lcd_init: ;@ 0x0
	global	??_led_control
??_led_control: ;@ 0x0
	global	??_cpu_sleep
??_cpu_sleep: ;@ 0x0
	global	??_lcd_put_char
??_lcd_put_char: ;@ 0x0
	global	??_IR_KDN_DataCode_BitOff_Send
??_IR_KDN_DataCode_BitOff_Send: ;@ 0x0
	global	??_IR_KDN_DataCode_StopBit_Send
??_IR_KDN_DataCode_StopBit_Send: ;@ 0x0
	global	??_IR_KDN_DataCode_BitOn_Send
??_IR_KDN_DataCode_BitOn_Send: ;@ 0x0
	global	??_toggle_E
??_toggle_E: ;@ 0x0
	global	??__delay
??__delay: ;@ 0x0
	global	??_IR_NEC_DataCode_StopBit_Send
??_IR_NEC_DataCode_StopBit_Send: ;@ 0x0
	global	??_IR_NEC_DataCode_BitOff_Send
??_IR_NEC_DataCode_BitOff_Send: ;@ 0x0
	global	??_IR_NEC_ReaderCode_Send
??_IR_NEC_ReaderCode_Send: ;@ 0x0
	global	??_IR_KDN_ReaderCode_Send
??_IR_KDN_ReaderCode_Send: ;@ 0x0
	global	??_IR_NEC_DataCode_BitOn_Send
??_IR_NEC_DataCode_BitOn_Send: ;@ 0x0
	global	??_motion_control
??_motion_control: ;@ 0x0
	global	??_lcd_clear
??_lcd_clear: ;@ 0x0
	global	??_memcmp
??_memcmp: ;@ 0x0
	global	motion_control@motion_state
motion_control@motion_state:	; 1 bytes @ 0x0
	ds	1
	global	?_motion_control
?_motion_control: ;@ 0x1
	global	?_cpu_sleep
?_cpu_sleep: ;@ 0x1
	global	??_ir_recieve
??_ir_recieve: ;@ 0x1
	global	??_lcd_put_hex
??_lcd_put_hex: ;@ 0x1
	global	lcd_goto_posi@addr
lcd_goto_posi@addr:	; 1 bytes @ 0x1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x1
	global	led_control@led_state
led_control@led_state:	; 1 bytes @ 0x1
	global	key_input_check@i
key_input_check@i:	; 1 bytes @ 0x1
	global	memcpy@d1
memcpy@d1:	; 1 bytes @ 0x1
	ds	1
	global	?_lcd_clear
?_lcd_clear: ;@ 0x2
	global	?_led_control
?_led_control: ;@ 0x2
	global	?_lcd_put_hex
?_lcd_put_hex: ;@ 0x2
	global	?_lcd_init
?_lcd_init: ;@ 0x2
	global	??_IR_NEC_format
??_IR_NEC_format: ;@ 0x2
	global	IR_KDN_format@j
IR_KDN_format@j:	; 1 bytes @ 0x2
	global	memcmp@s1
memcmp@s1:	; 1 bytes @ 0x2
	global	lcd_goto_posi@temp
lcd_goto_posi@temp:	; 1 bytes @ 0x2
	global	key_input_check@code
key_input_check@code:	; 1 bytes @ 0x2
	global	memcpy@s
memcpy@s:	; 1 bytes @ 0x2
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_put_ir_data
??_lcd_put_ir_data: ;@ 0x3
	global	?_key_input_check
?_key_input_check: ;@ 0x3
	global	?_ir_recieve
?_ir_recieve: ;@ 0x3
	global	?___bmul
?___bmul: ;@ 0x3
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x3
	global	IR_KDN_format@i
IR_KDN_format@i:	; 1 bytes @ 0x3
	global	memcpy@d
memcpy@d:	; 1 bytes @ 0x3
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?__delay
?__delay: ;@ 0x0
	global	?_toggle_E
?_toggle_E: ;@ 0x0
	global	?_memcpy
?_memcpy: ;@ 0x0
	global	memcpy@s1
memcpy@s1:	; 1 bytes @ 0x0
	global	memset@p1
memset@p1:	; 1 bytes @ 0x0
	global	memcmp@s2
memcmp@s2:	; 1 bytes @ 0x0
	global	?_memcmp
?_memcmp: ;@ 0x0
	global	__delay$0
__delay$0:	; 4 bytes @ 0x0
	ds	1
	global	memset@p
memset@p:	; 1 bytes @ 0x1
	global	memcpy@n
memcpy@n:	; 2 bytes @ 0x1
	global	memcmp@n
memcmp@n:	; 2 bytes @ 0x1
	ds	1
	global	?_memset
?_memset: ;@ 0x2
	global	memset@c
memset@c:	; 2 bytes @ 0x2
	ds	2
	global	?_IR_NEC_DataCode_BitOn_Send
?_IR_NEC_DataCode_BitOn_Send: ;@ 0x4
	global	??_IR_KDN_format
??_IR_KDN_format: ;@ 0x4
	global	?_IR_KDN_ReaderCode_Send
?_IR_KDN_ReaderCode_Send: ;@ 0x4
	global	?_IR_KDN_DataCode_StopBit_Send
?_IR_KDN_DataCode_StopBit_Send: ;@ 0x4
	global	?_IR_KDN_DataCode_BitOn_Send
?_IR_KDN_DataCode_BitOn_Send: ;@ 0x4
	global	?_IR_NEC_ReaderCode_Send
?_IR_NEC_ReaderCode_Send: ;@ 0x4
	global	?_IR_NEC_DataCode_BitOff_Send
?_IR_NEC_DataCode_BitOff_Send: ;@ 0x4
	global	?_IR_NEC_DataCode_StopBit_Send
?_IR_NEC_DataCode_StopBit_Send: ;@ 0x4
	global	?_lcd_goto_posi
?_lcd_goto_posi: ;@ 0x4
	global	?_IR_KDN_DataCode_BitOff_Send
?_IR_KDN_DataCode_BitOff_Send: ;@ 0x4
	global	lcd_put_char@data
lcd_put_char@data:	; 1 bytes @ 0x4
	global	IR_NEC_format@j
IR_NEC_format@j:	; 1 bytes @ 0x4
	global	memset@n
memset@n:	; 2 bytes @ 0x4
	ds	1
	global	IR_NEC_format@i
IR_NEC_format@i:	; 1 bytes @ 0x5
	global	lcd_put_char@temp
lcd_put_char@temp:	; 1 bytes @ 0x5
	ds	1
	global	?_IR_NEC_format
?_IR_NEC_format: ;@ 0x6
	global	?_lcd_put_char
?_lcd_put_char: ;@ 0x6
	global	??_lcd_put_ir_format
??_lcd_put_ir_format: ;@ 0x6
	global	lcd_put_hex@data
lcd_put_hex@data:	; 1 bytes @ 0x6
	global	ir_recieve@s_data
ir_recieve@s_data:	; 1 bytes @ 0x6
	global	IR_NEC_format@tbl_p
IR_NEC_format@tbl_p:	; 2 bytes @ 0x6
	ds	1
	global	ir_recieve@i
ir_recieve@i:	; 1 bytes @ 0x7
	global	lcd_put_hex@lo
lcd_put_hex@lo:	; 1 bytes @ 0x7
	ds	1
	global	?_IR_KDN_format
?_IR_KDN_format: ;@ 0x8
	global	lcd_put_hex@hi
lcd_put_hex@hi:	; 1 bytes @ 0x8
	global	IR_KDN_format@tbl_p
IR_KDN_format@tbl_p:	; 2 bytes @ 0x8
	ds	1
	global	lcd_put_ir_data@ir_data
lcd_put_ir_data@ir_data:	; 1 bytes @ 0x9
	ds	1
	global	??_ir_out_start
??_ir_out_start: ;@ 0xA
	global	lcd_put_ir_data@ir_char
lcd_put_ir_data@ir_char:	; 1 bytes @ 0xA
	global	lcd_put_ir_format@kdn
lcd_put_ir_format@kdn:	; 8 bytes @ 0xA
	ds	1
	global	lcd_put_ir_data@i
lcd_put_ir_data@i:	; 1 bytes @ 0xB
	ds	1
	global	?_lcd_put_ir_data
?_lcd_put_ir_data: ;@ 0xC
	global	lcd_put_ir_data@size
lcd_put_ir_data@size:	; 1 bytes @ 0xC
	ds	1
	global	ir_out_start@format
ir_out_start@format:	; 1 bytes @ 0xD
	ds	1
	global	ir_out_start@data_p
ir_out_start@data_p:	; 2 bytes @ 0xE
	ds	2
	global	ir_out_start@func_key
ir_out_start@func_key:	; 1 bytes @ 0x10
	ds	1
	global	?_ir_out_start
?_ir_out_start: ;@ 0x11
	global	ir_out_start@key_code
ir_out_start@key_code:	; 1 bytes @ 0x11
	ds	1
	global	lcd_put_ir_format@ukn
lcd_put_ir_format@ukn:	; 7 bytes @ 0x12
	ds	7
	global	lcd_put_ir_format@nec
lcd_put_ir_format@nec:	; 3 bytes @ 0x19
	ds	3
	global	lcd_put_ir_format@format
lcd_put_ir_format@format:	; 1 bytes @ 0x1C
	ds	1
	global	lcd_put_ir_format@i
lcd_put_ir_format@i:	; 1 bytes @ 0x1D
	ds	1
	global	?_lcd_put_ir_format
?_lcd_put_ir_format: ;@ 0x1E
	global	??_main
??_main: ;@ 0x1E
	ds	2
	global	?_main
?_main: ;@ 0x20
;Data sizes: Strings 0, constant 388, data 18, bss 52, persistent 0 stack 0
;Auto spaces:   Size  Autos    Used
; COMMON          14      6      10
; BANK0           80     32      70
; BANK1           80      5      33
; BANK3           96      0       0
; BANK2           96      0       0


;Pointer list with targets:

;sp__memcpy	PTR void  size(1); Largest target is 8
;		 -> eep_wdata(BANK0[7]), pre_data(BANK0[8]), 
;sp__memset	PTR void  size(1); Largest target is 8
;		 -> rcv_data(BANK0[8]), pre_data(BANK0[8]), 
;IR_NEC_format@tbl_p	PTR unsigned char  size(2); Largest target is 96
;		 -> eep_rdata(BANK1[28]), ir_func1_code_tbl(CODE[96]), ir_func2_code_tbl(CODE[96]), ir_func3_code_tbl(CODE[96]), 
;		 -> ir_func4_code_tbl(CODE[96]), 
;IR_KDN_format@tbl_p	PTR unsigned char  size(2); Largest target is 96
;		 -> eep_rdata(BANK1[28]), ir_func1_code_tbl(CODE[96]), ir_func2_code_tbl(CODE[96]), ir_func3_code_tbl(CODE[96]), 
;		 -> ir_func4_code_tbl(CODE[96]), 
;ir_out_start@data_p	PTR unsigned char  size(2); Largest target is 96
;		 -> ir_func1_code_tbl(CODE[96]), ir_func2_code_tbl(CODE[96]), ir_func3_code_tbl(CODE[96]), ir_func4_code_tbl(CODE[96]), 
;lcd_put_ir_data@ir_data	PTR unsigned char  size(1); Largest target is 8
;		 -> rcv_data(BANK0[8]), 
;?_memcpy	PTR void  size(1); Largest target is 8
;		 -> eep_wdata(BANK0[7]), pre_data(BANK0[8]), 
;?_memset	PTR void  size(1); Largest target is 8
;		 -> rcv_data(BANK0[8]), pre_data(BANK0[8]), 
;memcmp@s2	PTR const void  size(1); Largest target is 8
;		 -> rcv_data(BANK0[8]), 
;memcmp@s1	PTR const void  size(1); Largest target is 8
;		 -> pre_data(BANK0[8]), 
;memcpy@s	PTR const unsigned char  size(1); Largest target is 8
;		 -> rcv_data(BANK0[8]), 
;memcpy@s1	PTR const void  size(1); Largest target is 8
;		 -> rcv_data(BANK0[8]), 
;memcpy@d	PTR unsigned char  size(1); Largest target is 8
;		 -> eep_wdata(BANK0[7]), pre_data(BANK0[8]), 
;memcpy@d1	PTR void  size(1); Largest target is 8
;		 -> eep_wdata(BANK0[7]), pre_data(BANK0[8]), 
;memset@p	PTR unsigned char  size(1); Largest target is 8
;		 -> rcv_data(BANK0[8]), pre_data(BANK0[8]), 
;memset@p1	PTR void  size(1); Largest target is 8
;		 -> rcv_data(BANK0[8]), pre_data(BANK0[8]), 
;?_memcmp	int  size(1); Largest target is 0


;Main: autosize = 0, tempsize = 2, incstack = 0, save=0


;Call graph:                      Base Space Used Autos Args Refs Density
;_main                                                7    0 4926   0.00
;                                   30 BANK0    2
;                                    0 BANK1    5
;        _led_control
;    _key_input_check
;          _cpu_sleep
;       _ir_out_start
;         _ir_recieve
;             __delay
;             _memcpy
;             ___bmul
;      _IR_NEC_format
;      _IR_KDN_format
;           _lcd_init
;             _memset
;     _motion_control
;             _memcmp
;          _lcd_clear
;  _lcd_put_ir_format
;    _lcd_put_ir_data
;  _memcmp                                            3    3  126   0.00
;                                    0 COMMO    3
;                                    0 BANK0    3
;  _motion_control                                    1    0   24   0.00
;                                    0 COMMO    1
;  _lcd_put_ir_format                                24    0  654   0.00
;                                    6 BANK0   24
;      _lcd_goto_posi
;       _lcd_put_char
;  _lcd_clear                                         2    0    0   0.00
;                                    0 COMMO    2
;           _toggle_E
;             __delay
;  _memcpy                                            4    3  138   0.00
;                                    0 COMMO    4
;                                    0 BANK0    3
;  ___bmul                                            3    1  108   0.00
;                                    0 COMMO    4
;  _lcd_init                                          2    0    0   0.00
;                                    0 COMMO    2
;             __delay
;           _toggle_E
;  _ir_recieve                                        5    0  891   0.00
;                                    1 COMMO    2
;                                    6 BANK0    2
;             _memset
;        _Timer_Reset
;  _cpu_sleep                                         1    0    0   0.00
;                                    0 COMMO    1
;             __delay
;  _ir_out_start                                      7    1  639   0.00
;                                   10 BANK0    8
;      _IR_NEC_format
;      _IR_KDN_format
;  _led_control                                       2    0   48   0.00
;                                    0 COMMO    2
;  _key_input_check                                   3    0  177   0.00
;                                    0 COMMO    3
;             __delay
;  _lcd_put_ir_data                                   4    1  732   0.00
;                                    3 COMMO    1
;                                    9 BANK0    4
;      _lcd_goto_posi
;        _lcd_put_hex
;    _memset                                          3    4  108   0.00
;                                    0 COMMO    1
;                                    0 BANK0    6
;    _Timer_Reset                                     0    0    0   0.00
;    _lcd_goto_posi                                   3    0  159   0.00
;                                    0 COMMO    3
;           _toggle_E
;             __delay
;    _IR_NEC_format                                   6    2  180   0.00
;                                    2 COMMO    4
;                                    4 BANK0    4
;_IR_NEC_ReaderCode_S
;_IR_NEC_DataCode_Bit
;_IR_NEC_DataCode_Bit
;_IR_NEC_DataCode_Sto
;             __delay
;    _IR_KDN_format                                   6    2  180   0.00
;                                    2 COMMO    2
;                                    4 BANK0    6
;_IR_KDN_ReaderCode_S
;_IR_KDN_DataCode_Bit
;_IR_KDN_DataCode_Bit
;_IR_KDN_DataCode_Sto
;             __delay
;    _lcd_put_hex                                     4    0  441   0.00
;                                    1 COMMO    1
;                                    6 BANK0    3
;       _lcd_put_char
;      _lcd_put_char                                  3    0  156   0.00
;                                    0 COMMO    1
;                                    4 BANK0    2
;           _toggle_E
;             __delay
;      _IR_NEC_DataCode_BitOff_Send                   1    0    0   0.00
;                                    0 COMMO    1
;             __delay
;      _IR_NEC_DataCode_StopBit_Send                  1    0    0   0.00
;                                    0 COMMO    1
;             __delay
;      _IR_NEC_ReaderCode_Send                        2    0    0   0.00
;                                    0 COMMO    2
;             __delay
;      _IR_NEC_DataCode_BitOn_Send                    1    0    0   0.00
;                                    0 COMMO    1
;             __delay
;      _IR_KDN_ReaderCode_Send                        2    0    0   0.00
;                                    0 COMMO    2
;             __delay
;      _IR_KDN_DataCode_StopBit_Send                  1    0    0   0.00
;                                    0 COMMO    1
;             __delay
;      _IR_KDN_DataCode_BitOff_Send                   1    0    0   0.00
;                                    0 COMMO    1
;             __delay
;      _IR_KDN_DataCode_BitOn_Send                    1    0    0   0.00
;                                    0 COMMO    1
;             __delay
;        __delay                                      0    4    0   0.00
;                                    0 BANK0    4
;        _toggle_E                                    0    0    0   0.00
; Estimated maximum call depth 4
; Address spaces:

;Name               Size   Autos  Total    Cost      Usage
;BITCOMMON            E      0       0       0        0.0%
;CODE                 0      0       0       0        0.0%
;NULL                 0      0       0       0        0.0%
;COMMON               E      6       A       1       71.4%
;SFR0                 0      0       0       1        0.0%
;BITSFR0              0      0       0       1        0.0%
;BITSFR1              0      0       0       2        0.0%
;SFR1                 0      0       0       2        0.0%
;ABS                  0      0      71       2        0.0%
;STACK                0      0       0       3        0.0%
;BITBANK0            50      0       0       4        0.0%
;SFR3                 0      0       0       4        0.0%
;BITSFR3              0      0       0       4        0.0%
;BANK0               50     20      46       5       87.5%
;BITSFR2              0      0       0       5        0.0%
;SFR2                 0      0       0       5        0.0%
;BITBANK1            50      0       0       6        0.0%
;BANK1               50      5      21       7       41.3%
;BITBANK3            60      0       0       8        0.0%
;BANK3               60      0       0       9        0.0%
;BITBANK2            60      0       0      10        0.0%
;BANK2               60      0       0      11        0.0%
;DATA                 0      0      71      12        0.0%
;EEDATA             100      0       0    1000        0.0%

	global	_main
psect	maintext,local,class=CODE,delta=2
global __pmaintext
__pmaintext:

; *************** function _main *****************
; Defined at:
;		line 188 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;  key_code        1    4[BANK1 ] unsigned char 
;  i               1    3[BANK1 ] unsigned char 
;  eep_offset      1    2[BANK1 ] unsigned char 
;  ir_state        1    1[BANK1 ] unsigned char 
;  func_key_typ    1    0[BANK1 ] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+0, btemp+1, btemp+2, btemp+3, pclath, cstack
; Tracked objects:
;		On entry : 17F/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       2       5       0       0
;      Temp:     2
;      Total:    7
; This function calls:
;		_led_control
;		_key_input_check
;		_cpu_sleep
;		_ir_out_start
;		_ir_recieve
;		__delay
;		_memcpy
;		___bmul
;		_IR_NEC_format
;		_IR_KDN_format
;		_lcd_init
;		_memset
;		_motion_control
;		_memcmp
;		_lcd_clear
;		_lcd_put_ir_format
;		_lcd_put_ir_data
; This function is called by:
;		Startup code after reset
; This function uses a non-reentrant model
; 
psect	maintext
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
	line	188
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
;ir_main.c: 187: void main()
;ir_main.c: 188: {
	
_main:	
	opt stack 7
; Regs used in _main: [allreg]
	line	197
	
l30002700:	
;ir_main.c: 189: unsigned char i;
;ir_main.c: 190: unsigned char ir_state;
;ir_main.c: 191: unsigned char key_code;
;ir_main.c: 192: unsigned char func_key_type;
;ir_main.c: 193: unsigned char eep_offset;
;ir_main.c: 197: TRISA = 0xCF;
	movlw	(0CFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	
l30002701:	
	line	198
;ir_main.c: 198: TRISB = 0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(134)^080h	;volatile
	
l30002702:	
	line	200
;ir_main.c: 200: TRISC = 0x81;
	movlw	(081h)
	movwf	(135)^080h	;volatile
	line	203
;ir_main.c: 203: ADCON0 = 0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	204
;ir_main.c: 204: ANSEL = 0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(392)^0180h
	line	205
;ir_main.c: 205: ANSELH = 0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(393)^0180h
	
l30002703:	
	line	208
;ir_main.c: 208: CM1CON0 = 0x07;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(263)^0100h	;volatile
	
l30002704:	
	line	209
;ir_main.c: 209: CM2CON0 = 0x07;
	movlw	(07h)
	movwf	(264)^0100h	;volatile
	
l30002705:	
	line	212
;ir_main.c: 212: PR2 = 0x19;
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h
	
l30002706:	
	line	213
;ir_main.c: 213: T2CON = 0x0C;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)
	
l30002707:	
	line	216
;ir_main.c: 216: CCPR2L = 0x0C;
	movlw	(0Ch)
	movwf	(27)	;volatile
	
l30002708:	
	line	219
;ir_main.c: 219: CCP2CON = 0x20;
	movlw	(020h)
	movwf	(29)	;volatile
	
l30002709:	
	line	223
;ir_main.c: 223: T1CON = 0x01;
	clrf	(16)
	bsf	status,0
	rlf	(16),f
	
l30002710:	
	line	226
;ir_main.c: 226: TMR1L = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(14)	;volatile
	
l30002711:	
	line	227
;ir_main.c: 227: TMR1H = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(15)	;volatile
	
l30002712:	
	line	228
;ir_main.c: 228: TMR1IF = 0;
	bcf	(96/8),(96)&7
	
l30002713:	
	line	229
;ir_main.c: 229: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1120/8)^080h,(1120)&7
	
l30002714:	
	line	232
;ir_main.c: 232: PORTA = 0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	
l30002715:	
	line	233
;ir_main.c: 233: PORTB = 0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(6)	;volatile
	line	235
;ir_main.c: 235: PORTC = 0x01;
	movlw	(01h)
	movwf	(7)	;volatile
	
l30002716:	
	line	240
;ir_main.c: 240: if ((PORTA & 0xC0) == 0xC0) {
	movf	(5),w	;volatile
	andlw	0C0h
	xorlw	0C0h
	skipz
	goto	u2571
	goto	u2570
u2571:
	goto	l30002726
u2570:
	
l30002717:	
	line	242
;ir_main.c: 242: func_key_type = KEY_CODE01;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@func_key_type)^080h
	
l30002718:	
	line	244
;ir_main.c: 244: led_control(0x04);
	movlw	(04h)
	fcall	_led_control
	
l30002719:	
	line	249
;ir_main.c: 247: {
;ir_main.c: 249: key_code = key_input_check();
	fcall	_key_input_check
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@key_code)^080h
	
l30002720:	
	line	252
;ir_main.c: 252: if (key_code == KEY_OFF) {
	movf	(main@key_code)^080h,w
	xorlw	0FFh
	skipz
	goto	u2581
	goto	u2580
u2581:
	goto	l30002722
u2580:
	
l30002721:	
	line	254
;ir_main.c: 254: cpu_sleep();
	fcall	_cpu_sleep
	goto	l30002719
	
l30002722:	
	line	259
;ir_main.c: 257: else {
;ir_main.c: 259: if (key_code <= KEY_CODE04) {
	movlw	(04h)
	subwf	(main@key_code)^080h,w
	skipnc
	goto	u2591
	goto	u2590
u2591:
	goto	l30002725
u2590:
	
l30002723:	
	line	261
;ir_main.c: 261: func_key_type = key_code;
	movf	(main@key_code)^080h,w
	movwf	(main@func_key_type)^080h
	
l30002724:	
	line	263
;ir_main.c: 263: led_control((0x04 << key_code));
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@key_code)^080h,w
	goto	u2604
u2605:
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rlf	(??_main+0+0),f
u2604:
	addlw	-1
	skipz
	goto	u2605
	movf	0+(??_main+0+0),w
	fcall	_led_control
	goto	l30002719
	
l30002725:	
	line	268
;ir_main.c: 266: else {
;ir_main.c: 268: ir_out_start(func_key_type, key_code);
	movf	(main@key_code)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_ir_out_start)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@func_key_type)^080h,w
	fcall	_ir_out_start
	goto	l30002719
	
l30002726:	
	line	277
;ir_main.c: 272: }
;ir_main.c: 277: if ((PORTA & 0xC0) == 0x40) {
	movf	(5),w	;volatile
	andlw	0C0h
	xorlw	040h
	skipz
	goto	u2611
	goto	u2610
u2611:
	goto	l30002778
u2610:
	
l30002727:	
	line	279
;ir_main.c: 279: led_control(0x3C);
	movlw	(03Ch)
	fcall	_led_control
	
l30002728:	
	line	283
;ir_main.c: 283: key_code = key_input_check();
	fcall	_key_input_check
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@key_code)^080h
	
l30002729:	
	line	285
;ir_main.c: 285: if (key_code <= KEY_CODE04) {
	movlw	(04h)
	subwf	(main@key_code)^080h,w
	skipnc
	goto	u2621
	goto	u2620
u2621:
	goto	l30002728
u2620:
	
l30002730:	
	line	287
;ir_main.c: 287: func_key_type = key_code;
	movf	(main@key_code)^080h,w
	movwf	(main@func_key_type)^080h
	
l30002731:	
	line	289
;ir_main.c: 289: led_control((0x04 << key_code));
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@key_code)^080h,w
	goto	u2634
u2635:
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rlf	(??_main+0+0),f
u2634:
	addlw	-1
	skipz
	goto	u2635
	movf	0+(??_main+0+0),w
	fcall	_led_control
	
l30002733:	
	line	300
;ir_main.c: 300: ir_state = ir_recieve();
	fcall	_ir_recieve
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@ir_state)^080h
	
l30002734:	
	line	302
;ir_main.c: 302: if (ir_state == 0x00) {
	movf	(main@ir_state)^080h,f
	skipz
	goto	u2641
	goto	u2640
u2641:
	goto	l30002737
u2640:
	goto	l30002741
	
l30002737:	
	line	307
;ir_main.c: 307: else if (ir_state == 0x0F) {
	movf	(main@ir_state)^080h,w
	xorlw	0Fh
	skipz
	goto	u2651
	goto	u2650
u2651:
	goto	l30002733
u2650:
	
l30002738:	
	line	310
;ir_main.c: 310: led_control(0xC3);
	movlw	(0C3h)
	fcall	_led_control
	
l30002739:	
	line	311
;ir_main.c: 311: _delay((unsigned long)((150)*(4000000/4000.0)));
	movlw	195
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_main+0+0+1),f
	movlw	205
movwf	(??_main+0+0),f
u3797:
	decfsz	(??_main+0+0),f
	goto	u3797
	decfsz	(??_main+0+0+1),f
	goto	u3797

	
l30002740:	
	line	312
;ir_main.c: 312: led_control(0x3C);
	movlw	(03Ch)
	fcall	_led_control
	line	313
;ir_main.c: 313: _delay((unsigned long)((150)*(4000000/4000.0)));
	movlw	195
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_main+0+0+1),f
	movlw	205
movwf	(??_main+0+0),f
u3807:
	decfsz	(??_main+0+0),f
	goto	u3807
	decfsz	(??_main+0+0+1),f
	goto	u3807

	goto	l30002738
	
l30002741:	
	line	324
;ir_main.c: 324: for (i=0; i<2; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@i)^080h
	
l30002744:	
	line	327
;ir_main.c: 327: led_control(0xC3);
	movlw	(0C3h)
	fcall	_led_control
	
l30002745:	
	line	328
;ir_main.c: 328: _delay((unsigned long)((150)*(4000000/4000.0)));
	movlw	195
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_main+0+0+1),f
	movlw	205
movwf	(??_main+0+0),f
u3817:
	decfsz	(??_main+0+0),f
	goto	u3817
	decfsz	(??_main+0+0+1),f
	goto	u3817

	
l30002746:	
	line	329
;ir_main.c: 329: led_control((0x04 << func_key_type));
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@func_key_type)^080h,w
	goto	u2664
u2665:
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rlf	(??_main+0+0),f
u2664:
	addlw	-1
	skipz
	goto	u2665
	movf	0+(??_main+0+0),w
	fcall	_led_control
	line	330
;ir_main.c: 330: _delay((unsigned long)((150)*(4000000/4000.0)));
	movlw	195
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_main+0+0+1),f
	movlw	205
movwf	(??_main+0+0),f
u3827:
	decfsz	(??_main+0+0),f
	goto	u3827
	decfsz	(??_main+0+0+1),f
	goto	u3827

	
l30002747:	
	line	324
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	movf	(??_main+0+0),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(main@i)^080h,f
	
l30002748:	
	movlw	(02h)
	subwf	(main@i)^080h,w
	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l30002744
u2670:
	
l30002749:	
	line	333
;ir_main.c: 331: }
;ir_main.c: 333: eep_wdata.format = rx_format;
	movf	(_rx_format),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_eep_wdata)
	
l30002750:	
	line	335
;ir_main.c: 335: memcpy(&eep_wdata.data, &rcv_data, sizeof(rcv_data));
	movlw	((_rcv_data))&0ffh
	movwf	(?_memcpy)
	movlw	low(08h)
	movwf	0+(?_memcpy)+01h
	movlw	high(08h)
	movwf	(0+(?_memcpy)+01h)+1
	movlw	((_eep_wdata)+01h)&0ffh
	fcall	_memcpy
	
l30002751:	
	line	337
;ir_main.c: 337: eep_offset = (key_code * 0x07);
	movlw	(07h)
	movwf	(?___bmul)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@key_code)^080h,w
	fcall	___bmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@eep_offset)^080h
	
l143:	
	line	339
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfsc	(3169/8)^0180h,(3169)&7
	goto	u2681
	goto	u2680
u2681:
	goto	l143
u2680:
	
l30002752:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@eep_offset)^080h,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_eep_wdata),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(268)^0100h	;volatile
	
l30002753:	
	movlw	(03Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	movf	(??_main+0+0),w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(396)^0180h,f	;volatile
	
l30002754:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(24/8),(24)&7
	
l30002755:	
	btfss	(95/8),(95)&7
	goto	u2691
	goto	u2690
u2691:
	goto	l146
u2690:
	
l30002756:	
	bsf	(24/8),(24)&7
	
l146:	
	bcf	(95/8),(95)&7
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3170/8)^0180h,(3170)&7
	
l30002757:	
	movlw	(055h)
	movwf	(397)^0180h	;volatile
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	
l30002758:	
	bsf	(3169/8)^0180h,(3169)&7
	
l30002759:	
	bcf	(3170/8)^0180h,(3170)&7
	
l30002760:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(24/8),(24)&7
	goto	u2701
	goto	u2700
u2701:
	goto	l30002762
u2700:
	
l30002761:	
	bsf	(95/8),(95)&7
	
l30002762:	
	line	341
;ir_main.c: 341: eep_offset++;
	movlw	(01h)
	movwf	(??_main+0+0)
	movf	(??_main+0+0),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(main@eep_offset)^080h,f
	line	343
;ir_main.c: 343: for (i=0; i < 0x08; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@i)^080h
	
l154:	
	line	346
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfsc	(3169/8)^0180h,(3169)&7
	goto	u2711
	goto	u2710
u2711:
	goto	l154
u2710:
	
l30002765:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@i)^080h,w
	addwf	(main@eep_offset)^080h,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	
l30002766:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@i)^080h,w
	addlw	(_eep_wdata)+01h&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(268)^0100h	;volatile
	
l30002767:	
	movlw	(03Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	movf	(??_main+0+0),w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(396)^0180h,f	;volatile
	
l30002768:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(24/8),(24)&7
	
l30002769:	
	btfss	(95/8),(95)&7
	goto	u2721
	goto	u2720
u2721:
	goto	l157
u2720:
	
l30002770:	
	bsf	(24/8),(24)&7
	
l157:	
	bcf	(95/8),(95)&7
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3170/8)^0180h,(3170)&7
	
l30002771:	
	movlw	(055h)
	movwf	(397)^0180h	;volatile
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	
l30002772:	
	bsf	(3169/8)^0180h,(3169)&7
	
l30002773:	
	bcf	(3170/8)^0180h,(3170)&7
	
l30002774:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(24/8),(24)&7
	goto	u2731
	goto	u2730
u2731:
	goto	l30002776
u2730:
	
l30002775:	
	bsf	(95/8),(95)&7
	
l30002776:	
	line	343
	movlw	(01h)
	movwf	(??_main+0+0)
	movf	(??_main+0+0),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(main@i)^080h,f
	
l30002777:	
	movlw	(08h)
	subwf	(main@i)^080h,w
	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l154
u2740:
	
l149:	
	goto	l149
	
l30002778:	
	line	355
;ir_main.c: 350: }
;ir_main.c: 355: if ((PORTA & 0xC0) == 0x80) {
	movf	(5),w	;volatile
	andlw	0C0h
	xorlw	080h
	skipz
	goto	u2751
	goto	u2750
u2751:
	goto	l30002802
u2750:
	
l30002779:	
	line	357
;ir_main.c: 357: for (i = 0; i < (0x07 * 0x04); i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@i)^080h
	
l30002782:	
	line	358
;ir_main.c: 358: eep_rdata[i] = ((EEADR=(i)),(EECON1&=0x3F),(RD=1),EEDATA);
	movf	(main@i)^080h,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	
l30002783:	
	movlw	(03Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	movf	(??_main+0+0),w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(396)^0180h,f	;volatile
	
l30002784:	
	bsf	(3168/8)^0180h,(3168)&7
	
l30002785:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(268)^0100h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@i)^080h,w
	addlw	(_eep_rdata)&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0+0),w
	movwf	indf
	
l30002786:	
	line	357
	movlw	(01h)
	movwf	(??_main+0+0)
	movf	(??_main+0+0),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(main@i)^080h,f
	
l30002787:	
	movlw	(01Ch)
	subwf	(main@i)^080h,w
	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l30002782
u2760:
	
l30002788:	
	line	364
;ir_main.c: 362: {
;ir_main.c: 364: key_code = key_input_check();
	fcall	_key_input_check
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@key_code)^080h
	
l30002789:	
	line	367
;ir_main.c: 367: if (key_code == KEY_OFF) {
	movf	(main@key_code)^080h,w
	xorlw	0FFh
	skipz
	goto	u2771
	goto	u2770
u2771:
	goto	l30002791
u2770:
	
l30002790:	
	line	369
;ir_main.c: 369: cpu_sleep();
	fcall	_cpu_sleep
	goto	l30002788
	
l30002791:	
	line	373
;ir_main.c: 371: else {
;ir_main.c: 373: if (key_code <= KEY_CODE04) {
	movlw	(04h)
	subwf	(main@key_code)^080h,w
	skipnc
	goto	u2781
	goto	u2780
u2781:
	goto	l30002788
u2780:
	
l30002792:	
	line	375
;ir_main.c: 375: eep_offset = (key_code * 0x07);
	movlw	(07h)
	movwf	(?___bmul)
	movf	(main@key_code)^080h,w
	fcall	___bmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@eep_offset)^080h
	
l30002793:	
	line	378
;ir_main.c: 377: if ((eep_rdata[eep_offset] == 0x10) ||
;ir_main.c: 378: (eep_rdata[eep_offset] == 0x20)) {
	movf	(main@eep_offset)^080h,w
	addlw	(_eep_rdata)&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorlw	010h
	skipnz
	goto	u2791
	goto	u2790
u2791:
	goto	l30002795
u2790:
	
l30002794:	
	movf	(main@eep_offset)^080h,w
	addlw	(_eep_rdata)&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u2801
	goto	u2800
u2801:
	goto	l30002788
u2800:
	
l30002795:	
	line	380
;ir_main.c: 380: led_control((0x04 << key_code));
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@key_code)^080h,w
	goto	u2814
u2815:
	clrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	rlf	(??_main+0+0),f
u2814:
	addlw	-1
	skipz
	goto	u2815
	movf	0+(??_main+0+0),w
	fcall	_led_control
	
l30002796:	
	line	382
;ir_main.c: 382: if (eep_rdata[eep_offset] == 0x10) {
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@eep_offset)^080h,w
	addlw	(_eep_rdata)&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorlw	010h
	skipz
	goto	u2821
	goto	u2820
u2821:
	goto	l30002799
u2820:
	
l30002797:	
	line	386
;ir_main.c: 386: eep_offset++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	movf	(??_main+0+0),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(main@eep_offset)^080h,f
	
l30002798:	
	line	387
;ir_main.c: 387: IR_NEC_format((unsigned char*)&eep_rdata[eep_offset]);
	movf	(main@eep_offset)^080h,w
	addlw	(_eep_rdata)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_IR_NEC_format)
	movlw	(80h|(0x1/2))
	movwf	(?_IR_NEC_format+1)
	fcall	_IR_NEC_format
	goto	l30002801
	
l30002799:	
	line	394
;ir_main.c: 390: else {
;ir_main.c: 394: eep_offset++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0+0)
	movf	(??_main+0+0),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(main@eep_offset)^080h,f
	
l30002800:	
	line	395
;ir_main.c: 395: IR_KDN_format((unsigned char*)&eep_rdata[eep_offset]);
	movf	(main@eep_offset)^080h,w
	addlw	(_eep_rdata)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_IR_KDN_format)
	movlw	(80h|(0x1/2))
	movwf	(?_IR_KDN_format+1)
	fcall	_IR_KDN_format
	
l30002801:	
	line	398
;ir_main.c: 396: }
;ir_main.c: 398: led_control(0xC3);
	movlw	(0C3h)
	fcall	_led_control
	goto	l30002788
	
l30002802:	
	line	408
;ir_main.c: 403: }
;ir_main.c: 408: if ((PORTA & 0xC0) == 0x00) {
	movf	(5),w	;volatile
	andlw	0C0h
	btfss	status,2
	goto	u2831
	goto	u2830
u2831:
	goto	l112
u2830:
	
l30002803:	
	line	410
;ir_main.c: 410: lcd_init();
	fcall	_lcd_init
	
l30002804:	
	line	412
;ir_main.c: 412: memset(&pre_data, 0x00, sizeof(pre_data));
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_memset)
	movlw	high(0)
	movwf	((?_memset))+1
	movlw	low(08h)
	movwf	0+(?_memset)+02h
	movlw	high(08h)
	movwf	(0+(?_memset)+02h)+1
	movlw	((_pre_data))&0ffh
	fcall	_memset
	
l30002805:	
	line	416
;ir_main.c: 414: {
;ir_main.c: 416: ir_state = ir_recieve();
	fcall	_ir_recieve
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@ir_state)^080h
	goto	l30002812
	
l30002806:	
	line	422
;ir_main.c: 422: motion_control(0x0A);
	movlw	(0Ah)
	fcall	_motion_control
	goto	l30002813
	
l30002807:	
	line	425
;ir_main.c: 425: motion_control(0x05);
	movlw	(05h)
	fcall	_motion_control
	goto	l30002813
	
l30002808:	
	line	428
;ir_main.c: 428: motion_control(0x00);
	movlw	(0)
	fcall	_motion_control
	goto	l30002813
	
l30002809:	
	line	431
;ir_main.c: 431: motion_control(0x04);
	movlw	(04h)
	fcall	_motion_control
	goto	l30002813
	
l30002810:	
	line	434
;ir_main.c: 434: motion_control(0x01);
	movlw	(01h)
	fcall	_motion_control
	goto	l30002813
	
l30002812:	
	line	420
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_rcv_data)+05h,w
		xorlw	13^0
	skipnz
	goto	l30002808
	xorlw	93^13
	skipnz
	goto	l30002806
	xorlw	109^93
	skipnz
	goto	l30002807
	xorlw	253^109
	skipnz
	goto	l30002810
	xorlw	255^253
	skipnz
	goto	l30002809
	goto	l30002813

	
l30002813:	
	line	442
;ir_main.c: 442: if ((memcmp(&pre_data, &rcv_data, sizeof(rcv_data))) != 0) {
	movlw	((_rcv_data))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_memcmp)
	movlw	low(08h)
	movwf	0+(?_memcmp)+01h
	movlw	high(08h)
	movwf	(0+(?_memcmp)+01h)+1
	movlw	((_pre_data))&0ffh
	fcall	_memcmp
	bcf	status, 7	;select IRP bank0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_memcmp)),w
	iorwf	(0+(?_memcmp)),w
	skipnz
	goto	u2841
	goto	u2840
u2841:
	goto	l30002805
u2840:
	
l30002814:	
	line	443
;ir_main.c: 443: if (ir_state == 0x00) {
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@ir_state)^080h,f
	skipz
	goto	u2851
	goto	u2850
u2851:
	goto	l30002821
u2850:
	
l30002815:	
	line	444
;ir_main.c: 444: lcd_clear();
	fcall	_lcd_clear
	
l30002816:	
	line	445
;ir_main.c: 445: lcd_put_ir_format(rx_format);
	movf	(_rx_format),w
	fcall	_lcd_put_ir_format
	goto	l30002820
	
l30002817:	
	line	449
;ir_main.c: 449: lcd_put_ir_data(&rcv_data, 0x04);
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_put_ir_data)
	movlw	((_rcv_data))&0ffh
	fcall	_lcd_put_ir_data
	goto	l30002824
	
l30002818:	
	line	453
;ir_main.c: 453: lcd_put_ir_data(&rcv_data, 0x06);
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_put_ir_data)
	movlw	((_rcv_data))&0ffh
	fcall	_lcd_put_ir_data
	goto	l30002824
	
l30002820:	
	line	446
	movf	(_rx_format),w
		xorlw	16^0
	skipnz
	goto	l30002817
	xorlw	32^16
	skipnz
	goto	l30002818
	goto	l30002824

	
l30002821:	
	line	458
	movf	(main@ir_state)^080h,w
	xorlw	0Fh
	skipz
	goto	u2861
	goto	u2860
u2861:
	goto	l30002824
u2860:
	
l30002822:	
	line	460
;ir_main.c: 460: lcd_clear();
	fcall	_lcd_clear
	
l30002823:	
	line	461
;ir_main.c: 461: lcd_put_ir_format(0x30);
	movlw	(030h)
	fcall	_lcd_put_ir_format
	
l30002824:	
	line	467
;ir_main.c: 465: }
;ir_main.c: 467: memcpy(&pre_data, &rcv_data, sizeof(rcv_data));
	movlw	((_rcv_data))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_memcpy)
	movlw	low(08h)
	movwf	0+(?_memcpy)+01h
	movlw	high(08h)
	movwf	(0+(?_memcpy)+01h)+1
	movlw	((_pre_data))&0ffh
	fcall	_memcpy
	goto	l30002805
	
l112:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
; =============== function _main ends ============

psect	maintext
	line	471
	signat	_main,88
	global	_memcmp
psect	text225,local,class=CODE,delta=2
global __ptext225
__ptext225:

; *************** function _memcmp *****************
; Defined at:
;		line 4 in file "../../common/memcmp.c"
; Parameters:    Size  Location     Type
;  s1              1    wreg     PTR const void 
;		 -> pre_data(8), 
;  s2              1    0[BANK0 ] PTR const void 
;		 -> rcv_data(8), 
;  n               2    1[BANK0 ] unsigned int 
; Auto vars:     Size  Location     Type
;  s1              1    2[COMMON] PTR const void 
;		 -> pre_data(8), 
; Return value:  Size  Location     Type
;                  2    0[BANK0 ] int 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         3       3       0       0       0
;      Temp:     2
;      Total:    6
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text225
	file	"C:\Program Files\HI-TECH Software\PICC\9.70\sources\memcmp.c"
	line	4
	global	__size_of_memcmp
	__size_of_memcmp	equ	__end_of_memcmp-_memcmp
	
_memcmp:	
	opt stack 6
; Regs used in _memcmp: [wreg-fsr0h+status,2+status,0]
;memcmp@s1 stored from wreg
	movwf	(memcmp@s1)
	
l30002992:	
	goto	l30002997
	
l30002993:	
	line	6
	movf	(memcmp@s2),w
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_memcmp+0+0)
	movf	(memcmp@s1),w
	movwf	fsr0
	movf	indf,w
	xorwf	(??_memcmp+0+0),w
	skipnz
	goto	u3091
	goto	u3090
u3091:
	goto	l30002996
u3090:
	
l30002994:	
	line	7
	movf	(memcmp@s2),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_memcmp+0+0)
	clrf	(??_memcmp+0+0+1)
	comf	(??_memcmp+0+0),f
	comf	(??_memcmp+0+1),f
	incf	(??_memcmp+0+0),f
	skipnz
	incf	(??_memcmp+0+1),f
	movf	(memcmp@s1),w
	movwf	fsr0
	movf	indf,w
	addwf	0+(??_memcmp+0+0),w
	movwf	(?_memcmp)
	movf	1+(??_memcmp+0+0),w
	skipnc
	incf	1+(??_memcmp+0+0),w
	movwf	((?_memcmp))+1
	goto	l261
	
l30002996:	
	line	8
	movlw	(01h)
	movwf	(??_memcmp+0+0)
	movf	(??_memcmp+0+0),w
	addwf	(memcmp@s1),f
	line	9
	movlw	(01h)
	movwf	(??_memcmp+0+0)
	movf	(??_memcmp+0+0),w
	addwf	(memcmp@s2),f
	
l30002997:	
	line	5
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(memcmp@n),f
	movlw	high(01h)
	skipc
	decf	(memcmp@n+1),f
	subwf	(memcmp@n+1),f
	movlw	high(0FFFFh)
	xorwf	((memcmp@n+1))&07fh,w
	skipz
	goto	u3105
	movlw	low(0FFFFh)
	xorwf	((memcmp@n))&07fh,w
u3105:

	skipz
	goto	u3101
	goto	u3100
u3101:
	goto	l30002993
u3100:
	
l30002998:	
	line	11
	movlw	low(0)
	movwf	(?_memcmp)
	movlw	high(0)
	movwf	((?_memcmp))+1
	
l261:	
	return
	opt stack 0
GLOBAL	__end_of_memcmp
	__end_of_memcmp:
; =============== function _memcmp ends ============

psect	text226,local,class=CODE,delta=2
global __ptext226
__ptext226:
	line	12
	signat	_memcmp,12410
	global	_motion_control

; *************** function _motion_control *****************
; Defined at:
;		line 148 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
; Parameters:    Size  Location     Type
;  motion_state    1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  motion_state    1    0[COMMON] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     0
;      Total:    1
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text226
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
	line	148
	global	__size_of_motion_control
	__size_of_motion_control	equ	__end_of_motion_control-_motion_control
;ir_main.c: 147: void motion_control(unsigned char motion_state)
;ir_main.c: 148: {
	
_motion_control:	
	opt stack 6
; Regs used in _motion_control: [wreg]
;motion_control@motion_state stored from wreg
	movwf	(motion_control@motion_state)
	
l30003000:	
	line	149
;ir_main.c: 149: PORTB = motion_state;
	movf	(motion_control@motion_state),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	
l110:	
	return
	opt stack 0
GLOBAL	__end_of_motion_control
	__end_of_motion_control:
; =============== function _motion_control ends ============

psect	text227,local,class=CODE,delta=2
global __ptext227
__ptext227:
	line	150
	signat	_motion_control,4216
	global	_lcd_put_ir_format

; *************** function _lcd_put_ir_format *****************
; Defined at:
;		line 241 in file "C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
; Parameters:    Size  Location     Type
;  format          1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  format          1   28[BANK0 ] unsigned char 
;  kdn             8   10[BANK0 ] unsigned char [8]
;  ukn             7   18[BANK0 ] unsigned char [7]
;  nec             3   25[BANK0 ] unsigned char [3]
;  i               1   29[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0      24       0       0       0
;      Temp:     4
;      Total:   24
; This function calls:
;		_lcd_goto_posi
;		_lcd_put_char
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text227
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	241
	global	__size_of_lcd_put_ir_format
	__size_of_lcd_put_ir_format	equ	__end_of_lcd_put_ir_format-_lcd_put_ir_format
;lcd.c: 240: void lcd_put_ir_format(unsigned char format)
;lcd.c: 241: {
	
_lcd_put_ir_format:	
	opt stack 6
; Regs used in _lcd_put_ir_format: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_put_ir_format@format stored from wreg
	line	242
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_put_ir_format@format)
	
l30002837:	
;lcd.c: 242: unsigned char nec[3] = {0x4E, 0x45, 0x43};
	movf	(lcd_put_ir_format@F844),w
	movwf	(lcd_put_ir_format@nec)
	movf	(lcd_put_ir_format@F844+1),w
	movwf	(lcd_put_ir_format@nec+1)
	movf	(lcd_put_ir_format@F844+2),w
	movwf	(lcd_put_ir_format@nec+2)
	
l30002838:	
	line	244
;lcd.c: 243: unsigned char ukn[7] = {0x55, 0x4E, 0x4B, 0x4E,
;lcd.c: 244: 0x4F, 0x57, 0x4E};
	movlw	(lcd_put_ir_format@ukn)&0ffh
	movwf	fsr0
	movlw	lcd_put_ir_format@F846&0ffh
	movwf	(??_lcd_put_ir_format+0+0)
	movf	fsr0,w
	movwf	(??_lcd_put_ir_format+0+0+1)
	movlw	7
	movwf	(??_lcd_put_ir_format+0+0+2)
u2950:
	movf	(??_lcd_put_ir_format+0+0),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	(??_lcd_put_ir_format+0+0+3)
	incf	(??_lcd_put_ir_format+0+0),f
	movf	(??_lcd_put_ir_format+0+0+1),w
	movwf	fsr0
	movf	(??_lcd_put_ir_format+0+0+3),w
	movwf	indf
	incf	(??_lcd_put_ir_format+0+0+1),f
	decfsz	(??_lcd_put_ir_format+0+0+2),f
	goto	u2950
	
l30002839:	
	line	246
;lcd.c: 245: unsigned char kdn[8] = {0x4B, 0x41, 0x44, 0x45,
;lcd.c: 246: 0x4E, 0x4B, 0x59, 0x4F};
	movlw	(lcd_put_ir_format@kdn)&0ffh
	movwf	fsr0
	movlw	lcd_put_ir_format@F848&0ffh
	movwf	(??_lcd_put_ir_format+0+0)
	movf	fsr0,w
	movwf	(??_lcd_put_ir_format+0+0+1)
	movlw	8
	movwf	(??_lcd_put_ir_format+0+0+2)
u2960:
	movf	(??_lcd_put_ir_format+0+0),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	(??_lcd_put_ir_format+0+0+3)
	incf	(??_lcd_put_ir_format+0+0),f
	movf	(??_lcd_put_ir_format+0+0+1),w
	movwf	fsr0
	movf	(??_lcd_put_ir_format+0+0+3),w
	movwf	indf
	incf	(??_lcd_put_ir_format+0+0+1),f
	decfsz	(??_lcd_put_ir_format+0+0+2),f
	goto	u2960
	
l30002840:	
	line	250
;lcd.c: 247: unsigned char i;
;lcd.c: 250: lcd_goto_posi(0x00);
	movlw	(0)
	fcall	_lcd_goto_posi
	goto	l30002860
	
l30002841:	
	line	255
;lcd.c: 255: for (i = 0; i < 0x03; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(lcd_put_ir_format@i)
	
l30002844:	
	line	256
;lcd.c: 256: lcd_put_char(nec[i]);
	movf	(lcd_put_ir_format@i),w
	addlw	(lcd_put_ir_format@nec)&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_put_char
	
l30002845:	
	line	255
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_put_ir_format+0+0)
	movf	(??_lcd_put_ir_format+0+0),w
	addwf	(lcd_put_ir_format@i),f
	
l30002846:	
	movlw	(03h)
	subwf	(lcd_put_ir_format@i),w
	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l30002844
u2970:
	goto	l239
	
l30002847:	
	line	261
;lcd.c: 261: for (i = 0; i < 0x08; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(lcd_put_ir_format@i)
	
l30002850:	
	line	262
;lcd.c: 262: lcd_put_char(kdn[i]);
	movf	(lcd_put_ir_format@i),w
	addlw	(lcd_put_ir_format@kdn)&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_put_char
	
l30002851:	
	line	261
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_put_ir_format+0+0)
	movf	(??_lcd_put_ir_format+0+0),w
	addwf	(lcd_put_ir_format@i),f
	
l30002852:	
	movlw	(08h)
	subwf	(lcd_put_ir_format@i),w
	skipc
	goto	u2981
	goto	u2980
u2981:
	goto	l30002850
u2980:
	goto	l239
	
l30002853:	
	line	267
;lcd.c: 267: for (i = 0; i < 0x07; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(lcd_put_ir_format@i)
	
l30002856:	
	line	268
;lcd.c: 268: lcd_put_char(ukn[i]);
	movf	(lcd_put_ir_format@i),w
	addlw	(lcd_put_ir_format@ukn)&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_put_char
	
l30002857:	
	line	267
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_put_ir_format+0+0)
	movf	(??_lcd_put_ir_format+0+0),w
	addwf	(lcd_put_ir_format@i),f
	
l30002858:	
	movlw	(07h)
	subwf	(lcd_put_ir_format@i),w
	skipc
	goto	u2991
	goto	u2990
u2991:
	goto	l30002856
u2990:
	goto	l239
	
l30002860:	
	line	252
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_put_ir_format@format),w
		xorlw	16^0
	skipnz
	goto	l30002841
	xorlw	32^16
	skipnz
	goto	l30002847
	goto	l30002853

	
l239:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_put_ir_format
	__end_of_lcd_put_ir_format:
; =============== function _lcd_put_ir_format ends ============

psect	text228,local,class=CODE,delta=2
global __ptext228
__ptext228:
	line	274
	signat	_lcd_put_ir_format,4216
	global	_lcd_clear

; *************** function _lcd_clear *****************
; Defined at:
;		line 126 in file "C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       0       0       0       0
;      Temp:     2
;      Total:    2
; This function calls:
;		_toggle_E
;		__delay
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text228
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	126
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
;lcd.c: 125: void lcd_clear(void)
;lcd.c: 126: {
	
_lcd_clear:	
	opt stack 6
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	127
	
l30002943:	
;lcd.c: 127: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_clear+0+0)
	movf	(??_lcd_clear+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002944:	
	line	128
;lcd.c: 128: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002945:	
	line	129
;lcd.c: 129: PORTC |= 0x00;
	movf	(7),w	;volatile
	
l30002946:	
	line	130
;lcd.c: 130: toggle_E();
	fcall	_toggle_E
	
l30002947:	
	line	131
;lcd.c: 131: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_clear+0+0)
	movf	(??_lcd_clear+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002948:	
	line	132
;lcd.c: 132: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002949:	
	line	133
;lcd.c: 133: PORTC |= 0x04;
	bsf	(7)+(2/8),(2)&7	;volatile
	
l30002950:	
	line	135
;lcd.c: 135: toggle_E();
	fcall	_toggle_E
	line	136
;lcd.c: 136: _delay((unsigned long)((2)*(4000000/4000.0)));
	movlw	3
movwf	(??_lcd_clear+0+0+1),f
	movlw	151
movwf	(??_lcd_clear+0+0),f
u3837:
	decfsz	(??_lcd_clear+0+0),f
	goto	u3837
	decfsz	(??_lcd_clear+0+0+1),f
	goto	u3837
	nop2

	
l233:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
; =============== function _lcd_clear ends ============

psect	text229,local,class=CODE,delta=2
global __ptext229
__ptext229:
	line	139
	signat	_lcd_clear,88
	global	_memcpy

; *************** function _memcpy *****************
; Defined at:
;		line 10 in file "C:\Program Files\HI-TECH Software\PICC\9.70\sources\memcpy.c"
; Parameters:    Size  Location     Type
;  d1              1    wreg     PTR void 
;		 -> eep_wdata(7), pre_data(8), 
;  s1              1    0[BANK0 ] PTR const void 
;		 -> rcv_data(8), 
;  n               2    1[BANK0 ] unsigned int 
; Auto vars:     Size  Location     Type
;  d1              1    1[COMMON] PTR void 
;		 -> eep_wdata(7), pre_data(8), 
;  s               1    2[COMMON] PTR const unsigned char 
;		 -> rcv_data(8), 
;  d               1    3[COMMON] PTR unsigned char 
;		 -> eep_wdata(7), pre_data(8), 
; Return value:  Size  Location     Type
;                  1    wreg      PTR void 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       3       0       0       0
;      Temp:     1
;      Total:    7
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text229
	file	"C:\Program Files\HI-TECH Software\PICC\9.70\sources\memcpy.c"
	line	10
	global	__size_of_memcpy
	__size_of_memcpy	equ	__end_of_memcpy-_memcpy
	
_memcpy:	
	opt stack 6
; Regs used in _memcpy: [wreg-fsr0h+status,2+status,0]
;memcpy@d1 stored from wreg
	line	19
	movwf	(memcpy@d1)
	
l30003001:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(memcpy@s1),w
	movwf	(memcpy@s)
	line	20
	movf	(memcpy@d1),w
	movwf	(memcpy@d)
	goto	l30003005
	
l30003002:	
	line	22
	movf	(memcpy@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_memcpy+0+0)
	movf	(memcpy@d),w
	movwf	fsr0
	movf	(??_memcpy+0+0),w
	movwf	indf
	
l30003003:	
	movlw	(01h)
	movwf	(??_memcpy+0+0)
	movf	(??_memcpy+0+0),w
	addwf	(memcpy@s),f
	
l30003004:	
	movlw	(01h)
	movwf	(??_memcpy+0+0)
	movf	(??_memcpy+0+0),w
	addwf	(memcpy@d),f
	
l30003005:	
	line	21
	movlw	low(01h)
	subwf	(memcpy@n),f
	movlw	high(01h)
	skipc
	decf	(memcpy@n+1),f
	subwf	(memcpy@n+1),f
	movlw	high(0FFFFh)
	xorwf	((memcpy@n+1))&07fh,w
	skipz
	goto	u3115
	movlw	low(0FFFFh)
	xorwf	((memcpy@n))&07fh,w
u3115:

	skipz
	goto	u3111
	goto	u3110
u3111:
	goto	l30003002
u3110:
	
l266:	
	return
	opt stack 0
GLOBAL	__end_of_memcpy
	__end_of_memcpy:
; =============== function _memcpy ends ============

psect	text230,local,class=CODE,delta=2
global __ptext230
__ptext230:
	line	24
	signat	_memcpy,12409
	global	___bmul

; *************** function ___bmul *****************
; Defined at:
;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.70\sources\bmul.c"
; Parameters:    Size  Location     Type
;  multiplier      1    wreg     unsigned char 
;  multiplicand    1    3[COMMON] unsigned char 
; Auto vars:     Size  Location     Type
;  multiplier      1    2[COMMON] unsigned char 
;  product         1    1[COMMON] unsigned char 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       0       0       0       0
;      Temp:     1
;      Total:    4
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text230
	file	"C:\Program Files\HI-TECH Software\PICC\9.70\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt stack 6
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	
l30003006:	
	line	4
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___bmul@product)
	
l30003007:	
	line	7
	btfss	(___bmul@multiplier),(0)&7
	goto	u3121
	goto	u3120
u3121:
	goto	l30003009
u3120:
	
l30003008:	
	line	8
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0+0)
	movf	(??___bmul+0+0),w
	addwf	(___bmul@product),f
	
l30003009:	
	line	9
	clrc
	rlf	(___bmul@multiplicand),f

	
l30003010:	
	line	10
	clrc
	rrf	(___bmul@multiplier),f

	
l30003011:	
	line	11
	movf	(___bmul@multiplier),f
	skipz
	goto	u3131
	goto	u3130
u3131:
	goto	l30003007
u3130:
	
l30003012:	
	line	12
	movf	(___bmul@product),w
	
l274:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
; =============== function ___bmul ends ============

psect	text231,local,class=CODE,delta=2
global __ptext231
__ptext231:
	line	13
	signat	___bmul,8313
	global	_lcd_init

; *************** function _lcd_init *****************
; Defined at:
;		line 24 in file "C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       0       0       0       0
;      Temp:     2
;      Total:    2
; This function calls:
;		__delay
;		_toggle_E
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text231
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	24
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
;lcd.c: 23: void lcd_init(void)
;lcd.c: 24: {
	
_lcd_init:	
	opt stack 6
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	26
	
l30002884:	
;lcd.c: 26: _delay((unsigned long)((20)*(4000000/4000.0)));
	movlw	26
movwf	(??_lcd_init+0+0+1),f
	movlw	248
movwf	(??_lcd_init+0+0),f
u3847:
	decfsz	(??_lcd_init+0+0),f
	goto	u3847
	decfsz	(??_lcd_init+0+0+1),f
	goto	u3847
	clrwdt

	
l30002885:	
	line	27
;lcd.c: 27: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002886:	
	line	28
;lcd.c: 28: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002887:	
	line	29
;lcd.c: 29: PORTC |= 0x0C;
	movlw	(0Ch)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	iorwf	(7),f	;volatile
	
l30002888:	
	line	30
;lcd.c: 30: toggle_E();
	fcall	_toggle_E
	
l30002889:	
	line	31
;lcd.c: 31: _delay((unsigned long)((5)*(4000000/4000.0)));
	movlw	7
movwf	(??_lcd_init+0+0+1),f
	movlw	125
movwf	(??_lcd_init+0+0),f
u3857:
	decfsz	(??_lcd_init+0+0),f
	goto	u3857
	decfsz	(??_lcd_init+0+0+1),f
	goto	u3857

	
l30002890:	
	line	34
;lcd.c: 34: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002891:	
	line	35
;lcd.c: 35: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002892:	
	line	36
;lcd.c: 36: PORTC |= 0x0C;
	movlw	(0Ch)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	iorwf	(7),f	;volatile
	line	37
;lcd.c: 37: toggle_E();
	fcall	_toggle_E
	
l30002893:	
	line	38
;lcd.c: 38: _delay((unsigned long)((100)*(4000000/4000000.0)));
	movlw	33
movwf	(??_lcd_init+0+0),f
u3867:
decfsz	(??_lcd_init+0+0),f
	goto	u3867

	
l30002894:	
	line	41
;lcd.c: 41: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002895:	
	line	42
;lcd.c: 42: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002896:	
	line	43
;lcd.c: 43: PORTC |= 0x0C;
	movlw	(0Ch)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	iorwf	(7),f	;volatile
	
l30002897:	
	line	44
;lcd.c: 44: toggle_E();
	fcall	_toggle_E
	line	45
;lcd.c: 45: _delay((unsigned long)((100)*(4000000/4000000.0)));
	movlw	33
movwf	(??_lcd_init+0+0),f
u3877:
decfsz	(??_lcd_init+0+0),f
	goto	u3877

	
l30002898:	
	line	48
;lcd.c: 48: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002899:	
	line	49
;lcd.c: 49: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002900:	
	line	50
;lcd.c: 50: PORTC |= 0x08;
	bsf	(7)+(3/8),(3)&7	;volatile
	
l30002901:	
	line	51
;lcd.c: 51: toggle_E();
	fcall	_toggle_E
	
l30002902:	
	line	52
;lcd.c: 52: _delay((unsigned long)((100)*(4000000/4000000.0)));
	movlw	33
movwf	(??_lcd_init+0+0),f
u3887:
decfsz	(??_lcd_init+0+0),f
	goto	u3887

	
l30002903:	
	line	55
;lcd.c: 55: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002904:	
	line	56
;lcd.c: 56: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002905:	
	line	57
;lcd.c: 57: PORTC |= 0x08;
	bsf	(7)+(3/8),(3)&7	;volatile
	line	58
;lcd.c: 58: toggle_E();
	fcall	_toggle_E
	
l30002906:	
	line	59
;lcd.c: 59: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002907:	
	line	60
;lcd.c: 60: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002908:	
	line	61
;lcd.c: 61: PORTC |= 0x20;
	bsf	(7)+(5/8),(5)&7	;volatile
	
l30002909:	
	line	63
;lcd.c: 63: toggle_E();
	fcall	_toggle_E
	
l30002910:	
	line	64
;lcd.c: 64: _delay((unsigned long)((100)*(4000000/4000000.0)));
	movlw	33
movwf	(??_lcd_init+0+0),f
u3897:
decfsz	(??_lcd_init+0+0),f
	goto	u3897

	
l30002911:	
	line	67
;lcd.c: 67: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002912:	
	line	68
;lcd.c: 68: RA4 = 0;
	bcf	(44/8),(44)&7
	line	69
;lcd.c: 69: PORTC |= 0x00;
	movf	(7),w	;volatile
	
l30002913:	
	line	70
;lcd.c: 70: toggle_E();
	fcall	_toggle_E
	
l30002914:	
	line	71
;lcd.c: 71: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002915:	
	line	72
;lcd.c: 72: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002916:	
	line	73
;lcd.c: 73: PORTC |= 0x20;
	bsf	(7)+(5/8),(5)&7	;volatile
	
l30002917:	
	line	75
;lcd.c: 75: toggle_E();
	fcall	_toggle_E
	
l30002918:	
	line	76
;lcd.c: 76: _delay((unsigned long)((100)*(4000000/4000000.0)));
	movlw	33
movwf	(??_lcd_init+0+0),f
u3907:
decfsz	(??_lcd_init+0+0),f
	goto	u3907

	line	79
;lcd.c: 79: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002919:	
	line	80
;lcd.c: 80: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002920:	
	line	81
;lcd.c: 81: PORTC |= 0x00;
	movf	(7),w	;volatile
	
l30002921:	
	line	82
;lcd.c: 82: toggle_E();
	fcall	_toggle_E
	
l30002922:	
	line	83
;lcd.c: 83: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002923:	
	line	84
;lcd.c: 84: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002924:	
	line	85
;lcd.c: 85: PORTC |= 0x04;
	bsf	(7)+(2/8),(2)&7	;volatile
	
l30002925:	
	line	87
;lcd.c: 87: toggle_E();
	fcall	_toggle_E
	line	88
;lcd.c: 88: _delay((unsigned long)((2)*(4000000/4000.0)));
	movlw	3
movwf	(??_lcd_init+0+0+1),f
	movlw	151
movwf	(??_lcd_init+0+0),f
u3917:
	decfsz	(??_lcd_init+0+0),f
	goto	u3917
	decfsz	(??_lcd_init+0+0+1),f
	goto	u3917
	nop2

	
l30002926:	
	line	91
;lcd.c: 91: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002927:	
	line	92
;lcd.c: 92: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002928:	
	line	93
;lcd.c: 93: PORTC |= 0x00;
	movf	(7),w	;volatile
	
l30002929:	
	line	94
;lcd.c: 94: toggle_E();
	fcall	_toggle_E
	
l30002930:	
	line	95
;lcd.c: 95: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002931:	
	line	96
;lcd.c: 96: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002932:	
	line	97
;lcd.c: 97: PORTC |= 0x18;
	movlw	(018h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	iorwf	(7),f	;volatile
	
l30002933:	
	line	99
;lcd.c: 99: toggle_E();
	fcall	_toggle_E
	
l30002934:	
	line	100
;lcd.c: 100: _delay((unsigned long)((100)*(4000000/4000000.0)));
	movlw	33
movwf	(??_lcd_init+0+0),f
u3927:
decfsz	(??_lcd_init+0+0),f
	goto	u3927

	
l30002935:	
	line	103
;lcd.c: 103: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002936:	
	line	104
;lcd.c: 104: RA4 = 0;
	bcf	(44/8),(44)&7
	line	105
;lcd.c: 105: PORTC |= 0x00;
	movf	(7),w	;volatile
	
l30002937:	
	line	106
;lcd.c: 106: toggle_E();
	fcall	_toggle_E
	
l30002938:	
	line	107
;lcd.c: 107: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002939:	
	line	108
;lcd.c: 108: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002940:	
	line	109
;lcd.c: 109: PORTC |= 0x30;
	movlw	(030h)
	movwf	(??_lcd_init+0+0)
	movf	(??_lcd_init+0+0),w
	iorwf	(7),f	;volatile
	
l30002941:	
	line	111
;lcd.c: 111: toggle_E();
	fcall	_toggle_E
	line	112
;lcd.c: 112: _delay((unsigned long)((100)*(4000000/4000000.0)));
	movlw	33
movwf	(??_lcd_init+0+0),f
u3937:
decfsz	(??_lcd_init+0+0),f
	goto	u3937

	
l232:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
; =============== function _lcd_init ends ============

psect	text232,local,class=CODE,delta=2
global __ptext232
__ptext232:
	line	115
	signat	_lcd_init,88
	global	_ir_recieve

; *************** function _ir_recieve *****************
; Defined at:
;		line 51 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_in.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;  i               1    7[BANK0 ] unsigned char 
;  s_data          1    6[BANK0 ] unsigned char 
;  time_out        1    0        unsigned char 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       2       0       0       0
;      Temp:     2
;      Total:    4
; This function calls:
;		_memset
;		_Timer_Reset
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text232
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_in.c"
	line	51
	global	__size_of_ir_recieve
	__size_of_ir_recieve	equ	__end_of_ir_recieve-_ir_recieve
;ir_in.c: 50: unsigned char ir_recieve(void)
;ir_in.c: 51: {
	
_ir_recieve:	
	opt stack 6
; Regs used in _ir_recieve: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	57
	
l30003014:	
;ir_in.c: 52: unsigned char i;
;ir_in.c: 53: unsigned char s_data;
;ir_in.c: 54: unsigned char time_out;
;ir_in.c: 57: memset(&rcv_data, 0x00, sizeof(rcv_data));
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_memset)
	movlw	high(0)
	movwf	((?_memset))+1
	movlw	low(08h)
	movwf	0+(?_memset)+02h
	movlw	high(08h)
	movwf	(0+(?_memset)+02h)+1
	movlw	((_rcv_data))&0ffh
	fcall	_memset
	
l4:	
	line	64
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(7),(0)&7	;volatile
	goto	u3141
	goto	u3140
u3141:
	goto	l4
u3140:
	
l30003015:	
	line	70
;ir_in.c: 70: Timer_Reset();
	fcall	_Timer_Reset
	
l7:	
	line	73
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(7),(0)&7	;volatile
	goto	u3151
	goto	u3150
u3151:
	goto	l7
u3150:
	
l30003016:	
	line	77
;ir_in.c: 77: if ((TMR1H >= 0x0C) && (TMR1H <= 0x10)) {
	movlw	(0Ch)
	subwf	(15),w	;volatile
	skipc
	goto	u3161
	goto	u3160
u3161:
	goto	l30003019
u3160:
	
l30003017:	
	movlw	(011h)
	subwf	(15),w	;volatile
	skipnc
	goto	u3171
	goto	u3170
u3171:
	goto	l30003019
u3170:
	
l30003018:	
	line	79
;ir_in.c: 79: rx_format = 0x20;
	movlw	(020h)
	movwf	(_rx_format)
	goto	l30003028
	
l30003019:	
	line	80
	movlw	(01Fh)
	subwf	(15),w	;volatile
	skipc
	goto	u3181
	goto	u3180
u3181:
	goto	l30003022
u3180:
	
l30003020:	
	movlw	(028h)
	subwf	(15),w	;volatile
	skipnc
	goto	u3191
	goto	u3190
u3191:
	goto	l30003022
u3190:
	
l30003021:	
	line	82
;ir_in.c: 82: rx_format = 0x10;
	movlw	(010h)
	movwf	(_rx_format)
	goto	l30003028
	
l30003022:	
	line	83
	movlw	(04h)
	subwf	(15),w	;volatile
	skipc
	goto	u3201
	goto	u3200
u3201:
	goto	l30003026
u3200:
	
l30003023:	
	line	86
;ir_in.c: 86: return 0x0F;
	movlw	(0Fh)
	goto	l3
	
l30003026:	
	line	89
;ir_in.c: 89: return 0xFF;
	movlw	(0FFh)
	goto	l3
	
l30003028:	
	line	93
;ir_in.c: 90: }
;ir_in.c: 93: Timer_Reset();
	fcall	_Timer_Reset
	
l16:	
	line	94
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(7),(0)&7	;volatile
	goto	u3211
	goto	u3210
u3211:
	goto	l16
u3210:
	
l30003029:	
	line	95
;ir_in.c: 95: if ((rx_format == 0x10) && (TMR1H <=0x0F)) {
	movf	(_rx_format),w
	xorlw	010h
	skipz
	goto	u3221
	goto	u3220
u3221:
	goto	l30003033
u3220:
	
l30003030:	
	movlw	(010h)
	subwf	(15),w	;volatile
	skipnc
	goto	u3231
	goto	u3230
u3231:
	goto	l30003033
u3230:
	goto	l30003026
	
l30003033:	
	line	102
;ir_in.c: 97: }
;ir_in.c: 102: s_data = 0x01;
	clrf	(ir_recieve@s_data)
	bsf	status,0
	rlf	(ir_recieve@s_data),f
	
l30003034:	
	line	105
;ir_in.c: 105: if (rx_format == 0x10) {
	movf	(_rx_format),w
	xorlw	010h
	skipz
	goto	u3241
	goto	u3240
u3241:
	goto	l30003049
u3240:
	
l30003035:	
	line	107
;ir_in.c: 107: for (i = 0; i < 32; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(ir_recieve@i)
	
l24:	
	line	110
	btfss	(7),(0)&7	;volatile
	goto	u3251
	goto	u3250
u3251:
	goto	l24
u3250:
	
l30003038:	
	line	113
;ir_in.c: 113: Timer_Reset();
	fcall	_Timer_Reset
	
l27:	
	line	114
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(7),(0)&7	;volatile
	goto	u3261
	goto	u3260
u3261:
	goto	l27
u3260:
	
l30003039:	
	line	117
;ir_in.c: 117: if (TMR1H >= 0x04) {
	movlw	(04h)
	subwf	(15),w	;volatile
	skipc
	goto	u3271
	goto	u3270
u3271:
	goto	l30003047
u3270:
	
l30003040:	
	line	119
;ir_in.c: 119: if (i<8) {
	movlw	(08h)
	subwf	(ir_recieve@i),w
	skipnc
	goto	u3281
	goto	u3280
u3281:
	goto	l30003042
u3280:
	
l30003041:	
	line	120
;ir_in.c: 120: rcv_data[0] |= ((s_data & 0x01) << (7 - i));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	decf	(ir_recieve@i),w
	xorlw	0ffh
	addlw	07h
	addlw	1
	goto	u3294
u3295:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3294:
	addlw	-1
	skipz
	goto	u3295
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	(_rcv_data),f
	goto	l30003047
	
l30003042:	
	line	123
;ir_in.c: 123: else if (i<16) {
	movlw	(010h)
	subwf	(ir_recieve@i),w
	skipnc
	goto	u3301
	goto	u3300
u3301:
	goto	l30003044
u3300:
	
l30003043:	
	line	124
;ir_in.c: 124: rcv_data[1] |= ((s_data & 0x01) << (7 - (i-8)));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	movf	(ir_recieve@i),w
	addlw	-8
	xorlw	0ffh
	addlw	1
	addlw	07h
	addlw	1
	goto	u3314
u3315:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3314:
	addlw	-1
	skipz
	goto	u3315
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	0+(_rcv_data)+01h,f
	goto	l30003047
	
l30003044:	
	line	127
;ir_in.c: 127: else if (i<24) {
	movlw	(018h)
	subwf	(ir_recieve@i),w
	skipnc
	goto	u3321
	goto	u3320
u3321:
	goto	l30003046
u3320:
	
l30003045:	
	line	128
;ir_in.c: 128: rcv_data[2] |= ((s_data & 0x01) << (7 - (i-16)));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	movf	(ir_recieve@i),w
	addlw	-16
	xorlw	0ffh
	addlw	1
	addlw	07h
	addlw	1
	goto	u3334
u3335:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3334:
	addlw	-1
	skipz
	goto	u3335
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	0+(_rcv_data)+02h,f
	goto	l30003047
	
l30003046:	
	line	132
;ir_in.c: 131: else {
;ir_in.c: 132: rcv_data[3] |= ((s_data & 0x01) << (7 - (i-24)));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	movf	(ir_recieve@i),w
	addlw	-24
	xorlw	0ffh
	addlw	1
	addlw	07h
	addlw	1
	goto	u3344
u3345:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3344:
	addlw	-1
	skipz
	goto	u3345
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	0+(_rcv_data)+03h,f
	
l30003047:	
	line	107
	movlw	(01h)
	movwf	(??_ir_recieve+0+0)
	movf	(??_ir_recieve+0+0),w
	addwf	(ir_recieve@i),f
	
l30003048:	
	movlw	(020h)
	subwf	(ir_recieve@i),w
	skipc
	goto	u3351
	goto	u3350
u3351:
	goto	l24
u3350:
	goto	l61
	
l30003049:	
	line	140
;ir_in.c: 140: else if (rx_format == 0x20) {
	movf	(_rx_format),w
	xorlw	020h
	skipz
	goto	u3361
	goto	u3360
u3361:
	goto	l61
u3360:
	
l30003050:	
	line	142
;ir_in.c: 142: for (i = 0; i < 48; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(ir_recieve@i)
	
l43:	
	line	145
	btfss	(7),(0)&7	;volatile
	goto	u3371
	goto	u3370
u3371:
	goto	l43
u3370:
	
l30003053:	
	line	148
;ir_in.c: 148: Timer_Reset();
	fcall	_Timer_Reset
	
l46:	
	line	149
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(7),(0)&7	;volatile
	goto	u3381
	goto	u3380
u3381:
	goto	l46
u3380:
	
l30003054:	
	line	152
;ir_in.c: 152: if (TMR1H >= 0x03) {
	movlw	(03h)
	subwf	(15),w	;volatile
	skipc
	goto	u3391
	goto	u3390
u3391:
	goto	l30003066
u3390:
	
l30003055:	
	line	154
;ir_in.c: 154: if (i<8) {
	movlw	(08h)
	subwf	(ir_recieve@i),w
	skipnc
	goto	u3401
	goto	u3400
u3401:
	goto	l30003057
u3400:
	
l30003056:	
	line	155
;ir_in.c: 155: rcv_data[0] |= ((s_data & 0x01) << (7 - i));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	decf	(ir_recieve@i),w
	xorlw	0ffh
	addlw	07h
	addlw	1
	goto	u3414
u3415:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3414:
	addlw	-1
	skipz
	goto	u3415
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	(_rcv_data),f
	goto	l30003066
	
l30003057:	
	line	158
;ir_in.c: 158: else if (i<16) {
	movlw	(010h)
	subwf	(ir_recieve@i),w
	skipnc
	goto	u3421
	goto	u3420
u3421:
	goto	l30003059
u3420:
	
l30003058:	
	line	159
;ir_in.c: 159: rcv_data[1] |= ((s_data & 0x01) << (7 - (i-8)));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	movf	(ir_recieve@i),w
	addlw	-8
	xorlw	0ffh
	addlw	1
	addlw	07h
	addlw	1
	goto	u3434
u3435:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3434:
	addlw	-1
	skipz
	goto	u3435
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	0+(_rcv_data)+01h,f
	goto	l30003066
	
l30003059:	
	line	162
;ir_in.c: 162: else if (i<24) {
	movlw	(018h)
	subwf	(ir_recieve@i),w
	skipnc
	goto	u3441
	goto	u3440
u3441:
	goto	l30003061
u3440:
	
l30003060:	
	line	163
;ir_in.c: 163: rcv_data[2] |= ((s_data & 0x01) << (7 - (i-16)));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	movf	(ir_recieve@i),w
	addlw	-16
	xorlw	0ffh
	addlw	1
	addlw	07h
	addlw	1
	goto	u3454
u3455:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3454:
	addlw	-1
	skipz
	goto	u3455
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	0+(_rcv_data)+02h,f
	goto	l30003066
	
l30003061:	
	line	166
;ir_in.c: 166: else if (i<32) {
	movlw	(020h)
	subwf	(ir_recieve@i),w
	skipnc
	goto	u3461
	goto	u3460
u3461:
	goto	l30003063
u3460:
	
l30003062:	
	line	167
;ir_in.c: 167: rcv_data[3] |= ((s_data & 0x01) << (7 - (i-24)));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	movf	(ir_recieve@i),w
	addlw	-24
	xorlw	0ffh
	addlw	1
	addlw	07h
	addlw	1
	goto	u3474
u3475:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3474:
	addlw	-1
	skipz
	goto	u3475
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	0+(_rcv_data)+03h,f
	goto	l30003066
	
l30003063:	
	line	170
;ir_in.c: 170: else if (i<40) {
	movlw	(028h)
	subwf	(ir_recieve@i),w
	skipnc
	goto	u3481
	goto	u3480
u3481:
	goto	l30003065
u3480:
	
l30003064:	
	line	171
;ir_in.c: 171: rcv_data[4] |= ((s_data & 0x01) << (7 - (i-32)));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	movf	(ir_recieve@i),w
	addlw	-32
	xorlw	0ffh
	addlw	1
	addlw	07h
	addlw	1
	goto	u3494
u3495:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3494:
	addlw	-1
	skipz
	goto	u3495
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	0+(_rcv_data)+04h,f
	goto	l30003066
	
l30003065:	
	line	175
;ir_in.c: 174: else {
;ir_in.c: 175: rcv_data[5] |= ((s_data & 0x01) << (7 - (i-40)));
	movf	(ir_recieve@s_data),w
	andlw	01h
	movwf	(??_ir_recieve+0+0)
	movf	(ir_recieve@i),w
	addlw	-40
	xorlw	0ffh
	addlw	1
	addlw	07h
	addlw	1
	goto	u3504
u3505:
	clrc
	rlf	(??_ir_recieve+0+0),f
u3504:
	addlw	-1
	skipz
	goto	u3505
	movf	0+(??_ir_recieve+0+0),w
	movwf	(??_ir_recieve+1+0)
	movf	(??_ir_recieve+1+0),w
	iorwf	0+(_rcv_data)+05h,f
	
l30003066:	
	line	142
	movlw	(01h)
	movwf	(??_ir_recieve+0+0)
	movf	(??_ir_recieve+0+0),w
	addwf	(ir_recieve@i),f
	
l30003067:	
	movlw	(030h)
	subwf	(ir_recieve@i),w
	skipc
	goto	u3511
	goto	u3510
u3511:
	goto	l43
u3510:
	
l61:	
	line	183
	btfss	(7),(0)&7	;volatile
	goto	u3521
	goto	u3520
u3521:
	goto	l61
u3520:
	
l30003068:	
	line	185
;ir_in.c: 185: Timer_Reset();
	fcall	_Timer_Reset
	goto	l64
	
l30003069:	
	line	189
;ir_in.c: 189: if (TMR1H >= 0x08) {
	movlw	(08h)
	subwf	(15),w	;volatile
	skipc
	goto	u3531
	goto	u3530
u3531:
	goto	l64
u3530:
	
l30003070:	
	line	190
;ir_in.c: 190: return 0x00;
	movlw	(0)
	goto	l3
	
l64:	
	line	187
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(7),(0)&7	;volatile
	goto	u3541
	goto	u3540
u3541:
	goto	l30003069
u3540:
	goto	l30003023
	
l3:	
	return
	opt stack 0
GLOBAL	__end_of_ir_recieve
	__end_of_ir_recieve:
; =============== function _ir_recieve ends ============

psect	text233,local,class=CODE,delta=2
global __ptext233
__ptext233:
	line	194
	signat	_ir_recieve,89
	global	_cpu_sleep

; *************** function _cpu_sleep *****************
; Defined at:
;		line 161 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     1
;      Total:    1
; This function calls:
;		__delay
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text233
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
	line	161
	global	__size_of_cpu_sleep
	__size_of_cpu_sleep	equ	__end_of_cpu_sleep-_cpu_sleep
;ir_main.c: 160: void cpu_sleep(void)
;ir_main.c: 161: {
	
_cpu_sleep:	
	opt stack 6
; Regs used in _cpu_sleep: [wreg]
	line	162
	
l30003074:	
;ir_main.c: 162: PORTA = 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	163
;ir_main.c: 163: PORTB = 0x3C;
	movlw	(03Ch)
	movwf	(6)	;volatile
	
l30003075:	
	line	165
;ir_main.c: 165: INTEDG = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1038/8)^080h,(1038)&7
	
l30003076:	
	line	166
;ir_main.c: 166: INTF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(89/8),(89)&7
	
l30003077:	
	line	167
;ir_main.c: 167: INTE = 1;
	bsf	(92/8),(92)&7
	
l30003078:	
	line	169
# 169 "C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
sleep ;#
psect	text233
	line	171
;ir_main.c: 171: _delay((unsigned long)((1)*(4000000/4000.0)));
	movlw	249
movwf	(??_cpu_sleep+0+0),f
u3947:
	clrwdt
decfsz	(??_cpu_sleep+0+0),f
	goto	u3947
	nop2	;nop
	clrwdt

	
l30003079:	
	line	172
;ir_main.c: 172: INTF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(89/8),(89)&7
	
l30003080:	
	line	173
;ir_main.c: 173: INTE = 0;
	bcf	(92/8),(92)&7
	
l111:	
	return
	opt stack 0
GLOBAL	__end_of_cpu_sleep
	__end_of_cpu_sleep:
; =============== function _cpu_sleep ends ============

psect	text234,local,class=CODE,delta=2
global __ptext234
__ptext234:
	line	176
	signat	_cpu_sleep,88
	global	_ir_out_start

; *************** function _ir_out_start *****************
; Defined at:
;		line 253 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;  func_key        1    wreg     unsigned char 
;  key_code        1   17[BANK0 ] unsigned char 
; Auto vars:     Size  Location     Type
;  func_key        1   16[BANK0 ] unsigned char 
;  data_p          2   14[BANK0 ] PTR unsigned char 
;		 -> ir_func1_code_tbl(96), ir_func2_code_tbl(96), ir_func3_code_tbl(96), ir_func4_code_tbl(96), 
;  format          1   13[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       8       0       0       0
;      Temp:     3
;      Total:    8
; This function calls:
;		_IR_NEC_format
;		_IR_KDN_format
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text234
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	253
	global	__size_of_ir_out_start
	__size_of_ir_out_start	equ	__end_of_ir_out_start-_ir_out_start
;ir_out.c: 252: void ir_out_start(unsigned char func_key, unsigned char key_code)
;ir_out.c: 253: {
	
_ir_out_start:	
	opt stack 6
; Regs used in _ir_out_start: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;ir_out_start@func_key stored from wreg
	line	259
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ir_out_start@func_key)
	
l30002825:	
;ir_out.c: 254: unsigned char format;
;ir_out.c: 255: unsigned char* data_p;
;ir_out.c: 259: format = ir_format_tbl[func_key];
	movf	(ir_out_start@func_key),w
	addlw	low ((_ir_format_tbl))
	movwf	fsr0
	movlw	high ((_ir_format_tbl))
	skipnc
	addlw	1
	FNCALL _ir_out_start,stringtab
	fcall	stringtab
	movwf	(ir_out_start@format)
	
l30002826:	
	line	262
;ir_out.c: 262: if (func_key == KEY_CODE01) {
	movf	(ir_out_start@func_key),f
	skipz
	goto	u2871
	goto	u2870
u2871:
	goto	l30002828
u2870:
	
l30002827:	
	line	264
;ir_out.c: 264: data_p = (unsigned char*)&ir_func1_code_tbl[(key_code-4)][0];
	movf	(ir_out_start@key_code),w
	movwf	(??_ir_out_start+0+0)
	movlw	(03h)-1
u2885:
	clrc
	rlf	(??_ir_out_start+0+0),f
	addlw	-1
	skipz
	goto	u2885
	clrc
	rlf	(??_ir_out_start+0+0),w
	addlw	0E0h
	addlw	low((_ir_func1_code_tbl))
	movwf	(??_ir_out_start+1+0)
	movlw	high((_ir_func1_code_tbl))
	skipnc
	addlw	1
	movwf	1+((??_ir_out_start+1+0))
	movf	0+(??_ir_out_start+1+0),w
	movwf	(ir_out_start@data_p)
	movf	1+(??_ir_out_start+1+0),w
	movwf	((ir_out_start@data_p))+1
	goto	l30002833
	
l30002828:	
	line	265
	movf	(ir_out_start@func_key),w
	xorlw	01h
	skipz
	goto	u2891
	goto	u2890
u2891:
	goto	l30002830
u2890:
	
l30002829:	
	line	267
;ir_out.c: 267: data_p = (unsigned char*)&ir_func2_code_tbl[(key_code-4)][0];
	movf	(ir_out_start@key_code),w
	movwf	(??_ir_out_start+0+0)
	movlw	(03h)-1
u2905:
	clrc
	rlf	(??_ir_out_start+0+0),f
	addlw	-1
	skipz
	goto	u2905
	clrc
	rlf	(??_ir_out_start+0+0),w
	addlw	0E0h
	addlw	low((_ir_func2_code_tbl))
	movwf	(??_ir_out_start+1+0)
	movlw	high((_ir_func2_code_tbl))
	skipnc
	addlw	1
	movwf	1+((??_ir_out_start+1+0))
	movf	0+(??_ir_out_start+1+0),w
	movwf	(ir_out_start@data_p)
	movf	1+(??_ir_out_start+1+0),w
	movwf	((ir_out_start@data_p))+1
	goto	l30002833
	
l30002830:	
	line	268
	movf	(ir_out_start@func_key),w
	xorlw	02h
	skipz
	goto	u2911
	goto	u2910
u2911:
	goto	l30002832
u2910:
	
l30002831:	
	line	270
;ir_out.c: 270: data_p = (unsigned char*)&ir_func3_code_tbl[(key_code-4)][0];
	movf	(ir_out_start@key_code),w
	movwf	(??_ir_out_start+0+0)
	movlw	(03h)-1
u2925:
	clrc
	rlf	(??_ir_out_start+0+0),f
	addlw	-1
	skipz
	goto	u2925
	clrc
	rlf	(??_ir_out_start+0+0),w
	addlw	0E0h
	addlw	low((_ir_func3_code_tbl))
	movwf	(??_ir_out_start+1+0)
	movlw	high((_ir_func3_code_tbl))
	skipnc
	addlw	1
	movwf	1+((??_ir_out_start+1+0))
	movf	0+(??_ir_out_start+1+0),w
	movwf	(ir_out_start@data_p)
	movf	1+(??_ir_out_start+1+0),w
	movwf	((ir_out_start@data_p))+1
	goto	l30002833
	
l30002832:	
	line	273
;ir_out.c: 273: data_p = (unsigned char*)&ir_func4_code_tbl[(key_code-4)][0];
	movf	(ir_out_start@key_code),w
	movwf	(??_ir_out_start+0+0)
	movlw	(03h)-1
u2935:
	clrc
	rlf	(??_ir_out_start+0+0),f
	addlw	-1
	skipz
	goto	u2935
	clrc
	rlf	(??_ir_out_start+0+0),w
	addlw	0E0h
	addlw	low((_ir_func4_code_tbl))
	movwf	(??_ir_out_start+1+0)
	movlw	high((_ir_func4_code_tbl))
	skipnc
	addlw	1
	movwf	1+((??_ir_out_start+1+0))
	movf	0+(??_ir_out_start+1+0),w
	movwf	(ir_out_start@data_p)
	movf	1+(??_ir_out_start+1+0),w
	movwf	((ir_out_start@data_p))+1
	
l30002833:	
	line	277
;ir_out.c: 274: }
;ir_out.c: 277: if (format == 0x10) {
	movf	(ir_out_start@format),w
	xorlw	010h
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l30002835
u2940:
	
l30002834:	
	line	279
;ir_out.c: 279: IR_NEC_format(data_p);
	movf	(ir_out_start@data_p+1),w
	clrf	(?_IR_NEC_format+1)
	addwf	(?_IR_NEC_format+1)
	movf	(ir_out_start@data_p),w
	clrf	(?_IR_NEC_format)
	addwf	(?_IR_NEC_format)

	fcall	_IR_NEC_format
	goto	l223
	
l30002835:	
	line	282
;ir_out.c: 282: IR_KDN_format(data_p);
	movf	(ir_out_start@data_p+1),w
	clrf	(?_IR_KDN_format+1)
	addwf	(?_IR_KDN_format+1)
	movf	(ir_out_start@data_p),w
	clrf	(?_IR_KDN_format)
	addwf	(?_IR_KDN_format)

	fcall	_IR_KDN_format
	
l223:	
	return
	opt stack 0
GLOBAL	__end_of_ir_out_start
	__end_of_ir_out_start:
; =============== function _ir_out_start ends ============

psect	text235,local,class=CODE,delta=2
global __ptext235
__ptext235:
	line	285
	signat	_ir_out_start,8312
	global	_led_control

; *************** function _led_control *****************
; Defined at:
;		line 140 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
; Parameters:    Size  Location     Type
;  led_state       1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  led_state       1    1[COMMON] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       0       0       0       0
;      Temp:     1
;      Total:    2
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text235
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
	line	140
	global	__size_of_led_control
	__size_of_led_control	equ	__end_of_led_control-_led_control
;ir_main.c: 139: void led_control(unsigned char led_state)
;ir_main.c: 140: {
	
_led_control:	
	opt stack 6
; Regs used in _led_control: [wreg+status,2+status,0]
;led_control@led_state stored from wreg
	movwf	(led_control@led_state)
	
l30003082:	
	line	141
;ir_main.c: 141: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_led_control+0+0)
	movf	(??_led_control+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30003083:	
	line	142
;ir_main.c: 142: if (led_state != 0xC3) {
	movf	(led_control@led_state),w
	xorlw	0C3h
	skipnz
	goto	u3551
	goto	u3550
u3551:
	goto	l108
u3550:
	
l30003084:	
	line	143
;ir_main.c: 143: PORTC |= led_state;
	movf	(led_control@led_state),w
	movwf	(??_led_control+0+0)
	movf	(??_led_control+0+0),w
	iorwf	(7),f	;volatile
	
l108:	
	return
	opt stack 0
GLOBAL	__end_of_led_control
	__end_of_led_control:
; =============== function _led_control ends ============

psect	text236,local,class=CODE,delta=2
global __ptext236
__ptext236:
	line	145
	signat	_led_control,4216
	global	_key_input_check

; *************** function _key_input_check *****************
; Defined at:
;		line 52 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;  code            1    2[COMMON] unsigned char 
;  i               1    1[COMMON] unsigned char 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         3       0       0       0       0
;      Temp:     1
;      Total:    3
; This function calls:
;		__delay
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text236
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_main.c"
	line	52
	global	__size_of_key_input_check
	__size_of_key_input_check	equ	__end_of_key_input_check-_key_input_check
;ir_main.c: 25: asm("\tpsect config,class=CONFIG,delta=2"); asm("\tdw ""0x3FFC & 0x3FF7 & 0x3FFF & 0x3FFF & 0x3CFF & 0x2FFF");
;ir_main.c: 30: unsigned char key_input_check(void);
;ir_main.c: 31: void led_control(unsigned char led_state);
;ir_main.c: 32: void motion_control(unsigned char motion_state);
;ir_main.c: 33: void cpu_sleep(void);
;ir_main.c: 38: unsigned char rcv_data[0x08];
;ir_main.c: 39: unsigned char pre_data[0x08];
;ir_main.c: 40: unsigned char rx_format;
;ir_main.c: 41: unsigned char eep_rdata[(0x07 * 0x04)];
	
_key_input_check:	
	opt stack 6
; Regs used in _key_input_check: [wreg-fsr0h+status,2+status,0]
	line	53
	
l30003085:	
;ir_main.c: 53: unsigned char code = KEY_OFF;
	movlw	(0FFh)
	movwf	(key_input_check@code)
	
l30003086:	
	line	56
;ir_main.c: 54: unsigned char i;
;ir_main.c: 56: PORTB = 0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	
l30003087:	
	line	58
;ir_main.c: 58: for (i=0; i<4; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(key_input_check@i)
	goto	l30003118
	
l75:	
	line	61
;ir_main.c: 61: PORTB |= 0x04;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(6)+(2/8),(2)&7	;volatile
	
l30003089:	
	line	62
;ir_main.c: 62: _delay((unsigned long)((10)*(4000000/4000000.0)));
	movlw	3
movwf	(??_key_input_check+0+0),f
u3957:
decfsz	(??_key_input_check+0+0),f
	goto	u3957

	
l30003090:	
	line	64
;ir_main.c: 64: if (PORTA & 0x01) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(5),(0)&7	;volatile
	goto	u3561
	goto	u3560
u3561:
	goto	l76
u3560:
	
l30003091:	
	line	65
;ir_main.c: 65: code = KEY_CODE01;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(key_input_check@code)
	goto	l30003095
	
l76:	
	line	66
	btfss	(5),(1)&7	;volatile
	goto	u3571
	goto	u3570
u3571:
	goto	l78
u3570:
	
l30003092:	
	line	67
;ir_main.c: 67: code = KEY_CODE02;
	clrf	(key_input_check@code)
	bsf	status,0
	rlf	(key_input_check@code),f
	goto	l30003095
	
l78:	
	line	68
	btfss	(5),(2)&7	;volatile
	goto	u3581
	goto	u3580
u3581:
	goto	l80
u3580:
	
l30003093:	
	line	69
;ir_main.c: 69: code = KEY_CODE03;
	movlw	(02h)
	movwf	(key_input_check@code)
	goto	l30003095
	
l80:	
	line	70
	btfss	(5),(3)&7	;volatile
	goto	u3591
	goto	u3590
u3591:
	goto	l79
u3590:
	
l30003094:	
	line	71
;ir_main.c: 71: code = KEY_CODE04;
	movlw	(03h)
	movwf	(key_input_check@code)
	goto	l30003095
	
l79:	
	
l30003095:	
	line	73
;ir_main.c: 72: }
;ir_main.c: 73: PORTB &= ~0x04;
	movlw	(0FBh)
	movwf	(??_key_input_check+0+0)
	movf	(??_key_input_check+0+0),w
	andwf	(6),f	;volatile
	goto	l30003119
	
l83:	
	line	77
;ir_main.c: 77: PORTB |= 0x08;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(6)+(3/8),(3)&7	;volatile
	
l30003096:	
	line	78
;ir_main.c: 78: _delay((unsigned long)((10)*(4000000/4000000.0)));
	movlw	3
movwf	(??_key_input_check+0+0),f
u3967:
decfsz	(??_key_input_check+0+0),f
	goto	u3967

	
l30003097:	
	line	80
;ir_main.c: 80: if (PORTA & 0x01) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(5),(0)&7	;volatile
	goto	u3601
	goto	u3600
u3601:
	goto	l84
u3600:
	
l30003098:	
	line	81
;ir_main.c: 81: code = KEY_CODE05;
	movlw	(04h)
	movwf	(key_input_check@code)
	goto	l30003102
	
l84:	
	line	82
	btfss	(5),(1)&7	;volatile
	goto	u3611
	goto	u3610
u3611:
	goto	l86
u3610:
	
l30003099:	
	line	83
;ir_main.c: 83: code = KEY_CODE06;
	movlw	(05h)
	movwf	(key_input_check@code)
	goto	l30003102
	
l86:	
	line	84
	btfss	(5),(2)&7	;volatile
	goto	u3621
	goto	u3620
u3621:
	goto	l88
u3620:
	
l30003100:	
	line	85
;ir_main.c: 85: code = KEY_CODE07;
	movlw	(06h)
	movwf	(key_input_check@code)
	goto	l30003102
	
l88:	
	line	86
	btfss	(5),(3)&7	;volatile
	goto	u3631
	goto	u3630
u3631:
	goto	l87
u3630:
	
l30003101:	
	line	87
;ir_main.c: 87: code = KEY_CODE08;
	movlw	(07h)
	movwf	(key_input_check@code)
	goto	l30003102
	
l87:	
	
l30003102:	
	line	89
;ir_main.c: 88: }
;ir_main.c: 89: PORTB &= ~0x08;
	movlw	(0F7h)
	movwf	(??_key_input_check+0+0)
	movf	(??_key_input_check+0+0),w
	andwf	(6),f	;volatile
	goto	l30003119
	
l91:	
	line	93
;ir_main.c: 93: PORTB |= 0x10;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(6)+(4/8),(4)&7	;volatile
	
l30003103:	
	line	94
;ir_main.c: 94: _delay((unsigned long)((10)*(4000000/4000000.0)));
	movlw	3
movwf	(??_key_input_check+0+0),f
u3977:
decfsz	(??_key_input_check+0+0),f
	goto	u3977

	
l30003104:	
	line	96
;ir_main.c: 96: if (PORTA & 0x01) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(5),(0)&7	;volatile
	goto	u3641
	goto	u3640
u3641:
	goto	l92
u3640:
	
l30003105:	
	line	97
;ir_main.c: 97: code = KEY_CODE09;
	movlw	(08h)
	movwf	(key_input_check@code)
	goto	l30003109
	
l92:	
	line	98
	btfss	(5),(1)&7	;volatile
	goto	u3651
	goto	u3650
u3651:
	goto	l94
u3650:
	
l30003106:	
	line	99
;ir_main.c: 99: code = KEY_CODE10;
	movlw	(09h)
	movwf	(key_input_check@code)
	goto	l30003109
	
l94:	
	line	100
	btfss	(5),(2)&7	;volatile
	goto	u3661
	goto	u3660
u3661:
	goto	l96
u3660:
	
l30003107:	
	line	101
;ir_main.c: 101: code = KEY_CODE11;
	movlw	(0Ah)
	movwf	(key_input_check@code)
	goto	l30003109
	
l96:	
	line	102
	btfss	(5),(3)&7	;volatile
	goto	u3671
	goto	u3670
u3671:
	goto	l95
u3670:
	
l30003108:	
	line	103
;ir_main.c: 103: code = KEY_CODE12;
	movlw	(0Bh)
	movwf	(key_input_check@code)
	goto	l30003109
	
l95:	
	
l30003109:	
	line	105
;ir_main.c: 104: }
;ir_main.c: 105: PORTB &= ~0x10;
	movlw	(0EFh)
	movwf	(??_key_input_check+0+0)
	movf	(??_key_input_check+0+0),w
	andwf	(6),f	;volatile
	goto	l30003119
	
l99:	
	line	109
;ir_main.c: 109: PORTB |= 0x20;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(6)+(5/8),(5)&7	;volatile
	
l30003110:	
	line	110
;ir_main.c: 110: _delay((unsigned long)((10)*(4000000/4000000.0)));
	movlw	3
movwf	(??_key_input_check+0+0),f
u3987:
decfsz	(??_key_input_check+0+0),f
	goto	u3987

	
l30003111:	
	line	112
;ir_main.c: 112: if (PORTA & 0x01) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(5),(0)&7	;volatile
	goto	u3681
	goto	u3680
u3681:
	goto	l100
u3680:
	
l30003112:	
	line	113
;ir_main.c: 113: code = KEY_CODE13;
	movlw	(0Ch)
	movwf	(key_input_check@code)
	goto	l30003116
	
l100:	
	line	114
	btfss	(5),(1)&7	;volatile
	goto	u3691
	goto	u3690
u3691:
	goto	l102
u3690:
	
l30003113:	
	line	115
;ir_main.c: 115: code = KEY_CODE14;
	movlw	(0Dh)
	movwf	(key_input_check@code)
	goto	l30003116
	
l102:	
	line	116
	btfss	(5),(2)&7	;volatile
	goto	u3701
	goto	u3700
u3701:
	goto	l104
u3700:
	
l30003114:	
	line	117
;ir_main.c: 117: code = KEY_CODE15;
	movlw	(0Eh)
	movwf	(key_input_check@code)
	goto	l30003116
	
l104:	
	line	118
	btfss	(5),(3)&7	;volatile
	goto	u3711
	goto	u3710
u3711:
	goto	l103
u3710:
	
l30003115:	
	line	119
;ir_main.c: 119: code = KEY_CODE16;
	movlw	(0Fh)
	movwf	(key_input_check@code)
	goto	l30003116
	
l103:	
	
l30003116:	
	line	121
;ir_main.c: 120: }
;ir_main.c: 121: PORTB &= ~0x20;
	movlw	(0DFh)
	movwf	(??_key_input_check+0+0)
	movf	(??_key_input_check+0+0),w
	andwf	(6),f	;volatile
	goto	l30003119
	
l30003118:	
	line	59
	movf	(key_input_check@i),w
		xorlw	0^0
	skipnz
	goto	l75
	xorlw	1^0
	skipnz
	goto	l83
	xorlw	2^1
	skipnz
	goto	l91
	xorlw	3^2
	skipnz
	goto	l99
	goto	l30003119

	
l30003119:	
	line	124
;ir_main.c: 124: if (code != KEY_OFF) {
	movf	(key_input_check@code),w
	xorlw	0FFh
	skipnz
	goto	u3721
	goto	u3720
u3721:
	goto	l30003121
u3720:
	goto	l30003123
	
l30003121:	
	line	58
	movlw	(01h)
	movwf	(??_key_input_check+0+0)
	movf	(??_key_input_check+0+0),w
	addwf	(key_input_check@i),f
	
l30003122:	
	movlw	(04h)
	subwf	(key_input_check@i),w
	skipc
	goto	u3731
	goto	u3730
u3731:
	goto	l30003118
u3730:
	
l30003123:	
	line	128
;ir_main.c: 126: }
;ir_main.c: 127: }
;ir_main.c: 128: return code;
	movf	(key_input_check@code),w
	
l69:	
	return
	opt stack 0
GLOBAL	__end_of_key_input_check
	__end_of_key_input_check:
; =============== function _key_input_check ends ============

psect	text237,local,class=CODE,delta=2
global __ptext237
__ptext237:
	line	129
	signat	_key_input_check,89
	global	_lcd_put_ir_data

; *************** function _lcd_put_ir_data *****************
; Defined at:
;		line 286 in file "C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
; Parameters:    Size  Location     Type
;  ir_data         1    wreg     PTR unsigned char 
;		 -> rcv_data(8), 
;  size            1   12[BANK0 ] unsigned char 
; Auto vars:     Size  Location     Type
;  ir_data         1    9[BANK0 ] PTR unsigned char 
;		 -> rcv_data(8), 
;  i               1   11[BANK0 ] unsigned char 
;  ir_char         1   10[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       4       0       0       0
;      Temp:     1
;      Total:    5
; This function calls:
;		_lcd_goto_posi
;		_lcd_put_hex
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text237
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	286
	global	__size_of_lcd_put_ir_data
	__size_of_lcd_put_ir_data	equ	__end_of_lcd_put_ir_data-_lcd_put_ir_data
;lcd.c: 285: void lcd_put_ir_data(unsigned char* ir_data, unsigned char size)
;lcd.c: 286: {
	
_lcd_put_ir_data:	
	opt stack 6
; Regs used in _lcd_put_ir_data: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_put_ir_data@ir_data stored from wreg
	line	290
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_put_ir_data@ir_data)
	
l30002875:	
;lcd.c: 287: unsigned char i;
;lcd.c: 288: unsigned char ir_char;
;lcd.c: 290: if (size > 0x00) {
	movf	(lcd_put_ir_data@size),w
	skipz
	goto	u3020
	goto	l254
u3020:
	
l30002876:	
	line	292
;lcd.c: 292: lcd_goto_posi(0x40);
	movlw	(040h)
	fcall	_lcd_goto_posi
	
l30002877:	
	line	295
;lcd.c: 295: for (i = 0; i < size; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_put_ir_data@i)
	goto	l30002882
	
l30002878:	
	line	296
;lcd.c: 296: ir_char = *ir_data;
	movf	(lcd_put_ir_data@ir_data),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(lcd_put_ir_data@ir_char)
	
l30002879:	
	line	297
;lcd.c: 297: lcd_put_hex(ir_char);
	movf	(lcd_put_ir_data@ir_char),w
	fcall	_lcd_put_hex
	
l30002880:	
	line	298
;lcd.c: 298: ir_data++;
	movlw	(01h)
	movwf	(??_lcd_put_ir_data+0+0)
	movf	(??_lcd_put_ir_data+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_put_ir_data@ir_data),f
	
l30002881:	
	line	295
	movlw	(01h)
	movwf	(??_lcd_put_ir_data+0+0)
	movf	(??_lcd_put_ir_data+0+0),w
	addwf	(lcd_put_ir_data@i),f
	
l30002882:	
	movf	(lcd_put_ir_data@size),w
	subwf	(lcd_put_ir_data@i),w
	skipc
	goto	u3031
	goto	u3030
u3031:
	goto	l30002878
u3030:
	
l254:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_put_ir_data
	__end_of_lcd_put_ir_data:
; =============== function _lcd_put_ir_data ends ============

psect	text238,local,class=CODE,delta=2
global __ptext238
__ptext238:
	line	302
	signat	_lcd_put_ir_data,8312
	global	_memset

; *************** function _memset *****************
; Defined at:
;		line 10 in file "C:\Program Files\HI-TECH Software\PICC\9.70\sources\memset.c"
; Parameters:    Size  Location     Type
;  p1              1    wreg     PTR void 
;		 -> rcv_data(8), pre_data(8), 
;  c               2    2[BANK0 ] int 
;  n               2    4[BANK0 ] unsigned int 
; Auto vars:     Size  Location     Type
;  p1              1    0[BANK0 ] PTR void 
;		 -> rcv_data(8), pre_data(8), 
;  p               1    1[BANK0 ] PTR unsigned char 
;		 -> rcv_data(8), pre_data(8), 
; Return value:  Size  Location     Type
;                  1    wreg      PTR void 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       6       0       0       0
;      Temp:     1
;      Total:    7
; This function calls:
;		Nothing
; This function is called by:
;		_ir_recieve
;		_main
; This function uses a non-reentrant model
; 
psect	text238
	file	"C:\Program Files\HI-TECH Software\PICC\9.70\sources\memset.c"
	line	10
	global	__size_of_memset
	__size_of_memset	equ	__end_of_memset-_memset
	
_memset:	
	opt stack 5
; Regs used in _memset: [wreg-fsr0h+status,2+status,0]
;memset@p1 stored from wreg
	line	18
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(memset@p1)
	
l30003125:	
	movf	(memset@p1),w
	movwf	(memset@p)
	goto	l30003128
	
l30003126:	
	line	20
	movf	(memset@c),w
	movwf	(??_memset+0+0)
	movf	(memset@p),w
	movwf	fsr0
	movf	(??_memset+0+0),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l30003127:	
	movlw	(01h)
	movwf	(??_memset+0+0)
	movf	(??_memset+0+0),w
	addwf	(memset@p),f
	
l30003128:	
	line	19
	movlw	low(01h)
	subwf	(memset@n),f
	movlw	high(01h)
	skipc
	decf	(memset@n+1),f
	subwf	(memset@n+1),f
	movlw	high(0FFFFh)
	xorwf	((memset@n+1))&07fh,w
	skipz
	goto	u3745
	movlw	low(0FFFFh)
	xorwf	((memset@n))&07fh,w
u3745:

	skipz
	goto	u3741
	goto	u3740
u3741:
	goto	l30003126
u3740:
	
l270:	
	return
	opt stack 0
GLOBAL	__end_of_memset
	__end_of_memset:
; =============== function _memset ends ============

psect	text239,local,class=CODE,delta=2
global __ptext239
__ptext239:
	line	22
	signat	_memset,12409
	global	_Timer_Reset

; *************** function _Timer_Reset *****************
; Defined at:
;		line 30 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_in.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		Nothing
; This function is called by:
;		_ir_recieve
; This function uses a non-reentrant model
; 
psect	text239
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_in.c"
	line	30
	global	__size_of_Timer_Reset
	__size_of_Timer_Reset	equ	__end_of_Timer_Reset-_Timer_Reset
;pic16f887.h: 19: volatile unsigned char INDF @ 0x000;
;pic16f887.h: 20: volatile unsigned char TMR0 @ 0x001;
;pic16f887.h: 21: volatile unsigned char PCL @ 0x002;
;pic16f887.h: 22: volatile unsigned char STATUS @ 0x003;
;pic16f887.h: 23: unsigned char FSR @ 0x004;
;pic16f887.h: 24: volatile unsigned char PORTA @ 0x005;
;pic16f887.h: 25: volatile unsigned char PORTB @ 0x006;
;pic16f887.h: 26: volatile unsigned char PORTC @ 0x007;
;pic16f887.h: 30: volatile unsigned char PORTE @ 0x009;
;pic16f887.h: 31: volatile unsigned char PCLATH @ 0x00A;
	
_Timer_Reset:	
	opt stack 5
; Regs used in _Timer_Reset: [wreg+status,2+status,0]
	line	31
	
l30003129:	
;ir_in.c: 31: TMR1L = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(14)	;volatile
	line	32
;ir_in.c: 32: TMR1H = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(15)	;volatile
	
l30003130:	
	line	33
;ir_in.c: 33: TMR1IF = 0;
	bcf	(96/8),(96)&7
	
l30003131:	
	line	34
;ir_in.c: 34: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1120/8)^080h,(1120)&7
	
l2:	
	return
	opt stack 0
GLOBAL	__end_of_Timer_Reset
	__end_of_Timer_Reset:
; =============== function _Timer_Reset ends ============

psect	text240,local,class=CODE,delta=2
global __ptext240
__ptext240:
	line	36
	signat	_Timer_Reset,88
	global	_lcd_goto_posi

; *************** function _lcd_goto_posi *****************
; Defined at:
;		line 150 in file "C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
; Parameters:    Size  Location     Type
;  addr            1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  addr            1    1[COMMON] unsigned char 
;  temp            1    2[COMMON] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         3       0       0       0       0
;      Temp:     1
;      Total:    3
; This function calls:
;		_toggle_E
;		__delay
; This function is called by:
;		_lcd_put_ir_format
;		_lcd_put_ir_data
; This function uses a non-reentrant model
; 
psect	text240
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	150
	global	__size_of_lcd_goto_posi
	__size_of_lcd_goto_posi	equ	__end_of_lcd_goto_posi-_lcd_goto_posi
;lcd.c: 149: void lcd_goto_posi(unsigned char addr)
;lcd.c: 150: {
	
_lcd_goto_posi:	
	opt stack 5
; Regs used in _lcd_goto_posi: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto_posi@addr stored from wreg
	line	153
	movwf	(lcd_goto_posi@addr)
	
l30002861:	
;lcd.c: 151: unsigned char temp;
;lcd.c: 153: temp = (addr & 0xF0);
	movf	(lcd_goto_posi@addr),w
	andlw	0F0h
	movwf	(lcd_goto_posi@temp)
	
l30002862:	
	line	154
;lcd.c: 154: temp = (temp >> 2);
	movf	(lcd_goto_posi@temp),w
	movwf	(??_lcd_goto_posi+0+0)
	movlw	02h
u3005:
	clrc
	rrf	(??_lcd_goto_posi+0+0),f
	addlw	-1
	skipz
	goto	u3005
	movf	0+(??_lcd_goto_posi+0+0),w
	movwf	(lcd_goto_posi@temp)
	
l30002863:	
	line	155
;lcd.c: 155: temp |= 0x20;
	bsf	(lcd_goto_posi@temp)+(5/8),(5)&7
	
l30002864:	
	line	156
;lcd.c: 156: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_goto_posi+0+0)
	movf	(??_lcd_goto_posi+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002865:	
	line	157
;lcd.c: 157: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002866:	
	line	158
;lcd.c: 158: PORTC |= temp;
	movf	(lcd_goto_posi@temp),w
	movwf	(??_lcd_goto_posi+0+0)
	movf	(??_lcd_goto_posi+0+0),w
	iorwf	(7),f	;volatile
	
l30002867:	
	line	159
;lcd.c: 159: toggle_E();
	fcall	_toggle_E
	
l30002868:	
	line	160
;lcd.c: 160: temp = (addr & 0x0F);
	movf	(lcd_goto_posi@addr),w
	andlw	0Fh
	movwf	(lcd_goto_posi@temp)
	
l30002869:	
	line	161
;lcd.c: 161: temp = (temp << 2);
	movf	(lcd_goto_posi@temp),w
	movwf	(??_lcd_goto_posi+0+0)
	movlw	(02h)-1
u3015:
	clrc
	rlf	(??_lcd_goto_posi+0+0),f
	addlw	-1
	skipz
	goto	u3015
	clrc
	rlf	(??_lcd_goto_posi+0+0),w
	movwf	(lcd_goto_posi@temp)
	
l30002870:	
	line	162
;lcd.c: 162: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_goto_posi+0+0)
	movf	(??_lcd_goto_posi+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(7),f	;volatile
	
l30002871:	
	line	163
;lcd.c: 163: RA4 = 0;
	bcf	(44/8),(44)&7
	
l30002872:	
	line	164
;lcd.c: 164: PORTC |= temp;
	movf	(lcd_goto_posi@temp),w
	movwf	(??_lcd_goto_posi+0+0)
	movf	(??_lcd_goto_posi+0+0),w
	iorwf	(7),f	;volatile
	line	165
;lcd.c: 165: toggle_E();
	fcall	_toggle_E
	
l30002873:	
	line	166
;lcd.c: 166: _delay((unsigned long)((40)*(4000000/4000000.0)));
	movlw	13
movwf	(??_lcd_goto_posi+0+0),f
u3997:
decfsz	(??_lcd_goto_posi+0+0),f
	goto	u3997

	
l234:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto_posi
	__end_of_lcd_goto_posi:
; =============== function _lcd_goto_posi ends ============

psect	text241,local,class=CODE,delta=2
global __ptext241
__ptext241:
	line	169
	signat	_lcd_goto_posi,4216
	global	_IR_NEC_format

; *************** function _IR_NEC_format *****************
; Defined at:
;		line 100 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;  tbl_p           2    6[BANK0 ] PTR unsigned char 
;		 -> eep_rdata(28), ir_func1_code_tbl(96), ir_func2_code_tbl(96), ir_func3_code_tbl(96), 
;		 -> ir_func4_code_tbl(96), 
; Auto vars:     Size  Location     Type
;  j               1    4[BANK0 ] unsigned char 
;  i               1    5[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       4       0       0       0
;      Temp:     4
;      Total:    8
; This function calls:
;		_IR_NEC_ReaderCode_Send
;		_IR_NEC_DataCode_BitOn_Send
;		_IR_NEC_DataCode_BitOff_Send
;		_IR_NEC_DataCode_StopBit_Send
;		__delay
; This function is called by:
;		_main
;		_ir_out_start
; This function uses a non-reentrant model
; 
psect	text241
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	100
	global	__size_of_IR_NEC_format
	__size_of_IR_NEC_format	equ	__end_of_IR_NEC_format-_IR_NEC_format
;ir_out.c: 99: void IR_NEC_format(unsigned char* tbl_p)
;ir_out.c: 100: {
	
_IR_NEC_format:	
	opt stack 5
; Regs used in _IR_NEC_format: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	104
	
l30003133:	
;ir_out.c: 101: unsigned char i, j;
;ir_out.c: 104: IR_NEC_ReaderCode_Send();
	fcall	_IR_NEC_ReaderCode_Send
	
l30003134:	
	line	107
;ir_out.c: 107: for (i=0;i<0x04;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(IR_NEC_format@i)
	
l30003137:	
	line	110
;ir_out.c: 108: {
;ir_out.c: 110: for(j=0;j<0x08;j++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(IR_NEC_format@j)
	
l30003140:	
	line	113
;ir_out.c: 111: {
;ir_out.c: 113: if (*(tbl_p + i) & (0x80 >> j)) {
	movf	(IR_NEC_format@tbl_p+1),w
	movwf	(??_IR_NEC_format+0+0+1)
	movf	(IR_NEC_format@tbl_p),w
	movwf	(??_IR_NEC_format+0+0)
	movf	(IR_NEC_format@i),w
	addwf	(??_IR_NEC_format+0+0),w
	movwf	fsr0
	movf	(??_IR_NEC_format+0+1),w
	skipnc
	incf	(??_IR_NEC_format+0+1),w
	FNCALL _IR_NEC_format,stringtab
	fcall	stringtab
	movwf	(??_IR_NEC_format+2+0)
	movlw	(080h)
	movwf	(??_IR_NEC_format+3+0)
	incf	(IR_NEC_format@j),w
	goto	u3754
u3755:
	clrc
	rrf	(??_IR_NEC_format+3+0),f
u3754:
	addlw	-1
	skipz
	goto	u3755
	movf	0+(??_IR_NEC_format+3+0),w
	andwf	(??_IR_NEC_format+2+0),w
	btfsc	status,2
	goto	u3761
	goto	u3760
u3761:
	goto	l30003142
u3760:
	
l30003141:	
	line	114
;ir_out.c: 114: IR_NEC_DataCode_BitOn_Send();
	fcall	_IR_NEC_DataCode_BitOn_Send
	goto	l30003143
	
l30003142:	
	line	118
;ir_out.c: 117: else {
;ir_out.c: 118: IR_NEC_DataCode_BitOff_Send();
	fcall	_IR_NEC_DataCode_BitOff_Send
	
l30003143:	
	line	110
	movlw	(01h)
	movwf	(??_IR_NEC_format+0+0)
	movf	(??_IR_NEC_format+0+0),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(IR_NEC_format@j),f
	
l30003144:	
	movlw	(08h)
	subwf	(IR_NEC_format@j),w
	skipc
	goto	u3771
	goto	u3770
u3771:
	goto	l30003140
u3770:
	
l30003145:	
	line	107
	movlw	(01h)
	movwf	(??_IR_NEC_format+0+0)
	movf	(??_IR_NEC_format+0+0),w
	addwf	(IR_NEC_format@i),f
	
l30003146:	
	movlw	(04h)
	subwf	(IR_NEC_format@i),w
	skipc
	goto	u3781
	goto	u3780
u3781:
	goto	l30003137
u3780:
	
l30003147:	
	line	123
;ir_out.c: 119: }
;ir_out.c: 120: }
;ir_out.c: 121: }
;ir_out.c: 123: IR_NEC_DataCode_StopBit_Send();
	fcall	_IR_NEC_DataCode_StopBit_Send
	
l30003148:	
	line	125
;ir_out.c: 125: _delay((unsigned long)((28)*(4000000/4000.0)));
	movlw	37
movwf	(??_IR_NEC_format+0+0+1),f
	movlw	91
movwf	(??_IR_NEC_format+0+0),f
u4007:
	decfsz	(??_IR_NEC_format+0+0),f
	goto	u4007
	decfsz	(??_IR_NEC_format+0+0+1),f
	goto	u4007
	nop2

	
l201:	
	return
	opt stack 0
GLOBAL	__end_of_IR_NEC_format
	__end_of_IR_NEC_format:
; =============== function _IR_NEC_format ends ============

psect	text242,local,class=CODE,delta=2
global __ptext242
__ptext242:
	line	128
	signat	_IR_NEC_format,4216
	global	_IR_KDN_format

; *************** function _IR_KDN_format *****************
; Defined at:
;		line 214 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;  tbl_p           2    8[BANK0 ] PTR unsigned char 
;		 -> eep_rdata(28), ir_func1_code_tbl(96), ir_func2_code_tbl(96), ir_func3_code_tbl(96), 
;		 -> ir_func4_code_tbl(96), 
; Auto vars:     Size  Location     Type
;  j               1    2[COMMON] unsigned char 
;  i               1    3[COMMON] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       6       0       0       0
;      Temp:     4
;      Total:    8
; This function calls:
;		_IR_KDN_ReaderCode_Send
;		_IR_KDN_DataCode_BitOn_Send
;		_IR_KDN_DataCode_BitOff_Send
;		_IR_KDN_DataCode_StopBit_Send
;		__delay
; This function is called by:
;		_main
;		_ir_out_start
; This function uses a non-reentrant model
; 
psect	text242
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	214
	global	__size_of_IR_KDN_format
	__size_of_IR_KDN_format	equ	__end_of_IR_KDN_format-_IR_KDN_format
;ir_out.c: 213: void IR_KDN_format(unsigned char* tbl_p)
;ir_out.c: 214: {
	
_IR_KDN_format:	
	opt stack 5
; Regs used in _IR_KDN_format: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	218
	
l30002683:	
;ir_out.c: 215: unsigned char i, j;
;ir_out.c: 218: IR_KDN_ReaderCode_Send();
	fcall	_IR_KDN_ReaderCode_Send
	
l30002684:	
	line	221
;ir_out.c: 221: for (i=0;i<0x06;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(IR_KDN_format@i)
	
l30002687:	
	line	224
;ir_out.c: 222: {
;ir_out.c: 224: for(j=0;j<0x08;j++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(IR_KDN_format@j)
	
l30002690:	
	line	227
;ir_out.c: 225: {
;ir_out.c: 227: if (*(tbl_p + i) & (0x80 >> j)) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(IR_KDN_format@tbl_p+1),w
	movwf	(??_IR_KDN_format+0+0+1)
	movf	(IR_KDN_format@tbl_p),w
	movwf	(??_IR_KDN_format+0+0)
	movf	(IR_KDN_format@i),w
	addwf	(??_IR_KDN_format+0+0),w
	movwf	fsr0
	movf	(??_IR_KDN_format+0+1),w
	skipnc
	incf	(??_IR_KDN_format+0+1),w
	FNCALL _IR_KDN_format,stringtab
	fcall	stringtab
	movwf	(??_IR_KDN_format+2+0)
	movlw	(080h)
	movwf	(??_IR_KDN_format+3+0)
	incf	(IR_KDN_format@j),w
	goto	u2534
u2535:
	clrc
	rrf	(??_IR_KDN_format+3+0),f
u2534:
	addlw	-1
	skipz
	goto	u2535
	movf	0+(??_IR_KDN_format+3+0),w
	andwf	(??_IR_KDN_format+2+0),w
	btfsc	status,2
	goto	u2541
	goto	u2540
u2541:
	goto	l30002692
u2540:
	
l30002691:	
	line	228
;ir_out.c: 228: IR_KDN_DataCode_BitOn_Send();
	fcall	_IR_KDN_DataCode_BitOn_Send
	goto	l30002693
	
l30002692:	
	line	232
;ir_out.c: 231: else {
;ir_out.c: 232: IR_KDN_DataCode_BitOff_Send();
	fcall	_IR_KDN_DataCode_BitOff_Send
	
l30002693:	
	line	224
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_IR_KDN_format+0+0)
	movf	(??_IR_KDN_format+0+0),w
	addwf	(IR_KDN_format@j),f
	
l30002694:	
	movlw	(08h)
	subwf	(IR_KDN_format@j),w
	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l30002690
u2550:
	
l30002695:	
	line	221
	movlw	(01h)
	movwf	(??_IR_KDN_format+0+0)
	movf	(??_IR_KDN_format+0+0),w
	addwf	(IR_KDN_format@i),f
	
l30002696:	
	movlw	(06h)
	subwf	(IR_KDN_format@i),w
	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l30002687
u2560:
	
l30002697:	
	line	237
;ir_out.c: 233: }
;ir_out.c: 234: }
;ir_out.c: 235: }
;ir_out.c: 237: IR_KDN_DataCode_StopBit_Send();
	fcall	_IR_KDN_DataCode_StopBit_Send
	
l30002698:	
	line	239
;ir_out.c: 239: _delay((unsigned long)((63)*(4000000/4000.0)));
	movlw	82
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_IR_KDN_format+0+0+1),f
	movlw	208
movwf	(??_IR_KDN_format+0+0),f
u4017:
	decfsz	(??_IR_KDN_format+0+0),f
	goto	u4017
	decfsz	(??_IR_KDN_format+0+0+1),f
	goto	u4017
	clrwdt

	
l214:	
	return
	opt stack 0
GLOBAL	__end_of_IR_KDN_format
	__end_of_IR_KDN_format:
; =============== function _IR_KDN_format ends ============

psect	text243,local,class=CODE,delta=2
global __ptext243
__ptext243:
	line	242
	signat	_IR_KDN_format,4216
	global	_lcd_put_hex

; *************** function _lcd_put_hex *****************
; Defined at:
;		line 208 in file "C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
; Parameters:    Size  Location     Type
;  data            1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  data            1    6[BANK0 ] unsigned char 
;  hi              1    8[BANK0 ] unsigned char 
;  lo              1    7[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       3       0       0       0
;      Temp:     1
;      Total:    4
; This function calls:
;		_lcd_put_char
; This function is called by:
;		_lcd_put_ir_data
; This function uses a non-reentrant model
; 
psect	text243
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	208
	global	__size_of_lcd_put_hex
	__size_of_lcd_put_hex	equ	__end_of_lcd_put_hex-_lcd_put_hex
;lcd.c: 207: void lcd_put_hex(unsigned char data)
;lcd.c: 208: {
	
_lcd_put_hex:	
	opt stack 5
; Regs used in _lcd_put_hex: [wreg+status,2+status,0+pclath+cstack]
;lcd_put_hex@data stored from wreg
	line	212
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_put_hex@data)
	
l30002965:	
;lcd.c: 209: unsigned char hi, lo;
;lcd.c: 212: hi = (data & 0xF0);
	movf	(lcd_put_hex@data),w
	andlw	0F0h
	movwf	(lcd_put_hex@hi)
	
l30002966:	
	line	213
;lcd.c: 213: hi = (hi >> 4);
	movf	(lcd_put_hex@hi),w
	movwf	(??_lcd_put_hex+0+0)
	movlw	04h
u3065:
	clrc
	rrf	(??_lcd_put_hex+0+0),f
	addlw	-1
	skipz
	goto	u3065
	movf	0+(??_lcd_put_hex+0+0),w
	movwf	(lcd_put_hex@hi)
	
l30002967:	
	line	215
;lcd.c: 215: hi = (hi + '0');
	movf	(lcd_put_hex@hi),w
	addlw	030h
	movwf	(lcd_put_hex@hi)
	
l30002968:	
	line	216
;lcd.c: 216: if (hi > '9') {
	movlw	(03Ah)
	subwf	(lcd_put_hex@hi),w
	skipc
	goto	u3071
	goto	u3070
u3071:
	goto	l30002970
u3070:
	
l30002969:	
	line	217
;lcd.c: 217: hi = (hi + 7);
	movf	(lcd_put_hex@hi),w
	addlw	07h
	movwf	(lcd_put_hex@hi)
	
l30002970:	
	line	221
;lcd.c: 218: }
;lcd.c: 221: lo = (data & 0x0F);
	movf	(lcd_put_hex@data),w
	andlw	0Fh
	movwf	(lcd_put_hex@lo)
	
l30002971:	
	line	223
;lcd.c: 223: lo = (lo + '0');
	movf	(lcd_put_hex@lo),w
	addlw	030h
	movwf	(lcd_put_hex@lo)
	
l30002972:	
	line	224
;lcd.c: 224: if (lo > '9') {
	movlw	(03Ah)
	subwf	(lcd_put_hex@lo),w
	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l30002974
u3080:
	
l30002973:	
	line	225
;lcd.c: 225: lo = (lo + 7);
	movf	(lcd_put_hex@lo),w
	addlw	07h
	movwf	(lcd_put_hex@lo)
	
l30002974:	
	line	227
;lcd.c: 226: }
;lcd.c: 227: lcd_put_char(hi);
	movf	(lcd_put_hex@hi),w
	fcall	_lcd_put_char
	
l30002975:	
	line	228
;lcd.c: 228: lcd_put_char(lo);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_put_hex@lo),w
	fcall	_lcd_put_char
	
l236:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_put_hex
	__end_of_lcd_put_hex:
; =============== function _lcd_put_hex ends ============

psect	text244,local,class=CODE,delta=2
global __ptext244
__ptext244:
	line	231
	signat	_lcd_put_hex,4216
	global	_lcd_put_char

; *************** function _lcd_put_char *****************
; Defined at:
;		line 180 in file "C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
; Parameters:    Size  Location     Type
;  data            1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  data            1    4[BANK0 ] unsigned char 
;  temp            1    5[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       2       0       0       0
;      Temp:     1
;      Total:    3
; This function calls:
;		_toggle_E
;		__delay
; This function is called by:
;		_lcd_put_hex
;		_lcd_put_ir_format
; This function uses a non-reentrant model
; 
psect	text244
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	180
	global	__size_of_lcd_put_char
	__size_of_lcd_put_char	equ	__end_of_lcd_put_char-_lcd_put_char
;lcd.c: 179: void lcd_put_char(unsigned char data)
;lcd.c: 180: {
	
_lcd_put_char:	
	opt stack 4
; Regs used in _lcd_put_char: [wreg+status,2+status,0+pclath+cstack]
;lcd_put_char@data stored from wreg
	line	183
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_put_char@data)
	
l30002952:	
;lcd.c: 181: unsigned char temp;
;lcd.c: 183: temp = (data & 0xF0);
	movf	(lcd_put_char@data),w
	andlw	0F0h
	movwf	(lcd_put_char@temp)
	
l30002953:	
	line	184
;lcd.c: 184: temp = (temp >> 2);
	movf	(lcd_put_char@temp),w
	movwf	(??_lcd_put_char+0+0)
	movlw	02h
u3045:
	clrc
	rrf	(??_lcd_put_char+0+0),f
	addlw	-1
	skipz
	goto	u3045
	movf	0+(??_lcd_put_char+0+0),w
	movwf	(lcd_put_char@temp)
	
l30002954:	
	line	185
;lcd.c: 185: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_put_char+0+0)
	movf	(??_lcd_put_char+0+0),w
	andwf	(7),f	;volatile
	
l30002955:	
	line	186
;lcd.c: 186: RA4 = 1;
	bsf	(44/8),(44)&7
	
l30002956:	
	line	187
;lcd.c: 187: PORTC |= temp;
	movf	(lcd_put_char@temp),w
	movwf	(??_lcd_put_char+0+0)
	movf	(??_lcd_put_char+0+0),w
	iorwf	(7),f	;volatile
	
l30002957:	
	line	188
;lcd.c: 188: toggle_E();
	fcall	_toggle_E
	
l30002958:	
	line	189
;lcd.c: 189: temp = (data & 0x0F);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_put_char@data),w
	andlw	0Fh
	movwf	(lcd_put_char@temp)
	
l30002959:	
	line	190
;lcd.c: 190: temp = (temp << 2);
	movf	(lcd_put_char@temp),w
	movwf	(??_lcd_put_char+0+0)
	movlw	(02h)-1
u3055:
	clrc
	rlf	(??_lcd_put_char+0+0),f
	addlw	-1
	skipz
	goto	u3055
	clrc
	rlf	(??_lcd_put_char+0+0),w
	movwf	(lcd_put_char@temp)
	
l30002960:	
	line	191
;lcd.c: 191: PORTC &= 0xC3;
	movlw	(0C3h)
	movwf	(??_lcd_put_char+0+0)
	movf	(??_lcd_put_char+0+0),w
	andwf	(7),f	;volatile
	
l30002961:	
	line	192
;lcd.c: 192: RA4 = 1;
	bsf	(44/8),(44)&7
	
l30002962:	
	line	193
;lcd.c: 193: PORTC |= temp;
	movf	(lcd_put_char@temp),w
	movwf	(??_lcd_put_char+0+0)
	movf	(??_lcd_put_char+0+0),w
	iorwf	(7),f	;volatile
	line	194
;lcd.c: 194: toggle_E();
	fcall	_toggle_E
	
l30002963:	
	line	195
;lcd.c: 195: _delay((unsigned long)((40)*(4000000/4000000.0)));
	movlw	13
movwf	(??_lcd_put_char+0+0),f
u4027:
decfsz	(??_lcd_put_char+0+0),f
	goto	u4027

	
l235:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_put_char
	__end_of_lcd_put_char:
; =============== function _lcd_put_char ends ============

psect	text245,local,class=CODE,delta=2
global __ptext245
__ptext245:
	line	198
	signat	_lcd_put_char,4216
	global	_IR_NEC_DataCode_BitOff_Send

; *************** function _IR_NEC_DataCode_BitOff_Send *****************
; Defined at:
;		line 63 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     1
;      Total:    1
; This function calls:
;		__delay
; This function is called by:
;		_IR_NEC_format
; This function uses a non-reentrant model
; 
psect	text245
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	63
	global	__size_of_IR_NEC_DataCode_BitOff_Send
	__size_of_IR_NEC_DataCode_BitOff_Send	equ	__end_of_IR_NEC_DataCode_BitOff_Send-_IR_NEC_DataCode_BitOff_Send
;ir_out.c: 62: void IR_NEC_DataCode_BitOff_Send(void)
;ir_out.c: 63: {
	
_IR_NEC_DataCode_BitOff_Send:	
	opt stack 4
; Regs used in _IR_NEC_DataCode_BitOff_Send: [wreg+status,2+status,0]
	line	64
	
l30003150:	
;ir_out.c: 64: CCP2CON = 0x2C;
	movlw	(02Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	line	65
;ir_out.c: 65: _delay((unsigned long)((570)*(4000000/4000000.0)));
	movlw	189
movwf	(??_IR_NEC_DataCode_BitOff_Send+0+0),f
u4037:
decfsz	(??_IR_NEC_DataCode_BitOff_Send+0+0),f
	goto	u4037
	nop2	;nop

	line	66
;ir_out.c: 66: CCP2CON = 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	
l30003151:	
	line	67
;ir_out.c: 67: PORTC &= ~0x02;
	movlw	(0FDh)
	movwf	(??_IR_NEC_DataCode_BitOff_Send+0+0)
	movf	(??_IR_NEC_DataCode_BitOff_Send+0+0),w
	andwf	(7),f	;volatile
	
l30003152:	
	line	68
;ir_out.c: 68: _delay((unsigned long)((510)*(4000000/4000000.0)));
	movlw	169
movwf	(??_IR_NEC_DataCode_BitOff_Send+0+0),f
u4047:
decfsz	(??_IR_NEC_DataCode_BitOff_Send+0+0),f
	goto	u4047
	nop2	;nop

	
l199:	
	return
	opt stack 0
GLOBAL	__end_of_IR_NEC_DataCode_BitOff_Send
	__end_of_IR_NEC_DataCode_BitOff_Send:
; =============== function _IR_NEC_DataCode_BitOff_Send ends ============

psect	text246,local,class=CODE,delta=2
global __ptext246
__ptext246:
	line	71
	signat	_IR_NEC_DataCode_BitOff_Send,88
	global	_IR_NEC_DataCode_StopBit_Send

; *************** function _IR_NEC_DataCode_StopBit_Send *****************
; Defined at:
;		line 82 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     1
;      Total:    1
; This function calls:
;		__delay
; This function is called by:
;		_IR_NEC_format
; This function uses a non-reentrant model
; 
psect	text246
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	82
	global	__size_of_IR_NEC_DataCode_StopBit_Send
	__size_of_IR_NEC_DataCode_StopBit_Send	equ	__end_of_IR_NEC_DataCode_StopBit_Send-_IR_NEC_DataCode_StopBit_Send
;ir_out.c: 81: void IR_NEC_DataCode_StopBit_Send(void)
;ir_out.c: 82: {
	
_IR_NEC_DataCode_StopBit_Send:	
	opt stack 4
; Regs used in _IR_NEC_DataCode_StopBit_Send: [wreg+status,2+status,0]
	line	83
	
l30003154:	
;ir_out.c: 83: CCP2CON = 0x2C;
	movlw	(02Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	line	84
;ir_out.c: 84: _delay((unsigned long)((570)*(4000000/4000000.0)));
	movlw	189
movwf	(??_IR_NEC_DataCode_StopBit_Send+0+0),f
u4057:
decfsz	(??_IR_NEC_DataCode_StopBit_Send+0+0),f
	goto	u4057
	nop2	;nop

	line	85
;ir_out.c: 85: CCP2CON = 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	
l30003155:	
	line	86
;ir_out.c: 86: PORTC &= ~0x02;
	movlw	(0FDh)
	movwf	(??_IR_NEC_DataCode_StopBit_Send+0+0)
	movf	(??_IR_NEC_DataCode_StopBit_Send+0+0),w
	andwf	(7),f	;volatile
	
l200:	
	return
	opt stack 0
GLOBAL	__end_of_IR_NEC_DataCode_StopBit_Send
	__end_of_IR_NEC_DataCode_StopBit_Send:
; =============== function _IR_NEC_DataCode_StopBit_Send ends ============

psect	text247,local,class=CODE,delta=2
global __ptext247
__ptext247:
	line	89
	signat	_IR_NEC_DataCode_StopBit_Send,88
	global	_IR_NEC_ReaderCode_Send

; *************** function _IR_NEC_ReaderCode_Send *****************
; Defined at:
;		line 25 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       0       0       0       0
;      Temp:     2
;      Total:    2
; This function calls:
;		__delay
; This function is called by:
;		_IR_NEC_format
; This function uses a non-reentrant model
; 
psect	text247
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	25
	global	__size_of_IR_NEC_ReaderCode_Send
	__size_of_IR_NEC_ReaderCode_Send	equ	__end_of_IR_NEC_ReaderCode_Send-_IR_NEC_ReaderCode_Send
;ir_out.c: 24: void IR_NEC_ReaderCode_Send(void)
;ir_out.c: 25: {
	
_IR_NEC_ReaderCode_Send:	
	opt stack 4
; Regs used in _IR_NEC_ReaderCode_Send: [wreg+status,2+status,0]
	line	26
	
l30003157:	
;ir_out.c: 26: CCP2CON = 0x2C;
	movlw	(02Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	line	27
;ir_out.c: 27: _delay((unsigned long)((9000)*(4000000/4000000.0)));
	movlw	12
movwf	(??_IR_NEC_ReaderCode_Send+0+0+1),f
	movlw	175
movwf	(??_IR_NEC_ReaderCode_Send+0+0),f
u4067:
	decfsz	(??_IR_NEC_ReaderCode_Send+0+0),f
	goto	u4067
	decfsz	(??_IR_NEC_ReaderCode_Send+0+0+1),f
	goto	u4067

	line	28
;ir_out.c: 28: CCP2CON = 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	
l30003158:	
	line	29
;ir_out.c: 29: PORTC &= ~0x02;
	movlw	(0FDh)
	movwf	(??_IR_NEC_ReaderCode_Send+0+0)
	movf	(??_IR_NEC_ReaderCode_Send+0+0),w
	andwf	(7),f	;volatile
	
l30003159:	
	line	30
;ir_out.c: 30: _delay((unsigned long)((4500)*(4000000/4000000.0)));
	movlw	6
movwf	(??_IR_NEC_ReaderCode_Send+0+0+1),f
	movlw	215
movwf	(??_IR_NEC_ReaderCode_Send+0+0),f
u4077:
	decfsz	(??_IR_NEC_ReaderCode_Send+0+0),f
	goto	u4077
	decfsz	(??_IR_NEC_ReaderCode_Send+0+0+1),f
	goto	u4077

	
l197:	
	return
	opt stack 0
GLOBAL	__end_of_IR_NEC_ReaderCode_Send
	__end_of_IR_NEC_ReaderCode_Send:
; =============== function _IR_NEC_ReaderCode_Send ends ============

psect	text248,local,class=CODE,delta=2
global __ptext248
__ptext248:
	line	33
	signat	_IR_NEC_ReaderCode_Send,88
	global	_IR_NEC_DataCode_BitOn_Send

; *************** function _IR_NEC_DataCode_BitOn_Send *****************
; Defined at:
;		line 44 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     1
;      Total:    1
; This function calls:
;		__delay
; This function is called by:
;		_IR_NEC_format
; This function uses a non-reentrant model
; 
psect	text248
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	44
	global	__size_of_IR_NEC_DataCode_BitOn_Send
	__size_of_IR_NEC_DataCode_BitOn_Send	equ	__end_of_IR_NEC_DataCode_BitOn_Send-_IR_NEC_DataCode_BitOn_Send
;ir_out.c: 43: void IR_NEC_DataCode_BitOn_Send(void)
;ir_out.c: 44: {
	
_IR_NEC_DataCode_BitOn_Send:	
	opt stack 4
; Regs used in _IR_NEC_DataCode_BitOn_Send: [wreg+status,2+status,0]
	line	45
	
l30003161:	
;ir_out.c: 45: CCP2CON = 0x2C;
	movlw	(02Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	line	46
;ir_out.c: 46: _delay((unsigned long)((570)*(4000000/4000000.0)));
	movlw	189
movwf	(??_IR_NEC_DataCode_BitOn_Send+0+0),f
u4087:
decfsz	(??_IR_NEC_DataCode_BitOn_Send+0+0),f
	goto	u4087
	nop2	;nop

	line	47
;ir_out.c: 47: CCP2CON = 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	
l30003162:	
	line	48
;ir_out.c: 48: PORTC &= ~0x02;
	movlw	(0FDh)
	movwf	(??_IR_NEC_DataCode_BitOn_Send+0+0)
	movf	(??_IR_NEC_DataCode_BitOn_Send+0+0),w
	andwf	(7),f	;volatile
	
l30003163:	
	line	49
;ir_out.c: 49: _delay((unsigned long)((1600)*(4000000/4000000.0)));
	movlw	228
movwf	(??_IR_NEC_DataCode_BitOn_Send+0+0),f
u4097:
	nop2
	nop2
decfsz	(??_IR_NEC_DataCode_BitOn_Send+0+0),f
	goto	u4097
	nop2	;nop
	clrwdt

	
l198:	
	return
	opt stack 0
GLOBAL	__end_of_IR_NEC_DataCode_BitOn_Send
	__end_of_IR_NEC_DataCode_BitOn_Send:
; =============== function _IR_NEC_DataCode_BitOn_Send ends ============

psect	text249,local,class=CODE,delta=2
global __ptext249
__ptext249:
	line	52
	signat	_IR_NEC_DataCode_BitOn_Send,88
	global	_IR_KDN_ReaderCode_Send

; *************** function _IR_KDN_ReaderCode_Send *****************
; Defined at:
;		line 139 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       0       0       0       0
;      Temp:     2
;      Total:    2
; This function calls:
;		__delay
; This function is called by:
;		_IR_KDN_format
; This function uses a non-reentrant model
; 
psect	text249
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	139
	global	__size_of_IR_KDN_ReaderCode_Send
	__size_of_IR_KDN_ReaderCode_Send	equ	__end_of_IR_KDN_ReaderCode_Send-_IR_KDN_ReaderCode_Send
;ir_out.c: 138: void IR_KDN_ReaderCode_Send(void)
;ir_out.c: 139: {
	
_IR_KDN_ReaderCode_Send:	
	opt stack 4
; Regs used in _IR_KDN_ReaderCode_Send: [wreg+status,2+status,0]
	line	140
	
l30002985:	
;ir_out.c: 140: CCP2CON = 0x2C;
	movlw	(02Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	line	141
;ir_out.c: 141: _delay((unsigned long)((3250)*(4000000/4000000.0)));
	movlw	5
movwf	(??_IR_KDN_ReaderCode_Send+0+0+1),f
	movlw	55
movwf	(??_IR_KDN_ReaderCode_Send+0+0),f
u4107:
	decfsz	(??_IR_KDN_ReaderCode_Send+0+0),f
	goto	u4107
	decfsz	(??_IR_KDN_ReaderCode_Send+0+0+1),f
	goto	u4107

	line	142
;ir_out.c: 142: CCP2CON = 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	
l30002986:	
	line	143
;ir_out.c: 143: PORTC &= ~0x02;
	movlw	(0FDh)
	movwf	(??_IR_KDN_ReaderCode_Send+0+0)
	movf	(??_IR_KDN_ReaderCode_Send+0+0),w
	andwf	(7),f	;volatile
	
l30002987:	
	line	144
;ir_out.c: 144: _delay((unsigned long)((1500)*(4000000/4000000.0)));
	movlw	214
movwf	(??_IR_KDN_ReaderCode_Send+0+0),f
u4117:
	nop2
	nop2
decfsz	(??_IR_KDN_ReaderCode_Send+0+0),f
	goto	u4117
	clrwdt

	
l210:	
	return
	opt stack 0
GLOBAL	__end_of_IR_KDN_ReaderCode_Send
	__end_of_IR_KDN_ReaderCode_Send:
; =============== function _IR_KDN_ReaderCode_Send ends ============

psect	text250,local,class=CODE,delta=2
global __ptext250
__ptext250:
	line	147
	signat	_IR_KDN_ReaderCode_Send,88
	global	_IR_KDN_DataCode_StopBit_Send

; *************** function _IR_KDN_DataCode_StopBit_Send *****************
; Defined at:
;		line 196 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     1
;      Total:    1
; This function calls:
;		__delay
; This function is called by:
;		_IR_KDN_format
; This function uses a non-reentrant model
; 
psect	text250
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	196
	global	__size_of_IR_KDN_DataCode_StopBit_Send
	__size_of_IR_KDN_DataCode_StopBit_Send	equ	__end_of_IR_KDN_DataCode_StopBit_Send-_IR_KDN_DataCode_StopBit_Send
;ir_out.c: 195: void IR_KDN_DataCode_StopBit_Send(void)
;ir_out.c: 196: {
	
_IR_KDN_DataCode_StopBit_Send:	
	opt stack 4
; Regs used in _IR_KDN_DataCode_StopBit_Send: [wreg+status,2+status,0]
	line	197
	
l30002989:	
;ir_out.c: 197: CCP2CON = 0x2C;
	movlw	(02Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	line	198
;ir_out.c: 198: _delay((unsigned long)((420)*(4000000/4000000.0)));
	movlw	139
movwf	(??_IR_KDN_DataCode_StopBit_Send+0+0),f
u4127:
decfsz	(??_IR_KDN_DataCode_StopBit_Send+0+0),f
	goto	u4127
	nop2	;nop

	line	199
;ir_out.c: 199: CCP2CON = 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	
l30002990:	
	line	200
;ir_out.c: 200: PORTC &= ~0x02;
	movlw	(0FDh)
	movwf	(??_IR_KDN_DataCode_StopBit_Send+0+0)
	movf	(??_IR_KDN_DataCode_StopBit_Send+0+0),w
	andwf	(7),f	;volatile
	
l213:	
	return
	opt stack 0
GLOBAL	__end_of_IR_KDN_DataCode_StopBit_Send
	__end_of_IR_KDN_DataCode_StopBit_Send:
; =============== function _IR_KDN_DataCode_StopBit_Send ends ============

psect	text251,local,class=CODE,delta=2
global __ptext251
__ptext251:
	line	203
	signat	_IR_KDN_DataCode_StopBit_Send,88
	global	_IR_KDN_DataCode_BitOff_Send

; *************** function _IR_KDN_DataCode_BitOff_Send *****************
; Defined at:
;		line 177 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     1
;      Total:    1
; This function calls:
;		__delay
; This function is called by:
;		_IR_KDN_format
; This function uses a non-reentrant model
; 
psect	text251
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	177
	global	__size_of_IR_KDN_DataCode_BitOff_Send
	__size_of_IR_KDN_DataCode_BitOff_Send	equ	__end_of_IR_KDN_DataCode_BitOff_Send-_IR_KDN_DataCode_BitOff_Send
;ir_out.c: 176: void IR_KDN_DataCode_BitOff_Send(void)
;ir_out.c: 177: {
	
_IR_KDN_DataCode_BitOff_Send:	
	opt stack 4
; Regs used in _IR_KDN_DataCode_BitOff_Send: [wreg+status,2+status,0]
	line	178
	
l30002981:	
;ir_out.c: 178: CCP2CON = 0x2C;
	movlw	(02Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	line	179
;ir_out.c: 179: _delay((unsigned long)((420)*(4000000/4000000.0)));
	movlw	139
movwf	(??_IR_KDN_DataCode_BitOff_Send+0+0),f
u4137:
decfsz	(??_IR_KDN_DataCode_BitOff_Send+0+0),f
	goto	u4137
	nop2	;nop

	line	180
;ir_out.c: 180: CCP2CON = 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	
l30002982:	
	line	181
;ir_out.c: 181: PORTC &= ~0x02;
	movlw	(0FDh)
	movwf	(??_IR_KDN_DataCode_BitOff_Send+0+0)
	movf	(??_IR_KDN_DataCode_BitOff_Send+0+0),w
	andwf	(7),f	;volatile
	
l30002983:	
	line	182
;ir_out.c: 182: _delay((unsigned long)((300)*(4000000/4000000.0)));
	movlw	99
movwf	(??_IR_KDN_DataCode_BitOff_Send+0+0),f
u4147:
decfsz	(??_IR_KDN_DataCode_BitOff_Send+0+0),f
	goto	u4147
	nop2	;nop

	
l212:	
	return
	opt stack 0
GLOBAL	__end_of_IR_KDN_DataCode_BitOff_Send
	__end_of_IR_KDN_DataCode_BitOff_Send:
; =============== function _IR_KDN_DataCode_BitOff_Send ends ============

psect	text252,local,class=CODE,delta=2
global __ptext252
__ptext252:
	line	185
	signat	_IR_KDN_DataCode_BitOff_Send,88
	global	_IR_KDN_DataCode_BitOn_Send

; *************** function _IR_KDN_DataCode_BitOn_Send *****************
; Defined at:
;		line 158 in file "C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, status,2, status,0
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     1
;      Total:    1
; This function calls:
;		__delay
; This function is called by:
;		_IR_KDN_format
; This function uses a non-reentrant model
; 
psect	text252
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\ir_out.c"
	line	158
	global	__size_of_IR_KDN_DataCode_BitOn_Send
	__size_of_IR_KDN_DataCode_BitOn_Send	equ	__end_of_IR_KDN_DataCode_BitOn_Send-_IR_KDN_DataCode_BitOn_Send
;ir_out.c: 157: void IR_KDN_DataCode_BitOn_Send(void)
;ir_out.c: 158: {
	
_IR_KDN_DataCode_BitOn_Send:	
	opt stack 4
; Regs used in _IR_KDN_DataCode_BitOn_Send: [wreg+status,2+status,0]
	line	159
	
l30002977:	
;ir_out.c: 159: CCP2CON = 0x2C;
	movlw	(02Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	line	160
;ir_out.c: 160: _delay((unsigned long)((420)*(4000000/4000000.0)));
	movlw	139
movwf	(??_IR_KDN_DataCode_BitOn_Send+0+0),f
u4157:
decfsz	(??_IR_KDN_DataCode_BitOn_Send+0+0),f
	goto	u4157
	nop2	;nop

	line	161
;ir_out.c: 161: CCP2CON = 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(29)	;volatile
	
l30002978:	
	line	162
;ir_out.c: 162: PORTC &= ~0x02;
	movlw	(0FDh)
	movwf	(??_IR_KDN_DataCode_BitOn_Send+0+0)
	movf	(??_IR_KDN_DataCode_BitOn_Send+0+0),w
	andwf	(7),f	;volatile
	
l30002979:	
	line	163
;ir_out.c: 163: _delay((unsigned long)((1100)*(4000000/4000000.0)));
	movlw	157
movwf	(??_IR_KDN_DataCode_BitOn_Send+0+0),f
u4167:
	nop2
	nop2
decfsz	(??_IR_KDN_DataCode_BitOn_Send+0+0),f
	goto	u4167

	
l211:	
	return
	opt stack 0
GLOBAL	__end_of_IR_KDN_DataCode_BitOn_Send
	__end_of_IR_KDN_DataCode_BitOn_Send:
; =============== function _IR_KDN_DataCode_BitOn_Send ends ============

psect	text253,local,class=CODE,delta=2
global __ptext253
__ptext253:
	line	166
	signat	_IR_KDN_DataCode_BitOn_Send,88
	global	_toggle_E

; *************** function _toggle_E *****************
; Defined at:
;		line 313 in file "C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		None
; Tracked objects:
;		On entry : 0/0
;		On exit  : 0/0
;		Unchanged: 0/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		Nothing
; This function is called by:
;		_lcd_init
;		_lcd_clear
;		_lcd_goto_posi
;		_lcd_put_char
; This function uses a non-reentrant model
; 
psect	text253
	file	"C:\Users\denjo\Documents\PIC\infrated_ray\lcd.c"
	line	313
	global	__size_of_toggle_E
	__size_of_toggle_E	equ	__end_of_toggle_E-_toggle_E
;lcd.c: 312: void toggle_E(void)
;lcd.c: 313: {
	
_toggle_E:	
	opt stack 3
; Regs used in _toggle_E: []
	line	316
	
l30002883:	
;lcd.c: 316: RA5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	line	317
;lcd.c: 317: RA5 = 0;
	bcf	(45/8),(45)&7
	
l260:	
	return
	opt stack 0
GLOBAL	__end_of_toggle_E
	__end_of_toggle_E:
; =============== function _toggle_E ends ============

psect	text254,local,class=CODE,delta=2
global __ptext254
__ptext254:
	line	320
	signat	_toggle_E,88
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	end
