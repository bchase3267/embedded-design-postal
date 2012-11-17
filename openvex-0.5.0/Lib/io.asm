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
	global _io_set_analog_port_count
	global _io_get_analog_port_count
	global _adc_conv
	global _adc_busy
	global _io_read_analog
	global _io_read_digital
	global _io_write_digital
	global _io_set_direction
	global _io_get_direction
	global _io_update_local_pwm_dir
	global _Analog_ports
	global _Analog_ports_const
	global _adc_open8520

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
	extern _delay10tcy
	extern _adc_close
	extern _adc_read
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
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

udata_io_0	udata
_Analog_ports	res	1

udata_io_1	udata
_Analog_ports_const	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_io__io_update_local_pwm_dir	code
_io_update_local_pwm_dir:
;	.line	437; io.c	void    io_update_local_pwm_dir(unsigned char txPWM_MASK)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	440; io.c	IO_DIRECTION_PWM1 = txPWM_MASK & 0x01;
	MOVLW	0x01
	ANDWF	r0x00, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISEbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_TRISEbits
;	.line	441; io.c	IO_DIRECTION_PWM2 = txPWM_MASK & 0x02;
	MOVLW	0x02
	ANDWF	r0x00, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_TRISGbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_TRISGbits
;	.line	442; io.c	IO_DIRECTION_PWM3 = txPWM_MASK & 0x04;
	MOVLW	0x04
	ANDWF	r0x00, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISGbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_TRISGbits
;	.line	443; io.c	IO_DIRECTION_PWM4 = txPWM_MASK & 0x08;
	MOVLW	0x08
	ANDWF	r0x00, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISGbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_TRISGbits
;	.line	444; io.c	IO_DIRECTION_PWM5 = txPWM_MASK & 0x10;
	MOVLW	0x10
	ANDWF	r0x00, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_TRISEbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_TRISEbits
;	.line	445; io.c	IO_DIRECTION_PWM6 = txPWM_MASK & 0x20;
	MOVLW	0x20
	ANDWF	r0x00, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISEbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_TRISEbits
;	.line	446; io.c	IO_DIRECTION_PWM7 = txPWM_MASK & 0x40;
	MOVLW	0x40
	ANDWF	r0x00, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISEbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_TRISEbits
;	.line	447; io.c	IO_DIRECTION_PWM8 = txPWM_MASK & 0x80;
	MOVLW	0x80
	ANDWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISEbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_TRISEbits
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_io__io_get_direction	code
_io_get_direction:
;	.line	400; io.c	char    io_get_direction(unsigned char port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	402; io.c	if ( ! VALID_DIGITAL_PORT(port) )
	MOVF	r0x00, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00270_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
	CLRF	r0x01
	RLCF	r0x01, F
	MOVF	r0x01, W
	BZ	_00271_DS_
_00270_DS_:
;	.line	403; io.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00291_DS_
_00271_DS_:
;	.line	405; io.c	switch(port)
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00289_DS_
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00289_DS_
	DECF	r0x00, F
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	CLRF	r0x03
	RLCF	r0x00, W
	RLCF	r0x03, F
	RLCF	WREG, W
	RLCF	r0x03, F
	ANDLW	0xfc
	MOVWF	r0x02
	MOVLW	UPPER(_00300_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00300_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00300_DS_)
	ADDWF	r0x02, F
	MOVF	r0x03, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x02, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVWF	PCL
_00300_DS_:
	GOTO	_00273_DS_
	GOTO	_00274_DS_
	GOTO	_00275_DS_
	GOTO	_00276_DS_
	GOTO	_00277_DS_
	GOTO	_00278_DS_
	GOTO	_00279_DS_
	GOTO	_00280_DS_
	GOTO	_00281_DS_
	GOTO	_00282_DS_
	GOTO	_00283_DS_
	GOTO	_00284_DS_
	GOTO	_00285_DS_
	GOTO	_00286_DS_
	GOTO	_00287_DS_
	GOTO	_00288_DS_
_00273_DS_:
;	.line	407; io.c	case    1:  return IO_DIRECTION1;
	CLRF	r0x00
	BTFSC	_TRISAbits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00274_DS_:
;	.line	408; io.c	case    2:  return IO_DIRECTION2;
	CLRF	r0x00
	BTFSC	_TRISAbits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00275_DS_:
;	.line	409; io.c	case    3:  return IO_DIRECTION3;
	CLRF	r0x00
	BTFSC	_TRISAbits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00276_DS_:
;	.line	410; io.c	case    4:  return IO_DIRECTION4;
	CLRF	r0x00
	BTFSC	_TRISAbits, 3
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00277_DS_:
;	.line	411; io.c	case    5:  return IO_DIRECTION5;
	CLRF	r0x00
	BTFSC	_TRISAbits, 5
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00278_DS_:
;	.line	412; io.c	case    6:  return IO_DIRECTION6;
	CLRF	r0x00
	BTFSC	_TRISFbits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00279_DS_:
;	.line	413; io.c	case    7:  return IO_DIRECTION7;
	CLRF	r0x00
	BTFSC	_TRISFbits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00280_DS_:
;	.line	414; io.c	case    8:  return IO_DIRECTION8;
	CLRF	r0x00
	BTFSC	_TRISFbits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00281_DS_:
;	.line	415; io.c	case    9:  return IO_DIRECTION9;
	CLRF	r0x00
	BTFSC	_TRISFbits, 3
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00282_DS_:
;	.line	416; io.c	case    10:  return IO_DIRECTION10;
	CLRF	r0x00
	BTFSC	_TRISFbits, 4
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00283_DS_:
;	.line	417; io.c	case    11:  return IO_DIRECTION11;
	CLRF	r0x00
	BTFSC	_TRISFbits, 5
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00284_DS_:
;	.line	418; io.c	case    12:  return IO_DIRECTION12;
	CLRF	r0x00
	BTFSC	_TRISFbits, 6
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00285_DS_:
;	.line	419; io.c	case    13:  return IO_DIRECTION13;
	CLRF	r0x00
	BTFSC	_TRISHbits, 4
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00286_DS_:
;	.line	420; io.c	case    14:  return IO_DIRECTION14;
	CLRF	r0x00
	BTFSC	_TRISHbits, 5
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00287_DS_:
;	.line	421; io.c	case    15:  return IO_DIRECTION15;
	CLRF	r0x00
	BTFSC	_TRISHbits, 6
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00288_DS_:
;	.line	422; io.c	case    16:  return IO_DIRECTION16;
	CLRF	r0x00
	BTFSC	_TRISHbits, 7
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00291_DS_
_00289_DS_:
;	.line	424; io.c	return OV_BAD_PARAM;
	MOVLW	0x80
_00291_DS_:
;	.line	425; io.c	}
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_io__io_set_direction	code
_io_set_direction:
;	.line	370; io.c	status_t    io_set_direction(unsigned char port,io_dir_t dir)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	372; io.c	if ( ! VALID_DIGITAL_PORT(port) )
	MOVF	r0x00, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00235_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
	CLRF	r0x02
	RLCF	r0x02, F
	MOVF	r0x02, W
	BZ	_00236_DS_
_00235_DS_:
;	.line	373; io.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00256_DS_
_00236_DS_:
;	.line	375; io.c	switch(port)
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00254_DS_
	MOVF	r0x02, W
	BTFSS	STATUS, 2
	BRA	_00254_DS_
	DECF	r0x00, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	CLRF	r0x04
	RLCF	r0x00, W
	RLCF	r0x04, F
	RLCF	WREG, W
	RLCF	r0x04, F
	ANDLW	0xfc
	MOVWF	r0x03
	MOVLW	UPPER(_00265_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00265_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00265_DS_)
	ADDWF	r0x03, F
	MOVF	r0x04, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVWF	PCL
_00265_DS_:
	GOTO	_00238_DS_
	GOTO	_00239_DS_
	GOTO	_00240_DS_
	GOTO	_00241_DS_
	GOTO	_00242_DS_
	GOTO	_00243_DS_
	GOTO	_00244_DS_
	GOTO	_00245_DS_
	GOTO	_00246_DS_
	GOTO	_00247_DS_
	GOTO	_00248_DS_
	GOTO	_00249_DS_
	GOTO	_00250_DS_
	GOTO	_00251_DS_
	GOTO	_00252_DS_
	GOTO	_00253_DS_
_00238_DS_:
;	.line	377; io.c	case    1:  IO_DIRECTION1 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00255_DS_
_00239_DS_:
;	.line	378; io.c	case    2:  IO_DIRECTION2 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00255_DS_
_00240_DS_:
;	.line	379; io.c	case    3:  IO_DIRECTION3 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00255_DS_
_00241_DS_:
;	.line	380; io.c	case    4:  IO_DIRECTION4 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00255_DS_
_00242_DS_:
;	.line	381; io.c	case    5:  IO_DIRECTION5 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISAbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_TRISAbits
	BRA	_00255_DS_
_00243_DS_:
;	.line	382; io.c	case    6:  IO_DIRECTION6 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_TRISFbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_TRISFbits
	BRA	_00255_DS_
_00244_DS_:
;	.line	383; io.c	case    7:  IO_DIRECTION7 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISFbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_TRISFbits
	BRA	_00255_DS_
_00245_DS_:
;	.line	384; io.c	case    8:  IO_DIRECTION8 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISFbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_TRISFbits
	BRA	_00255_DS_
_00246_DS_:
;	.line	385; io.c	case    9:  IO_DIRECTION9 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISFbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_TRISFbits
	BRA	_00255_DS_
_00247_DS_:
;	.line	386; io.c	case    10:  IO_DIRECTION10 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISFbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_TRISFbits
	BRA	_00255_DS_
_00248_DS_:
;	.line	387; io.c	case    11:  IO_DIRECTION11 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISFbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_TRISFbits
	BRA	_00255_DS_
_00249_DS_:
;	.line	388; io.c	case    12:  IO_DIRECTION12 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISFbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_TRISFbits
	BRA	_00255_DS_
_00250_DS_:
;	.line	389; io.c	case    13:  IO_DIRECTION13 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISHbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_TRISHbits
	BRA	_00255_DS_
_00251_DS_:
;	.line	390; io.c	case    14:  IO_DIRECTION14 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISHbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_TRISHbits
	BRA	_00255_DS_
_00252_DS_:
;	.line	391; io.c	case    15:  IO_DIRECTION15 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISHbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_TRISHbits
	BRA	_00255_DS_
_00253_DS_:
;	.line	392; io.c	case    16:  IO_DIRECTION16 = dir; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_TRISHbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_TRISHbits
	BRA	_00255_DS_
_00254_DS_:
;	.line	394; io.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00256_DS_
_00255_DS_:
;	.line	396; io.c	return OV_OK;
	CLRF	WREG
_00256_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_io__io_write_digital	code
_io_write_digital:
;	.line	320; io.c	status_t    io_write_digital(unsigned char port,unsigned char val)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	322; io.c	if ( ! VALID_DIGITAL_OUTPUT_PORT(port) )
	MOVF	r0x00, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00198_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
	CLRF	r0x02
	RLCF	r0x02, F
	MOVF	r0x02, W
	BNZ	_00198_DS_
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_get_direction
	MOVWF	r0x03
	INCF	FSR1L, F
	MOVF	r0x03, W
	BZ	_00199_DS_
_00198_DS_:
;	.line	323; io.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00220_DS_
_00199_DS_:
;	.line	327; io.c	switch(port)
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00218_DS_
	MOVF	r0x02, W
	BTFSS	STATUS, 2
	BRA	_00218_DS_
	DECF	r0x00, F
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	CLRF	r0x05
	RLCF	r0x00, W
	RLCF	r0x05, F
	RLCF	WREG, W
	RLCF	r0x05, F
	ANDLW	0xfc
	MOVWF	r0x04
	MOVLW	UPPER(_00230_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00230_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00230_DS_)
	ADDWF	r0x04, F
	MOVF	r0x05, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x04, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVWF	PCL
_00230_DS_:
	GOTO	_00202_DS_
	GOTO	_00203_DS_
	GOTO	_00204_DS_
	GOTO	_00205_DS_
	GOTO	_00206_DS_
	GOTO	_00207_DS_
	GOTO	_00208_DS_
	GOTO	_00209_DS_
	GOTO	_00210_DS_
	GOTO	_00211_DS_
	GOTO	_00212_DS_
	GOTO	_00213_DS_
	GOTO	_00214_DS_
	GOTO	_00215_DS_
	GOTO	_00216_DS_
	GOTO	_00217_DS_
_00202_DS_:
;	.line	329; io.c	case    1:  DIGITAL_OUT1 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00219_DS_
_00203_DS_:
;	.line	330; io.c	case    2:  DIGITAL_OUT2 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00219_DS_
_00204_DS_:
;	.line	331; io.c	case    3:  DIGITAL_OUT3 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00219_DS_
_00205_DS_:
;	.line	332; io.c	case    4:  DIGITAL_OUT4 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00219_DS_
_00206_DS_:
;	.line	333; io.c	case    5:  DIGITAL_OUT5 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATAbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_LATAbits
	BRA	_00219_DS_
_00207_DS_:
;	.line	334; io.c	case    6:  DIGITAL_OUT6 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATFbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATFbits
	BRA	_00219_DS_
_00208_DS_:
;	.line	335; io.c	case    7:  DIGITAL_OUT7 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATFbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATFbits
	BRA	_00219_DS_
_00209_DS_:
;	.line	336; io.c	case    8:  DIGITAL_OUT8 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATFbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATFbits
	BRA	_00219_DS_
_00210_DS_:
;	.line	337; io.c	case    9:  DIGITAL_OUT9 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATFbits, W
	ANDLW	0xf7
	IORWF	PRODH, W
	MOVWF	_LATFbits
	BRA	_00219_DS_
_00211_DS_:
;	.line	338; io.c	case    10:  DIGITAL_OUT10 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_LATFbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_LATFbits
	BRA	_00219_DS_
_00212_DS_:
;	.line	339; io.c	case    11:  DIGITAL_OUT11 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATFbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_LATFbits
	BRA	_00219_DS_
_00213_DS_:
;	.line	340; io.c	case    12:  DIGITAL_OUT12 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATFbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_LATFbits
	BRA	_00219_DS_
_00214_DS_:
;	.line	341; io.c	case    13:  DIGITAL_OUT13 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	MOVF	_LATHbits, W
	ANDLW	0xef
	IORWF	PRODH, W
	MOVWF	_LATHbits
	BRA	_00219_DS_
_00215_DS_:
;	.line	342; io.c	case    14:  DIGITAL_OUT14 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATHbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_LATHbits
	BRA	_00219_DS_
_00216_DS_:
;	.line	343; io.c	case    15:  DIGITAL_OUT15 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATHbits, W
	ANDLW	0xbf
	IORWF	PRODH, W
	MOVWF	_LATHbits
	BRA	_00219_DS_
_00217_DS_:
;	.line	344; io.c	case    16:  DIGITAL_OUT16 = val; break;
	MOVF	r0x01, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATHbits, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	_LATHbits
	BRA	_00219_DS_
_00218_DS_:
;	.line	346; io.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00220_DS_
_00219_DS_:
;	.line	348; io.c	return OV_OK;
	CLRF	WREG
_00220_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_io__io_read_digital	code
_io_read_digital:
;	.line	271; io.c	char    io_read_digital(unsigned char port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	274; io.c	if ( ! VALID_DIGITAL_INPUT_PORT(port) )
	MOVF	r0x00, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00159_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
	CLRF	r0x01
	RLCF	r0x01, F
	MOVF	r0x01, W
	BNZ	_00159_DS_
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_get_direction
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	XORLW	0x01
	BZ	_00160_DS_
_00159_DS_:
;	.line	275; io.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00181_DS_
_00160_DS_:
;	.line	278; io.c	switch(port)
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00179_DS_
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00179_DS_
	DECF	r0x00, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	CLRF	r0x04
	RLCF	r0x00, W
	RLCF	r0x04, F
	RLCF	WREG, W
	RLCF	r0x04, F
	ANDLW	0xfc
	MOVWF	r0x03
	MOVLW	UPPER(_00193_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00193_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00193_DS_)
	ADDWF	r0x03, F
	MOVF	r0x04, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVWF	PCL
_00193_DS_:
	GOTO	_00163_DS_
	GOTO	_00164_DS_
	GOTO	_00165_DS_
	GOTO	_00166_DS_
	GOTO	_00167_DS_
	GOTO	_00168_DS_
	GOTO	_00169_DS_
	GOTO	_00170_DS_
	GOTO	_00171_DS_
	GOTO	_00172_DS_
	GOTO	_00173_DS_
	GOTO	_00174_DS_
	GOTO	_00175_DS_
	GOTO	_00176_DS_
	GOTO	_00177_DS_
	GOTO	_00178_DS_
_00163_DS_:
;	.line	280; io.c	case    1:  return DIGITAL_IN1;
	CLRF	r0x00
	BTFSC	_PORTAbits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00164_DS_:
;	.line	281; io.c	case    2:  return DIGITAL_IN2;
	CLRF	r0x00
	BTFSC	_PORTAbits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00165_DS_:
;	.line	282; io.c	case    3:  return DIGITAL_IN3;
	CLRF	r0x00
	BTFSC	_PORTAbits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00166_DS_:
;	.line	283; io.c	case    4:  return DIGITAL_IN4;
	CLRF	r0x00
	BTFSC	_PORTAbits, 3
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00167_DS_:
;	.line	284; io.c	case    5:  return DIGITAL_IN5;
	CLRF	r0x00
	BTFSC	_PORTAbits, 5
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00168_DS_:
;	.line	285; io.c	case    6:  return DIGITAL_IN6;
	CLRF	r0x00
	BTFSC	_PORTFbits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00169_DS_:
;	.line	286; io.c	case    7:  return DIGITAL_IN7;
	CLRF	r0x00
	BTFSC	_PORTFbits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00170_DS_:
;	.line	287; io.c	case    8:  return DIGITAL_IN8;
	CLRF	r0x00
	BTFSC	_PORTFbits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00171_DS_:
;	.line	288; io.c	case    9:  return DIGITAL_IN9;
	CLRF	r0x00
	BTFSC	_PORTFbits, 3
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00172_DS_:
;	.line	289; io.c	case    10: return DIGITAL_IN10;
	CLRF	r0x00
	BTFSC	_PORTFbits, 4
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00173_DS_:
;	.line	290; io.c	case    11: return DIGITAL_IN11;
	CLRF	r0x00
	BTFSC	_PORTFbits, 5
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00174_DS_:
;	.line	291; io.c	case    12: return DIGITAL_IN12;
	CLRF	r0x00
	BTFSC	_PORTFbits, 6
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00175_DS_:
;	.line	292; io.c	case    13: return DIGITAL_IN13;
	CLRF	r0x00
	BTFSC	_PORTHbits, 4
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00176_DS_:
;	.line	293; io.c	case    14: return DIGITAL_IN14;
	CLRF	r0x00
	BTFSC	_PORTHbits, 5
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00177_DS_:
;	.line	294; io.c	case    15: return DIGITAL_IN15;
	CLRF	r0x00
	BTFSC	_PORTHbits, 6
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00178_DS_:
;	.line	295; io.c	case    16: return DIGITAL_IN16;
	CLRF	r0x00
	BTFSC	_PORTHbits, 7
	INCF	r0x00, F
	MOVF	r0x00, W
	BRA	_00181_DS_
_00179_DS_:
;	.line	297; io.c	return OV_BAD_PARAM;
	MOVLW	0x80
_00181_DS_:
;	.line	298; io.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_io__io_read_analog	code
_io_read_analog:
;	.line	199; io.c	unsigned int io_read_analog(unsigned char port)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	213; io.c	if ( ! VALID_ANALOG_PORT(port) )
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00142_DS_
	MOVF	r0x00, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00143_DS_
_00142_DS_:
;	.line	214; io.c	return OV_BAD_PARAM;
	SETF	PRODL
	MOVLW	0x80
	BRA	_00148_DS_
_00143_DS_:
;	.line	219; io.c	channel = port - 1;
	DECF	r0x00, F
;	.line	225; io.c	adc_open8520(channel);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_adc_open8520
	INCF	FSR1L, F
;	.line	228; io.c	delay10tcy(10);
	MOVLW	0x0a
	CALL	_delay10tcy
;	.line	230; io.c	adc_conv();
	CALL	_adc_conv
_00145_DS_:
;	.line	231; io.c	while ( adc_busy() )
	CALL	_adc_busy
	MOVWF	r0x00
	MOVF	r0x00, W
	BNZ	_00145_DS_
;	.line	233; io.c	result = adc_read();
	CALL	_adc_read
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
;	.line	234; io.c	adc_close();
	CALL	_adc_close
;	.line	251; io.c	return result;
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
_00148_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_io__adc_busy	code
_adc_busy:
;	.line	174; io.c	return ADCON0bits.GO;
	CLRF	r0x00
	BTFSC	_ADCON0bits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
; ; Starting pCode block
S_io__adc_conv	code
_adc_conv:
;	.line	167; io.c	void adc_conv(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	169; io.c	ADCON0bits.GO = 1;
	BSF	_ADCON0bits, 1
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_io__adc_open8520	code
_adc_open8520:
;	.line	120; io.c	void    adc_open8520(unsigned char channel)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	124; io.c	ADCON0 = 0;
	CLRF	_ADCON0
;	.line	127; io.c	ADCON0 |= (channel << 2);
	RLNCF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0xfc
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	IORWF	_ADCON0, F
;	.line	130; io.c	ADCON0bits.GO = 0;
	BCF	_ADCON0bits, 1
;	.line	133; io.c	ADCON1 = 0;
	CLRF	_ADCON1
;	.line	136; io.c	ADCON1bits.VCFG1 = 0;
	BCF	_ADCON1bits, 5
;	.line	137; io.c	ADCON1bits.VCFG0 = 0;
	BCF	_ADCON1bits, 4
	BANKSEL	_Analog_ports_const
;	.line	140; io.c	ADCON1 |= Analog_ports_const;
	MOVF	_Analog_ports_const, W, B
	IORWF	_ADCON1, F
;	.line	143; io.c	ADCON2 |= ADC_FRM_RJUST;
	BSF	_ADCON2, 7
;	.line	146; io.c	ADCON2bits.ADCS2 = 1;
	BSF	_ADCON2bits, 2
;	.line	147; io.c	ADCON2bits.ADCS1 = 1;
	BSF	_ADCON2bits, 1
;	.line	148; io.c	ADCON2bits.ADCS0 = 1;
	BSF	_ADCON2bits, 0
;	.line	151; io.c	PIR1bits.ADIF = ADC_INT_OFF;
	BCF	_PIR1bits, 6
;	.line	152; io.c	PIE1bits.ADIE = 0;
	BCF	_PIE1bits, 6
;	.line	155; io.c	ADCON0bits.ADON = 1;
	BSF	_ADCON0bits, 0
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_io__io_get_analog_port_count	code
_io_get_analog_port_count:
;	.line	100; io.c	unsigned char   io_get_analog_port_count(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_Analog_ports
;	.line	103; io.c	return Analog_ports;
	MOVF	_Analog_ports, W, B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_io__io_set_analog_port_count	code
_io_set_analog_port_count:
;	.line	65; io.c	status_t    io_set_analog_port_count(unsigned char ports)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	76; io.c	if ( ports <= 14 )
	MOVLW	0x0f
	SUBWF	r0x00, W
	BC	_00109_DS_
;	.line	78; io.c	Analog_ports = ports;
	MOVFF	r0x00, _Analog_ports
;	.line	79; io.c	Analog_ports_const = (0x0F - ports) | ADC_MASK;
	MOVF	r0x00, W
	SUBLW	0x0f
	BANKSEL	_Analog_ports_const
	MOVWF	_Analog_ports_const, B
;	.line	80; io.c	return OV_OK;
	CLRF	WREG
	BRA	_00111_DS_
_00109_DS_:
;	.line	82; io.c	else if ( ports == 16 )
	MOVF	r0x00, W
	XORLW	0x10
	BNZ	_00106_DS_
;	.line	84; io.c	Analog_ports = ports;
	MOVFF	r0x00, _Analog_ports
	BANKSEL	_Analog_ports_const
;	.line	85; io.c	Analog_ports_const = 0x00 | ADC_MASK;
	CLRF	_Analog_ports_const, B
;	.line	86; io.c	return OV_OK;
	CLRF	WREG
	BRA	_00111_DS_
_00106_DS_:
;	.line	89; io.c	return OV_BAD_PARAM;
	MOVLW	0x80
_00111_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	 2288 (0x08f0) bytes ( 1.75%)
;           	 1144 (0x0478) words
; udata size:	    2 (0x0002) bytes ( 0.11%)
; access size:	    6 (0x0006) bytes


	end
