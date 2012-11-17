;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Fri Nov  9 21:20:54 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _debug_stack_report
	global _debug_hex_dump
	global _debug_spi_buff_dump
	global _debug_stack_paint

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
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
	extern _printf
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
r0x17	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_debug__debug_spi_buff_dump	code
_debug_spi_buff_dump:
;	.line	121; debug.c	void    debug_spi_buff_dump(unsigned char *ptr)
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
	MOVFF	r0x17, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	126; debug.c	for (ii = 0; ii < 4; ii++) {
	CLRF	r0x03
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
_00151_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00160_DS_
	MOVLW	0x04
	SUBWF	r0x03, W
_00160_DS_:
	BTFSC	STATUS, 0
	BRA	_00154_DS_
;	.line	127; debug.c	DPRINTF("%d: %x %x %x %x %x %x %x %x\n", 8*ii,
	MOVF	r0x05, W
	ADDLW	0x07
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x08
	CLRF	r0x09
	BTFSC	r0x08, 7
	SETF	r0x09
	MOVF	r0x00, W
	ADDWF	r0x07, F
	MOVF	r0x01, W
	ADDWFC	r0x08, F
	MOVF	r0x02, W
	ADDWFC	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x07
	CLRF	r0x08
	MOVF	r0x05, W
	ADDLW	0x06
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x0a
	CLRF	r0x0b
	BTFSC	r0x0a, 7
	SETF	r0x0b
	MOVF	r0x00, W
	ADDWF	r0x09, F
	MOVF	r0x01, W
	ADDWFC	r0x0a, F
	MOVF	r0x02, W
	ADDWFC	r0x0b, F
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget1
	MOVWF	r0x09
	CLRF	r0x0a
	MOVF	r0x05, W
	ADDLW	0x05
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x0c
	CLRF	r0x0d
	BTFSC	r0x0c, 7
	SETF	r0x0d
	MOVF	r0x00, W
	ADDWF	r0x0b, F
	MOVF	r0x01, W
	ADDWFC	r0x0c, F
	MOVF	r0x02, W
	ADDWFC	r0x0d, F
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
	MOVWF	r0x0b
	CLRF	r0x0c
	MOVF	r0x05, W
	ADDLW	0x04
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x0e
	CLRF	r0x0f
	BTFSC	r0x0e, 7
	SETF	r0x0f
	MOVF	r0x00, W
	ADDWF	r0x0d, F
	MOVF	r0x01, W
	ADDWFC	r0x0e, F
	MOVF	r0x02, W
	ADDWFC	r0x0f, F
	MOVFF	r0x0d, FSR0L
	MOVFF	r0x0e, PRODL
	MOVF	r0x0f, W
	CALL	__gptrget1
	MOVWF	r0x0d
	CLRF	r0x0e
	MOVF	r0x05, W
	ADDLW	0x03
	MOVWF	r0x0f
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x10
	CLRF	r0x11
	BTFSC	r0x10, 7
	SETF	r0x11
	MOVF	r0x00, W
	ADDWF	r0x0f, F
	MOVF	r0x01, W
	ADDWFC	r0x10, F
	MOVF	r0x02, W
	ADDWFC	r0x11, F
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget1
	MOVWF	r0x0f
	CLRF	r0x10
	MOVF	r0x05, W
	ADDLW	0x02
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x12
	CLRF	r0x13
	BTFSC	r0x12, 7
	SETF	r0x13
	MOVF	r0x00, W
	ADDWF	r0x11, F
	MOVF	r0x01, W
	ADDWFC	r0x12, F
	MOVF	r0x02, W
	ADDWFC	r0x13, F
	MOVFF	r0x11, FSR0L
	MOVFF	r0x12, PRODL
	MOVF	r0x13, W
	CALL	__gptrget1
	MOVWF	r0x11
	CLRF	r0x12
	MOVF	r0x05, W
	ADDLW	0x01
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x14
	CLRF	r0x15
	BTFSC	r0x14, 7
	SETF	r0x15
	MOVF	r0x00, W
	ADDWF	r0x13, F
	MOVF	r0x01, W
	ADDWFC	r0x14, F
	MOVF	r0x02, W
	ADDWFC	r0x15, F
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget1
	MOVWF	r0x13
	CLRF	r0x14
	MOVF	r0x05, W
	ADDWF	r0x00, W
	MOVWF	r0x15
	MOVF	r0x06, W
	ADDWFC	r0x01, W
	MOVWF	r0x16
	CLRF	WREG
	BTFSC	r0x06, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x17
	MOVFF	r0x15, FSR0L
	MOVFF	r0x16, PRODL
	MOVF	r0x17, W
	CALL	__gptrget1
	MOVWF	r0x15
	CLRF	r0x16
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x16, W
	MOVWF	POSTDEC1
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x15
	ADDWF	FSR1L, F
;	.line	126; debug.c	for (ii = 0; ii < 4; ii++) {
	MOVLW	0x08
	ADDWF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00151_DS_
_00154_DS_:
;	.line	138; debug.c	DPRINTF("\n");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x17
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
S_debug__debug_hex_dump	code
_debug_hex_dump:
;	.line	106; debug.c	void    debug_hex_dump(unsigned char *address, unsigned int count)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
_00143_DS_:
;	.line	109; debug.c	while ( count-- )
	MOVFF	r0x03, r0x05
	MOVFF	r0x04, r0x06
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVF	r0x05, W
	IORWF	r0x06, W
	BZ	_00145_DS_
;	.line	110; debug.c	printf("%x ", *address++);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x05
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	CLRF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00143_DS_
_00145_DS_:
;	.line	111; debug.c	printf("\n");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
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
S_debug__debug_stack_report	code
_debug_stack_report:
;	.line	75; debug.c	void    debug_stack_report(void)
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
;	.line	83; debug.c	if (stack[0] != 0xdeadbeef) {
	LFSR	0x00, 0x200
	MOVFF	POSTINC0, r0x00
	MOVFF	POSTINC0, r0x01
	MOVFF	POSTINC0, r0x02
	MOVFF	INDF0, r0x03
	MOVF	r0x00, W
	XORLW	0xef
	BNZ	_00136_DS_
	MOVF	r0x01, W
	XORLW	0xbe
	BNZ	_00136_DS_
	MOVF	r0x02, W
	XORLW	0xad
	BNZ	_00136_DS_
	MOVF	r0x03, W
	XORLW	0xde
	BZ	_00133_DS_
_00136_DS_:
;	.line	84; debug.c	printf("Stack overflowed\r\n");
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
_00120_DS_:
;	.line	85; debug.c	while (1)
	BRA	_00120_DS_
_00133_DS_:
;	.line	89; debug.c	for (ii = 1; stack[ii] == 0xdeadbeef; ii++)
	MOVLW	0x01
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	0x04
	MOVWF	r0x02
	CLRF	r0x03
_00124_DS_:
	MOVF	r0x02, W
	MOVWF	r0x04
	MOVLW	0x02
	ADDWF	r0x03, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	POSTINC0, r0x05
	MOVFF	POSTINC0, r0x06
	MOVFF	INDF0, r0x07
	MOVF	r0x04, W
	XORLW	0xef
	BNZ	_00137_DS_
	MOVF	r0x05, W
	XORLW	0xbe
	BNZ	_00137_DS_
	MOVF	r0x06, W
	XORLW	0xad
	BNZ	_00137_DS_
	MOVF	r0x07, W
	XORLW	0xde
	BZ	_00138_DS_
_00137_DS_:
	BRA	_00127_DS_
_00138_DS_:
	MOVLW	0x04
	ADDWF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00124_DS_
_00127_DS_:
;	.line	91; debug.c	size = 64 - ii;
	MOVF	r0x00, W
	SUBLW	0x40
	MOVWF	r0x00
	MOVLW	0x00
	SUBFWB	r0x01, F
;	.line	98; debug.c	FSR1H, FSR1L, size, stack[ii]);
	MOVFF	_FSR1L, r0x02
	CLRF	r0x03
	MOVFF	_FSR1H, r0x08
	CLRF	r0x09
;	.line	97; debug.c	printf("FSR1 = %x %x Max stack usage so far = %d/64 longs.\n",
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x0d
	ADDWF	FSR1L, F
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
S_debug__debug_stack_paint	code
_debug_stack_paint:
;	.line	26; debug.c	void    debug_stack_paint(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	46; debug.c	for (ii = 0; ii * sizeof(long) < FSR1L-4; ++ii)
	CLRF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00105_DS_:
	MOVFF	_FSR1L, r0x04
	CLRF	r0x05
	MOVLW	0xfc
	ADDWF	r0x04, F
	BTFSS	STATUS, 0
	DECF	r0x05, F
	MOVF	r0x03, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x05, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00114_DS_
	MOVF	r0x04, W
	SUBWF	r0x02, W
_00114_DS_:
	BC	_00109_DS_
;	.line	47; debug.c	stack[ii] = 0xdeadbeef;
	MOVF	r0x02, W
	MOVWF	r0x04
	MOVLW	0x02
	ADDWF	r0x03, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVLW	0xef
	MOVWF	POSTINC0
	MOVLW	0xbe
	MOVWF	POSTINC0
	MOVLW	0xad
	MOVWF	POSTINC0
	MOVLW	0xde
	MOVWF	INDF0
;	.line	46; debug.c	for (ii = 0; ii * sizeof(long) < FSR1L-4; ++ii)
	MOVLW	0x04
	ADDWF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00105_DS_
_00109_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x53, 0x74, 0x61, 0x63, 0x6b, 0x20, 0x6f, 0x76, 0x65, 0x72, 0x66, 0x6c
	DB	0x6f, 0x77, 0x65, 0x64, 0x0d, 0x0a, 0x00
; ; Starting pCode block
__str_1:
	DB	0x46, 0x53, 0x52, 0x31, 0x20, 0x3d, 0x20, 0x25, 0x78, 0x20, 0x25, 0x78
	DB	0x20, 0x4d, 0x61, 0x78, 0x20, 0x73, 0x74, 0x61, 0x63, 0x6b, 0x20, 0x75
	DB	0x73, 0x61, 0x67, 0x65, 0x20, 0x73, 0x6f, 0x20, 0x66, 0x61, 0x72, 0x20
	DB	0x3d, 0x20, 0x25, 0x64, 0x2f, 0x36, 0x34, 0x20, 0x6c, 0x6f, 0x6e, 0x67
	DB	0x73, 0x2e, 0x0a, 0x00
; ; Starting pCode block
__str_2:
	DB	0x25, 0x78, 0x20, 0x00
; ; Starting pCode block
__str_3:
	DB	0x0a, 0x00
; ; Starting pCode block
__str_4:
	DB	0x25, 0x64, 0x3a, 0x20, 0x25, 0x78, 0x20, 0x25, 0x78, 0x20, 0x25, 0x78
	DB	0x20, 0x25, 0x78, 0x20, 0x25, 0x78, 0x20, 0x25, 0x78, 0x20, 0x25, 0x78
	DB	0x20, 0x25, 0x78, 0x0a, 0x00


; Statistics:
; code size:	 1460 (0x05b4) bytes ( 1.11%)
;           	  730 (0x02da) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	   24 (0x0018) bytes


	end
