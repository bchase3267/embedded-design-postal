;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Fri Nov  2 01:09:54 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _Sonar_output_port
	global _Interrupt_port_in_use
	global _interrupt_set_edge
	global _interrupt_enable
	global _interrupt_disable
	global _InterruptVectorLow
	global _InterruptHandlerLow
	global _sonar_emit_isr
	global _sonar_echo_isr
	global _quad_encoder_isr
	global _Timer0_overflows
	global _Timer1_overflows
	global _Timer2_overflows
	global _Timer3_overflows
	global _Timer4_overflows
	global _Sonar_on_iport
	global _Sonar_data_available
	global _Sonar_echo_time
	global _Timer0_at_emit
	global _Timer0_at_echo
	global _Encoder_ticks
	global _Encoder_on_iport
	global _Quad_input_port
	global _Porta_sample
	global _Portf_sample
	global _Porth_sample

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
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_Interrupt_port_in_use	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_Sonar_on_iport	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_Sonar_data_available	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_Sonar_echo_time	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_Encoder_ticks	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_Encoder_on_iport	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_Quad_input_port	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_InterruptHandlerLow_old_portb_1_1	db	0x00


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

udata_interrupts_0	udata
_Sonar_output_port	res	6

udata_interrupts_1	udata
_Porta_sample	res	1

udata_interrupts_2	udata
_Portf_sample	res	1

udata_interrupts_3	udata
_Porth_sample	res	1

udata_interrupts_4	udata
_Timer0_overflows	res	2

udata_interrupts_5	udata
_Timer1_overflows	res	2

udata_interrupts_6	udata
_Timer2_overflows	res	4

udata_interrupts_7	udata
_Timer3_overflows	res	2

udata_interrupts_8	udata
_Timer4_overflows	res	4

udata_interrupts_9	udata
_Timer0_at_emit	res	12

udata_interrupts_10	udata
_Timer0_at_echo	res	12

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_interrupts__InterruptVectorLow	code	0X000818
_InterruptVectorLow:
	goto _InterruptHandlerLow
	
; ; Starting pCode block
S_interrupts__InterruptHandlerLow	code
_InterruptHandlerLow:
;	.line	210; interrupts.c	void    InterruptHandlerLow(void) INTERRUPT
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
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
;	.line	279; interrupts.c	Porta_sample = PORTA;
	MOVFF	_PORTA, _Porta_sample
;	.line	280; interrupts.c	Portf_sample = PORTF;
	MOVFF	_PORTF, _Portf_sample
;	.line	281; interrupts.c	Porth_sample = PORTH;
	MOVFF	_PORTH, _Porth_sample
;	.line	283; interrupts.c	if (INTCONbits.RBIF)
	BTFSS	_INTCONbits, 0
	BRA	_00177_DS_
;	.line	289; interrupts.c	new_portb = PORTB;
	MOVFF	_PORTB, r0x00
;	.line	290; interrupts.c	INTCONbits.RBIF = 0;
	BCF	_INTCONbits, 0
;	.line	308; interrupts.c	for (p = 3, mask = 0x10; p <= 6; ++p, mask <<= 1)
	MOVLW	0x10
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	0x03
	MOVWF	r0x03
	CLRF	r0x04
_00214_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00245_DS_
	MOVLW	0x07
	SUBWF	r0x03, W
_00245_DS_:
	BTFSC	STATUS, 0
	BRA	_00177_DS_
	BANKSEL	_InterruptHandlerLow_old_portb_1_1
;	.line	311; interrupts.c	if ( (new_portb ^ old_portb) & mask )
	MOVF	_InterruptHandlerLow_old_portb_1_1, W, B
	XORWF	r0x00, W
	MOVWF	r0x05
	CLRF	r0x06
	MOVF	r0x01, W
	ANDWF	r0x05, F
	MOVF	r0x02, W
	ANDWF	r0x06, F
	MOVF	r0x05, W
	IORWF	r0x06, W
	BTFSC	STATUS, 2
	BRA	_00216_DS_
;	.line	314; interrupts.c	if ( new_portb & mask ) /* Rising edge */
	MOVFF	r0x00, r0x05
	CLRF	r0x06
	MOVF	r0x01, W
	ANDWF	r0x05, F
	MOVF	r0x02, W
	ANDWF	r0x06, F
	MOVF	r0x05, W
	IORWF	r0x06, W
	BTFSC	STATUS, 2
	BRA	_00172_DS_
; #	MOVF	r0x03, W
; #	MOVWF	r0x05
; #	DECF	r0x05, F
;	.line	316; interrupts.c	if ( ENCODER_ON_IPORT(p) == ENCODER_STD )
	DECF	r0x03, W
	MOVWF	r0x05
	MOVLW	LOW(_Encoder_on_iport)
	ADDWF	r0x05, W
	MOVWF	r0x06
	CLRF	r0x07
	BTFSC	r0x05, 7
	SETF	r0x07
	MOVLW	HIGH(_Encoder_on_iport)
	ADDWFC	r0x07, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	INDF0, r0x06
	MOVF	r0x06, W
	XORLW	0x01
	BNZ	_00167_DS_
; ;multiply lit val:0x02 by variable r0x05 and store in r0x07
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	317; interrupts.c	SHAFT_ENCODER_ISR(p);
	MOVLW	0x00
	BTFSC	r0x05, 7
	MOVLW	0xff
	BCF	STATUS, 0
	RLCF	r0x05, W
	MOVWF	r0x07
	CLRF	r0x08
	BTFSC	r0x07, 7
	SETF	r0x08
	MOVLW	LOW(_Encoder_ticks)
	ADDWF	r0x07, F
	MOVLW	HIGH(_Encoder_ticks)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	POSTINC0, r0x09
	MOVFF	INDF0, r0x0a
	INCF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	r0x09, POSTINC0
	MOVFF	r0x0a, INDF0
	BRA	_00168_DS_
_00167_DS_:
;	.line	318; interrupts.c	else if ( ENCODER_ON_IPORT(p) == ENCODER_QUAD )
	MOVF	r0x06, W
	XORLW	0x02
	BNZ	_00164_DS_
;	.line	319; interrupts.c	quad_encoder_isr(p);
	MOVF	r0x03, W
; #	MOVWF	r0x06
; #	MOVF	r0x06, W
	MOVWF	r0x06
	MOVWF	POSTDEC1
	CALL	_quad_encoder_isr
	INCF	FSR1L, F
	BRA	_00168_DS_
_00164_DS_:
;	.line	320; interrupts.c	else if ( SONAR_ON_IPORT(p) )
	CLRF	r0x06
	BTFSC	r0x05, 7
	SETF	r0x06
	MOVLW	LOW(_Sonar_on_iport)
	ADDWF	r0x05, F
	MOVLW	HIGH(_Sonar_on_iport)
	ADDWFC	r0x06, F
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	INDF0, r0x05
	MOVF	r0x05, W
	BZ	_00168_DS_
; #	MOVF	r0x03, W
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
;	.line	321; interrupts.c	sonar_emit_isr(p);
	MOVF	r0x03, W
	MOVWF	r0x05
	MOVWF	POSTDEC1
	CALL	_sonar_emit_isr
	INCF	FSR1L, F
_00168_DS_:
;	.line	322; interrupts.c	old_portb |= mask;      /* Update "old" bit state */
	MOVFF	_InterruptHandlerLow_old_portb_1_1, r0x05
	CLRF	r0x06
	MOVF	r0x01, W
	IORWF	r0x05, F
	MOVF	r0x02, W
	IORWF	r0x06, F
	MOVF	r0x05, W
	BANKSEL	_InterruptHandlerLow_old_portb_1_1
	MOVWF	_InterruptHandlerLow_old_portb_1_1, B
	BRA	_00216_DS_
_00172_DS_:
;	.line	332; interrupts.c	if ( SONAR_ON_IPORT(p) )
	MOVF	r0x03, W
	MOVWF	r0x05
	DECF	r0x05, F
	CLRF	r0x06
	BTFSC	r0x05, 7
	SETF	r0x06
	MOVLW	LOW(_Sonar_on_iport)
	ADDWF	r0x05, F
	MOVLW	HIGH(_Sonar_on_iport)
	ADDWFC	r0x06, F
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	INDF0, r0x05
	MOVF	r0x05, W
	BZ	_00170_DS_
; #	MOVF	r0x03, W
; #	MOVWF	r0x05
; #	MOVF	r0x05, W
;	.line	333; interrupts.c	sonar_echo_isr(p);
	MOVF	r0x03, W
	MOVWF	r0x05
	MOVWF	POSTDEC1
	CALL	_sonar_echo_isr
	INCF	FSR1L, F
_00170_DS_:
;	.line	334; interrupts.c	old_portb &= ~mask;     /* Update "old" bit state */
	MOVF	r0x01, W
	MOVWF	r0x05
	COMF	r0x05, F
	MOVF	r0x05, W
	BANKSEL	_InterruptHandlerLow_old_portb_1_1
	ANDWF	_InterruptHandlerLow_old_portb_1_1, F, B
_00216_DS_:
;	.line	308; interrupts.c	for (p = 3, mask = 0x10; p <= 6; ++p, mask <<= 1)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	MOVF	r0x01, W
	ADDWF	r0x01, F
	RLCF	r0x02, F
	BRA	_00214_DS_
_00177_DS_:
;	.line	344; interrupts.c	if (INTCON3bits.INT2IF)
	BTFSS	_INTCON3bits, 1
	BRA	_00190_DS_
;	.line	346; interrupts.c	INTCON3bits.INT2IF = 0;
	BCF	_INTCON3bits, 1
;	.line	347; interrupts.c	if ( ENCODER_ON_IPORT(1) == ENCODER_STD )
	MOVFF	_Encoder_on_iport, r0x00
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00187_DS_
_00254_DS_:
	BANKSEL	_Encoder_ticks
;	.line	348; interrupts.c	SHAFT_ENCODER_ISR(1);
	MOVF	_Encoder_ticks, W, B
	ADDLW	0x01
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_Encoder_ticks + 1)
	ADDWFC	(_Encoder_ticks + 1), W, B
	MOVWF	r0x02
	MOVF	r0x01, W
	BANKSEL	_Encoder_ticks
	MOVWF	_Encoder_ticks, B
	MOVF	r0x02, W
	BANKSEL	(_Encoder_ticks + 1)
	MOVWF	(_Encoder_ticks + 1), B
	BRA	_00190_DS_
_00187_DS_:
;	.line	349; interrupts.c	else if ( ENCODER_ON_IPORT(1) == ENCODER_QUAD )
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00184_DS_
;	.line	350; interrupts.c	quad_encoder_isr(1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_quad_encoder_isr
	INCF	FSR1L, F
	BRA	_00190_DS_
_00184_DS_:
	BANKSEL	_Sonar_on_iport
;	.line	351; interrupts.c	else if ( SONAR_ON_IPORT(1) )
	MOVF	_Sonar_on_iport, W, B
	BZ	_00190_DS_
;	.line	353; interrupts.c	if (INTCON2bits.INTEDG2)    /* Rising edge? */
	BTFSS	_INTCON2bits, 4
	BRA	_00179_DS_
;	.line	354; interrupts.c	sonar_emit_isr(1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_sonar_emit_isr
	INCF	FSR1L, F
	BRA	_00190_DS_
_00179_DS_:
;	.line	356; interrupts.c	sonar_echo_isr(1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_sonar_echo_isr
	INCF	FSR1L, F
_00190_DS_:
;	.line	364; interrupts.c	if (INTCON3bits.INT3IF)
	BTFSS	_INTCON3bits, 2
	BRA	_00203_DS_
;	.line	366; interrupts.c	INTCON3bits.INT3IF = 0;
	BCF	_INTCON3bits, 2
;	.line	367; interrupts.c	if ( ENCODER_ON_IPORT(2) == ENCODER_STD )
	MOVFF	(_Encoder_on_iport + 1), r0x00
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00200_DS_
_00258_DS_:
	BANKSEL	(_Encoder_ticks + 2)
;	.line	368; interrupts.c	SHAFT_ENCODER_ISR(2);
	MOVF	(_Encoder_ticks + 2), W, B
	ADDLW	0x01
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_Encoder_ticks + 3)
	ADDWFC	(_Encoder_ticks + 3), W, B
	MOVWF	r0x02
	MOVF	r0x01, W
	BANKSEL	(_Encoder_ticks + 2)
	MOVWF	(_Encoder_ticks + 2), B
	MOVF	r0x02, W
	BANKSEL	(_Encoder_ticks + 3)
	MOVWF	(_Encoder_ticks + 3), B
	BRA	_00203_DS_
_00200_DS_:
;	.line	369; interrupts.c	else if ( ENCODER_ON_IPORT(2) == ENCODER_QUAD )
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00197_DS_
;	.line	370; interrupts.c	quad_encoder_isr(2);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_quad_encoder_isr
	INCF	FSR1L, F
	BRA	_00203_DS_
_00197_DS_:
	BANKSEL	(_Sonar_on_iport + 1)
;	.line	371; interrupts.c	else if ( SONAR_ON_IPORT(2) )
	MOVF	(_Sonar_on_iport + 1), W, B
	BZ	_00203_DS_
;	.line	373; interrupts.c	if (INTCON2bits.INTEDG3)    /* Rising edge? */
	BTFSS	_INTCON2bits, 3
	BRA	_00192_DS_
;	.line	374; interrupts.c	sonar_emit_isr(2);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_sonar_emit_isr
	INCF	FSR1L, F
	BRA	_00203_DS_
_00192_DS_:
;	.line	376; interrupts.c	sonar_echo_isr(2);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_sonar_echo_isr
	INCF	FSR1L, F
_00203_DS_:
;	.line	381; interrupts.c	if ( INTCONbits.T0IF )
	BTFSS	_INTCONbits, 2
	BRA	_00205_DS_
;	.line	383; interrupts.c	INTCONbits.T0IF = 0;
	BCF	_INTCONbits, 2
	BANKSEL	_Timer0_overflows
;	.line	384; interrupts.c	++Timer0_overflows;
	INCF	_Timer0_overflows, F, B
	BNC	_10289_DS_
	BANKSEL	(_Timer0_overflows + 1)
	INCF	(_Timer0_overflows + 1), F, B
_10289_DS_:
_00205_DS_:
;	.line	388; interrupts.c	if ( PIR1bits.TMR1IF )
	BTFSS	_PIR1bits, 0
	BRA	_00207_DS_
;	.line	390; interrupts.c	PIR1bits.TMR1IF = 0;
	BCF	_PIR1bits, 0
	BANKSEL	_Timer1_overflows
;	.line	391; interrupts.c	++Timer1_overflows;
	INCF	_Timer1_overflows, F, B
	BNC	_20290_DS_
	BANKSEL	(_Timer1_overflows + 1)
	INCF	(_Timer1_overflows + 1), F, B
_20290_DS_:
_00207_DS_:
;	.line	396; interrupts.c	if ( PIR1bits.TMR2IF )
	BTFSS	_PIR1bits, 1
	BRA	_00209_DS_
;	.line	398; interrupts.c	PIR1bits.TMR2IF = 0;
	BCF	_PIR1bits, 1
	BANKSEL	_Timer2_overflows
;	.line	399; interrupts.c	++Timer2_overflows;
	INCF	_Timer2_overflows, F, B
	BNC	_30291_DS_
	BANKSEL	(_Timer2_overflows + 1)
	INCF	(_Timer2_overflows + 1), F, B
_30291_DS_:
	BNC	_40292_DS_
	BANKSEL	(_Timer2_overflows + 2)
	INCF	(_Timer2_overflows + 2), F, B
_40292_DS_:
	BNC	_50293_DS_
	BANKSEL	(_Timer2_overflows + 3)
	INCF	(_Timer2_overflows + 3), F, B
_50293_DS_:
	BANKSEL	(_Timer2_overflows + 3)
;	.line	404; interrupts.c	Timer2_overflows &= 0x00ffffff;
	CLRF	(_Timer2_overflows + 3), B
_00209_DS_:
;	.line	408; interrupts.c	if ( PIR2bits.TMR3IF )
	BTFSS	_PIR2bits, 1
	BRA	_00211_DS_
;	.line	410; interrupts.c	PIR2bits.TMR3IF = 0;
	BCF	_PIR2bits, 1
	BANKSEL	_Timer3_overflows
;	.line	411; interrupts.c	++Timer3_overflows;
	INCF	_Timer3_overflows, F, B
	BNC	_60294_DS_
	BANKSEL	(_Timer3_overflows + 1)
	INCF	(_Timer3_overflows + 1), F, B
_60294_DS_:
_00211_DS_:
;	.line	415; interrupts.c	if ( PIR3bits.TMR4IF )
	BTFSS	_PIR3bits, 3
	BRA	_00218_DS_
;	.line	417; interrupts.c	PIR3bits.TMR4IF = 0;
	BCF	_PIR3bits, 3
	BANKSEL	_Timer4_overflows
;	.line	418; interrupts.c	++Timer4_overflows;
	INCF	_Timer4_overflows, F, B
	BNC	_70295_DS_
	BANKSEL	(_Timer4_overflows + 1)
	INCF	(_Timer4_overflows + 1), F, B
_70295_DS_:
	BNC	_80296_DS_
	BANKSEL	(_Timer4_overflows + 2)
	INCF	(_Timer4_overflows + 2), F, B
_80296_DS_:
	BNC	_90297_DS_
	BANKSEL	(_Timer4_overflows + 3)
	INCF	(_Timer4_overflows + 3), F, B
_90297_DS_:
	BANKSEL	(_Timer4_overflows + 3)
;	.line	422; interrupts.c	Timer4_overflows &= 0x00ffffff;
	CLRF	(_Timer4_overflows + 3), B
_00218_DS_:
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
S_interrupts__quad_encoder_isr	code
_quad_encoder_isr:
;	.line	500; interrupts.c	void    quad_encoder_isr(unsigned char interrupt_port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	503; interrupts.c	unsigned char   sample = 0;
	CLRF	r0x01
;	.line	516; interrupts.c	switch(Quad_input_port[interrupt_port-1])
	DECF	r0x00, F
	MOVLW	LOW(_Quad_input_port)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_Quad_input_port)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	MOVLW	0x01
	SUBWF	r0x02, W
	BTFSS	STATUS, 0
	BRA	_00306_DS_
	MOVLW	0x11
	SUBWF	r0x02, W
	BTFSC	STATUS, 0
	BRA	_00306_DS_
	DECF	r0x02, F
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	CLRF	r0x06
	RLCF	r0x02, W
	RLCF	r0x06, F
	RLCF	WREG, W
	RLCF	r0x06, F
	ANDLW	0xfc
	MOVWF	r0x05
	MOVLW	UPPER(_00317_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00317_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00317_DS_)
	ADDWF	r0x05, F
	MOVF	r0x06, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x05, W
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVWF	PCL
_00317_DS_:
	GOTO	_00289_DS_
	GOTO	_00290_DS_
	GOTO	_00291_DS_
	GOTO	_00292_DS_
	GOTO	_00293_DS_
	GOTO	_00294_DS_
	GOTO	_00295_DS_
	GOTO	_00296_DS_
	GOTO	_00297_DS_
	GOTO	_00298_DS_
	GOTO	_00299_DS_
	GOTO	_00300_DS_
	GOTO	_00301_DS_
	GOTO	_00302_DS_
	GOTO	_00303_DS_
	GOTO	_00304_DS_
_00289_DS_:
;	.line	519; interrupts.c	sample = Porta_sample & 0x01;
	MOVLW	0x01
	BANKSEL	_Porta_sample
	ANDWF	_Porta_sample, W, B
	MOVWF	r0x01
;	.line	520; interrupts.c	break;
	BRA	_00306_DS_
_00290_DS_:
;	.line	522; interrupts.c	sample = Porta_sample & 0x02;
	MOVLW	0x02
	BANKSEL	_Porta_sample
	ANDWF	_Porta_sample, W, B
	MOVWF	r0x01
;	.line	523; interrupts.c	break;
	BRA	_00306_DS_
_00291_DS_:
;	.line	525; interrupts.c	sample = Porta_sample & 0x04;
	MOVLW	0x04
	BANKSEL	_Porta_sample
	ANDWF	_Porta_sample, W, B
	MOVWF	r0x01
;	.line	526; interrupts.c	break;
	BRA	_00306_DS_
_00292_DS_:
;	.line	528; interrupts.c	sample = Porta_sample & 0x08;
	MOVLW	0x08
	BANKSEL	_Porta_sample
	ANDWF	_Porta_sample, W, B
	MOVWF	r0x01
;	.line	529; interrupts.c	break;
	BRA	_00306_DS_
_00293_DS_:
;	.line	531; interrupts.c	sample = Porta_sample & 0x20;
	MOVLW	0x20
	BANKSEL	_Porta_sample
	ANDWF	_Porta_sample, W, B
	MOVWF	r0x01
;	.line	532; interrupts.c	break;
	BRA	_00306_DS_
_00294_DS_:
;	.line	534; interrupts.c	sample = Portf_sample & 0x01;
	MOVLW	0x01
	BANKSEL	_Portf_sample
	ANDWF	_Portf_sample, W, B
	MOVWF	r0x01
;	.line	535; interrupts.c	break;
	BRA	_00306_DS_
_00295_DS_:
;	.line	537; interrupts.c	sample = Portf_sample & 0x02;
	MOVLW	0x02
	BANKSEL	_Portf_sample
	ANDWF	_Portf_sample, W, B
	MOVWF	r0x01
;	.line	538; interrupts.c	break;
	BRA	_00306_DS_
_00296_DS_:
;	.line	540; interrupts.c	sample = Portf_sample & 0x04;
	MOVLW	0x04
	BANKSEL	_Portf_sample
	ANDWF	_Portf_sample, W, B
	MOVWF	r0x01
;	.line	541; interrupts.c	break;
	BRA	_00306_DS_
_00297_DS_:
;	.line	543; interrupts.c	sample = Portf_sample & 0x08;
	MOVLW	0x08
	BANKSEL	_Portf_sample
	ANDWF	_Portf_sample, W, B
	MOVWF	r0x01
;	.line	544; interrupts.c	break;
	BRA	_00306_DS_
_00298_DS_:
;	.line	546; interrupts.c	sample = Portf_sample & 0x10;
	MOVLW	0x10
	BANKSEL	_Portf_sample
	ANDWF	_Portf_sample, W, B
	MOVWF	r0x01
;	.line	547; interrupts.c	break;
	BRA	_00306_DS_
_00299_DS_:
;	.line	549; interrupts.c	sample = Portf_sample & 0x01;
	MOVLW	0x01
	BANKSEL	_Portf_sample
	ANDWF	_Portf_sample, W, B
	MOVWF	r0x01
;	.line	550; interrupts.c	break;
	BRA	_00306_DS_
_00300_DS_:
;	.line	552; interrupts.c	sample = Portf_sample & 0x02;
	MOVLW	0x02
	BANKSEL	_Portf_sample
	ANDWF	_Portf_sample, W, B
	MOVWF	r0x01
;	.line	553; interrupts.c	break;
	BRA	_00306_DS_
_00301_DS_:
;	.line	555; interrupts.c	sample = Porth_sample & 0x10;
	MOVLW	0x10
	BANKSEL	_Porth_sample
	ANDWF	_Porth_sample, W, B
	MOVWF	r0x01
;	.line	556; interrupts.c	break;
	BRA	_00306_DS_
_00302_DS_:
;	.line	558; interrupts.c	sample = Porth_sample & 0x20;
	MOVLW	0x20
	BANKSEL	_Porth_sample
	ANDWF	_Porth_sample, W, B
	MOVWF	r0x01
;	.line	559; interrupts.c	break;
	BRA	_00306_DS_
_00303_DS_:
;	.line	561; interrupts.c	sample = Porth_sample & 0x40;
	MOVLW	0x40
	BANKSEL	_Porth_sample
	ANDWF	_Porth_sample, W, B
	MOVWF	r0x01
;	.line	562; interrupts.c	break;
	BRA	_00306_DS_
_00304_DS_:
;	.line	564; interrupts.c	sample = Porth_sample & 0x80;
	MOVLW	0x80
	BANKSEL	_Porth_sample
	ANDWF	_Porth_sample, W, B
	MOVWF	r0x01
_00306_DS_:
;	.line	574; interrupts.c	if ( sample == 0 )
	MOVF	r0x01, W
	BNZ	_00308_DS_
; ;multiply lit val:0x02 by variable r0x00 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	575; interrupts.c	--Encoder_ticks[interrupt_port-1];
	BCF	STATUS, 0
	RLCF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_Encoder_ticks)
	ADDWF	r0x01, F
	MOVLW	HIGH(_Encoder_ticks)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	POSTINC0, r0x03
	MOVFF	INDF0, r0x04
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, POSTINC0
	MOVFF	r0x04, INDF0
	BRA	_00310_DS_
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00308_DS_:
;	.line	577; interrupts.c	++Encoder_ticks[interrupt_port-1];
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x01
	MOVLW	LOW(_Encoder_ticks)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Encoder_ticks)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x02
	MOVFF	INDF0, r0x03
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, POSTINC0
	MOVFF	r0x03, INDF0
_00310_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_interrupts__sonar_echo_isr	code
_sonar_echo_isr:
;	.line	474; interrupts.c	void sonar_echo_isr(unsigned char interrupt_port) 
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
;	.line	477; interrupts.c	TIMER0_READ16(Timer0_at_echo[interrupt_port-1]);
	DECF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x00, W
	MOVWF	r0x01
	MOVLW	LOW(_Timer0_at_echo)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_Timer0_at_echo)
	ADDWFC	r0x03, F
	MOVFF	_TMR0L, r0x04
	CLRF	r0x05
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, POSTINC0
	MOVFF	r0x05, INDF0
	MOVLW	LOW(_Timer0_at_echo)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_Timer0_at_echo)
	ADDWFC	r0x03, F
	MOVLW	LOW(_Timer0_at_echo)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_Timer0_at_echo)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	INDF0, r0x05
	MOVFF	_TMR0H, r0x06
	CLRF	r0x07
	MOVF	r0x06, W
	MOVWF	r0x09
	CLRF	r0x08
	MOVF	r0x08, W
	IORWF	r0x04, F
	MOVF	r0x09, W
	IORWF	r0x05, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, POSTINC0
	MOVFF	r0x05, INDF0
;	.line	479; interrupts.c	SET_SONAR_ECHO_TIME(interrupt_port,
	MOVLW	LOW(_Sonar_echo_time)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_Sonar_echo_time)
	ADDWFC	r0x03, F
	MOVLW	LOW(_Timer0_at_echo)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_Timer0_at_echo)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	INDF0, r0x05
	CLRF	r0x06
	MOVLW	LOW(_Timer0_at_emit)
	ADDWF	r0x01, F
	MOVLW	HIGH(_Timer0_at_emit)
	ADDWFC	r0x06, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	POSTINC0, r0x01
	MOVFF	INDF0, r0x06
	MOVF	r0x01, W
	SUBWF	r0x04, F
	MOVF	r0x06, W
	SUBWFB	r0x05, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, POSTINC0
	MOVFF	r0x05, INDF0
;	.line	482; interrupts.c	SET_SONAR_DATA_AVAILABLE(interrupt_port);
	CLRF	r0x01
	MOVLW	LOW(_Sonar_data_available)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Sonar_data_available)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
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
S_interrupts__sonar_emit_isr	code
_sonar_emit_isr:
;	.line	445; interrupts.c	void sonar_emit_isr(unsigned char interrupt_port) 
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
;	.line	449; interrupts.c	TIMER0_READ16(Timer0_at_emit[interrupt_port-1]);
	DECF	r0x00, W
	MOVWF	r0x01
; ;multiply lit val:0x02 by variable r0x01 and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x01, W
	MOVWF	r0x02
	MOVLW	LOW(_Timer0_at_emit)
	ADDWF	r0x02, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_Timer0_at_emit)
	ADDWFC	r0x04, F
	MOVFF	_TMR0L, r0x05
	CLRF	r0x06
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x05, POSTINC0
	MOVFF	r0x06, INDF0
	MOVLW	LOW(_Timer0_at_emit)
	ADDWF	r0x02, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_Timer0_at_emit)
	ADDWFC	r0x04, F
	CLRF	r0x05
	MOVLW	LOW(_Timer0_at_emit)
	ADDWF	r0x02, F
	MOVLW	HIGH(_Timer0_at_emit)
	ADDWFC	r0x05, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x02
	MOVFF	INDF0, r0x05
	MOVFF	_TMR0H, r0x06
	CLRF	r0x07
	MOVF	r0x06, W
	MOVWF	r0x09
	CLRF	r0x08
	MOVF	r0x08, W
	IORWF	r0x02, F
	MOVF	r0x09, W
	IORWF	r0x05, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x02, POSTINC0
	MOVFF	r0x05, INDF0
;	.line	451; interrupts.c	switch(interrupt_port)
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00272_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BC	_00272_DS_
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	CLRF	r0x0b
	RLCF	r0x01, W
	RLCF	r0x0b, F
	RLCF	WREG, W
	RLCF	r0x0b, F
	ANDLW	0xfc
	MOVWF	r0x0a
	MOVLW	UPPER(_00279_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00279_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00279_DS_)
	ADDWF	r0x0a, F
	MOVF	r0x0b, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x0a, W
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVWF	PCL
_00279_DS_:
	GOTO	_00265_DS_
	GOTO	_00266_DS_
	GOTO	_00272_DS_
	GOTO	_00272_DS_
	GOTO	_00272_DS_
	GOTO	_00272_DS_
_00265_DS_:
;	.line	455; interrupts.c	INTCON2bits.INTEDG2 = 0;
	BCF	_INTCON2bits, 4
;	.line	456; interrupts.c	break;
	BRA	_00272_DS_
_00266_DS_:
;	.line	460; interrupts.c	INTCON2bits.INTEDG3 = 0;
	BCF	_INTCON2bits, 3
_00272_DS_:
;	.line	470; interrupts.c	}
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
S_interrupts__interrupt_disable	code
_interrupt_disable:
;	.line	152; interrupts.c	void    interrupt_disable(unsigned char port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	155; interrupts.c	switch(port)
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00145_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BC	_00145_DS_
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
	MOVLW	UPPER(_00151_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00151_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00151_DS_)
	ADDWF	r0x01, F
	MOVF	r0x02, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVWF	PCL
_00151_DS_:
	GOTO	_00138_DS_
	GOTO	_00139_DS_
	GOTO	_00143_DS_
	GOTO	_00143_DS_
	GOTO	_00143_DS_
	GOTO	_00143_DS_
_00138_DS_:
;	.line	158; interrupts.c	INTCON3bits.INT2IE = 0;
	BCF	_INTCON3bits, 4
;	.line	159; interrupts.c	break;
	BRA	_00145_DS_
_00139_DS_:
;	.line	161; interrupts.c	INTCON3bits.INT3IE = 0;
	BCF	_INTCON3bits, 5
;	.line	162; interrupts.c	break;
	BRA	_00145_DS_
_00143_DS_:
;	.line	167; interrupts.c	INTCONbits.RBIE = 0;
	BCF	_INTCONbits, 3
_00145_DS_:
;	.line	169; interrupts.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_interrupts__interrupt_enable	code
_interrupt_enable:
;	.line	118; interrupts.c	void    interrupt_enable(unsigned char port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	121; interrupts.c	switch(port)
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00127_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BC	_00127_DS_
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
	MOVLW	UPPER(_00133_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00133_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00133_DS_)
	ADDWF	r0x01, F
	MOVF	r0x02, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVWF	PCL
_00133_DS_:
	GOTO	_00120_DS_
	GOTO	_00121_DS_
	GOTO	_00125_DS_
	GOTO	_00125_DS_
	GOTO	_00125_DS_
	GOTO	_00125_DS_
_00120_DS_:
;	.line	124; interrupts.c	INTCON3bits.INT2IE = 1;
	BSF	_INTCON3bits, 4
;	.line	125; interrupts.c	break;
	BRA	_00127_DS_
_00121_DS_:
;	.line	127; interrupts.c	INTCON3bits.INT3IE = 1;
	BSF	_INTCON3bits, 5
;	.line	128; interrupts.c	break;
	BRA	_00127_DS_
_00125_DS_:
;	.line	133; interrupts.c	INTCONbits.RBIE = 1;
	BSF	_INTCONbits, 3
_00127_DS_:
;	.line	135; interrupts.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_interrupts__interrupt_set_edge	code
_interrupt_set_edge:
;	.line	85; interrupts.c	void    interrupt_set_edge(unsigned char port,unsigned char mask)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	88; interrupts.c	switch(port)
	MOVF	r0x00, W
	XORLW	0x01
	BZ	_00105_DS_
	MOVF	r0x00, W
	XORLW	0x02
	BZ	_00106_DS_
	BRA	_00108_DS_
_00105_DS_:
;	.line	91; interrupts.c	INTCON2bits.INTEDG2 = mask;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_INTCON2bits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_INTCON2bits
;	.line	92; interrupts.c	break;
	BRA	_00108_DS_
_00106_DS_:
;	.line	94; interrupts.c	INTCON2bits.INTEDG3 = mask;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_INTCON2bits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_INTCON2bits
_00108_DS_:
;	.line	101; interrupts.c	}
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	 2334 (0x091e) bytes ( 1.78%)
;           	 1167 (0x048f) words
; udata size:	   47 (0x002f) bytes ( 2.62%)
; access size:	   12 (0x000c) bytes


	end
