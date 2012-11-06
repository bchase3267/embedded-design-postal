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
	global _shaft_encoder_enable_std
	global _shaft_encoder_enable_quad
	global _shaft_encoder_enable
	global _shaft_encoder_disable
	global _shaft_encoder_reset
	global _shaft_encoder_read_std
	global _shaft_encoder_read_quad
	global _shaft_tps_run
	global _shaft_tps_init

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
	extern __gptrput1
	extern __gptrput2
	extern __gptrget4
	extern __gptrget2
	extern __gptrput4
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
	extern _Timer0_overflows
	extern _Timer1_overflows
	extern _Timer2_overflows
	extern _Timer3_overflows
	extern _Timer4_overflows
	extern _Porta_sample
	extern _Portf_sample
	extern _Porth_sample
	extern _Encoder_ticks
	extern _Encoder_on_iport
	extern _Quad_input_port
	extern _Analog_ports
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
	extern _timer0_read32
	extern _pwm_write
	extern _controller_submit_data
	extern _io_set_direction
	extern _io_get_direction
	extern __divsint
	extern __divulong
	extern __modulong
	extern __mullong
	extern __mulint
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_shaft_tps_run_kpn_1_1	db	0x01, 0x00
_shaft_tps_run_kpd_1_1	db	0x0c, 0x00
_shaft_tps_run_kin_1_1	db	0x00, 0x00
_shaft_tps_run_kid_1_1	db	0x01, 0x00
_shaft_tps_run_kdn_1_1	db	0x01, 0x00
_shaft_tps_run_kdd_1_1	db	0x01, 0x00
_shaft_tps_run_sample_interval_1_1	db	0x32, 0x00


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
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1
r0x16	res	1

udata_shaft_encoder_0	udata
_shaft_tps_run_active_timers_1_1	res	1

udata_shaft_encoder_1	udata
_shaft_tps_run_active_counters_1_1	res	1

udata_shaft_encoder_2	udata
_shaft_tps_run_sp_1_1	res	3

udata_shaft_encoder_3	udata
_shaft_tps_run_start_time_1_1	res	4

udata_shaft_encoder_4	udata
_shaft_tps_run_elapsed_time_1_1	res	4

udata_shaft_encoder_5	udata
_shaft_tps_run_actual_ticks_1_1	res	4

udata_shaft_encoder_6	udata
_shaft_tps_run_expected_ticks_1_1	res	4

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_shaft_encoder__shaft_tps_init	code
_shaft_tps_init:
;	.line	510; shaft_encoder.c	status_t    shaft_tps_init(shaft_t *sp,
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
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
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
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x0a
	MOVLW	0x0d
	MOVFF	PLUSW2, r0x0b
	MOVLW	0x0e
	MOVFF	PLUSW2, r0x0c
	MOVLW	0x0f
	MOVFF	PLUSW2, r0x0d
;	.line	516; shaft_encoder.c	printf("%d %d %d\n", motor_port, interrupt_port, input_port);
	MOVFF	r0x0b, r0x0e
	CLRF	r0x0f
	MOVFF	r0x0a, r0x10
	CLRF	r0x11
	MOVFF	r0x09, r0x12
	CLRF	r0x13
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	517; shaft_encoder.c	if ( ! VALID_PWM_PORT(motor_port) ||
	MOVLW	0x01
	SUBWF	r0x09, W
	BNC	_00327_DS_
	MOVLW	0x09
	SUBWF	r0x09, W
	BC	_00327_DS_
;	.line	518; shaft_encoder.c	! VALID_INTERRUPT_PORT(interrupt_port) ||
	MOVLW	0x01
	SUBWF	r0x0a, W
	BNC	_00327_DS_
	MOVLW	0x07
	SUBWF	r0x0a, W
	BC	_00327_DS_
;	.line	519; shaft_encoder.c	((input_port != 0) && ! VALID_DIGITAL_PORT(input_port)) )
	MOVF	r0x0b, W
	BZ	_00328_DS_
	MOVF	r0x0b, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00327_DS_
	MOVLW	0x11
	SUBWF	r0x0b, W
	BNC	_00328_DS_
_00327_DS_:
;	.line	520; shaft_encoder.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00335_DS_
_00328_DS_:
;	.line	522; shaft_encoder.c	io_set_direction(input_port, IO_DIRECTION_IN);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	CALL	_io_set_direction
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	524; shaft_encoder.c	sp->timer_limit = timer_limit;
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x05, TBLPTRL
	MOVFF	r0x06, TBLPTRH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput4
;	.line	525; shaft_encoder.c	sp->tick_limit = tick_limit;
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	526; shaft_encoder.c	sp->motor_port = motor_port;
	MOVF	r0x00, W
	ADDLW	0x08
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVF	r0x09, W
	ANDLW	0x07
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	ANDLW	0xf8
	IORWF	PRODH, W
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	527; shaft_encoder.c	sp->interrupt_port = interrupt_port;
	MOVF	r0x00, W
	ADDLW	0x08
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVF	r0x0a, W
	ANDLW	0x0f
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	ANDLW	0x0f
	IORWF	PRODH, W
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	528; shaft_encoder.c	sp->input_port = input_port;
	MOVF	r0x00, W
	ADDLW	0x09
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVF	r0x0b, W
	ANDLW	0x0f
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	ANDLW	0xf0
	IORWF	PRODH, W
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	529; shaft_encoder.c	sp->tps = MIN(ticks_per_second, 1699);
	MOVLW	0x06
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVF	r0x0d, W
	ADDLW	0x80
	ADDLW	0x7a
	BNZ	_00352_DS_
	MOVLW	0xa3
	SUBWF	r0x0c, W
_00352_DS_:
	BC	_00337_DS_
	MOVFF	r0x0c, r0x03
	MOVFF	r0x0d, r0x04
	BRA	_00338_DS_
_00337_DS_:
	MOVLW	0xa3
	MOVWF	r0x03
	MOVLW	0x06
	MOVWF	r0x04
_00338_DS_:
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
;	.line	531; shaft_encoder.c	return OV_OK;
	CLRF	WREG
_00335_DS_:
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
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
S_shaft_encoder__shaft_tps_run	code
_shaft_tps_run:
;	.line	353; shaft_encoder.c	status_t    shaft_tps_run(shaft_t shafts[], unsigned char count)
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
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x16, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	390; shaft_encoder.c	if ( ! VALID_ENCODER_COUNT(count) )
	MOVLW	0x01
	SUBWF	r0x03, W
	BNC	_00234_DS_
	MOVLW	0x07
	SUBWF	r0x03, W
	BNC	_00235_DS_
_00234_DS_:
;	.line	391; shaft_encoder.c	return OV_BAD_PARAM;
	MOVLW	0x80
	GOTO	_00266_DS_
_00235_DS_:
;	.line	394; shaft_encoder.c	start_time = TIMER0_ELAPSED_MS;
	CALL	_timer0_read32
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	BTFSS	_T0CON, 3
	BRA	_00268_DS_
	MOVLW	0x01
	MOVWF	r0x08
	CLRF	r0x09
	BRA	_00269_DS_
_00268_DS_:
	MOVLW	0x07
	ANDWF	_T0CON, W
	MOVWF	r0x0a
	MOVLW	0x02
	MOVWF	r0x08
	MOVLW	0x00
	MOVWF	r0x09
	MOVF	r0x0a, W
	BZ	_00269_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00307_DS_:
	RLCF	r0x08, F
	RLCF	r0x09, F
	ADDLW	0x01
	BNC	_00307_DS_
_00269_DS_:
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	WREG
	BTFSC	r0x09, 7
	MOVLW	0xff
	MOVWF	r0x0a
; #	MOVWF	r0x0b
; #	MOVF	r0x0b, W
	MOVWF	r0x0b
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__divulong
	BANKSEL	_shaft_tps_run_start_time_1_1
	MOVWF	_shaft_tps_run_start_time_1_1, B
	MOVFF	PRODL, (_shaft_tps_run_start_time_1_1 + 1)
	MOVFF	PRODH, (_shaft_tps_run_start_time_1_1 + 2)
	MOVFF	FSR0L, (_shaft_tps_run_start_time_1_1 + 3)
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	397; shaft_encoder.c	for (sp = shafts; sp < shafts + count; ++sp)
	MOVFF	r0x00, _shaft_tps_run_sp_1_1
	MOVFF	r0x01, (_shaft_tps_run_sp_1_1 + 1)
	MOVFF	r0x02, (_shaft_tps_run_sp_1_1 + 2)
; ;multiply lit val:0x0e by variable r0x03 and store in r0x04
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x03, W
	MULLW	0x0e
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	CLRF	r0x06
	MOVF	r0x00, W
	ADDWF	r0x04, F
	MOVF	r0x01, W
	ADDWFC	r0x05, F
	MOVF	r0x02, W
	ADDWFC	r0x06, F
_00254_DS_:
	BANKSEL	(_shaft_tps_run_sp_1_1 + 2)
	MOVF	(_shaft_tps_run_sp_1_1 + 2), W, B
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x06, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00308_DS_
	MOVF	r0x05, W
	BANKSEL	(_shaft_tps_run_sp_1_1 + 1)
	SUBWF	(_shaft_tps_run_sp_1_1 + 1), W, B
	BNZ	_00308_DS_
	MOVF	r0x04, W
	BANKSEL	_shaft_tps_run_sp_1_1
	SUBWF	_shaft_tps_run_sp_1_1, W, B
_00308_DS_:
	BTFSC	STATUS, 0
	BRA	_00296_DS_
;	.line	399; shaft_encoder.c	if ( ENCODER_ON_IPORT(sp->interrupt_port) )
	MOVFF	_shaft_tps_run_sp_1_1, r0x07
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x08
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x09
	MOVLW	0x08
	ADDWF	r0x07, F
	MOVLW	0x00
	ADDWFC	r0x08, F
	MOVLW	0x00
	ADDWFC	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	SWAPF	WREG, W
	ANDLW	0x0f
	MOVWF	r0x07
	DECF	r0x07, F
	CLRF	r0x08
	BTFSC	r0x07, 7
	SETF	r0x08
	MOVLW	LOW(_Encoder_on_iport)
	ADDWF	r0x07, F
	MOVLW	HIGH(_Encoder_on_iport)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	INDF0, r0x07
	MOVF	r0x07, W
	BZ	_00238_DS_
;	.line	401; shaft_encoder.c	shaft_encoder_reset(sp->interrupt_port);
	MOVFF	_shaft_tps_run_sp_1_1, r0x07
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x08
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x09
	MOVLW	0x08
	ADDWF	r0x07, F
	MOVLW	0x00
	ADDWFC	r0x08, F
	MOVLW	0x00
	ADDWFC	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	SWAPF	WREG, W
	ANDLW	0x0f
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
	MOVWF	r0x07
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_reset
	INCF	FSR1L, F
;	.line	402; shaft_encoder.c	sp->leave_encoder_on = 1;
	MOVFF	_shaft_tps_run_sp_1_1, r0x07
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x08
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x09
	MOVLW	0x08
	ADDWF	r0x07, F
	MOVLW	0x00
	ADDWFC	r0x08, F
	MOVLW	0x00
	ADDWFC	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	BSF	WREG, 3
	MOVWF	POSTDEC1
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput1
	BRA	_00239_DS_
_00238_DS_:
;	.line	406; shaft_encoder.c	shaft_encoder_enable(sp->interrupt_port);
	MOVFF	_shaft_tps_run_sp_1_1, r0x07
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x08
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x09
	MOVLW	0x08
	ADDWF	r0x07, F
	MOVLW	0x00
	ADDWFC	r0x08, F
	MOVLW	0x00
	ADDWFC	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	SWAPF	WREG, W
	ANDLW	0x0f
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
	MOVWF	r0x07
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_enable
	INCF	FSR1L, F
;	.line	407; shaft_encoder.c	sp->leave_encoder_on = 0;
	MOVFF	_shaft_tps_run_sp_1_1, r0x07
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x08
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x09
	MOVLW	0x08
	ADDWF	r0x07, F
	MOVLW	0x00
	ADDWFC	r0x08, F
	MOVLW	0x00
	ADDWFC	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	BCF	WREG, 3
	MOVWF	POSTDEC1
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput1
_00239_DS_:
;	.line	409; shaft_encoder.c	sp->power = 0;
	MOVFF	_shaft_tps_run_sp_1_1, r0x07
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x08
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x09
	MOVLW	0x0d
	ADDWF	r0x07, F
	MOVLW	0x00
	ADDWFC	r0x08, F
	MOVLW	0x00
	ADDWFC	r0x09, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput1
;	.line	410; shaft_encoder.c	sp->integral = 0;
	MOVFF	_shaft_tps_run_sp_1_1, r0x07
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x08
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x09
	MOVLW	0x0a
	ADDWF	r0x07, F
	MOVLW	0x00
	ADDWFC	r0x08, F
	MOVLW	0x00
	ADDWFC	r0x09, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput2
;	.line	397; shaft_encoder.c	for (sp = shafts; sp < shafts + count; ++sp)
	MOVLW	0x0e
	BANKSEL	_shaft_tps_run_sp_1_1
	ADDWF	_shaft_tps_run_sp_1_1, F, B
	MOVLW	0x00
	BANKSEL	(_shaft_tps_run_sp_1_1 + 1)
	ADDWFC	(_shaft_tps_run_sp_1_1 + 1), F, B
	MOVLW	0x00
	BANKSEL	(_shaft_tps_run_sp_1_1 + 2)
	ADDWFC	(_shaft_tps_run_sp_1_1 + 2), F, B
	BRA	_00254_DS_
_00296_DS_:
;	.line	417; shaft_encoder.c	do
	MOVF	r0x04, W
	ADDLW	0xf2
	MOVWF	r0x07
	MOVLW	0xff
	ADDWFC	r0x05, W
	MOVWF	r0x08
	MOVLW	0xff
	ADDWFC	r0x06, W
	MOVWF	r0x09
_00249_DS_:
;	.line	419; shaft_encoder.c	active_timers = active_counters = count;
	MOVFF	r0x03, _shaft_tps_run_active_counters_1_1
	MOVFF	r0x03, _shaft_tps_run_active_timers_1_1
;	.line	422; shaft_encoder.c	elapsed_time = TIMER0_ELAPSED_MS - start_time;
	CALL	_timer0_read32
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	BTFSS	_T0CON, 3
	BRA	_00270_DS_
	MOVLW	0x01
	MOVWF	r0x0e
	CLRF	r0x0f
	BRA	_00271_DS_
_00270_DS_:
	MOVLW	0x07
	ANDWF	_T0CON, W
	MOVWF	r0x10
	MOVLW	0x02
	MOVWF	r0x0e
	MOVLW	0x00
	MOVWF	r0x0f
	MOVF	r0x10, W
	BZ	_00271_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00312_DS_:
	RLCF	r0x0e, F
	RLCF	r0x0f, F
	ADDLW	0x01
	BNC	_00312_DS_
_00271_DS_:
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	WREG
	BTFSC	r0x0f, 7
	MOVLW	0xff
	MOVWF	r0x10
; #	MOVWF	r0x11
; #	MOVF	r0x11, W
	MOVWF	r0x11
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	_shaft_tps_run_start_time_1_1
	MOVF	_shaft_tps_run_start_time_1_1, W, B
	SUBWF	r0x0a, W
	BANKSEL	_shaft_tps_run_elapsed_time_1_1
	MOVWF	_shaft_tps_run_elapsed_time_1_1, B
	BANKSEL	(_shaft_tps_run_start_time_1_1 + 1)
	MOVF	(_shaft_tps_run_start_time_1_1 + 1), W, B
	SUBWFB	r0x0b, W
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 1)
	MOVWF	(_shaft_tps_run_elapsed_time_1_1 + 1), B
	BANKSEL	(_shaft_tps_run_start_time_1_1 + 2)
	MOVF	(_shaft_tps_run_start_time_1_1 + 2), W, B
	SUBWFB	r0x0c, W
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 2)
	MOVWF	(_shaft_tps_run_elapsed_time_1_1 + 2), B
	BANKSEL	(_shaft_tps_run_start_time_1_1 + 3)
	MOVF	(_shaft_tps_run_start_time_1_1 + 3), W, B
	SUBWFB	r0x0d, W
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 3)
	MOVWF	(_shaft_tps_run_elapsed_time_1_1 + 3), B
;	.line	425; shaft_encoder.c	if ( elapsed_time % sample_interval == 0 )
	MOVFF	_shaft_tps_run_sample_interval_1_1, r0x0a
	MOVFF	(_shaft_tps_run_sample_interval_1_1 + 1), r0x0b
	CLRF	WREG
	BANKSEL	(_shaft_tps_run_sample_interval_1_1 + 1)
	BTFSC	(_shaft_tps_run_sample_interval_1_1 + 1), 7
	MOVLW	0xff
	MOVWF	r0x0c
; #	MOVWF	r0x0d
; #	MOVF	r0x0d, W
	MOVWF	r0x0d
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 3)
	MOVF	(_shaft_tps_run_elapsed_time_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 2)
	MOVF	(_shaft_tps_run_elapsed_time_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 1)
	MOVF	(_shaft_tps_run_elapsed_time_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_elapsed_time_1_1
	MOVF	_shaft_tps_run_elapsed_time_1_1, W, B
	MOVWF	POSTDEC1
	CALL	__modulong
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x0a, W
	IORWF	r0x0b, W
	IORWF	r0x0c, W
	IORWF	r0x0d, W
	BTFSS	STATUS, 2
	GOTO	_00250_DS_
;	.line	432; shaft_encoder.c	for (sp = shafts + count - 1; sp >= shafts; --sp)
	MOVFF	r0x07, _shaft_tps_run_sp_1_1
	MOVFF	r0x08, (_shaft_tps_run_sp_1_1 + 1)
	MOVFF	r0x09, (_shaft_tps_run_sp_1_1 + 2)
_00258_DS_:
	BANKSEL	(_shaft_tps_run_sp_1_1 + 2)
	MOVF	(_shaft_tps_run_sp_1_1 + 2), W, B
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x02, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00313_DS_
	MOVF	r0x01, W
	BANKSEL	(_shaft_tps_run_sp_1_1 + 1)
	SUBWF	(_shaft_tps_run_sp_1_1 + 1), W, B
	BNZ	_00313_DS_
	MOVF	r0x00, W
	BANKSEL	_shaft_tps_run_sp_1_1
	SUBWF	_shaft_tps_run_sp_1_1, W, B
_00313_DS_:
	BTFSS	STATUS, 0
	GOTO	_00261_DS_
;	.line	435; shaft_encoder.c	if ( elapsed_time >= sp->timer_limit )
	MOVFF	_shaft_tps_run_sp_1_1, r0x0a
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0b
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x0c
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget4
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	MOVF	r0x0d, W
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 3)
	SUBWF	(_shaft_tps_run_elapsed_time_1_1 + 3), W, B
	BNZ	_00314_DS_
	MOVF	r0x0c, W
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 2)
	SUBWF	(_shaft_tps_run_elapsed_time_1_1 + 2), W, B
	BNZ	_00314_DS_
	MOVF	r0x0b, W
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 1)
	SUBWF	(_shaft_tps_run_elapsed_time_1_1 + 1), W, B
	BNZ	_00314_DS_
	MOVF	r0x0a, W
	BANKSEL	_shaft_tps_run_elapsed_time_1_1
	SUBWF	_shaft_tps_run_elapsed_time_1_1, W, B
_00314_DS_:
	BNC	_00241_DS_
	BANKSEL	_shaft_tps_run_active_timers_1_1
;	.line	436; shaft_encoder.c	--active_timers;
	DECF	_shaft_tps_run_active_timers_1_1, F, B
_00241_DS_:
;	.line	438; shaft_encoder.c	actual_ticks = SHAFT_ENCODER_READ_STD(sp->interrupt_port);
	MOVFF	_shaft_tps_run_sp_1_1, r0x0a
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0b
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x0c
	MOVLW	0x08
	ADDWF	r0x0a, F
	MOVLW	0x00
	ADDWFC	r0x0b, F
	MOVLW	0x00
	ADDWFC	r0x0c, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget1
	SWAPF	WREG, W
	ANDLW	0x0f
	MOVWF	r0x0a
	DECF	r0x0a, F
; ;multiply lit val:0x02 by variable r0x0a and store in r0x0a
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x0a, F
	CLRF	r0x0b
	BTFSC	r0x0a, 7
	SETF	r0x0b
	MOVLW	LOW(_Encoder_ticks)
	ADDWF	r0x0a, F
	MOVLW	HIGH(_Encoder_ticks)
	ADDWFC	r0x0b, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, FSR0H
	MOVFF	POSTINC0, r0x0a
	MOVFF	INDF0, r0x0b
	MOVFF	r0x0a, _shaft_tps_run_actual_ticks_1_1
	MOVFF	r0x0b, (_shaft_tps_run_actual_ticks_1_1 + 1)
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 2)
	CLRF	(_shaft_tps_run_actual_ticks_1_1 + 2), B
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 3)
	CLRF	(_shaft_tps_run_actual_ticks_1_1 + 3), B
;	.line	439; shaft_encoder.c	if ( actual_ticks >= sp->tick_limit )
	MOVFF	_shaft_tps_run_sp_1_1, r0x0a
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0b
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x0c
	MOVLW	0x04
	ADDWF	r0x0a, F
	MOVLW	0x00
	ADDWFC	r0x0b, F
	MOVLW	0x00
	ADDWFC	r0x0c, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	CLRF	r0x0c
	CLRF	r0x0d
	MOVF	r0x0d, W
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 3)
	SUBWF	(_shaft_tps_run_actual_ticks_1_1 + 3), W, B
	BNZ	_00315_DS_
	MOVF	r0x0c, W
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 2)
	SUBWF	(_shaft_tps_run_actual_ticks_1_1 + 2), W, B
	BNZ	_00315_DS_
	MOVF	r0x0b, W
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 1)
	SUBWF	(_shaft_tps_run_actual_ticks_1_1 + 1), W, B
	BNZ	_00315_DS_
	MOVF	r0x0a, W
	BANKSEL	_shaft_tps_run_actual_ticks_1_1
	SUBWF	_shaft_tps_run_actual_ticks_1_1, W, B
_00315_DS_:
	BNC	_00243_DS_
	BANKSEL	_shaft_tps_run_active_counters_1_1
;	.line	440; shaft_encoder.c	--active_counters;
	DECF	_shaft_tps_run_active_counters_1_1, F, B
_00243_DS_:
;	.line	443; shaft_encoder.c	expected_ticks = ABS(sp->tps) * elapsed_time / MS_PER_SEC;
	MOVFF	_shaft_tps_run_sp_1_1, r0x0a
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0b
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x0c
	MOVLW	0x06
	ADDWF	r0x0a, F
	MOVLW	0x00
	ADDWFC	r0x0b, F
	MOVLW	0x00
	ADDWFC	r0x0c, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	BSF	STATUS, 0
	BTFSS	r0x0b, 7
	BCF	STATUS, 0
	CLRF	r0x0a
	RLCF	r0x0a, F
	MOVF	r0x0a, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x0a
	RLCF	r0x0a, F
	MOVF	r0x0a, W
	BZ	_00272_DS_
	MOVFF	_shaft_tps_run_sp_1_1, r0x0a
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0b
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x0c
	MOVLW	0x06
	ADDWF	r0x0a, F
	MOVLW	0x00
	ADDWFC	r0x0b, F
	MOVLW	0x00
	ADDWFC	r0x0c, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	BRA	_00273_DS_
_00272_DS_:
	MOVFF	_shaft_tps_run_sp_1_1, r0x0c
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0d
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x0e
	MOVLW	0x06
	ADDWF	r0x0c, F
	MOVLW	0x00
	ADDWFC	r0x0d, F
	MOVLW	0x00
	ADDWFC	r0x0e, F
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrget2
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	COMF	r0x0d, W
	MOVWF	r0x0b
	COMF	r0x0c, W
	MOVWF	r0x0a
	INFSNZ	r0x0a, F
	INCF	r0x0b, F
_00273_DS_:
	CLRF	WREG
	BTFSC	r0x0b, 7
	MOVLW	0xff
	MOVWF	r0x0c
	MOVWF	r0x0d
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 3)
	MOVF	(_shaft_tps_run_elapsed_time_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 2)
	MOVF	(_shaft_tps_run_elapsed_time_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 1)
	MOVF	(_shaft_tps_run_elapsed_time_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_elapsed_time_1_1
	MOVF	_shaft_tps_run_elapsed_time_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	__divulong
	BANKSEL	_shaft_tps_run_expected_ticks_1_1
	MOVWF	_shaft_tps_run_expected_ticks_1_1, B
	MOVFF	PRODL, (_shaft_tps_run_expected_ticks_1_1 + 1)
	MOVFF	PRODH, (_shaft_tps_run_expected_ticks_1_1 + 2)
	MOVFF	FSR0L, (_shaft_tps_run_expected_ticks_1_1 + 3)
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	_shaft_tps_run_actual_ticks_1_1
;	.line	445; shaft_encoder.c	error = expected_ticks - actual_ticks;
	MOVF	_shaft_tps_run_actual_ticks_1_1, W, B
	BANKSEL	_shaft_tps_run_expected_ticks_1_1
	SUBWF	_shaft_tps_run_expected_ticks_1_1, W, B
	MOVWF	r0x0a
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 1)
	MOVF	(_shaft_tps_run_actual_ticks_1_1 + 1), W, B
	BANKSEL	(_shaft_tps_run_expected_ticks_1_1 + 1)
	SUBWFB	(_shaft_tps_run_expected_ticks_1_1 + 1), W, B
	MOVWF	r0x0b
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 2)
	MOVF	(_shaft_tps_run_actual_ticks_1_1 + 2), W, B
	BANKSEL	(_shaft_tps_run_expected_ticks_1_1 + 2)
	SUBWFB	(_shaft_tps_run_expected_ticks_1_1 + 2), W, B
	MOVWF	r0x0c
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 3)
	MOVF	(_shaft_tps_run_actual_ticks_1_1 + 3), W, B
	BANKSEL	(_shaft_tps_run_expected_ticks_1_1 + 3)
	SUBWFB	(_shaft_tps_run_expected_ticks_1_1 + 3), W, B
	MOVWF	r0x0d
;	.line	448; shaft_encoder.c	proportional = kpn * error / kpd;
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_kpn_1_1 + 1)
	MOVF	(_shaft_tps_run_kpn_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_kpn_1_1
	MOVF	_shaft_tps_run_kpn_1_1, W, B
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	(_shaft_tps_run_kpd_1_1 + 1)
	MOVF	(_shaft_tps_run_kpd_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_kpd_1_1
	MOVF	_shaft_tps_run_kpd_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	456; shaft_encoder.c	sp->integral = (sp->integral * 2 / 3 + (kin * error)) / kid;
	MOVFF	_shaft_tps_run_sp_1_1, r0x0e
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0f
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x10
	MOVLW	0x0a
	ADDWF	r0x0e, F
	MOVLW	0x00
	ADDWFC	r0x0f, F
	MOVLW	0x00
	ADDWFC	r0x10, F
	MOVFF	_shaft_tps_run_sp_1_1, r0x11
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x12
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x13
	MOVLW	0x0a
	ADDWF	r0x11, F
	MOVLW	0x00
	ADDWFC	r0x12, F
	MOVLW	0x00
	ADDWFC	r0x13, F
	MOVFF	r0x11, FSR0L
	MOVFF	r0x12, PRODL
	MOVF	r0x13, W
	CALL	__gptrget2
	MOVWF	r0x11
	MOVFF	PRODL, r0x12
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x11
	MOVFF	PRODL, r0x12
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x11
	MOVFF	PRODL, r0x12
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_kin_1_1 + 1)
	MOVF	(_shaft_tps_run_kin_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_kin_1_1
	MOVF	_shaft_tps_run_kin_1_1, W, B
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	ADDWF	r0x11, F
	MOVF	r0x14, W
	ADDWFC	r0x12, F
	BANKSEL	(_shaft_tps_run_kid_1_1 + 1)
	MOVF	(_shaft_tps_run_kid_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_kid_1_1
	MOVF	_shaft_tps_run_kid_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x11
	MOVFF	PRODL, r0x12
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, PRODH
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrput2
;	.line	459; shaft_encoder.c	derivative = kdn * (error - sp->previous_error) / kdd;
	MOVFF	_shaft_tps_run_sp_1_1, r0x0e
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0f
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x10
	MOVLW	0x0c
	ADDWF	r0x0e, F
	MOVLW	0x00
	ADDWFC	r0x0f, F
	MOVLW	0x00
	ADDWFC	r0x10, F
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x0e
	CLRF	r0x0f
	BTFSC	r0x0e, 7
	SETF	r0x0f
	MOVF	r0x0e, W
	SUBWF	r0x0a, W
	MOVWF	r0x0e
	MOVF	r0x0f, W
	SUBWFB	r0x0b, W
; #	MOVWF	r0x0f
; #	MOVF	r0x0f, W
	MOVWF	r0x0f
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_kdn_1_1 + 1)
	MOVF	(_shaft_tps_run_kdn_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_kdn_1_1
	MOVF	_shaft_tps_run_kdn_1_1, W, B
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	(_shaft_tps_run_kdd_1_1 + 1)
	MOVF	(_shaft_tps_run_kdd_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_kdd_1_1
	MOVF	_shaft_tps_run_kdd_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	460; shaft_encoder.c	sp->previous_error = error;
	MOVFF	_shaft_tps_run_sp_1_1, r0x10
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x11
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x12
	MOVLW	0x0c
	ADDWF	r0x10, F
	MOVLW	0x00
	ADDWFC	r0x11, F
	MOVLW	0x00
	ADDWFC	r0x12, F
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput1
;	.line	463; shaft_encoder.c	new_power = ABS(sp->power) + 
	MOVFF	_shaft_tps_run_sp_1_1, r0x0a
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0b
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x10
	MOVLW	0x0d
	ADDWF	r0x0a, F
	MOVLW	0x00
	ADDWFC	r0x0b, F
	MOVLW	0x00
	ADDWFC	r0x10, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x0a
	BSF	STATUS, 0
	BTFSS	r0x0a, 7
	BCF	STATUS, 0
	CLRF	r0x0a
	RLCF	r0x0a, F
	MOVF	r0x0a, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x0a
	RLCF	r0x0a, F
	MOVF	r0x0a, W
	BZ	_00274_DS_
	MOVFF	_shaft_tps_run_sp_1_1, r0x0a
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0b
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x10
	MOVLW	0x0d
	ADDWF	r0x0a, F
	MOVLW	0x00
	ADDWFC	r0x0b, F
	MOVLW	0x00
	ADDWFC	r0x10, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x0a
	CLRF	r0x0b
	BTFSC	r0x0a, 7
	SETF	r0x0b
	BRA	_00275_DS_
_00274_DS_:
	MOVFF	_shaft_tps_run_sp_1_1, r0x10
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x11
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x12
	MOVLW	0x0d
	ADDWF	r0x10, F
	MOVLW	0x00
	ADDWFC	r0x11, F
	MOVLW	0x00
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x10
	CLRF	r0x11
	BTFSC	r0x10, 7
	SETF	r0x11
	COMF	r0x11, W
	MOVWF	r0x0b
	COMF	r0x10, W
	MOVWF	r0x0a
	INFSNZ	r0x0a, F
	INCF	r0x0b, F
_00275_DS_:
	MOVF	r0x0c, W
	ADDWF	r0x0a, F
	MOVF	r0x0d, W
	ADDWFC	r0x0b, F
;	.line	464; shaft_encoder.c	proportional + sp->integral + derivative;
	MOVFF	_shaft_tps_run_sp_1_1, r0x10
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x11
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x12
	MOVLW	0x0a
	ADDWF	r0x10, F
	MOVLW	0x00
	ADDWFC	r0x11, F
	MOVLW	0x00
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget2
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	MOVF	r0x10, W
	ADDWF	r0x0a, F
	MOVF	r0x11, W
	ADDWFC	r0x0b, F
	MOVF	r0x0e, W
	ADDWF	r0x0a, F
	MOVF	r0x0f, W
	ADDWFC	r0x0b, F
;	.line	465; shaft_encoder.c	sp->power = new_power > 127 ? 127 :
	MOVFF	_shaft_tps_run_sp_1_1, r0x10
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x11
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x12
	MOVLW	0x0d
	ADDWF	r0x10, F
	MOVLW	0x00
	ADDWFC	r0x11, F
	MOVLW	0x00
	ADDWFC	r0x12, F
	MOVF	r0x0b, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00320_DS_
	MOVLW	0x80
	SUBWF	r0x0a, W
_00320_DS_:
	BNC	_00276_DS_
	MOVLW	0x7f
	MOVWF	r0x13
	CLRF	r0x14
	BRA	_00277_DS_
_00276_DS_:
;	.line	466; shaft_encoder.c	(new_power < 0 ? 0 : new_power);
	BSF	STATUS, 0
	BTFSS	r0x0b, 7
	BCF	STATUS, 0
	BNC	_00278_DS_
	CLRF	r0x15
	CLRF	r0x16
	BRA	_00279_DS_
_00278_DS_:
	MOVFF	r0x0a, r0x15
	MOVFF	r0x0b, r0x16
_00279_DS_:
	MOVFF	r0x15, r0x13
	MOVFF	r0x16, r0x14
_00277_DS_:
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput1
;	.line	467; shaft_encoder.c	if ( sp->tps < 0 )
	MOVFF	_shaft_tps_run_sp_1_1, r0x10
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x11
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x12
	MOVLW	0x06
	ADDWF	r0x10, F
	MOVLW	0x00
	ADDWFC	r0x11, F
	MOVLW	0x00
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget2
	MOVWF	r0x10
	MOVFF	PRODL, r0x11
	BSF	STATUS, 0
	BTFSS	r0x11, 7
	BCF	STATUS, 0
	BNC	_00245_DS_
;	.line	468; shaft_encoder.c	sp->power = -sp->power;
	MOVFF	_shaft_tps_run_sp_1_1, r0x10
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x11
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x12
	MOVLW	0x0d
	ADDWF	r0x10, F
	MOVLW	0x00
	ADDWFC	r0x11, F
	MOVLW	0x00
	ADDWFC	r0x12, F
	MOVFF	_shaft_tps_run_sp_1_1, r0x13
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x14
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x15
	MOVLW	0x0d
	ADDWF	r0x13, F
	MOVLW	0x00
	ADDWFC	r0x14, F
	MOVLW	0x00
	ADDWFC	r0x15, F
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget1
	MOVWF	r0x13
	NEGF	r0x13
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput1
_00245_DS_:
;	.line	470; shaft_encoder.c	DPRINTF("t: %6lu  m: %u  et: %ld  at: %ld  p: %d  i: %d  d: %d  np: %d %d\n",
	MOVFF	_shaft_tps_run_sp_1_1, r0x10
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x11
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x12
	MOVLW	0x0d
	ADDWF	r0x10, F
	MOVLW	0x00
	ADDWFC	r0x11, F
	MOVLW	0x00
	ADDWFC	r0x12, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x10
	CLRF	r0x11
	BTFSC	r0x10, 7
	SETF	r0x11
	MOVFF	_shaft_tps_run_sp_1_1, r0x12
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x13
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x14
	MOVLW	0x0a
	ADDWF	r0x12, F
	MOVLW	0x00
	ADDWFC	r0x13, F
	MOVLW	0x00
	ADDWFC	r0x14, F
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrget2
	MOVWF	r0x12
	MOVFF	PRODL, r0x13
	MOVFF	_shaft_tps_run_sp_1_1, r0x14
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x15
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x16
	MOVLW	0x08
	ADDWF	r0x14, F
	MOVLW	0x00
	ADDWFC	r0x15, F
	MOVLW	0x00
	ADDWFC	r0x16, F
	MOVFF	r0x14, FSR0L
	MOVFF	r0x15, PRODL
	MOVF	r0x16, W
	CALL	__gptrget1
	ANDLW	0x07
	MOVWF	r0x14
	CLRF	r0x15
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 3)
	MOVF	(_shaft_tps_run_actual_ticks_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 2)
	MOVF	(_shaft_tps_run_actual_ticks_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_actual_ticks_1_1 + 1)
	MOVF	(_shaft_tps_run_actual_ticks_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_actual_ticks_1_1
	MOVF	_shaft_tps_run_actual_ticks_1_1, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_expected_ticks_1_1 + 3)
	MOVF	(_shaft_tps_run_expected_ticks_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_expected_ticks_1_1 + 2)
	MOVF	(_shaft_tps_run_expected_ticks_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_expected_ticks_1_1 + 1)
	MOVF	(_shaft_tps_run_expected_ticks_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_expected_ticks_1_1
	MOVF	_shaft_tps_run_expected_ticks_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 3)
	MOVF	(_shaft_tps_run_elapsed_time_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 2)
	MOVF	(_shaft_tps_run_elapsed_time_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_shaft_tps_run_elapsed_time_1_1 + 1)
	MOVF	(_shaft_tps_run_elapsed_time_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_shaft_tps_run_elapsed_time_1_1
	MOVF	_shaft_tps_run_elapsed_time_1_1, W, B
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x1b
	ADDWF	FSR1L, F
;	.line	474; shaft_encoder.c	pwm_write(sp->motor_port, sp->power);
	MOVFF	_shaft_tps_run_sp_1_1, r0x0a
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0b
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x0c
	MOVLW	0x08
	ADDWF	r0x0a, F
	MOVLW	0x00
	ADDWFC	r0x0b, F
	MOVLW	0x00
	ADDWFC	r0x0c, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget1
	ANDLW	0x07
	MOVWF	r0x0a
	MOVFF	_shaft_tps_run_sp_1_1, r0x0b
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x0c
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x0d
	MOVLW	0x0d
	ADDWF	r0x0b, F
	MOVLW	0x00
	ADDWFC	r0x0c, F
	MOVLW	0x00
	ADDWFC	r0x0d, F
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
; #	MOVWF	r0x0b
; #	MOVF	r0x0b, W
	MOVWF	r0x0b
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	432; shaft_encoder.c	for (sp = shafts + count - 1; sp >= shafts; --sp)
	MOVLW	0xf2
	BANKSEL	_shaft_tps_run_sp_1_1
	ADDWF	_shaft_tps_run_sp_1_1, F, B
	MOVLW	0xff
	BANKSEL	(_shaft_tps_run_sp_1_1 + 1)
	ADDWFC	(_shaft_tps_run_sp_1_1 + 1), F, B
	MOVLW	0xff
	BANKSEL	(_shaft_tps_run_sp_1_1 + 2)
	ADDWFC	(_shaft_tps_run_sp_1_1 + 2), F, B
	GOTO	_00258_DS_
_00261_DS_:
;	.line	476; shaft_encoder.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
_00250_DS_:
	BANKSEL	_shaft_tps_run_active_timers_1_1
;	.line	478; shaft_encoder.c	}   while ( active_timers || active_counters );
	MOVF	_shaft_tps_run_active_timers_1_1, W, B
	BTFSS	STATUS, 2
	GOTO	_00249_DS_
	BANKSEL	_shaft_tps_run_active_counters_1_1
	MOVF	_shaft_tps_run_active_counters_1_1, W, B
	BTFSS	STATUS, 2
	GOTO	_00249_DS_
;	.line	480; shaft_encoder.c	for (sp = shafts; sp < shafts + count; ++sp)
	MOVFF	r0x00, _shaft_tps_run_sp_1_1
	MOVFF	r0x01, (_shaft_tps_run_sp_1_1 + 1)
	MOVFF	r0x02, (_shaft_tps_run_sp_1_1 + 2)
	MOVFF	r0x04, r0x00
	MOVFF	r0x05, r0x01
	MOVFF	r0x06, r0x02
_00262_DS_:
	BANKSEL	(_shaft_tps_run_sp_1_1 + 2)
	MOVF	(_shaft_tps_run_sp_1_1 + 2), W, B
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x02, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00322_DS_
	MOVF	r0x01, W
	BANKSEL	(_shaft_tps_run_sp_1_1 + 1)
	SUBWF	(_shaft_tps_run_sp_1_1 + 1), W, B
	BNZ	_00322_DS_
	MOVF	r0x00, W
	BANKSEL	_shaft_tps_run_sp_1_1
	SUBWF	_shaft_tps_run_sp_1_1, W, B
_00322_DS_:
	BTFSC	STATUS, 0
	BRA	_00265_DS_
;	.line	481; shaft_encoder.c	if ( !sp->leave_encoder_on )
	MOVFF	_shaft_tps_run_sp_1_1, r0x03
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x04
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x05
	MOVLW	0x08
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	SWAPF	WREG, W
	RLNCF	WREG, W
	ANDLW	0x01
	MOVWF	r0x03
	MOVF	r0x03, W
	BNZ	_00264_DS_
;	.line	482; shaft_encoder.c	shaft_encoder_disable(sp->interrupt_port);
	MOVFF	_shaft_tps_run_sp_1_1, r0x03
	MOVFF	(_shaft_tps_run_sp_1_1 + 1), r0x04
	MOVFF	(_shaft_tps_run_sp_1_1 + 2), r0x05
	MOVLW	0x08
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	SWAPF	WREG, W
	ANDLW	0x0f
; #	MOVWF	r0x03
; #	MOVF	r0x03, W
	MOVWF	r0x03
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_disable
	INCF	FSR1L, F
_00264_DS_:
;	.line	480; shaft_encoder.c	for (sp = shafts; sp < shafts + count; ++sp)
	MOVLW	0x0e
	BANKSEL	_shaft_tps_run_sp_1_1
	ADDWF	_shaft_tps_run_sp_1_1, F, B
	MOVLW	0x00
	BANKSEL	(_shaft_tps_run_sp_1_1 + 1)
	ADDWFC	(_shaft_tps_run_sp_1_1 + 1), F, B
	MOVLW	0x00
	BANKSEL	(_shaft_tps_run_sp_1_1 + 2)
	ADDWFC	(_shaft_tps_run_sp_1_1 + 2), F, B
	BRA	_00262_DS_
_00265_DS_:
;	.line	483; shaft_encoder.c	return OV_OK;
	CLRF	WREG
_00266_DS_:
	MOVFF	PREINC1, r0x16
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
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
S_shaft_encoder__shaft_encoder_read_quad	code
_shaft_encoder_read_quad:
;	.line	280; shaft_encoder.c	int     shaft_encoder_read_quad(unsigned char interrupt_port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	283; shaft_encoder.c	if ( ! VALID_INTERRUPT_PORT(interrupt_port) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00222_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BNC	_00223_DS_
_00222_DS_:
;	.line	284; shaft_encoder.c	return OV_BAD_PARAM;
	SETF	PRODL
	MOVLW	0x80
	BRA	_00225_DS_
_00223_DS_:
;	.line	286; shaft_encoder.c	return (int)Encoder_ticks[interrupt_port-1];
	DECF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x01
	MOVLW	LOW(_Encoder_ticks)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Encoder_ticks)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
_00225_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_shaft_encoder__shaft_encoder_read_std	code
_shaft_encoder_read_std:
;	.line	251; shaft_encoder.c	unsigned int   shaft_encoder_read_std(unsigned char interrupt_port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	254; shaft_encoder.c	if ( ! VALID_INTERRUPT_PORT(interrupt_port) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00210_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BNC	_00211_DS_
_00210_DS_:
;	.line	255; shaft_encoder.c	return OV_BAD_PARAM;
	SETF	PRODL
	MOVLW	0x80
	BRA	_00213_DS_
_00211_DS_:
;	.line	257; shaft_encoder.c	return Encoder_ticks[interrupt_port-1];
	DECF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x01
	MOVLW	LOW(_Encoder_ticks)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Encoder_ticks)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
_00213_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_shaft_encoder__shaft_encoder_reset	code
_shaft_encoder_reset:
;	.line	224; shaft_encoder.c	status_t    shaft_encoder_reset(unsigned char interrupt_port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	227; shaft_encoder.c	if ( ! VALID_INTERRUPT_PORT(interrupt_port) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00198_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BNC	_00199_DS_
_00198_DS_:
;	.line	228; shaft_encoder.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00201_DS_
_00199_DS_:
;	.line	230; shaft_encoder.c	Encoder_ticks[interrupt_port-1] = 0;
	DECF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x01
	MOVLW	LOW(_Encoder_ticks)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Encoder_ticks)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	231; shaft_encoder.c	return OV_OK;
	CLRF	WREG
_00201_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_shaft_encoder__shaft_encoder_disable	code
_shaft_encoder_disable:
;	.line	169; shaft_encoder.c	status_t    shaft_encoder_disable(unsigned char interrupt_port)
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
;	.line	175; shaft_encoder.c	if ( ! VALID_INTERRUPT_PORT(interrupt_port) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BTG	STATUS, 0
	CLRF	r0x01
	RLCF	r0x01, F
	MOVF	r0x01, W
	BNZ	_00163_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	CLRF	r0x02
	RLCF	r0x02, F
	MOVF	r0x02, W
	BZ	_00164_DS_
_00163_DS_:
;	.line	176; shaft_encoder.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00179_DS_
_00164_DS_:
;	.line	178; shaft_encoder.c	CLR_INTERRUPT_PORT_IN_USE(interrupt_port);
	MOVFF	r0x00, r0x03
	CLRF	r0x04
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVLW	LOW(_Interrupt_port_in_use)
	ADDWF	r0x03, F
	MOVLW	HIGH(_Interrupt_port_in_use)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
;	.line	179; shaft_encoder.c	CLR_ENCODER_ON_IPORT(interrupt_port);
	DECF	r0x00, F
	MOVLW	LOW(_Encoder_on_iport)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_Encoder_on_iport)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
;	.line	181; shaft_encoder.c	switch(interrupt_port)
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00174_DS_
	MOVF	r0x02, W
	BTFSS	STATUS, 2
	BRA	_00174_DS_
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	CLRF	r0x07
	RLCF	r0x00, W
	RLCF	r0x07, F
	RLCF	WREG, W
	RLCF	r0x07, F
	ANDLW	0xfc
	MOVWF	r0x06
	MOVLW	UPPER(_00192_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00192_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00192_DS_)
	ADDWF	r0x06, F
	MOVF	r0x07, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x06, W
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVWF	PCL
_00192_DS_:
	GOTO	_00166_DS_
	GOTO	_00167_DS_
	GOTO	_00171_DS_
	GOTO	_00171_DS_
	GOTO	_00171_DS_
	GOTO	_00171_DS_
_00166_DS_:
;	.line	184; shaft_encoder.c	INTCON3bits.INT2IE = 0; /* Disable INTERRUPT_IN2 */
	BCF	_INTCON3bits, 4
;	.line	185; shaft_encoder.c	break;
	BRA	_00174_DS_
_00167_DS_:
;	.line	187; shaft_encoder.c	INTCON3bits.INT3IE = 0; /* Disable INTERRUPT_IN2 */
	BCF	_INTCON3bits, 5
;	.line	188; shaft_encoder.c	break;
	BRA	_00174_DS_
_00171_DS_:
;	.line	197; shaft_encoder.c	count = 0;
	CLRF	r0x00
	CLRF	r0x01
;	.line	198; shaft_encoder.c	for (p=3; p<6; ++p)
	MOVLW	0x03
	MOVWF	r0x02
	CLRF	r0x03
_00175_DS_:
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00193_DS_
	MOVLW	0x06
	SUBWF	r0x02, W
_00193_DS_:
	BC	_00178_DS_
;	.line	199; shaft_encoder.c	count += INTERRUPT_PORT_IN_USE(p);
	MOVF	r0x02, W
	ADDLW	0xff
	MOVWF	r0x04
	MOVLW	0xff
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVLW	LOW(_Interrupt_port_in_use)
	ADDWF	r0x04, F
	MOVLW	HIGH(_Interrupt_port_in_use)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
	CLRF	r0x05
	MOVF	r0x04, W
	ADDWF	r0x00, F
	MOVF	r0x05, W
	ADDWFC	r0x01, F
;	.line	198; shaft_encoder.c	for (p=3; p<6; ++p)
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00175_DS_
_00178_DS_:
;	.line	200; shaft_encoder.c	if ( count == 0 )
	MOVF	r0x00, W
; #	IORWF	r0x01, W
; #	BTFSS	STATUS, 2
; #	GOTO	_00174_DS_
; #	BCF	_INTCONbits, 3
; #	CLRF	WREG
; #; info ==> [localregs] exit begin

;	.line	202; shaft_encoder.c	INTCONbits.RBIE = 0;    /* Disable RB interrupts */
	IORWF	r0x01, W
;	.line	206; shaft_encoder.c	return OV_OK;
	BTFSC	STATUS, 2
	BCF	_INTCONbits, 3
_00174_DS_:
	CLRF	WREG
_00179_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_shaft_encoder__shaft_encoder_enable	code
_shaft_encoder_enable:
;	.line	113; shaft_encoder.c	status_t    shaft_encoder_enable(unsigned char interrupt_port)
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
;	.line	116; shaft_encoder.c	if ( ! VALID_INTERRUPT_PORT(interrupt_port) ||
	MOVLW	0x01
	SUBWF	r0x00, W
	BTG	STATUS, 0
	CLRF	r0x01
	RLCF	r0x01, F
	MOVF	r0x01, W
	BNZ	_00137_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	CLRF	r0x02
	RLCF	r0x02, F
	MOVF	r0x02, W
	BNZ	_00137_DS_
;	.line	117; shaft_encoder.c	INTERRUPT_PORT_IN_USE(interrupt_port) )
	MOVFF	r0x00, r0x03
	CLRF	r0x04
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVLW	LOW(_Interrupt_port_in_use)
	ADDWF	r0x03, F
	MOVLW	HIGH(_Interrupt_port_in_use)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x05
	MOVF	r0x05, W
	BZ	_00138_DS_
_00137_DS_:
;	.line	118; shaft_encoder.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00148_DS_
_00138_DS_:
;	.line	120; shaft_encoder.c	SET_INTERRUPT_PORT_IN_USE(interrupt_port);
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
;	.line	121; shaft_encoder.c	Encoder_ticks[interrupt_port-1] = 0;
	DECF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	LOW(_Encoder_ticks)
	ADDWF	r0x03, F
	MOVLW	HIGH(_Encoder_ticks)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	123; shaft_encoder.c	switch(interrupt_port)
	MOVF	r0x01, W
	BNZ	_00147_DS_
	MOVF	r0x02, W
	BNZ	_00147_DS_
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	CLRF	r0x07
	RLCF	r0x00, W
	RLCF	r0x07, F
	RLCF	WREG, W
	RLCF	r0x07, F
	ANDLW	0xfc
	MOVWF	r0x06
	MOVLW	UPPER(_00158_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00158_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00158_DS_)
	ADDWF	r0x06, F
	MOVF	r0x07, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x06, W
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVWF	PCL
_00158_DS_:
	GOTO	_00141_DS_
	GOTO	_00142_DS_
	GOTO	_00146_DS_
	GOTO	_00146_DS_
	GOTO	_00146_DS_
	GOTO	_00146_DS_
_00141_DS_:
;	.line	127; shaft_encoder.c	INTCON2bits.INTEDG2 = 1;  /* INTERRUPT_IN1 rising edge triggered */
	BSF	_INTCON2bits, 4
;	.line	128; shaft_encoder.c	INTCON3bits.INT2IP = 0;   /* INTERRUPT_IN1 low priority */
	BCF	_INTCON3bits, 7
;	.line	129; shaft_encoder.c	INTCON3bits.INT2IF = 0;   /* Clear flag for INTERRUPT_IN1 */
	BCF	_INTCON3bits, 1
;	.line	130; shaft_encoder.c	INTCON3bits.INT2IE = 1;   /* Enable INTERRUPT_IN1 */
	BSF	_INTCON3bits, 4
;	.line	131; shaft_encoder.c	break;
	BRA	_00147_DS_
_00142_DS_:
;	.line	134; shaft_encoder.c	INTCON2bits.INTEDG3 = 1;  /* INTERRUPT_IN2 rising edge triggered */
	BSF	_INTCON2bits, 3
;	.line	135; shaft_encoder.c	INTCON2bits.INT3P = 0;    /* INTERRUPT_IN2 low priority */
	BCF	_INTCON2bits, 1
;	.line	136; shaft_encoder.c	INTCON3bits.INT3IF = 0;   /* Clear flag for INTERRUPT_IN2 */
	BCF	_INTCON3bits, 2
;	.line	137; shaft_encoder.c	INTCON3bits.INT3IE = 1;   /* Enable INTERRUPT_IN2 */
	BSF	_INTCON3bits, 5
;	.line	138; shaft_encoder.c	break;
	BRA	_00147_DS_
_00146_DS_:
;	.line	145; shaft_encoder.c	INTCON2bits.RBIP = 0;   /* Low priority */
	BCF	_INTCON2bits, 0
;	.line	146; shaft_encoder.c	INTCONbits.RBIF = 0;    /* Clear interrupt flag */
	BCF	_INTCONbits, 0
;	.line	147; shaft_encoder.c	INTCONbits.RBIE = 1;    /* Enable interrupts */
	BSF	_INTCONbits, 3
_00147_DS_:
;	.line	150; shaft_encoder.c	return OV_OK;
	CLRF	WREG
_00148_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_shaft_encoder__shaft_encoder_enable_quad	code
_shaft_encoder_enable_quad:
;	.line	94; shaft_encoder.c	status_t    shaft_encoder_enable_quad(unsigned char interrupt_port,
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	100; shaft_encoder.c	if ( ! VALID_INTERRUPT_PORT(interrupt_port) ||
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00112_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BC	_00112_DS_
;	.line	101; shaft_encoder.c	! VALID_DIGITAL_INPUT_PORT(input_port) )
	MOVF	r0x01, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00112_DS_
	MOVLW	0x11
	SUBWF	r0x01, W
	BC	_00112_DS_
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_io_get_direction
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	XORLW	0x01
	BZ	_00113_DS_
_00112_DS_:
;	.line	102; shaft_encoder.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00120_DS_
_00113_DS_:
;	.line	104; shaft_encoder.c	if ( (stat = shaft_encoder_enable(interrupt_port)) == OV_OK)
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_enable
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVFF	r0x02, r0x03
	MOVF	r0x02, W
	BNZ	_00119_DS_
;	.line	106; shaft_encoder.c	SET_ENCODER_ON_IPORT(interrupt_port, ENCODER_QUAD);
	DECF	r0x00, F
	MOVLW	LOW(_Encoder_on_iport)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x04
	MOVLW	HIGH(_Encoder_on_iport)
	ADDWFC	r0x04, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x02
	MOVWF	INDF0
;	.line	107; shaft_encoder.c	Quad_input_port[(interrupt_port)-1] = input_port;
	CLRF	r0x02
	MOVLW	LOW(_Quad_input_port)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Quad_input_port)
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x01, INDF0
_00119_DS_:
;	.line	109; shaft_encoder.c	return stat;
	MOVF	r0x03, W
_00120_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_shaft_encoder__shaft_encoder_enable_std	code
_shaft_encoder_enable_std:
;	.line	62; shaft_encoder.c	status_t    shaft_encoder_enable_std(unsigned char interrupt_port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	67; shaft_encoder.c	if ( (stat = shaft_encoder_enable(interrupt_port)) == OV_OK )
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_enable
	MOVWF	r0x01
	INCF	FSR1L, F
	MOVFF	r0x01, r0x02
	MOVF	r0x01, W
	BNZ	_00106_DS_
;	.line	68; shaft_encoder.c	SET_ENCODER_ON_IPORT(interrupt_port, ENCODER_STD);
	DECF	r0x00, F
	CLRF	r0x01
	MOVLW	LOW(_Encoder_on_iport)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Encoder_on_iport)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
_00106_DS_:
;	.line	69; shaft_encoder.c	return stat;
	MOVF	r0x02, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x74, 0x3a, 0x20, 0x25, 0x36, 0x6c, 0x75, 0x20, 0x20, 0x6d, 0x3a, 0x20
	DB	0x25, 0x75, 0x20, 0x20, 0x65, 0x74, 0x3a, 0x20, 0x25, 0x6c, 0x64, 0x20
	DB	0x20, 0x61, 0x74, 0x3a, 0x20, 0x25, 0x6c, 0x64, 0x20, 0x20, 0x70, 0x3a
	DB	0x20, 0x25, 0x64, 0x20, 0x20, 0x69, 0x3a, 0x20, 0x25, 0x64, 0x20, 0x20
	DB	0x64, 0x3a, 0x20, 0x25, 0x64, 0x20, 0x20, 0x6e, 0x70, 0x3a, 0x20, 0x25
	DB	0x64, 0x20, 0x25, 0x64, 0x0a, 0x00
; ; Starting pCode block
__str_1:
	DB	0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x0a, 0x00


; Statistics:
; code size:	 5248 (0x1480) bytes ( 4.00%)
;           	 2624 (0x0a40) words
; udata size:	   21 (0x0015) bytes ( 1.17%)
; access size:	   23 (0x0017) bytes


	end
