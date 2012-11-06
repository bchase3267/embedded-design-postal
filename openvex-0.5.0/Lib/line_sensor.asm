;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Sun Oct 14 01:17:21 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _line_sensor_read

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput2
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
	extern _io_read_analog
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

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_line_sensor__line_sensor_read	code
_line_sensor_read:
;	.line	66; line_sensor.c	status_t    line_sensor_read(unsigned char left_port,
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
;	.line	72; line_sensor.c	if ( ! VALID_ANALOG_PORT(left_port) ||
	MOVLW	0x01
	SUBWF	r0x00, W
	BNC	_00105_DS_
	MOVF	r0x00, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BNC	_00105_DS_
;	.line	73; line_sensor.c	! VALID_ANALOG_PORT(center_port) ||
	MOVLW	0x01
	SUBWF	r0x01, W
	BNC	_00105_DS_
	MOVF	r0x01, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BNC	_00105_DS_
;	.line	74; line_sensor.c	! VALID_ANALOG_PORT(right_port) )
	MOVLW	0x01
	SUBWF	r0x02, W
	BNC	_00105_DS_
	MOVF	r0x02, W
	BANKSEL	_Analog_ports
	SUBWF	_Analog_ports, W, B
	BC	_00106_DS_
_00105_DS_:
;	.line	75; line_sensor.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00112_DS_
_00106_DS_:
;	.line	77; line_sensor.c	sensor_data->left = left_port == 0 ? 0 : io_read_analog(left_port);
	MOVFF	r0x03, r0x06
	MOVFF	r0x04, r0x07
	MOVFF	r0x05, r0x08
	MOVF	r0x00, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x09
	RLCF	r0x09, F
	MOVF	r0x09, W
	BZ	_00114_DS_
	CLRF	r0x09
	CLRF	r0x0a
	BRA	_00115_DS_
_00114_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_read_analog
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	INCF	FSR1L, F
_00115_DS_:
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, PRODH
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput2
;	.line	78; line_sensor.c	sensor_data->center = center_port == 0 ? 0 : io_read_analog(center_port);
	MOVF	r0x03, W
	ADDLW	0x02
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x07
	MOVF	r0x01, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x08
	RLCF	r0x08, F
	MOVF	r0x08, W
	BZ	_00116_DS_
	CLRF	r0x08
	CLRF	r0x09
	BRA	_00117_DS_
_00116_DS_:
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_io_read_analog
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	INCF	FSR1L, F
_00117_DS_:
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput2
;	.line	79; line_sensor.c	sensor_data->right = right_port == 0 ? 0 : io_read_analog(right_port);
	MOVF	r0x03, W
	ADDLW	0x04
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x00
	MOVF	r0x02, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x04
	RLCF	r0x04, F
	MOVF	r0x04, W
	BZ	_00118_DS_
	CLRF	r0x04
	CLRF	r0x05
	BRA	_00119_DS_
_00118_DS_:
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_io_read_analog
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	INCF	FSR1L, F
_00119_DS_:
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	CALL	__gptrput2
;	.line	80; line_sensor.c	return OV_OK;
	CLRF	WREG
_00112_DS_:
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
; code size:	  414 (0x019e) bytes ( 0.32%)
;           	  207 (0x00cf) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	   11 (0x000b) bytes


	end
