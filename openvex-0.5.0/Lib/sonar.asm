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
	global _sonar_init_spin_wait
	global _sonar_read_spin_wait
	global _sonar_init
	global _sonar_read
	global _sonar_emit_pulse
	global _sonar_emit_pulse_interrupt

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
	extern _Interrupt_port_in_use
	extern _Sonar_on_iport
	extern _Sonar_output_port
	extern _Sonar_data_available
	extern _Sonar_echo_time
	extern _Timer0_at_emit
	extern _Timer0_at_echo
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
	extern _io_read_digital
	extern _io_write_digital
	extern _io_set_direction
	extern _io_get_direction
	extern _interrupt_set_edge
	extern _interrupt_enable
	extern __mullong
	extern __divulong
	extern __divsint
	extern __divuint
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
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_sonar_read_waiting_for_echo_1_1	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_sonar_read_last_distance_1_1	db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00


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

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_sonar__sonar_emit_pulse_interrupt	code
_sonar_emit_pulse_interrupt:
;	.line	333; sonar.c	status_t    sonar_emit_pulse_interrupt(unsigned char output_port,
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	345; sonar.c	if ( ! VALID_INTERRUPT_PORT(interrupt_port) ||
	MOVLW	0x01
	SUBWF	r0x01, W
	BNC	_00226_DS_
	MOVLW	0x07
	SUBWF	r0x01, W
	BC	_00226_DS_
;	.line	346; sonar.c	! VALID_DIGITAL_OUTPUT_PORT(output_port) )
	MOVF	r0x00, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00226_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
	BC	_00226_DS_
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_get_direction
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	BZ	_00227_DS_
_00226_DS_:
;	.line	347; sonar.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00232_DS_
_00227_DS_:
;	.line	349; sonar.c	interrupt_set_edge(interrupt_port,INTERRUPT_RISING_EDGE);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_interrupt_set_edge
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	350; sonar.c	interrupt_enable(interrupt_port);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_interrupt_enable
	INCF	FSR1L, F
;	.line	351; sonar.c	sonar_emit_pulse(output_port);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sonar_emit_pulse
	INCF	FSR1L, F
;	.line	352; sonar.c	return OV_OK;
	CLRF	WREG
_00232_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_sonar__sonar_emit_pulse	code
_sonar_emit_pulse:
;	.line	300; sonar.c	status_t    sonar_emit_pulse(unsigned char output_port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	311; sonar.c	if ( ! VALID_DIGITAL_OUTPUT_PORT(output_port) )
	MOVF	r0x00, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00206_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
	BC	_00206_DS_
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_get_direction
	MOVWF	r0x01
	INCF	FSR1L, F
	MOVF	r0x01, W
	BZ	_00207_DS_
_00206_DS_:
;	.line	312; sonar.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00213_DS_
_00207_DS_:
;	.line	314; sonar.c	io_write_digital(output_port,1);    /* Start pulse. */
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_write_digital
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	315; sonar.c	start = TMR0L;
	MOVFF	_TMR0L, r0x01
;	.line	317; sonar.c	end = start + 16;
	MOVLW	0x10
	ADDWF	r0x01, F
_00210_DS_:
;	.line	318; sonar.c	while (TMR0L < end)
	MOVF	r0x01, W
	SUBWF	_TMR0L, W
	BNC	_00210_DS_
;	.line	320; sonar.c	io_write_digital(output_port,0);    /* End pulse. */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_write_digital
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	322; sonar.c	return OV_OK;
	CLRF	WREG
_00213_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_sonar__sonar_read	code
_sonar_read:
;	.line	240; sonar.c	unsigned int    sonar_read(unsigned char interrupt_port)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	249; sonar.c	if ( ! VALID_INTERRUPT_PORT(interrupt_port) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00168_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BNC	_00169_DS_
_00168_DS_:
;	.line	250; sonar.c	return OV_BAD_PARAM;
	SETF	PRODL
	MOVLW	0x80
	BRA	_00178_DS_
_00169_DS_:
;	.line	255; sonar.c	if ( !waiting_for_echo[interrupt_port-1] )
	DECF	r0x00, W
	MOVWF	r0x01
	MOVLW	LOW(_sonar_read_waiting_for_echo_1_1)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_sonar_read_waiting_for_echo_1_1)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x04
	MOVF	r0x04, W
	BTFSS	STATUS, 2
	BRA	_00176_DS_
;	.line	261; sonar.c	TIMER0_READ16(t0);
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
; ;multiply lit val:0x02 by variable r0x01 and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	268; sonar.c	echo_time = (t0 - Timer0_at_echo[interrupt_port-1]) / TIMER0_TICKS_PER_MS;
	BCF	STATUS, 0
	RLCF	r0x01, W
	MOVWF	r0x06
	CLRF	r0x07
	MOVLW	LOW(_Timer0_at_echo)
	ADDWF	r0x06, F
	MOVLW	HIGH(_Timer0_at_echo)
	ADDWFC	r0x07, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	POSTINC0, r0x06
	MOVFF	INDF0, r0x07
	MOVF	r0x06, W
	SUBWF	r0x04, F
	MOVF	r0x07, W
	SUBWFB	r0x05, F
	BTFSS	_T0CON, 3
	BRA	_00180_DS_
	MOVLW	0x01
	MOVWF	r0x06
	CLRF	r0x07
	BRA	_00181_DS_
_00180_DS_:
	MOVLW	0x07
	ANDWF	_T0CON, W
	MOVWF	r0x08
	MOVLW	0x02
	MOVWF	r0x06
	MOVLW	0x00
	MOVWF	r0x07
	MOVF	r0x08, W
	BZ	_00181_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00196_DS_:
	RLCF	r0x06, F
	RLCF	r0x07, F
	ADDLW	0x01
	BNC	_00196_DS_
_00181_DS_:
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	269; sonar.c	if ( echo_time > 11 )
	MOVLW	0x00
	SUBWF	r0x05, W
	BNZ	_00197_DS_
	MOVLW	0x0c
	SUBWF	r0x04, W
_00197_DS_:
	BTFSS	STATUS, 0
	BRA	_00177_DS_
;	.line	271; sonar.c	sonar_emit_pulse_interrupt(Sonar_output_port[interrupt_port-1],
	MOVLW	LOW(_Sonar_output_port)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_Sonar_output_port)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
;	.line	272; sonar.c	interrupt_port);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_sonar_emit_pulse_interrupt
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	273; sonar.c	waiting_for_echo[interrupt_port-1] = 1;
	MOVLW	LOW(_sonar_read_waiting_for_echo_1_1)
	ADDWF	r0x01, W
	MOVWF	r0x00
	CLRF	r0x04
	MOVLW	HIGH(_sonar_read_waiting_for_echo_1_1)
	ADDWFC	r0x04, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
	BRA	_00177_DS_
_00176_DS_:
;	.line	277; sonar.c	else if ( SONAR_DATA_AVAILABLE(interrupt_port) )
	MOVLW	LOW(_Sonar_data_available)
	ADDWF	r0x01, W
	MOVWF	r0x00
	CLRF	r0x04
	MOVLW	HIGH(_Sonar_data_available)
	ADDWFC	r0x04, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x00
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00177_DS_
;	.line	279; sonar.c	CLR_SONAR_DATA_AVAILABLE(interrupt_port);
	MOVLW	LOW(_Sonar_data_available)
	ADDWF	r0x01, W
	MOVWF	r0x00
	CLRF	r0x04
	MOVLW	HIGH(_Sonar_data_available)
	ADDWFC	r0x04, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
;	.line	282; sonar.c	waiting_for_echo[interrupt_port-1] = 0;
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
; ;multiply lit val:0x02 by variable r0x01 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	285; sonar.c	last_distance[interrupt_port-1] = 
	BCF	STATUS, 0
	RLCF	r0x01, W
	MOVWF	r0x00
	MOVLW	LOW(_sonar_read_last_distance_1_1)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_sonar_read_last_distance_1_1)
	ADDWFC	r0x03, F
;	.line	286; sonar.c	ECHO_TIME_TO_CM(SONAR_ECHO_TIME(interrupt_port));
	BTFSS	_T0CON, 3
	BRA	_00182_DS_
	MOVLW	0x01
	MOVWF	r0x04
	CLRF	r0x05
	BRA	_00183_DS_
_00182_DS_:
	MOVLW	0x07
	ANDWF	_T0CON, W
	MOVWF	r0x06
	MOVLW	0x02
	MOVWF	r0x04
	MOVLW	0x00
	MOVWF	r0x05
	MOVF	r0x06, W
	BZ	_00183_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00201_DS_:
	RLCF	r0x04, F
	RLCF	r0x05, F
	ADDLW	0x01
	BNC	_00201_DS_
_00183_DS_:
	CLRF	WREG
	BTFSC	r0x05, 7
	MOVLW	0xff
	MOVWF	r0x06
	MOVWF	r0x07
	CLRF	r0x08
	MOVLW	LOW(_Sonar_echo_time)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Sonar_echo_time)
	ADDWFC	r0x08, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x08
	CLRF	r0x09
	CLRF	r0x0a
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x00
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVFF	FSR0L, r0x06
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVLW	0x70
	ADDWF	r0x00, F
	MOVLW	0xfe
	ADDWFC	r0x04, F
	MOVLW	0xff
	ADDWFC	r0x05, F
	MOVLW	0xff
	ADDWFC	r0x06, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x47
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x00
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVFF	FSR0L, r0x06
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x00, POSTINC0
	MOVFF	r0x04, INDF0
; ;multiply lit val:0x02 by variable r0x01 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00177_DS_:
;	.line	288; sonar.c	return last_distance[interrupt_port-1];
	BCF	STATUS, 0
	RLCF	r0x01, F
	CLRF	r0x00
	MOVLW	LOW(_sonar_read_last_distance_1_1)
	ADDWF	r0x01, F
	MOVLW	HIGH(_sonar_read_last_distance_1_1)
	ADDWFC	r0x00, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x00, FSR0H
	MOVFF	POSTINC0, r0x01
	MOVFF	INDF0, r0x00
	MOVFF	r0x00, PRODL
	MOVF	r0x01, W
_00178_DS_:
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
S_sonar__sonar_init	code
_sonar_init:
;	.line	196; sonar.c	status_t    sonar_init(unsigned char interrupt_port,
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
;	.line	200; sonar.c	if ( ! VALID_INTERRUPT_PORT(interrupt_port) ||
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00150_DS_
	MOVLW	0x07
	SUBWF	r0x00, W
	BC	_00150_DS_
;	.line	201; sonar.c	! VALID_DIGITAL_PORT(output_port) )
	MOVF	r0x01, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00150_DS_
	MOVLW	0x11
	SUBWF	r0x01, W
	BNC	_00151_DS_
_00150_DS_:
;	.line	202; sonar.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00155_DS_
_00151_DS_:
;	.line	204; sonar.c	io_set_direction(output_port,IO_DIRECTION_OUT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_io_set_direction
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	205; sonar.c	io_write_digital(output_port,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_io_write_digital
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	206; sonar.c	SET_SONAR_ON_IPORT(interrupt_port);
	DECF	r0x00, W
	MOVWF	r0x02
	MOVLW	LOW(_Sonar_on_iport)
	ADDWF	r0x02, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_Sonar_on_iport)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
;	.line	207; sonar.c	Sonar_output_port[interrupt_port-1] = output_port;
	CLRF	r0x03
	MOVLW	LOW(_Sonar_output_port)
	ADDWF	r0x02, F
	MOVLW	HIGH(_Sonar_output_port)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
;	.line	208; sonar.c	sonar_emit_pulse_interrupt(output_port,interrupt_port);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_sonar_emit_pulse_interrupt
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	209; sonar.c	return OV_OK;
	CLRF	WREG
_00155_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_sonar__sonar_read_spin_wait	code
_sonar_read_spin_wait:
;	.line	139; sonar.c	unsigned int    sonar_read_spin_wait(
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
;	.line	150; sonar.c	sonar_emit_pulse(output_port);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sonar_emit_pulse
	INCF	FSR1L, F
_00123_DS_:
;	.line	164; sonar.c	while ( io_read_digital(digital_in_port) == 0 )
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	BZ	_00123_DS_
;	.line	167; sonar.c	TIMER0_READ16(timer0_at_emit);
	MOVFF	_TMR0L, r0x00
	CLRF	r0x02
	MOVFF	_TMR0H, r0x03
	CLRF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x06
	CLRF	r0x05
	MOVF	r0x05, W
	IORWF	r0x00, F
	MOVF	r0x06, W
	IORWF	r0x02, F
_00126_DS_:
;	.line	171; sonar.c	while ( io_read_digital(digital_in_port) == 1 )
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x03
	INCF	FSR1L, F
	MOVF	r0x03, W
	XORLW	0x01
	BZ	_00126_DS_
;	.line	174; sonar.c	TIMER0_READ16(timer0_at_echo);
	MOVFF	_TMR0L, r0x01
	CLRF	r0x03
	MOVFF	_TMR0H, r0x04
	CLRF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x07
	CLRF	r0x06
	MOVF	r0x06, W
	IORWF	r0x01, F
	MOVF	r0x07, W
	IORWF	r0x03, F
;	.line	176; sonar.c	sonar_echo_time = timer0_at_echo - timer0_at_emit;
	MOVF	r0x00, W
	SUBWF	r0x01, W
	MOVWF	r0x00
	MOVF	r0x02, W
	SUBWFB	r0x03, W
	MOVWF	r0x01
;	.line	181; sonar.c	return ECHO_TIME_TO_CM(sonar_echo_time);
	BTFSS	_T0CON, 3
	BRA	_00131_DS_
	MOVLW	0x01
	MOVWF	r0x02
	CLRF	r0x03
	BRA	_00132_DS_
_00131_DS_:
	MOVLW	0x07
	ANDWF	_T0CON, W
	MOVWF	r0x04
	MOVLW	0x02
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	r0x03
	MOVF	r0x04, W
	BZ	_00132_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00145_DS_:
	RLCF	r0x02, F
	RLCF	r0x03, F
	ADDLW	0x01
	BNC	_00145_DS_
_00132_DS_:
	CLRF	WREG
	BTFSC	r0x03, 7
	MOVLW	0xff
	MOVWF	r0x04
	MOVWF	r0x05
	CLRF	r0x06
	CLRF	r0x07
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVLW	0x70
	ADDWF	r0x00, F
	MOVLW	0xfe
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x47
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
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
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
S_sonar__sonar_init_spin_wait	code
_sonar_init_spin_wait:
;	.line	92; sonar.c	status_t    sonar_init_spin_wait(unsigned char output_port,
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	96; sonar.c	if ( ! VALID_DIGITAL_PORT(input_port) ||
	MOVF	r0x01, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00105_DS_
	MOVLW	0x11
	SUBWF	r0x01, W
	BC	_00105_DS_
;	.line	97; sonar.c	! VALID_DIGITAL_PORT(output_port) )
	MOVF	r0x00, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00105_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
	BNC	_00106_DS_
_00105_DS_:
;	.line	98; sonar.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00110_DS_
_00106_DS_:
;	.line	100; sonar.c	io_set_direction(output_port,IO_DIRECTION_OUT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_set_direction
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	101; sonar.c	io_write_digital(output_port,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_write_digital
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	102; sonar.c	io_set_direction(input_port,IO_DIRECTION_IN);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_io_set_direction
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	103; sonar.c	return OV_OK;
	CLRF	WREG
_00110_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	 1706 (0x06aa) bytes ( 1.30%)
;           	  853 (0x0355) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	   11 (0x000b) bytes


	end
