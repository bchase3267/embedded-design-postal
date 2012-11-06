;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Fri Nov  2 01:06:41 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _timer_read_ms
	global _timer_clear
	global _timer_start
	global _timer_stop
	global _timer_allocate
	global _timer_free

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
	extern _Timer0_overflows
	extern _Timer1_overflows
	extern _Timer2_overflows
	extern _Timer3_overflows
	extern _Timer4_overflows
	extern _Timer_allocated
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
	extern _timer1_read32
	extern _timer2_read32
	extern _timer3_read32
	extern _timer4_read32
	extern __divsint
	extern __divulong
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
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

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_timer_simple__timer_free	code
_timer_free:
;	.line	236; timer_simple.c	void    timer_free(unsigned char timer)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	239; timer_simple.c	timer_stop(timer);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_timer_stop
	INCF	FSR1L, F
;	.line	240; timer_simple.c	Timer_allocated[timer-1] = 0;
	DECF	r0x00, F
	CLRF	r0x01
	MOVLW	LOW(_Timer_allocated)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Timer_allocated)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer_simple__timer_allocate	code
_timer_allocate:
;	.line	201; timer_simple.c	unsigned char   timer_allocate(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_Timer_allocated
;	.line	204; timer_simple.c	if ( ! Timer_allocated[0] )
	MOVF	_Timer_allocated, W, B
	BNZ	_00194_DS_
; #	MOVLW	0x01
; #	MOVWF	_Timer_allocated, B
; #	MOVLW	0x01
;	.line	206; timer_simple.c	Timer_allocated[0] = 1;
	MOVLW	0x01
	BANKSEL	_Timer_allocated
;	.line	207; timer_simple.c	return 1;
	MOVWF	_Timer_allocated, B
	BRA	_00196_DS_
_00194_DS_:
	BANKSEL	(_Timer_allocated + 2)
;	.line	209; timer_simple.c	else if ( ! Timer_allocated[2] )
	MOVF	(_Timer_allocated + 2), W, B
	BNZ	_00191_DS_
;	.line	211; timer_simple.c	Timer_allocated[2] = 1;
	MOVLW	0x01
	BANKSEL	(_Timer_allocated + 2)
	MOVWF	(_Timer_allocated + 2), B
;	.line	212; timer_simple.c	return 3;
	MOVLW	0x03
	BRA	_00196_DS_
_00191_DS_:
	BANKSEL	(_Timer_allocated + 1)
;	.line	214; timer_simple.c	else if ( ! Timer_allocated[1] )
	MOVF	(_Timer_allocated + 1), W, B
	BNZ	_00188_DS_
;	.line	216; timer_simple.c	Timer_allocated[1] = 1;
	MOVLW	0x01
	BANKSEL	(_Timer_allocated + 1)
	MOVWF	(_Timer_allocated + 1), B
;	.line	217; timer_simple.c	return 2;
	MOVLW	0x02
	BRA	_00196_DS_
_00188_DS_:
	BANKSEL	(_Timer_allocated + 3)
;	.line	219; timer_simple.c	else if ( ! Timer_allocated[3] )
	MOVF	(_Timer_allocated + 3), W, B
	BNZ	_00192_DS_
;	.line	221; timer_simple.c	Timer_allocated[3] = 1;
	MOVLW	0x01
	BANKSEL	(_Timer_allocated + 3)
	MOVWF	(_Timer_allocated + 3), B
;	.line	222; timer_simple.c	return 4;
	MOVLW	0x04
	BRA	_00196_DS_
_00192_DS_:
;	.line	224; timer_simple.c	return 0;
	CLRF	WREG
_00196_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer_simple__timer_stop	code
_timer_stop:
;	.line	166; timer_simple.c	void    timer_stop(unsigned char timer)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	168; timer_simple.c	switch(timer)
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00174_DS_
	MOVLW	0x05
	SUBWF	r0x00, W
	BC	_00174_DS_
	DECF	r0x00, F
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	CLRF	r0x02
	RLCF	r0x00, W
	RLCF	r0x02, F
	RLCF	WREG, W
	RLCF	r0x02, F
	ANDLW	0xfc
	MOVWF	r0x01
	MOVLW	UPPER(_00180_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00180_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00180_DS_)
	ADDWF	r0x01, F
	MOVF	r0x02, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVWF	PCL
_00180_DS_:
	GOTO	_00169_DS_
	GOTO	_00170_DS_
	GOTO	_00171_DS_
	GOTO	_00172_DS_
_00169_DS_:
;	.line	171; timer_simple.c	TIMER1_STOP();
	BCF	_T1CONbits, 0
;	.line	172; timer_simple.c	TIMER1_CLEAR_INTERRUPT_FLAG();
	BCF	_PIR1bits, 0
;	.line	173; timer_simple.c	TIMER1_DISABLE_INTERRUPTS();
	BCF	_PIE1bits, 0
;	.line	174; timer_simple.c	return;
	BRA	_00174_DS_
_00170_DS_:
;	.line	176; timer_simple.c	TIMER2_STOP();
	BCF	_T2CONbits, 2
;	.line	177; timer_simple.c	TIMER2_CLEAR_INTERRUPT_FLAG();
	BCF	_PIR1bits, 1
;	.line	178; timer_simple.c	TIMER2_DISABLE_INTERRUPTS();
	BCF	_PIE1bits, 1
;	.line	179; timer_simple.c	return;
	BRA	_00174_DS_
_00171_DS_:
;	.line	181; timer_simple.c	TIMER3_STOP();
	BCF	_T3CONbits, 0
;	.line	182; timer_simple.c	TIMER3_CLEAR_INTERRUPT_FLAG();
	BCF	_PIR2bits, 1
;	.line	183; timer_simple.c	TIMER3_DISABLE_INTERRUPTS();
	BCF	_PIE2bits, 1
;	.line	184; timer_simple.c	return;
	BRA	_00174_DS_
_00172_DS_:
;	.line	186; timer_simple.c	TIMER4_STOP();
	BCF	_T4CONbits, 2
;	.line	187; timer_simple.c	TIMER4_CLEAR_INTERRUPT_FLAG();
	BCF	_PIR3bits, 3
;	.line	188; timer_simple.c	TIMER4_DISABLE_INTERRUPTS();
	BCF	_PIE3bits, 3
_00174_DS_:
;	.line	190; timer_simple.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer_simple__timer_start	code
_timer_start:
;	.line	118; timer_simple.c	void    timer_start(unsigned char timer)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	120; timer_simple.c	switch(timer)
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00158_DS_
	MOVLW	0x05
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00158_DS_
	DECF	r0x00, F
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	CLRF	r0x02
	RLCF	r0x00, W
	RLCF	r0x02, F
	RLCF	WREG, W
	RLCF	r0x02, F
	ANDLW	0xfc
	MOVWF	r0x01
	MOVLW	UPPER(_00164_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00164_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00164_DS_)
	ADDWF	r0x01, F
	MOVF	r0x02, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVWF	PCL
_00164_DS_:
	GOTO	_00153_DS_
	GOTO	_00154_DS_
	GOTO	_00155_DS_
	GOTO	_00156_DS_
_00153_DS_:
;	.line	123; timer_simple.c	TIMER1_STOP();
	BCF	_T1CONbits, 0
;	.line	124; timer_simple.c	TIMER1_SET_WIDTH_16();
	BSF	_T1CONbits, 7
;	.line	125; timer_simple.c	TIMER1_SET_PRESCALE(TIMER1_PRESCALE_MASK_8);
	MOVLW	0xcf
	ANDWF	_T1CON, W
	MOVWF	r0x00
	MOVLW	0x30
	IORWF	r0x00, W
	MOVWF	_T1CON
;	.line	126; timer_simple.c	TIMER1_CLEAR_INTERRUPT_FLAG();
	BCF	_PIR1bits, 0
;	.line	127; timer_simple.c	TIMER1_ENABLE_INTERRUPTS();
	BSF	_PIE1bits, 0
;	.line	128; timer_simple.c	TIMER1_START();
	BSF	_T1CONbits, 0
;	.line	129; timer_simple.c	return;
	BRA	_00158_DS_
_00154_DS_:
;	.line	131; timer_simple.c	TIMER2_STOP();
	BCF	_T2CONbits, 2
;	.line	132; timer_simple.c	TIMER2_SET_PRESCALE(TIMER2_PRESCALE_MASK_16);
	MOVLW	0xfc
	ANDWF	_T2CON, W
	MOVWF	r0x00
	MOVLW	0x02
	IORWF	r0x00, W
	MOVWF	_T2CON
;	.line	133; timer_simple.c	TIMER2_CLEAR_INTERRUPT_FLAG();
	BCF	_PIR1bits, 1
;	.line	134; timer_simple.c	TIMER2_ENABLE_INTERRUPTS();
	BSF	_PIE1bits, 1
;	.line	135; timer_simple.c	TIMER2_START();
	BSF	_T2CONbits, 2
;	.line	136; timer_simple.c	return;
	BRA	_00158_DS_
_00155_DS_:
;	.line	138; timer_simple.c	TIMER3_STOP();
	BCF	_T3CONbits, 0
;	.line	139; timer_simple.c	TIMER3_SET_WIDTH_16();
	BSF	_T3CONbits, 7
;	.line	140; timer_simple.c	TIMER3_SET_PRESCALE(TIMER1_PRESCALE_MASK_8);
	MOVLW	0xcf
	ANDWF	_T3CON, W
	MOVWF	r0x00
	MOVLW	0x30
	IORWF	r0x00, W
	MOVWF	_T3CON
;	.line	141; timer_simple.c	TIMER3_CLEAR_INTERRUPT_FLAG();
	BCF	_PIR2bits, 1
;	.line	142; timer_simple.c	TIMER3_ENABLE_INTERRUPTS();
	BSF	_PIE2bits, 1
;	.line	143; timer_simple.c	TIMER3_START();
	BSF	_T3CONbits, 0
;	.line	144; timer_simple.c	return;
	BRA	_00158_DS_
_00156_DS_:
;	.line	146; timer_simple.c	TIMER4_STOP();
	BCF	_T4CONbits, 2
;	.line	147; timer_simple.c	TIMER4_SET_PRESCALE(TIMER4_PRESCALE_MASK_16);
	MOVLW	0xfc
	ANDWF	_T4CON, W
	MOVWF	r0x00
	MOVLW	0x02
	IORWF	r0x00, W
	MOVWF	_T4CON
;	.line	148; timer_simple.c	TIMER4_CLEAR_INTERRUPT_FLAG();
	BCF	_PIR3bits, 3
;	.line	149; timer_simple.c	TIMER4_ENABLE_INTERRUPTS();
	BSF	_PIE3bits, 3
;	.line	150; timer_simple.c	TIMER4_START();
	BSF	_T4CONbits, 2
_00158_DS_:
;	.line	152; timer_simple.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer_simple__timer_clear	code
_timer_clear:
;	.line	70; timer_simple.c	void    timer_clear(unsigned char timer)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	72; timer_simple.c	switch(timer)
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00142_DS_
	MOVLW	0x05
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00142_DS_
	DECF	r0x00, F
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	CLRF	r0x02
	RLCF	r0x00, W
	RLCF	r0x02, F
	RLCF	WREG, W
	RLCF	r0x02, F
	ANDLW	0xfc
	MOVWF	r0x01
	MOVLW	UPPER(_00148_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00148_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00148_DS_)
	ADDWF	r0x01, F
	MOVF	r0x02, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVWF	PCL
_00148_DS_:
	GOTO	_00137_DS_
	GOTO	_00138_DS_
	GOTO	_00139_DS_
	GOTO	_00140_DS_
_00137_DS_:
;	.line	75; timer_simple.c	TIMER1_WRITE16(0);
	CLRF	_TMR1H
	CLRF	_TMR1L
	BANKSEL	_Timer1_overflows
;	.line	76; timer_simple.c	Timer1_overflows = 0;
	CLRF	_Timer1_overflows, B
	BANKSEL	(_Timer1_overflows + 1)
	CLRF	(_Timer1_overflows + 1), B
;	.line	77; timer_simple.c	return;
	BRA	_00142_DS_
_00138_DS_:
;	.line	84; timer_simple.c	TMR2 = 0;   /* Clear postscale bits to get 1:1 */
	CLRF	_TMR2
;	.line	85; timer_simple.c	TIMER2_WRITE8(1);
	MOVLW	0x01
	MOVWF	_TMR2
	BANKSEL	_Timer2_overflows
;	.line	86; timer_simple.c	Timer2_overflows = 0;
	CLRF	_Timer2_overflows, B
	BANKSEL	(_Timer2_overflows + 1)
	CLRF	(_Timer2_overflows + 1), B
	BANKSEL	(_Timer2_overflows + 2)
	CLRF	(_Timer2_overflows + 2), B
	BANKSEL	(_Timer2_overflows + 3)
	CLRF	(_Timer2_overflows + 3), B
;	.line	87; timer_simple.c	TIMER2_WRITE_PR(0);
	CLRF	_PR2
;	.line	88; timer_simple.c	return;
	BRA	_00142_DS_
_00139_DS_:
;	.line	90; timer_simple.c	TIMER3_WRITE16(0);
	CLRF	_TMR3H
	CLRF	_TMR3L
	BANKSEL	_Timer3_overflows
;	.line	91; timer_simple.c	Timer3_overflows = 0;
	CLRF	_Timer3_overflows, B
	BANKSEL	(_Timer3_overflows + 1)
	CLRF	(_Timer3_overflows + 1), B
;	.line	92; timer_simple.c	return;
	BRA	_00142_DS_
_00140_DS_:
;	.line	99; timer_simple.c	TMR4 = 0;   /* Clear postscale bits to get 1:1 */
	CLRF	_TMR4
;	.line	100; timer_simple.c	TIMER4_WRITE8(1);
	MOVLW	0x01
	MOVWF	_TMR4
	BANKSEL	_Timer4_overflows
;	.line	101; timer_simple.c	Timer4_overflows = 0;
	CLRF	_Timer4_overflows, B
	BANKSEL	(_Timer4_overflows + 1)
	CLRF	(_Timer4_overflows + 1), B
	BANKSEL	(_Timer4_overflows + 2)
	CLRF	(_Timer4_overflows + 2), B
	BANKSEL	(_Timer4_overflows + 3)
	CLRF	(_Timer4_overflows + 3), B
;	.line	102; timer_simple.c	TIMER4_WRITE_PR(0);
	CLRF	_PR4
_00142_DS_:
;	.line	104; timer_simple.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer_simple__timer_read_ms	code
_timer_read_ms:
;	.line	43; timer_simple.c	unsigned long   timer_read_ms(unsigned char timer)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	45; timer_simple.c	switch(timer)
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00109_DS_
	MOVLW	0x05
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00109_DS_
	DECF	r0x00, F
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	CLRF	r0x0b
	RLCF	r0x00, W
	RLCF	r0x0b, F
	RLCF	WREG, W
	RLCF	r0x0b, F
	ANDLW	0xfc
	MOVWF	r0x0a
	MOVLW	UPPER(_00116_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00116_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00116_DS_)
	ADDWF	r0x0a, F
	MOVF	r0x0b, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x0a, W
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVWF	PCL
_00116_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
_00105_DS_:
;	.line	48; timer_simple.c	return TIMER1_ELAPSED_MS;
	CALL	_timer1_read32
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x30
	ANDWF	_T1CON, W
	MOVWF	r0x04
	SWAPF	r0x04, W
	ANDLW	0x0f
	MOVWF	r0x04
	MOVLW	0x01
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	r0x06
	MOVF	r0x04, W
	BZ	_00118_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00119_DS_:
	RLCF	r0x05, F
	RLCF	r0x06, F
	ADDLW	0x01
	BNC	_00119_DS_
_00118_DS_:
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	WREG
	BTFSC	r0x05, 7
	MOVLW	0xff
	MOVWF	r0x06
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
	MOVWF	r0x07
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
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00110_DS_
_00106_DS_:
;	.line	50; timer_simple.c	return TIMER2_ELAPSED_MS;
	CALL	_timer2_read32
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x03
	ANDWF	_T2CON, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x06
	ADDWF	r0x06, F
	RLCF	r0x05, W
	MOVWF	r0x07
	MOVLW	0x01
	MOVWF	r0x08
	MOVLW	0x00
	MOVWF	r0x09
	MOVF	r0x06, W
	BZ	_00121_DS_
	BN	_00124_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00122_DS_:
	RLCF	r0x08, F
	RLCF	r0x09, F
	ADDLW	0x01
	BNC	_00122_DS_
	BRA	_00121_DS_
_00124_DS_:
	BCF	STATUS, 0
_00123_DS_:
	BTFSC	r0x09, 7
	BSF	STATUS, 0
	RRCF	r0x09, F
	RRCF	r0x08, F
	ADDLW	0x01
	BNC	_00123_DS_
_00121_DS_:
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	WREG
	BTFSC	r0x05, 7
	MOVLW	0xff
	MOVWF	r0x06
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
	MOVWF	r0x07
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
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00110_DS_
_00107_DS_:
;	.line	52; timer_simple.c	return TIMER3_ELAPSED_MS;
	CALL	_timer3_read32
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x30
	ANDWF	_T3CON, W
	MOVWF	r0x04
	SWAPF	r0x04, W
	ANDLW	0x0f
	MOVWF	r0x04
	MOVLW	0x01
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	r0x06
	MOVF	r0x04, W
	BZ	_00126_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00127_DS_:
	RLCF	r0x05, F
	RLCF	r0x06, F
	ADDLW	0x01
	BNC	_00127_DS_
_00126_DS_:
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	WREG
	BTFSC	r0x05, 7
	MOVLW	0xff
	MOVWF	r0x06
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
	MOVWF	r0x07
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
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00110_DS_
_00108_DS_:
;	.line	54; timer_simple.c	return TIMER4_ELAPSED_MS;
	CALL	_timer4_read32
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x03
	ANDWF	_T4CON, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x06
	ADDWF	r0x06, F
	RLCF	r0x05, W
	MOVWF	r0x07
	MOVLW	0x01
	MOVWF	r0x08
	MOVLW	0x00
	MOVWF	r0x09
	MOVF	r0x06, W
	BZ	_00129_DS_
	BN	_00132_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00130_DS_:
	RLCF	r0x08, F
	RLCF	r0x09, F
	ADDLW	0x01
	BNC	_00130_DS_
	BRA	_00129_DS_
_00132_DS_:
	BCF	STATUS, 0
_00131_DS_:
	BTFSC	r0x09, 7
	BSF	STATUS, 0
	RRCF	r0x09, F
	RRCF	r0x08, F
	ADDLW	0x01
	BNC	_00131_DS_
_00129_DS_:
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	WREG
	BTFSC	r0x05, 7
	MOVLW	0xff
	MOVWF	r0x06
; #	MOVWF	r0x07
; #	MOVF	r0x07, W
	MOVWF	r0x07
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
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00110_DS_
_00109_DS_:
;	.line	56; timer_simple.c	return 0;
	CLRF	FSR0L
	CLRF	PRODH
	CLRF	PRODL
	CLRF	WREG
_00110_DS_:
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
; code size:	 1582 (0x062e) bytes ( 1.21%)
;           	  791 (0x0317) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	   12 (0x000c) bytes


	end
