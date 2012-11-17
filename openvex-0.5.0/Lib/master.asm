;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Fri Nov  9 21:20:53 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _rc_read_status
	global _rc_read_data
	global _rc_button_sequence
	global _rc_new_data_available
	global _controller_in_autonomous_mode
	global _controller_end_autonomous_mode
	global _controller_begin_autonomous_mode
	global _controller_submit_data
	global _controller_print_version
	global _pwm_write
	global _pwm_read
	global _pwm_select_processor
	global _pwm_set_output_type
	global _master_set_user_cmd
	global _master_clr_user_cmd
	global _Pwm_disable_mask

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
	extern _Rx_buff
	extern _Rx_user_buff_index
	extern _User_rxdata
	extern _Tx_buff
	extern _Tx_user_buff_index
	extern _User_txdata
	extern _Spi_status
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
	extern _printf
	extern _memcpy
	extern _check_tx_env
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
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
_rc_button_sequence_count_1_1	db	0x00
_rc_button_sequence_val_1_1	db	0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1

udata_master_0	udata
_rc_button_sequence_temp_1_1	res	1

udata_master_1	udata
_rc_button_sequence_digit_1_1	res	1

udata_master_2	udata
_rc_button_sequence_button_1_1	res	1

udata_master_3	udata
_rc_button_sequence_old_button_1_1	res	1

udata_master_4	udata
_Pwm_disable_mask	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_master__master_clr_user_cmd	code
_master_clr_user_cmd:
;	.line	629; master.c	void    master_clr_user_cmd(unsigned char cmd)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	632; master.c	User_txdata.user_cmd &= ~cmd;
	COMF	r0x00, F
	BANKSEL	(_User_txdata + 20)
	MOVF	(_User_txdata + 20), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_User_txdata + 20)
	MOVWF	(_User_txdata + 20), B
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__master_set_user_cmd	code
_master_set_user_cmd:
;	.line	615; master.c	void    master_set_user_cmd(unsigned char cmd)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	BANKSEL	(_User_txdata + 20)
;	.line	618; master.c	User_txdata.user_cmd |= cmd;
	MOVF	(_User_txdata + 20), W, B
	IORWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_User_txdata + 20)
	MOVWF	(_User_txdata + 20), B
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__pwm_set_output_type	code
_pwm_set_output_type:
;	.line	574; master.c	void    pwm_set_output_type(int pwmSpec1, int pwmSpec2, int pwmSpec3, int pwmSpec4)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	BANKSEL	_Pwm_disable_mask
;	.line	577; master.c	Pwm_disable_mask = 0;
	CLRF	_Pwm_disable_mask, B
;	.line	579; master.c	if (pwmSpec1 == USER_CCP)
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00289_DS_
	MOVF	r0x01, W
	BZ	_00290_DS_
_00289_DS_:
	BRA	_00272_DS_
_00290_DS_:
;	.line	580; master.c	Pwm_disable_mask |= 0x01;
	MOVLW	0x01
	BANKSEL	_Pwm_disable_mask
	MOVWF	_Pwm_disable_mask, B
	BRA	_00273_DS_
_00272_DS_:
;	.line	582; master.c	CCP2CON = 0;
	CLRF	_CCP2CON
_00273_DS_:
;	.line	584; master.c	if (pwmSpec2 == USER_CCP)
	MOVF	r0x02, W
	XORLW	0x01
	BNZ	_00291_DS_
	MOVF	r0x03, W
	BZ	_00292_DS_
_00291_DS_:
	BRA	_00275_DS_
_00292_DS_:
	BANKSEL	_Pwm_disable_mask
;	.line	585; master.c	Pwm_disable_mask |= 0x02;
	BSF	_Pwm_disable_mask, 1, B
	BRA	_00276_DS_
_00275_DS_:
;	.line	587; master.c	CCP3CON = 0;
	CLRF	_CCP3CON
_00276_DS_:
;	.line	589; master.c	if (pwmSpec3 == USER_CCP)
	MOVF	r0x04, W
	XORLW	0x01
	BNZ	_00294_DS_
	MOVF	r0x05, W
	BZ	_00295_DS_
_00294_DS_:
	BRA	_00278_DS_
_00295_DS_:
	BANKSEL	_Pwm_disable_mask
;	.line	590; master.c	Pwm_disable_mask |= 0x04;
	BSF	_Pwm_disable_mask, 2, B
	BRA	_00279_DS_
_00278_DS_:
;	.line	592; master.c	CCP4CON = 0;
	CLRF	_CCP4CON
_00279_DS_:
;	.line	594; master.c	if (pwmSpec4 == USER_CCP)
	MOVF	r0x06, W
	XORLW	0x01
	BNZ	_00297_DS_
	MOVF	r0x07, W
	BZ	_00298_DS_
_00297_DS_:
	BRA	_00281_DS_
_00298_DS_:
	BANKSEL	_Pwm_disable_mask
;	.line	595; master.c	Pwm_disable_mask |= 0x08;
	BSF	_Pwm_disable_mask, 3, B
	BRA	_00283_DS_
_00281_DS_:
;	.line	597; master.c	CCP5CON = 0;
	CLRF	_CCP5CON
_00283_DS_:
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__pwm_select_processor	code
_pwm_select_processor:
;	.line	547; master.c	void    pwm_select_processor(unsigned char port,
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	550; master.c	switch(controller)
	MOVF	r0x01, W
	BZ	_00252_DS_
	MOVF	r0x01, W
	XORLW	0x01
	BNZ	_00254_DS_
;	.line	553; master.c	User_txdata.pwm_mask |= (1 << ((port)-1));
	DECF	r0x00, W
	MOVWF	r0x01
	MOVLW	0x01
	MOVWF	r0x02
	MOVF	r0x01, W
	BZ	_00262_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00263_DS_:
	RLCF	r0x02, F
	ADDLW	0x01
	BNC	_00263_DS_
_00262_DS_:
	MOVF	r0x02, W
	BANKSEL	(_User_txdata + 22)
	IORWF	(_User_txdata + 22), W, B
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	BANKSEL	(_User_txdata + 22)
	MOVWF	(_User_txdata + 22), B
;	.line	554; master.c	break;
	BRA	_00254_DS_
_00252_DS_:
;	.line	556; master.c	User_txdata.pwm_mask &= ~(1 << ((port)-1));
	DECF	r0x00, F
	MOVLW	0x01
	MOVWF	r0x01
	MOVF	r0x00, W
	BZ	_00265_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00266_DS_:
	RLCF	r0x01, F
	ADDLW	0x01
	BNC	_00266_DS_
_00265_DS_:
	COMF	r0x01, W
	MOVWF	r0x00
	BANKSEL	(_User_txdata + 22)
	MOVF	(_User_txdata + 22), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_User_txdata + 22)
	MOVWF	(_User_txdata + 22), B
_00254_DS_:
;	.line	558; master.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__pwm_read	code
_pwm_read:
;	.line	526; master.c	char    pwm_read(unsigned char port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	528; master.c	if ( VALID_PWM_PORT(port) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00238_DS_
	MOVLW	0x09
	SUBWF	r0x00, W
	BC	_00238_DS_
;	.line	529; master.c	return User_txdata.pwm[port-1] - 127;
	DECF	r0x00, F
	CLRF	r0x01
	MOVLW	LOW(_User_txdata + 4)
	ADDWF	r0x00, F
	MOVLW	HIGH(_User_txdata + 4)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	MOVLW	0x81
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BRA	_00241_DS_
_00238_DS_:
;	.line	531; master.c	return OV_BAD_PARAM;
	MOVLW	0x80
_00241_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__pwm_write	code
_pwm_write:
;	.line	485; master.c	char    pwm_write(unsigned char port,char val)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	496; master.c	if ( val == -128 )
	MOVF	r0x01, W
	XORLW	0x80
	BNZ	_00219_DS_
;	.line	497; master.c	++val;
	INCF	r0x01, F
_00219_DS_:
;	.line	499; master.c	if ( VALID_PWM_PORT(port) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00221_DS_
	MOVLW	0x09
	SUBWF	r0x00, W
	BC	_00221_DS_
;	.line	501; master.c	User_txdata.pwm[port-1] = val + 127;
	DECF	r0x00, F
	CLRF	r0x02
	MOVLW	LOW(_User_txdata + 4)
	ADDWF	r0x00, F
	MOVLW	HIGH(_User_txdata + 4)
	ADDWFC	r0x02, F
	MOVLW	0x7f
	ADDWF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x01, INDF0
;	.line	502; master.c	return OV_OK;
	CLRF	WREG
	BRA	_00224_DS_
_00221_DS_:
;	.line	505; master.c	return OV_BAD_PARAM;
	MOVLW	0x80
_00224_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__controller_print_version	code
_controller_print_version:
;	.line	427; master.c	void    controller_print_version(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	431; master.c	(int)User_rxdata->master_version, CODE_VERSION);
	MOVFF	_User_rxdata, r0x00
	MOVFF	(_User_rxdata + 1), r0x01
	MOVFF	(_User_rxdata + 2), r0x02
	MOVLW	0x1f
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	CLRF	r0x01
;	.line	430; master.c	printf("\nVEX master code v%d\n%s\n",
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__controller_submit_data	code
_controller_submit_data:
;	.line	376; master.c	void    controller_submit_data(unsigned char wait)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	BANKSEL	(_User_txdata + 30)
;	.line	387; master.c	if (User_txdata.current_mode == 2)
	MOVF	(_User_txdata + 30), W, B
	XORLW	0x02
	BNZ	_00194_DS_
;	.line	388; master.c	check_tx_env();
	CALL	_check_tx_env
_00194_DS_:
;	.line	394; master.c	User_txdata.cmd_byte1 &= 0x7F;
	MOVLW	0x7f
	BANKSEL	(_User_txdata + 21)
	ANDWF	(_User_txdata + 21), W, B
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	BANKSEL	(_User_txdata + 21)
	MOVWF	(_User_txdata + 21), B
; ;multiply lit val:0x20 by variable _Tx_user_buff_index and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_Tx_user_buff_index
;	.line	399; master.c	memcpy(Tx_buff + Tx_user_buff_index,&User_txdata,sizeof(tx_data_t));
	MOVF	_Tx_user_buff_index, W, B
	MULLW	0x20
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVLW	LOW(_Tx_buff)
	ADDWF	r0x01, F
	MOVLW	HIGH(_Tx_buff)
	ADDWFC	r0x02, F
; #	MOVF	r0x02, W
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
; #	MOVF	r0x01, W
; #	MOVF	r0x01, W
; #	MOVWF	r0x01
	MOVF	r0x01, W
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	HIGH(_User_txdata)
	MOVWF	r0x05
	MOVLW	LOW(_User_txdata)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	406; master.c	PIE1bits.SSPIE = 0;
	BCF	_PIE1bits, 3
	BANKSEL	_Tx_user_buff_index
;	.line	407; master.c	Tx_user_buff_index = !Tx_user_buff_index;
	MOVF	_Tx_user_buff_index, W, B
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	BANKSEL	_Tx_user_buff_index
	CLRF	_Tx_user_buff_index, B
	RLCF	_Tx_user_buff_index, F, B
	BANKSEL	_Spi_status
;	.line	408; master.c	Spi_status.new_tx_data = 1;
	BSF	_Spi_status, 1, B
;	.line	409; master.c	PIE1bits.SSPIE = 1;
	BSF	_PIE1bits, 3
;	.line	412; master.c	User_txdata.packet_num++;
	MOVFF	(_User_txdata + 29), r0x01
	INCF	r0x01, F
	MOVF	r0x01, W
	BANKSEL	(_User_txdata + 29)
	MOVWF	(_User_txdata + 29), B
;	.line	416; master.c	if ( wait == WAIT )
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00200_DS_
_00195_DS_:
;	.line	417; master.c	while ( !rc_new_data_available() )
	CALL	_rc_new_data_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00195_DS_
_00200_DS_:
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__controller_begin_autonomous_mode	code
_controller_begin_autonomous_mode:
;	.line	301; master.c	void    controller_begin_autonomous_mode(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	305; master.c	master_set_user_cmd(TX_CMD_AUTONOMOUS_MODE);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_master_set_user_cmd
	INCF	FSR1L, F
;	.line	306; master.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
_00185_DS_:
;	.line	309; master.c	while ( ! controller_in_autonomous_mode() )
	CALL	_controller_in_autonomous_mode
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00185_DS_
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__controller_end_autonomous_mode	code
_controller_end_autonomous_mode:
;	.line	270; master.c	void    controller_end_autonomous_mode(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	274; master.c	master_clr_user_cmd(TX_CMD_AUTONOMOUS_MODE);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_master_clr_user_cmd
	INCF	FSR1L, F
;	.line	275; master.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
_00177_DS_:
;	.line	281; master.c	while ( controller_in_autonomous_mode() )
	CALL	_controller_in_autonomous_mode
	MOVWF	r0x00
	MOVF	r0x00, W
	BNZ	_00177_DS_
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__controller_in_autonomous_mode	code
_controller_in_autonomous_mode:
;	.line	253; master.c	char    controller_in_autonomous_mode(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	256; master.c	return User_rxdata->rc_mode.autonomous;
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
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
; #; info ==> [localregs] exit begin

	MOVWF	r0x00
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__rc_new_data_available	code
_rc_new_data_available:
;	.line	205; master.c	char   rc_new_data_available(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	210; master.c	new_rc_data = Spi_status.new_rc_data;
	CLRF	r0x00
	BANKSEL	_Spi_status
	BTFSC	_Spi_status, 0, B
	INCF	r0x00, F
;	.line	211; master.c	if ( new_rc_data )
	MOVF	r0x00, W
	BZ	_00166_DS_
;	.line	217; master.c	PIE1bits.SSPIE = 0;
	BCF	_PIE1bits, 3
	BANKSEL	_Spi_status
;	.line	218; master.c	MASTER_CLR_NEW_RC_DATA_FLAG(Spi_status);
	BCF	_Spi_status, 0, B
;	.line	219; master.c	PIE1bits.SSPIE = 1;
	BSF	_PIE1bits, 3
_00166_DS_:
;	.line	226; master.c	return new_rc_data;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__rc_button_sequence	code
_rc_button_sequence:
;	.line	141; master.c	unsigned char   rc_button_sequence(unsigned char channel, unsigned char len)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	151; master.c	if ( ! VALID_RC_CHANNEL(channel) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00129_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BNC	_00130_DS_
_00129_DS_:
;	.line	152; master.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00142_DS_
_00130_DS_:
;	.line	154; master.c	switch ( (button = rc_read_data(channel)) )
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVFF	r0x00, _rc_button_sequence_button_1_1
	MOVF	r0x00, W
	XORLW	0x81
	BZ	_00132_DS_
	MOVF	r0x00, W
	XORLW	0x7f
	BZ	_00133_DS_
	BRA	_00134_DS_
_00132_DS_:
	BANKSEL	_rc_button_sequence_digit_1_1
;	.line	157; master.c	digit = 0;
	CLRF	_rc_button_sequence_digit_1_1, B
;	.line	158; master.c	break;
	BRA	_00135_DS_
_00133_DS_:
;	.line	160; master.c	digit = 1;
	MOVLW	0x01
	BANKSEL	_rc_button_sequence_digit_1_1
	MOVWF	_rc_button_sequence_digit_1_1, B
;	.line	161; master.c	break;
	BRA	_00135_DS_
_00134_DS_:
;	.line	163; master.c	digit = 2;
	MOVLW	0x02
	BANKSEL	_rc_button_sequence_digit_1_1
	MOVWF	_rc_button_sequence_digit_1_1, B
_00135_DS_:
;	.line	172; master.c	if ( (digit < 2) && (button != old_button) )
	MOVLW	0x02
	BANKSEL	_rc_button_sequence_digit_1_1
	SUBWF	_rc_button_sequence_digit_1_1, W, B
	BC	_00137_DS_
	BANKSEL	_rc_button_sequence_button_1_1
	MOVF	_rc_button_sequence_button_1_1, W, B
	BANKSEL	_rc_button_sequence_old_button_1_1
	XORWF	_rc_button_sequence_old_button_1_1, W, B
	BZ	_00137_DS_
_00158_DS_:
	BANKSEL	_rc_button_sequence_count_1_1
;	.line	174; master.c	++count;
	INCF	_rc_button_sequence_count_1_1, F, B
	BANKSEL	_rc_button_sequence_val_1_1
;	.line	175; master.c	val = (val << 1) + digit;     /* Insert new digit in LSB */
	RLNCF	_rc_button_sequence_val_1_1, W, B
	ANDLW	0xfe
	MOVWF	r0x00
	BANKSEL	_rc_button_sequence_digit_1_1
	MOVF	_rc_button_sequence_digit_1_1, W, B
	ADDWF	r0x00, W
	BANKSEL	_rc_button_sequence_val_1_1
	MOVWF	_rc_button_sequence_val_1_1, B
_00137_DS_:
;	.line	177; master.c	old_button = button;
	MOVFF	_rc_button_sequence_button_1_1, _rc_button_sequence_old_button_1_1
	BANKSEL	_rc_button_sequence_count_1_1
;	.line	178; master.c	if ( count == len )
	MOVF	_rc_button_sequence_count_1_1, W, B
	XORWF	r0x01, W
	BNZ	_00140_DS_
;	.line	180; master.c	temp = val;
	MOVFF	_rc_button_sequence_val_1_1, _rc_button_sequence_temp_1_1
	BANKSEL	_rc_button_sequence_val_1_1
;	.line	181; master.c	count = val = 0;
	CLRF	_rc_button_sequence_val_1_1, B
	BANKSEL	_rc_button_sequence_count_1_1
	CLRF	_rc_button_sequence_count_1_1, B
	BANKSEL	_rc_button_sequence_temp_1_1
;	.line	182; master.c	return temp;
	MOVF	_rc_button_sequence_temp_1_1, W, B
	BRA	_00142_DS_
_00140_DS_:
;	.line	185; master.c	return OV_SEQUENCE_INCOMPLETE;
	MOVLW	0xfe
_00142_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__rc_read_data	code
_rc_read_data:
;	.line	88; master.c	char    rc_read_data(unsigned char channel)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	91; master.c	if ( VALID_RC_CHANNEL(channel) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00113_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00113_DS_
;	.line	102; master.c	if ( User_rxdata->oi_analog[channel-1] == 255 )
	MOVFF	_User_rxdata, r0x01
	MOVFF	(_User_rxdata + 1), r0x02
	MOVFF	(_User_rxdata + 2), r0x03
	MOVLW	0x06
	ADDWF	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	ADDWFC	r0x03, F
	DECF	r0x00, F
	MOVF	r0x00, W
	ADDWF	r0x01, F
	CLRF	WREG
	ADDWFC	r0x02, F
	CLRF	WREG
	ADDWFC	r0x03, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget1
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	XORLW	0xff
	BNZ	_00111_DS_
;	.line	103; master.c	--User_rxdata->oi_analog[channel-1];
	MOVFF	_User_rxdata, r0x01
	MOVFF	(_User_rxdata + 1), r0x02
	MOVFF	(_User_rxdata + 2), r0x03
	MOVLW	0x06
	ADDWF	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	ADDWFC	r0x03, F
	MOVF	r0x00, W
	ADDWF	r0x01, F
	CLRF	WREG
	ADDWFC	r0x02, F
	CLRF	WREG
	ADDWFC	r0x03, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget1
	MOVWF	r0x04
	DECF	r0x04, F
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrput1
_00111_DS_:
;	.line	104; master.c	return User_rxdata->oi_analog[channel-1] - 127;
	MOVFF	_User_rxdata, r0x01
	MOVFF	(_User_rxdata + 1), r0x02
	MOVFF	(_User_rxdata + 2), r0x03
	MOVLW	0x06
	ADDWF	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	ADDWFC	r0x03, F
	CLRF	r0x04
	CLRF	r0x05
	MOVF	r0x01, W
	ADDWF	r0x00, F
	MOVF	r0x02, W
	ADDWFC	r0x04, F
	MOVF	r0x03, W
	ADDWFC	r0x05, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x00
	MOVLW	0x81
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BRA	_00116_DS_
_00113_DS_:
;	.line	107; master.c	return OV_BAD_PARAM;
	MOVLW	0x80
_00116_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_master__rc_read_status	code
_rc_read_status:
;	.line	63; master.c	char    rc_read_status(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	66; master.c	return User_rxdata->rc_status_byte;
	MOVFF	_User_rxdata, r0x00
	MOVFF	(_User_rxdata + 1), r0x01
	MOVFF	(_User_rxdata + 2), r0x02
	MOVLW	0x02
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
; #; info ==> [localregs] exit begin

	MOVWF	r0x00
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x0a, 0x56, 0x45, 0x58, 0x20, 0x6d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x20
	DB	0x63, 0x6f, 0x64, 0x65, 0x20, 0x76, 0x25, 0x64, 0x0a, 0x25, 0x73, 0x0a
	DB	0x00
; ; Starting pCode block
__str_1:
	DB	0x4f, 0x70, 0x65, 0x6e, 0x56, 0x65, 0x78, 0x2d, 0x30, 0x2e, 0x35, 0x2e
	DB	0x30, 0x00


; Statistics:
; code size:	 1742 (0x06ce) bytes ( 1.33%)
;           	  871 (0x0367) words
; udata size:	    5 (0x0005) bytes ( 0.28%)
; access size:	    8 (0x0008) bytes


	end
