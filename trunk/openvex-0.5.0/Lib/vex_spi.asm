;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Fri Nov  2 01:06:40 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _OpenSPI
	global _user_proc_is_ready
	global _check_tx_env
	global _Rx_buff
	global _Rx_user_buff_index
	global _User_rxdata
	global _Tx_buff
	global _Tx_user_buff_index
	global _User_txdata
	global _Spi_status
	global _InterruptVectorHigh
	global _InterruptHandlerHigh

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
	extern __gptrput1
	extern _stdin
	extern _stdout
	extern _RCSTA2bits
	extern _TXSTA2bits
	extern _CCP5CONbits
	extern _CCP4CONbits
	extern _T4CONbits
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _PORTFbits
	extern _PORTGbits
	extern _PORTHbits
	extern _PORTJbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _LATFbits
	extern _LATGbits
	extern _LATHbits
	extern _LATJbits
	extern _TRISAbits
	extern _TRISBbits
	extern _TRISCbits
	extern _TRISDbits
	extern _TRISEbits
	extern _TRISFbits
	extern _TRISGbits
	extern _TRISHbits
	extern _TRISJbits
	extern _MEMCONbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _PIE3bits
	extern _PIR3bits
	extern _IPR3bits
	extern _EECON1bits
	extern _RCSTA1bits
	extern _TXSTA1bits
	extern _RCSTAbits
	extern _TXSTAbits
	extern _PSPCONbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _CCP3CONbits
	extern _CCP2CONbits
	extern _CCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSPCON2bits
	extern _SSPCON1bits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _LVDCONbits
	extern _OSCCONbits
	extern _STATUSbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _STKPTRbits
	extern _Interrupt_port_in_use
	extern _RCSTA2
	extern _TXSTA2
	extern _TXREG2
	extern _RCREG2
	extern _SPBRG2
	extern _CCP5CON
	extern _CCPR5L
	extern _CCPR5H
	extern _CCP4CON
	extern _CCPR4L
	extern _CCPR4H
	extern _T4CON
	extern _PR4
	extern _TMR4
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _PORTF
	extern _PORTG
	extern _PORTH
	extern _PORTJ
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _LATF
	extern _LATG
	extern _LATH
	extern _LATJ
	extern _TRISA
	extern _TRISB
	extern _TRISC
	extern _TRISD
	extern _TRISE
	extern _TRISF
	extern _TRISG
	extern _TRISH
	extern _TRISJ
	extern _MEMCON
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _PIE3
	extern _PIR3
	extern _IPR3
	extern _EECON1
	extern _EECON2
	extern _EEDATA
	extern _EEADR
	extern _EEADRH
	extern _RCSTA1
	extern _TXSTA1
	extern _TXREG1
	extern _RCREG1
	extern _SPBRG1
	extern _RCSTA
	extern _TXSTA
	extern _TXREG
	extern _RCREG
	extern _SPBRG
	extern _PSPCON
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _CCP3CON
	extern _CCPR3L
	extern _CCPR3H
	extern _CCP2CON
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRESL
	extern _ADRESH
	extern _SSPCON2
	extern _SSPCON1
	extern _SSPSTAT
	extern _SSPADD
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _LVDCON
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOSL
	extern _TOSH
	extern _TOSU
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_Rx_user_buff_index	db	0x00
_User_rxdata	db	LOW((_Rx_buff + 0)), HIGH((_Rx_buff + 0)), 0x80
_Tx_user_buff_index	db	0x00
_InterruptHandlerHigh_packet_num_1_1	db	0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1

udata_vex_spi_0	udata
_InterruptHandlerHigh_tx_ptr_1_1	res	3

udata_vex_spi_1	udata
_InterruptHandlerHigh_rx_ptr_1_1	res	3

udata_vex_spi_2	udata
_InterruptHandlerHigh_Spi_byte_count_1_1	res	1

udata_vex_spi_3	udata
_InterruptHandlerHigh_spi_ch_1_1	res	1

udata_vex_spi_4	udata
_Rx_buff	res	64

udata_vex_spi_5	udata
_Tx_buff	res	64

udata_vex_spi_6	udata
_Spi_status	res	1

udata_vex_spi_7	udata
_User_txdata	res	32

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_vex_spi__InterruptVectorHigh	code	0X000808
_InterruptVectorHigh:
	goto _InterruptHandlerHigh
	
; ; Starting pCode block
S_vex_spi__InterruptHandlerHigh	code
_InterruptHandlerHigh:
;	.line	95; vex_spi.c	void    InterruptHandlerHigh(void) INTERRUPT
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	120; vex_spi.c	if (INTCONbits.INT0F)
	BTFSS	_INTCONbits, 1
	BRA	_00117_DS_
;	.line	122; vex_spi.c	INTCONbits.INT0F = 0;   /* Clear interrupt condition. */
	BCF	_INTCONbits, 1
;	.line	123; vex_spi.c	Spi_byte_count = sizeof(rx_data_t);
	MOVLW	0x20
	BANKSEL	_InterruptHandlerHigh_Spi_byte_count_1_1
	MOVWF	_InterruptHandlerHigh_Spi_byte_count_1_1, B
;	.line	124; vex_spi.c	IPR1bits.SSPIP = 1;     /* Set SPI for high-priority interrupts */
	BSF	_IPR1bits, 3
	BANKSEL	_Rx_user_buff_index
;	.line	131; vex_spi.c	rx_ptr = (volatile unsigned char *)(Rx_buff + !Rx_user_buff_index);
	MOVF	_Rx_user_buff_index, W, B
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
; ;multiply lit val:0x20 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x00, W
	MULLW	0x20
	MOVFF	PRODL, r0x00
	MOVFF	PRODH, r0x01
	MOVLW	LOW(_Rx_buff)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Rx_buff)
	ADDWFC	r0x01, F
	MOVF	r0x01, W
	BANKSEL	(_InterruptHandlerHigh_rx_ptr_1_1 + 1)
	MOVWF	(_InterruptHandlerHigh_rx_ptr_1_1 + 1), B
	MOVF	r0x00, W
	BANKSEL	_InterruptHandlerHigh_rx_ptr_1_1
	MOVWF	_InterruptHandlerHigh_rx_ptr_1_1, B
	MOVLW	0x80
	BANKSEL	(_InterruptHandlerHigh_rx_ptr_1_1 + 2)
	MOVWF	(_InterruptHandlerHigh_rx_ptr_1_1 + 2), B
	BANKSEL	_Tx_user_buff_index
;	.line	133; vex_spi.c	tx_ptr = (volatile unsigned char *)(Tx_buff + !Tx_user_buff_index);
	MOVF	_Tx_user_buff_index, W, B
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
; ;multiply lit val:0x20 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x00, W
	MULLW	0x20
	MOVFF	PRODL, r0x00
	MOVFF	PRODH, r0x01
	MOVLW	LOW(_Tx_buff)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Tx_buff)
	ADDWFC	r0x01, F
	MOVF	r0x01, W
	BANKSEL	(_InterruptHandlerHigh_tx_ptr_1_1 + 1)
	MOVWF	(_InterruptHandlerHigh_tx_ptr_1_1 + 1), B
	MOVF	r0x00, W
	BANKSEL	_InterruptHandlerHigh_tx_ptr_1_1
	MOVWF	_InterruptHandlerHigh_tx_ptr_1_1, B
	MOVLW	0x80
	BANKSEL	(_InterruptHandlerHigh_tx_ptr_1_1 + 2)
	MOVWF	(_InterruptHandlerHigh_tx_ptr_1_1 + 2), B
;	.line	137; vex_spi.c	if ( User_rxdata->rc_mode.autonomous )
	MOVFF	_User_rxdata, r0x00
	MOVFF	(_User_rxdata + 1), r0x01
	MOVFF	(_User_rxdata + 2), r0x02
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	RLNCF	WREG, W
	RLNCF	WREG, W
	ANDLW	0x01
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00111_DS_
	BANKSEL	_Tx_user_buff_index
;	.line	139; vex_spi.c	Tx_buff[!Tx_user_buff_index].packet_num = packet_num;
	MOVF	_Tx_user_buff_index, W, B
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x00
	RLCF	r0x00, F
; ;multiply lit val:0x20 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x00, W
	MULLW	0x20
	MOVFF	PRODL, r0x00
	CLRF	r0x01
	MOVLW	LOW(_Tx_buff)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Tx_buff)
	ADDWFC	r0x01, F
	MOVLW	0x1d
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	_InterruptHandlerHigh_packet_num_1_1, INDF0
; ;multiply lit val:0x20 by variable _Tx_user_buff_index and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_Tx_user_buff_index
;	.line	140; vex_spi.c	Tx_buff[Tx_user_buff_index].packet_num = packet_num;
	MOVF	_Tx_user_buff_index, W, B
	MULLW	0x20
	MOVFF	PRODL, r0x00
	CLRF	r0x01
	MOVLW	LOW(_Tx_buff)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Tx_buff)
	ADDWFC	r0x01, F
	MOVLW	0x1d
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	_InterruptHandlerHigh_packet_num_1_1, INDF0
;	.line	141; vex_spi.c	++packet_num;
	INCF	_InterruptHandlerHigh_packet_num_1_1, F, B
_00111_DS_:
;	.line	144; vex_spi.c	spi_ch = SSPBUF;
	MOVFF	_SSPBUF, _InterruptHandlerHigh_spi_ch_1_1
;	.line	145; vex_spi.c	SSPBUF = *tx_ptr++;
	MOVFF	_InterruptHandlerHigh_tx_ptr_1_1, r0x00
	MOVFF	(_InterruptHandlerHigh_tx_ptr_1_1 + 1), r0x01
	MOVFF	(_InterruptHandlerHigh_tx_ptr_1_1 + 2), r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	BANKSEL	_InterruptHandlerHigh_tx_ptr_1_1
	INCF	_InterruptHandlerHigh_tx_ptr_1_1, F, B
	BNC	_10159_DS_
	BANKSEL	(_InterruptHandlerHigh_tx_ptr_1_1 + 1)
	INCF	(_InterruptHandlerHigh_tx_ptr_1_1 + 1), F, B
_10159_DS_:
	BNC	_20160_DS_
	BANKSEL	(_InterruptHandlerHigh_tx_ptr_1_1 + 2)
	INCF	(_InterruptHandlerHigh_tx_ptr_1_1 + 2), F, B
_20160_DS_:
	MOVFF	r0x00, _SSPBUF
	BRA	_00119_DS_
_00117_DS_:
;	.line	150; vex_spi.c	else if (PIR1bits.SSPIF)
	BTFSS	_PIR1bits, 3
	BRA	_00119_DS_
;	.line	152; vex_spi.c	PIR1bits.SSPIF = 0;     /* Clear SPI interrupt condition */
	BCF	_PIR1bits, 3
;	.line	158; vex_spi.c	*rx_ptr++ = SSPBUF;     /* Buffer next byte from master */
	MOVFF	_InterruptHandlerHigh_rx_ptr_1_1, r0x00
	MOVFF	(_InterruptHandlerHigh_rx_ptr_1_1 + 1), r0x01
	MOVFF	(_InterruptHandlerHigh_rx_ptr_1_1 + 2), r0x02
	MOVFF	_SSPBUF, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BANKSEL	_InterruptHandlerHigh_rx_ptr_1_1
	INCF	_InterruptHandlerHigh_rx_ptr_1_1, F, B
	BNC	_30161_DS_
	BANKSEL	(_InterruptHandlerHigh_rx_ptr_1_1 + 1)
	INCF	(_InterruptHandlerHigh_rx_ptr_1_1 + 1), F, B
_30161_DS_:
	BNC	_40162_DS_
	BANKSEL	(_InterruptHandlerHigh_rx_ptr_1_1 + 2)
	INCF	(_InterruptHandlerHigh_rx_ptr_1_1 + 2), F, B
_40162_DS_:
;	.line	159; vex_spi.c	SSPBUF = *tx_ptr++;     /* Send next byte to master */
	MOVFF	_InterruptHandlerHigh_tx_ptr_1_1, r0x00
	MOVFF	(_InterruptHandlerHigh_tx_ptr_1_1 + 1), r0x01
	MOVFF	(_InterruptHandlerHigh_tx_ptr_1_1 + 2), r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	BANKSEL	_InterruptHandlerHigh_tx_ptr_1_1
	INCF	_InterruptHandlerHigh_tx_ptr_1_1, F, B
	BNC	_50163_DS_
	BANKSEL	(_InterruptHandlerHigh_tx_ptr_1_1 + 1)
	INCF	(_InterruptHandlerHigh_tx_ptr_1_1 + 1), F, B
_50163_DS_:
	BNC	_60164_DS_
	BANKSEL	(_InterruptHandlerHigh_tx_ptr_1_1 + 2)
	INCF	(_InterruptHandlerHigh_tx_ptr_1_1 + 2), F, B
_60164_DS_:
	MOVFF	r0x00, _SSPBUF
	BANKSEL	_InterruptHandlerHigh_Spi_byte_count_1_1
;	.line	162; vex_spi.c	if (--Spi_byte_count == 0)
	DECF	_InterruptHandlerHigh_Spi_byte_count_1_1, F, B
	MOVF	_InterruptHandlerHigh_Spi_byte_count_1_1, W, B
	BNZ	_00119_DS_
;	.line	171; vex_spi.c	User_txdata.current_mode = 2;
	MOVLW	0x02
	BANKSEL	(_User_txdata + 30)
	MOVWF	(_User_txdata + 30), B
	BANKSEL	_Spi_status
;	.line	172; vex_spi.c	Spi_status.new_tx_data = 0;
	BCF	_Spi_status, 1, B
;	.line	173; vex_spi.c	MASTER_SET_NEW_RC_DATA_FLAG(Spi_status);
	BSF	_Spi_status, 0, B
	BANKSEL	_Rx_user_buff_index
;	.line	174; vex_spi.c	Rx_user_buff_index = !Rx_user_buff_index;
	MOVF	_Rx_user_buff_index, W, B
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	BANKSEL	_Rx_user_buff_index
	CLRF	_Rx_user_buff_index, B
	RLCF	_Rx_user_buff_index, F, B
; ;multiply lit val:0x20 by variable _Rx_user_buff_index and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	175; vex_spi.c	User_rxdata = Rx_buff + Rx_user_buff_index;
	MOVF	_Rx_user_buff_index, W, B
	MULLW	0x20
	MOVFF	PRODL, r0x00
	MOVFF	PRODH, r0x01
	MOVLW	LOW(_Rx_buff)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Rx_buff)
	ADDWFC	r0x01, F
	MOVF	r0x01, W
	BANKSEL	(_User_rxdata + 1)
	MOVWF	(_User_rxdata + 1), B
	MOVF	r0x00, W
	BANKSEL	_User_rxdata
	MOVWF	_User_rxdata, B
	MOVLW	0x80
	BANKSEL	(_User_rxdata + 2)
	MOVWF	(_User_rxdata + 2), B
_00119_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; I code from now on!
; ; Starting pCode block
S_vex_spi__check_tx_env	code
_check_tx_env:
;	.line	282; vex_spi.c	void    check_tx_env(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	BANKSEL	(_User_txdata + 28)
;	.line	284; vex_spi.c	User_txdata.error_code = 0;
	CLRF	(_User_txdata + 28), B
	BANKSEL	(_User_txdata + 23)
;	.line	285; vex_spi.c	User_txdata.warning_code = 0;
	CLRF	(_User_txdata + 23), B
;	.line	288; vex_spi.c	if (SSPCON1bits.WCOL)
	BTFSS	_SSPCON1bits, 7
	BRA	_00166_DS_
;	.line	290; vex_spi.c	SSPCON1bits.WCOL = 0;
	BCF	_SSPCON1bits, 7
;	.line	291; vex_spi.c	User_txdata.warning_code = 1;
	MOVLW	0x01
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00167_DS_
_00166_DS_:
;	.line	294; vex_spi.c	else if ((INTCON2bits.RBPU == 1) && (INTCONbits.RBIE == 1))
	CLRF	r0x00
	BTFSC	_INTCON2bits, 7
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00162_DS_
	CLRF	r0x00
	BTFSC	_INTCONbits, 3
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00162_DS_
;	.line	296; vex_spi.c	User_txdata.warning_code = 2;
	MOVLW	0x02
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00167_DS_
_00162_DS_:
;	.line	298; vex_spi.c	else if (INTCON3bits.INT1IE)
	BTFSS	_INTCON3bits, 3
	BRA	_00167_DS_
;	.line	300; vex_spi.c	LATHbits.LATH7 = 0;         /* Digital_out16 */
	BCF	_LATHbits, 7
;	.line	301; vex_spi.c	User_txdata.warning_code = 3;
	MOVLW	0x03
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
_00167_DS_:
;	.line	305; vex_spi.c	if ((SSPCON1 & 0x25) != 0x25)
	MOVLW	0x25
	ANDWF	_SSPCON1, W
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	r0x00
	XORLW	0x25
	BZ	_00210_DS_
;	.line	307; vex_spi.c	User_txdata.error_code = 1;
	MOVLW	0x01
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	308; vex_spi.c	User_txdata.warning_code = SSPCON1;
	MOVF	_SSPCON1, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00210_DS_:
;	.line	310; vex_spi.c	else if (SSPCON2)
	MOVF	_SSPCON2, W
	BZ	_00207_DS_
;	.line	312; vex_spi.c	User_txdata.error_code = 2;
	MOVLW	0x02
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	313; vex_spi.c	User_txdata.warning_code = SSPCON2;
	MOVF	_SSPCON2, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00207_DS_:
;	.line	316; vex_spi.c	else if (!RCONbits.IPEN)
	BTFSC	_RCONbits, 7
	BRA	_00204_DS_
;	.line	318; vex_spi.c	User_txdata.error_code = 3;
	MOVLW	0x03
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	319; vex_spi.c	User_txdata.warning_code = RCON;
	MOVF	_RCON, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00204_DS_:
;	.line	322; vex_spi.c	else if (!PIE1bits.SSPIE)
	BTFSC	_PIE1bits, 3
	BRA	_00201_DS_
;	.line	324; vex_spi.c	User_txdata.error_code = 4;
	MOVLW	0x04
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	325; vex_spi.c	User_txdata.warning_code = PIE1;
	MOVF	_PIE1, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00201_DS_:
;	.line	328; vex_spi.c	else if (MEMCON)
	MOVF	_MEMCON, W
	BZ	_00198_DS_
;	.line	330; vex_spi.c	User_txdata.error_code = 5;
	MOVLW	0x05
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	331; vex_spi.c	User_txdata.warning_code = MEMCON;
	MOVF	_MEMCON, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00198_DS_:
;	.line	337; vex_spi.c	else if (IPR1 != 0x08)  /* IPR1bits.SSPIP? */
	MOVF	_IPR1, W
	XORLW	0x08
	BZ	_00195_DS_
;	.line	339; vex_spi.c	User_txdata.error_code = 6;
	MOVLW	0x06
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	340; vex_spi.c	User_txdata.warning_code = IPR1;
	MOVF	_IPR1, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00195_DS_:
;	.line	342; vex_spi.c	else if (IPR2)
	MOVF	_IPR2, W
	BZ	_00192_DS_
;	.line	344; vex_spi.c	User_txdata.error_code = 7;
	MOVLW	0x07
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	345; vex_spi.c	User_txdata.warning_code = IPR2;
	MOVF	_IPR2, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00192_DS_:
;	.line	347; vex_spi.c	else if (IPR3)
	MOVF	_IPR3, W
	BZ	_00189_DS_
;	.line	349; vex_spi.c	User_txdata.error_code = 8;
	MOVLW	0x08
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	350; vex_spi.c	User_txdata.warning_code = IPR3;
	MOVF	_IPR3, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00189_DS_:
;	.line	353; vex_spi.c	else if ((INTCON & 0x10) != 0x10)
	MOVLW	0x10
	ANDWF	_INTCON, W
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	r0x00
	XORLW	0x10
	BZ	_00186_DS_
;	.line	355; vex_spi.c	User_txdata.error_code = 9;
	MOVLW	0x09
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	356; vex_spi.c	User_txdata.warning_code = INTCON;
	MOVF	_INTCON, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00186_DS_:
;	.line	359; vex_spi.c	else if (INTCON2 & 0x47 )
	MOVF	_INTCON2, W
	ANDLW	0x47
	BZ	_00183_DS_
;	.line	361; vex_spi.c	User_txdata.error_code = 10;
	MOVLW	0x0a
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	362; vex_spi.c	User_txdata.warning_code = INTCON2;
	MOVF	_INTCON2, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00183_DS_:
;	.line	365; vex_spi.c	else if (INTCON3 & 0xC0 )
	MOVF	_INTCON3, W
	ANDLW	0xc0
	BZ	_00180_DS_
;	.line	367; vex_spi.c	User_txdata.error_code = 11;
	MOVLW	0x0b
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	368; vex_spi.c	User_txdata.warning_code = INTCON3;
	MOVF	_INTCON3, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00180_DS_:
;	.line	370; vex_spi.c	else if (TRISAbits.TRISA4)
	BTFSS	_TRISAbits, 4
	BRA	_00177_DS_
;	.line	372; vex_spi.c	User_txdata.error_code = 12;
	MOVLW	0x0c
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	373; vex_spi.c	User_txdata.warning_code = TRISA;
	MOVF	_TRISA, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00177_DS_:
;	.line	375; vex_spi.c	else if (!TRISBbits.TRISB0)
	BTFSC	_TRISBbits, 0
	BRA	_00174_DS_
;	.line	377; vex_spi.c	User_txdata.error_code = 13;
	MOVLW	0x0d
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	378; vex_spi.c	User_txdata.warning_code = TRISB;
	MOVF	_TRISB, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00174_DS_:
;	.line	381; vex_spi.c	else if ((TRISC & 0x3e) != 0x1c)
	MOVLW	0x3e
	ANDWF	_TRISC, W
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	r0x00
	XORLW	0x1c
	BZ	_00171_DS_
;	.line	383; vex_spi.c	User_txdata.error_code = 14;
	MOVLW	0x0e
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	384; vex_spi.c	User_txdata.warning_code = TRISC;
	MOVF	_TRISC, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
	BRA	_00212_DS_
_00171_DS_:
;	.line	386; vex_spi.c	else if (!TRISFbits.TRISF7)
	BTFSC	_TRISFbits, 7
	BRA	_00212_DS_
;	.line	388; vex_spi.c	User_txdata.error_code = 15;
	MOVLW	0x0f
	BANKSEL	(_User_txdata + 28)
	MOVWF	(_User_txdata + 28), B
;	.line	389; vex_spi.c	User_txdata.warning_code = TRISF;
	MOVF	_TRISF, W
	BANKSEL	(_User_txdata + 23)
	MOVWF	(_User_txdata + 23), B
_00212_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_vex_spi__user_proc_is_ready	code
_user_proc_is_ready:
;	.line	266; vex_spi.c	void    user_proc_is_ready(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	268; vex_spi.c	PORTCbits.RC1 = 1;
	BSF	_PORTCbits, 1
;	.line	269; vex_spi.c	PORTAbits.RA4 = 1;
	BSF	_PORTAbits, 4
;	.line	270; vex_spi.c	TRISCbits.TRISC1 = 0;
	BCF	_TRISCbits, 1
;	.line	271; vex_spi.c	TRISAbits.TRISA4 = 0;
	BCF	_TRISAbits, 4
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_vex_spi__OpenSPI	code
_OpenSPI:
;	.line	205; vex_spi.c	void    OpenSPI(unsigned char mode_select, unsigned char clock_mode, unsigned char sample)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	208; vex_spi.c	SSPCON1 = mode_select & 0x0F;       /* Also clears CKP */
	MOVLW	0x0f
	ANDWF	r0x00, W
	MOVWF	_SSPCON1
;	.line	209; vex_spi.c	SSPSTAT = sample? 0x80: 0x00;       /* Also clears CKE */
	MOVF	r0x02, W
	BZ	_00137_DS_
	MOVLW	0x80
	MOVWF	r0x02
	BRA	_00138_DS_
_00137_DS_:
	CLRF	r0x02
_00138_DS_:
	MOVFF	r0x02, _SSPSTAT
;	.line	211; vex_spi.c	switch(clock_mode)
	MOVLW	0x04
	SUBWF	r0x01, W
	BC	_00128_DS_
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	CLRF	r0x04
	RLCF	r0x01, W
	RLCF	r0x04, F
	RLCF	WREG, W
	RLCF	r0x04, F
	ANDLW	0xfc
	MOVWF	r0x03
	MOVLW	UPPER(_00145_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00145_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00145_DS_)
	ADDWF	r0x03, F
	MOVF	r0x04, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVWF	PCL
_00145_DS_:
	GOTO	_00124_DS_
	GOTO	_00125_DS_
	GOTO	_00126_DS_
	GOTO	_00127_DS_
_00124_DS_:
;	.line	214; vex_spi.c	SSPCON1bits.CKP = 0;
	BCF	_SSPCON1bits, 4
;	.line	215; vex_spi.c	SSPSTATbits.CKE = 1;
	BSF	_SSPSTATbits, 6
;	.line	216; vex_spi.c	break;
	BRA	_00128_DS_
_00125_DS_:
;	.line	218; vex_spi.c	SSPCON1bits.CKP = 0;
	BCF	_SSPCON1bits, 4
;	.line	219; vex_spi.c	SSPSTATbits.CKE = 0;
	BCF	_SSPSTATbits, 6
;	.line	220; vex_spi.c	break;
	BRA	_00128_DS_
_00126_DS_:
;	.line	222; vex_spi.c	SSPCON1bits.CKP = 1;
	BSF	_SSPCON1bits, 4
;	.line	223; vex_spi.c	SSPSTATbits.CKE = 1;
	BSF	_SSPSTATbits, 6
;	.line	224; vex_spi.c	break;
	BRA	_00128_DS_
_00127_DS_:
;	.line	226; vex_spi.c	SSPCON1bits.CKP = 1;
	BSF	_SSPCON1bits, 4
;	.line	227; vex_spi.c	SSPSTATbits.CKE = 0;
	BCF	_SSPSTATbits, 6
_00128_DS_:
;	.line	234; vex_spi.c	if (mode_select == SLV_SSOFF) {
	MOVF	r0x00, W
	XORLW	0x05
	BNZ	_00133_DS_
;	.line	235; vex_spi.c	TRISCbits.TRISC3 = 1;   /* RC3/SCK/SCL an input. 1 for SPI slave. */
	BSF	_TRISCbits, 3
;	.line	236; vex_spi.c	SSPSTATbits.SMP  = 0;   /* Force SMPMID */
	BCF	_SSPSTATbits, 7
	BRA	_00134_DS_
_00133_DS_:
;	.line	237; vex_spi.c	} else if (mode_select == SPI_FOSC_16) {
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00130_DS_
;	.line	238; vex_spi.c	TRISAbits.TRISA5 = 1;   /* OSC2/CLKO/RA6 an input */
	BSF	_TRISAbits, 5
	BRA	_00134_DS_
_00130_DS_:
;	.line	241; vex_spi.c	TRISCbits.TRISC3 = 0;   /* RC3/SCK/SCL an output. 0 for SPI master. */
	BCF	_TRISCbits, 3
_00134_DS_:
;	.line	244; vex_spi.c	TRISCbits.TRISC5 = 0;       /* RC5/SDO an output. Required for SPI. */
	BCF	_TRISCbits, 5
;	.line	245; vex_spi.c	TRISCbits.TRISC4 = 1;       /* RC4/SDI/SDA an input */
	BSF	_TRISCbits, 4
;	.line	246; vex_spi.c	TRISFbits.TRISF7 = 1;       /* SS' must be set. */
	BSF	_TRISFbits, 7
;	.line	248; vex_spi.c	INTCON2bits.INTEDG0 = 0;    /* Trigger on falling edge */
	BCF	_INTCON2bits, 6
;	.line	249; vex_spi.c	INTCONbits.INT0E = 1;       /* Enable pack interrupts */
	BSF	_INTCONbits, 4
;	.line	252; vex_spi.c	SSPCON1bits.SSPEN = 1;
	BSF	_SSPCON1bits, 5
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	 1216 (0x04c0) bytes ( 0.93%)
;           	  608 (0x0260) words
; udata size:	  169 (0x00a9) bytes ( 9.43%)
; access size:	    5 (0x0005) bytes


	end
