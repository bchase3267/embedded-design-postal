;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Sat Nov 10 17:01:25 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _Timer_allocated
	global _timer0_read32
	global _timer1_read32
	global _timer2_read32
	global _timer3_read32
	global _timer4_read32
	global _timer0_init

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern _Sonar_data_available
	extern _Sonar_on_iport
	extern _Timer0_overflows
	extern _Timer1_overflows
	extern _Timer2_overflows
	extern _Timer3_overflows
	extern _Timer4_overflows
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
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_timer0_init_timer0_running_1_1	db	0x00


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

udata_timer_0	udata
_Timer_allocated	res	4

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_timer__timer0_init	code
_timer0_init:
;	.line	215; timer.c	void    timer0_init(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	BANKSEL	_timer0_init_timer0_running_1_1
;	.line	220; timer.c	if ( ! timer0_running )
	MOVF	_timer0_init_timer0_running_1_1, W, B
	BNZ	_00156_DS_
;	.line	223; timer.c	TIMER0_RESET();
	CLRF	_T0CON
	BANKSEL	_Timer0_overflows
	CLRF	_Timer0_overflows, B
	BANKSEL	(_Timer0_overflows + 1)
	CLRF	(_Timer0_overflows + 1), B
;	.line	229; timer.c	TIMER0_SET_WIDTH_16();
	BCF	_T0CON, 6
;	.line	236; timer.c	TIMER0_SET_PRESCALE(TIMER0_PRESCALE_MASK_16);
	MOVLW	0xf0
	ANDWF	_T0CON, W
	MOVWF	r0x00
	MOVLW	0x03
	IORWF	r0x00, W
	MOVWF	_T0CON
;	.line	242; timer.c	TIMER0_ENABLE_INTERRUPTS();
	BCF	_INTCON2bits, 2
	BSF	_INTCONbits, 5
	BSF	_INTCONbits, 6
	BSF	_INTCONbits, 7
;	.line	244; timer.c	TIMER0_CLEAR_INTERRUPT_FLAG();
	BCF	_INTCONbits, 2
;	.line	245; timer.c	TIMER0_START();
	BSF	_T0CON, 7
;	.line	246; timer.c	timer0_running = 1;
	MOVLW	0x01
	BANKSEL	_timer0_init_timer0_running_1_1
	MOVWF	_timer0_init_timer0_running_1_1, B
_00156_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__timer4_read32	code
_timer4_read32:
;	.line	195; timer.c	unsigned long   timer4_read32(void)
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
;	.line	200; timer.c	TIMER4_READ8(low);
	MOVFF	_TMR4, r0x00
	CLRF	r0x01
	BANKSEL	(_Timer4_overflows + 2)
;	.line	201; timer.c	return low | (Timer4_overflows << 8);
	MOVF	(_Timer4_overflows + 2), W, B
	MOVWF	r0x05
	BANKSEL	(_Timer4_overflows + 1)
	MOVF	(_Timer4_overflows + 1), W, B
	MOVWF	r0x04
	BANKSEL	_Timer4_overflows
	MOVF	_Timer4_overflows, W, B
	MOVWF	r0x03
	CLRF	r0x02
	CLRF	r0x06
	CLRF	r0x07
	MOVF	r0x00, W
	IORWF	r0x02, F
	MOVF	r0x01, W
	IORWF	r0x03, F
	MOVF	r0x06, W
	IORWF	r0x04, F
	MOVF	r0x07, W
	IORWF	r0x05, F
	MOVFF	r0x05, FSR0L
	MOVFF	r0x04, PRODH
	MOVFF	r0x03, PRODL
	MOVF	r0x02, W
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
S_timer__timer3_read32	code
_timer3_read32:
;	.line	170; timer.c	unsigned long   timer3_read32(void)
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
;	.line	175; timer.c	TIMER3_READ16(low0);
	MOVFF	_TMR3L, r0x00
	CLRF	r0x01
	MOVFF	_TMR3H, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	MOVWF	r0x05
	CLRF	r0x04
	MOVF	r0x04, W
	IORWF	r0x00, F
	MOVF	r0x05, W
	IORWF	r0x01, F
;	.line	176; timer.c	high = Timer3_overflows;
	MOVFF	_Timer3_overflows, r0x02
	MOVFF	(_Timer3_overflows + 1), r0x03
;	.line	177; timer.c	TIMER3_READ16(low1);
	MOVFF	_TMR3L, r0x04
	CLRF	r0x05
	MOVFF	_TMR3H, r0x06
	CLRF	r0x07
	MOVF	r0x06, W
	MOVWF	r0x09
	CLRF	r0x08
	MOVF	r0x08, W
	IORWF	r0x04, F
	MOVF	r0x09, W
	IORWF	r0x05, F
;	.line	188; timer.c	if ( low1 < low0 )
	MOVF	r0x01, W
	SUBWF	r0x05, W
	BNZ	_00144_DS_
	MOVF	r0x00, W
	SUBWF	r0x04, W
_00144_DS_:
	BC	_00137_DS_
;	.line	189; timer.c	return low1 | ((unsigned long)Timer3_overflows << 16);
	MOVFF	_Timer3_overflows, r0x06
	MOVFF	(_Timer3_overflows + 1), r0x07
	CLRF	r0x08
	CLRF	r0x09
	MOVF	r0x07, W
	MOVWF	r0x0d
	MOVF	r0x06, W
	MOVWF	r0x0c
	CLRF	r0x0a
	CLRF	r0x0b
	CLRF	r0x0e
	CLRF	r0x0f
	MOVF	r0x04, W
	IORWF	r0x0a, F
	MOVF	r0x05, W
	IORWF	r0x0b, F
	MOVF	r0x0e, W
	IORWF	r0x0c, F
	MOVF	r0x0f, W
	IORWF	r0x0d, F
	MOVFF	r0x0d, FSR0L
	MOVFF	r0x0c, PRODH
	MOVFF	r0x0b, PRODL
	MOVF	r0x0a, W
	BRA	_00139_DS_
_00137_DS_:
;	.line	191; timer.c	return low0 | ((unsigned long)high << 16);
	CLRF	r0x04
	CLRF	r0x05
	MOVF	r0x03, W
	MOVWF	r0x09
	MOVF	r0x02, W
	MOVWF	r0x08
	CLRF	r0x06
	CLRF	r0x07
	CLRF	r0x0a
	CLRF	r0x0b
	MOVF	r0x00, W
	IORWF	r0x06, F
	MOVF	r0x01, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
	MOVF	r0x0b, W
	IORWF	r0x09, F
	MOVFF	r0x09, FSR0L
	MOVFF	r0x08, PRODH
	MOVFF	r0x07, PRODL
	MOVF	r0x06, W
_00139_DS_:
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
S_timer__timer2_read32	code
_timer2_read32:
;	.line	160; timer.c	unsigned long   timer2_read32(void)
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
;	.line	165; timer.c	TIMER2_READ8(low);
	MOVFF	_TMR2, r0x00
	CLRF	r0x01
	BANKSEL	(_Timer2_overflows + 2)
;	.line	166; timer.c	return low | (Timer2_overflows << 8);
	MOVF	(_Timer2_overflows + 2), W, B
	MOVWF	r0x05
	BANKSEL	(_Timer2_overflows + 1)
	MOVF	(_Timer2_overflows + 1), W, B
	MOVWF	r0x04
	BANKSEL	_Timer2_overflows
	MOVF	_Timer2_overflows, W, B
	MOVWF	r0x03
	CLRF	r0x02
	CLRF	r0x06
	CLRF	r0x07
	MOVF	r0x00, W
	IORWF	r0x02, F
	MOVF	r0x01, W
	IORWF	r0x03, F
	MOVF	r0x06, W
	IORWF	r0x04, F
	MOVF	r0x07, W
	IORWF	r0x05, F
	MOVFF	r0x05, FSR0L
	MOVFF	r0x04, PRODH
	MOVFF	r0x03, PRODL
	MOVF	r0x02, W
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
S_timer__timer1_read32	code
_timer1_read32:
;	.line	135; timer.c	unsigned long   timer1_read32(void)
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
;	.line	140; timer.c	TIMER1_READ16(low0);
	MOVFF	_TMR1L, r0x00
	CLRF	r0x01
	MOVFF	_TMR1H, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	MOVWF	r0x05
	CLRF	r0x04
	MOVF	r0x04, W
	IORWF	r0x00, F
	MOVF	r0x05, W
	IORWF	r0x01, F
;	.line	141; timer.c	high = Timer1_overflows;
	MOVFF	_Timer1_overflows, r0x02
	MOVFF	(_Timer1_overflows + 1), r0x03
;	.line	142; timer.c	TIMER1_READ16(low1);
	MOVFF	_TMR1L, r0x04
	CLRF	r0x05
	MOVFF	_TMR1H, r0x06
	CLRF	r0x07
	MOVF	r0x06, W
	MOVWF	r0x09
	CLRF	r0x08
	MOVF	r0x08, W
	IORWF	r0x04, F
	MOVF	r0x09, W
	IORWF	r0x05, F
;	.line	153; timer.c	if ( low1 < low0 )
	MOVF	r0x01, W
	SUBWF	r0x05, W
	BNZ	_00126_DS_
	MOVF	r0x00, W
	SUBWF	r0x04, W
_00126_DS_:
	BC	_00119_DS_
;	.line	154; timer.c	return low1 | ((unsigned long)Timer1_overflows << 16);
	MOVFF	_Timer1_overflows, r0x06
	MOVFF	(_Timer1_overflows + 1), r0x07
	CLRF	r0x08
	CLRF	r0x09
	MOVF	r0x07, W
	MOVWF	r0x0d
	MOVF	r0x06, W
	MOVWF	r0x0c
	CLRF	r0x0a
	CLRF	r0x0b
	CLRF	r0x0e
	CLRF	r0x0f
	MOVF	r0x04, W
	IORWF	r0x0a, F
	MOVF	r0x05, W
	IORWF	r0x0b, F
	MOVF	r0x0e, W
	IORWF	r0x0c, F
	MOVF	r0x0f, W
	IORWF	r0x0d, F
	MOVFF	r0x0d, FSR0L
	MOVFF	r0x0c, PRODH
	MOVFF	r0x0b, PRODL
	MOVF	r0x0a, W
	BRA	_00121_DS_
_00119_DS_:
;	.line	156; timer.c	return low0 | ((unsigned long)high << 16);
	CLRF	r0x04
	CLRF	r0x05
	MOVF	r0x03, W
	MOVWF	r0x09
	MOVF	r0x02, W
	MOVWF	r0x08
	CLRF	r0x06
	CLRF	r0x07
	CLRF	r0x0a
	CLRF	r0x0b
	MOVF	r0x00, W
	IORWF	r0x06, F
	MOVF	r0x01, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
	MOVF	r0x0b, W
	IORWF	r0x09, F
	MOVFF	r0x09, FSR0L
	MOVFF	r0x08, PRODH
	MOVFF	r0x07, PRODL
	MOVF	r0x06, W
_00121_DS_:
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
S_timer__timer0_read32	code
_timer0_read32:
;	.line	110; timer.c	unsigned long   timer0_read32(void)
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
;	.line	115; timer.c	TIMER0_READ16(low0);
	MOVFF	_TMR0L, r0x00
	CLRF	r0x01
	MOVFF	_TMR0H, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	MOVWF	r0x05
	CLRF	r0x04
	MOVF	r0x04, W
	IORWF	r0x00, F
	MOVF	r0x05, W
	IORWF	r0x01, F
;	.line	116; timer.c	high = Timer0_overflows;
	MOVFF	_Timer0_overflows, r0x02
	MOVFF	(_Timer0_overflows + 1), r0x03
;	.line	117; timer.c	TIMER0_READ16(low1);
	MOVFF	_TMR0L, r0x04
	CLRF	r0x05
	MOVFF	_TMR0H, r0x06
	CLRF	r0x07
	MOVF	r0x06, W
	MOVWF	r0x09
	CLRF	r0x08
	MOVF	r0x08, W
	IORWF	r0x04, F
	MOVF	r0x09, W
	IORWF	r0x05, F
;	.line	128; timer.c	if ( low1 < low0 )
	MOVF	r0x01, W
	SUBWF	r0x05, W
	BNZ	_00113_DS_
	MOVF	r0x00, W
	SUBWF	r0x04, W
_00113_DS_:
	BC	_00106_DS_
;	.line	129; timer.c	return low1 | ((unsigned long)Timer0_overflows << 16);
	MOVFF	_Timer0_overflows, r0x06
	MOVFF	(_Timer0_overflows + 1), r0x07
	CLRF	r0x08
	CLRF	r0x09
	MOVF	r0x07, W
	MOVWF	r0x0d
	MOVF	r0x06, W
	MOVWF	r0x0c
	CLRF	r0x0a
	CLRF	r0x0b
	CLRF	r0x0e
	CLRF	r0x0f
	MOVF	r0x04, W
	IORWF	r0x0a, F
	MOVF	r0x05, W
	IORWF	r0x0b, F
	MOVF	r0x0e, W
	IORWF	r0x0c, F
	MOVF	r0x0f, W
	IORWF	r0x0d, F
	MOVFF	r0x0d, FSR0L
	MOVFF	r0x0c, PRODH
	MOVFF	r0x0b, PRODL
	MOVF	r0x0a, W
	BRA	_00108_DS_
_00106_DS_:
;	.line	131; timer.c	return low0 | ((unsigned long)high << 16);
	CLRF	r0x04
	CLRF	r0x05
	MOVF	r0x03, W
	MOVWF	r0x09
	MOVF	r0x02, W
	MOVWF	r0x08
	CLRF	r0x06
	CLRF	r0x07
	CLRF	r0x0a
	CLRF	r0x0b
	MOVF	r0x00, W
	IORWF	r0x06, F
	MOVF	r0x01, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
	MOVF	r0x0b, W
	IORWF	r0x09, F
	MOVFF	r0x09, FSR0L
	MOVFF	r0x08, PRODH
	MOVFF	r0x07, PRODL
	MOVF	r0x06, W
_00108_DS_:
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



; Statistics:
; code size:	 1318 (0x0526) bytes ( 1.01%)
;           	  659 (0x0293) words
; udata size:	    4 (0x0004) bytes ( 0.22%)
; access size:	   16 (0x0010) bytes


	end
