;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Thu Oct 25 10:32:21 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _main
	global _custom_init
	global _rc_routine
	global _tank_drive_routine
	global _arcade_drive_routine
	global _autonomous_routine0
	global _autonomous_routine1
	global _autonomous_routine_competition
	global _heartbeat
	global _bump_front_left
	global _bump_front_right
	global _bump_front

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
	extern _rxbyte
	extern _Encoder_on_iport
	extern _Encoder_ticks
	extern _Quad_input_port
	extern _Porta_sample
	extern _Portf_sample
	extern _Porth_sample
	extern _Rx_buff
	extern _Rx_user_buff_index
	extern _Spi_status
	extern _Sonar_data_available
	extern _Sonar_on_iport
	extern _User_rxdata
	extern _User_txdata
	extern _Tx_buff
	extern _Tx_user_buff_index
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
	extern _io_set_analog_port_count
	extern _io_read_digital
	extern _io_set_direction
	extern _timer0_read32
	extern _rc_read_status
	extern _rc_read_data
	extern _rc_new_data_available
	extern _pwm_write
	extern _pwm_read
	extern _controller_submit_data
	extern _controller_begin_autonomous_mode
	extern _controller_end_autonomous_mode
	extern _controller_print_version
	extern _controller_init
	extern _delay_msec
	extern _delay_sec
	extern _arcade_drive
	extern __divsint
	extern __divulong
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
_rc_routine_sonar_distance_1_1	db	0x00, 0x00
_rc_routine_old_time_1_1	db	0x00, 0x00, 0x00, 0x00


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

udata_firmware_0	udata
_rc_routine_elapsed_time_1_1	res	4

udata_firmware_1	udata
_tank_drive_routine_left_power_1_1	res	1

udata_firmware_2	udata
_tank_drive_routine_right_power_1_1	res	1

udata_firmware_3	udata
_tank_drive_routine_impeller_power_1_1	res	1

udata_firmware_4	udata
_tank_drive_routine_arm_power_1_1	res	1

udata_firmware_5	udata
_arcade_drive_routine_left_power_1_1	res	1

udata_firmware_6	udata
_arcade_drive_routine_right_power_1_1	res	1

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	code
__sdcc_gsinit_startup:
; I code from now on!
	goto	__sdcc_program_startup
; ; Starting pCode block
__sdcc_program_startup:
	CALL	_main
; ;	return from main will lock up

	GOTO	$
; ; Starting pCode block
S_firmware__main	code
_main:
;	.line	66; firmware.c	controller_init();
	CALL	_controller_init
;	.line	69; firmware.c	custom_init();
	CALL	_custom_init
;	.line	80; firmware.c	if ( io_read_digital(COMPETITION_JUMPER_PORT) == 0 )
	MOVLW	0x0f
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	BNZ	_00119_DS_
;	.line	83; firmware.c	printf("Waiting for RC signal to begin autonomous period...\n");
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
_00105_DS_:
;	.line	84; firmware.c	while ( rc_read_status() != 1 )
	CALL	_rc_read_status
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	MOVWF	r0x00
	XORLW	0x01
	BNZ	_00105_DS_
;	.line	87; firmware.c	autonomous_routine_competition(20);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x14
	MOVWF	POSTDEC1
	CALL	_autonomous_routine_competition
	MOVLW	0x02
	ADDWF	FSR1L, F
_00119_DS_:
;	.line	112; firmware.c	if ( rc_new_data_available() )
	CALL	_rc_new_data_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00115_DS_
;	.line	114; firmware.c	rc_routine();
	CALL	_rc_routine
;	.line	117; firmware.c	if ( rc_read_data(AUTONOMOUS_TRIGGER_CHAN) == -127 )
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	XORLW	0x81
	BNZ	_00111_DS_
;	.line	118; firmware.c	autonomous_routine0();
	CALL	_autonomous_routine0
_00111_DS_:
;	.line	119; firmware.c	if ( rc_read_data(AUTONOMOUS_TRIGGER_CHAN) == 127 )
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	XORLW	0x7f
	BNZ	_00115_DS_
;	.line	120; firmware.c	autonomous_routine1();
	CALL	_autonomous_routine1
_00115_DS_:
;	.line	124; firmware.c	if(PIR1bits.RCIF) heartbeat();
	BTFSS	_PIR1bits, 5
	BRA	_00119_DS_
	CALL	_heartbeat
	BRA	_00119_DS_
	RETURN	

; ; Starting pCode block
S_firmware__bump_front	code
_bump_front:
;	.line	474; firmware.c	void bump_front()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	477; firmware.c	reset_right = pwm_read(RIGHT_DRIVE_PORT);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x00
	INCF	FSR1L, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
;	.line	478; firmware.c	reset_left = pwm_read(LEFT_DRIVE_PORT);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x02
	INCF	FSR1L, F
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
;	.line	481; firmware.c	pwm_write(RIGHT_DRIVE_PORT, -AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	482; firmware.c	pwm_write(LEFT_DRIVE_PORT, AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	483; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	484; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	487; firmware.c	pwm_write(RIGHT_DRIVE_PORT, AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	488; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	489; firmware.c	delay_msec(2700);
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	0x8c
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	492; firmware.c	pwm_write(RIGHT_DRIVE_PORT, reset_right);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	493; firmware.c	pwm_write(LEFT_DRIVE_PORT, reset_left);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	494; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	495; firmware.c	delay_msec(100);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x64
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__bump_front_right	code
_bump_front_right:
;	.line	447; firmware.c	void bump_front_right()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	451; firmware.c	reset_right = pwm_read(RIGHT_DRIVE_PORT);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x00
	INCF	FSR1L, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
;	.line	452; firmware.c	reset_left = pwm_read(LEFT_DRIVE_PORT);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x02
	INCF	FSR1L, F
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
;	.line	455; firmware.c	pwm_write(RIGHT_DRIVE_PORT, AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	456; firmware.c	pwm_write(LEFT_DRIVE_PORT, -AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	457; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	458; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	461; firmware.c	pwm_write(RIGHT_DRIVE_PORT, -AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	462; firmware.c	pwm_write(LEFT_DRIVE_PORT, -AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	463; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	464; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	467; firmware.c	pwm_write(RIGHT_DRIVE_PORT, reset_right);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	468; firmware.c	pwm_write(LEFT_DRIVE_PORT, reset_left);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	469; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	470; firmware.c	delay_msec(100);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x64
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__bump_front_left	code
_bump_front_left:
;	.line	421; firmware.c	void bump_front_left()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	424; firmware.c	reset_right = pwm_read(RIGHT_DRIVE_PORT);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x00
	INCF	FSR1L, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
;	.line	425; firmware.c	reset_left = pwm_read(LEFT_DRIVE_PORT);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x02
	INCF	FSR1L, F
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
;	.line	428; firmware.c	pwm_write(RIGHT_DRIVE_PORT, AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	429; firmware.c	pwm_write(LEFT_DRIVE_PORT, -AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	430; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	431; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	434; firmware.c	pwm_write(LEFT_DRIVE_PORT, AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	435; firmware.c	pwm_write(RIGHT_DRIVE_PORT, AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	436; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	437; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	440; firmware.c	pwm_write(RIGHT_DRIVE_PORT, reset_right);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	441; firmware.c	pwm_write(LEFT_DRIVE_PORT, reset_left);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	442; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	443; firmware.c	delay_msec(100);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x64
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__heartbeat	code
_heartbeat:
;	.line	405; firmware.c	void heartbeat(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	409; firmware.c	dat = RCREG;
	MOVFF	_RCREG, r0x00
;	.line	410; firmware.c	if(dat == 'p')
	MOVF	r0x00, W
	XORLW	0x70
	BNZ	_00227_DS_
;	.line	412; firmware.c	printf("Hello, World!\n");
	MOVLW	UPPER(__str_7)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_7)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_7)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	413; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
_00227_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__autonomous_routine_competition	code
_autonomous_routine_competition:
;	.line	379; firmware.c	void    autonomous_routine_competition(unsigned short seconds)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	382; firmware.c	printf("Running competition autonomous routine...\n");
	MOVLW	UPPER(__str_6)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_6)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_6)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	383; firmware.c	controller_begin_autonomous_mode();
	CALL	_controller_begin_autonomous_mode
;	.line	399; firmware.c	controller_end_autonomous_mode();
	CALL	_controller_end_autonomous_mode
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__autonomous_routine1	code
_autonomous_routine1:
;	.line	334; firmware.c	void    autonomous_routine1(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	338; firmware.c	DPRINTF("Starting autonomous routine...\n");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	346; firmware.c	pwm_write(RIGHT_DRIVE_PORT, -AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	347; firmware.c	pwm_write(LEFT_DRIVE_PORT, AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	348; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	351; firmware.c	for(i=0; (rc_read_data(6) != -127) && (i < 400);i++)
	CLRF	r0x00
	CLRF	r0x01
_00200_DS_:
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	XORLW	0x81
	BNZ	_00214_DS_
	BRA	_00203_DS_
_00214_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x7f
	BNZ	_00215_DS_
	MOVLW	0x90
	SUBWF	r0x00, W
_00215_DS_:
	BTFSC	STATUS, 0
	BRA	_00203_DS_
;	.line	353; firmware.c	delay_msec(50);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	356; firmware.c	if ( io_read_digital(LEFT_BUMPER_PORT) == 0 )
	MOVLW	0x09
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	BNZ	_00197_DS_
;	.line	358; firmware.c	printf("Bump left\n");
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	359; firmware.c	if ( io_read_digital(RIGHT_BUMPER_PORT) == 0 )
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	BNZ	_00192_DS_
;	.line	360; firmware.c	bump_front();
	CALL	_bump_front
	BRA	_00198_DS_
_00192_DS_:
;	.line	362; firmware.c	bump_front_left();
	CALL	_bump_front_left
	BRA	_00198_DS_
_00197_DS_:
;	.line	364; firmware.c	else if ( io_read_digital(RIGHT_BUMPER_PORT) == 0 )
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	BNZ	_00198_DS_
;	.line	366; firmware.c	printf("Bump right\n");
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	367; firmware.c	bump_front_right();
	CALL	_bump_front_right
_00198_DS_:
;	.line	369; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	351; firmware.c	for(i=0; (rc_read_data(6) != -127) && (i < 400);i++)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00200_DS_
_00203_DS_:
;	.line	371; firmware.c	pwm_write(RIGHT_DRIVE_PORT, MOTOR_STOP);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	372; firmware.c	pwm_write(LEFT_DRIVE_PORT, MOTOR_STOP);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	373; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	376; firmware.c	DPRINTF("Ending autonomous routine...\n");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__autonomous_routine0	code
_autonomous_routine0:
;	.line	307; firmware.c	void    autonomous_routine0(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	310; firmware.c	DPRINTF("Starting autonomous routine...\n");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	311; firmware.c	controller_begin_autonomous_mode();
	CALL	_controller_begin_autonomous_mode
;	.line	318; firmware.c	pwm_write(RIGHT_DRIVE_PORT, -AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	319; firmware.c	pwm_write(LEFT_DRIVE_PORT, AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	320; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	321; firmware.c	delay_sec(4);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_delay_sec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	322; firmware.c	pwm_write(RIGHT_DRIVE_PORT, MOTOR_STOP);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	323; firmware.c	pwm_write(LEFT_DRIVE_PORT, MOTOR_STOP);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	324; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	326; firmware.c	controller_end_autonomous_mode();
	CALL	_controller_end_autonomous_mode
;	.line	327; firmware.c	DPRINTF("Ending autonomous routine...\n");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__arcade_drive_routine	code
_arcade_drive_routine:
;	.line	268; firmware.c	void    arcade_drive_routine(void)
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
;	.line	278; firmware.c	joy_x = rc_read_data(ARCADE_DRIVE_X_CHAN);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
;	.line	279; firmware.c	joy_y = -rc_read_data(ARCADE_DRIVE_Y_CHAN);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x01
	INCF	FSR1L, F
	NEGF	r0x01
;	.line	280; firmware.c	arcade_drive(joy_x, joy_y, PWM_MAX, &left_power, &right_power);
	MOVLW	HIGH(_arcade_drive_routine_left_power_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_arcade_drive_routine_left_power_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVLW	HIGH(_arcade_drive_routine_right_power_1_1)
	MOVWF	r0x06
	MOVLW	LOW(_arcade_drive_routine_right_power_1_1)
	MOVWF	r0x05
	MOVLW	0x80
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
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_arcade_drive
	MOVLW	0x09
	ADDWF	FSR1L, F
	BANKSEL	_arcade_drive_routine_left_power_1_1
;	.line	284; firmware.c	pwm_write(LEFT_DRIVE_PORT, left_power);//pwm_write(LEFT_DRIVE_PORT, -left_power);
	MOVF	_arcade_drive_routine_left_power_1_1, W, B
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	_arcade_drive_routine_right_power_1_1
;	.line	285; firmware.c	pwm_write(RIGHT_DRIVE_PORT, -right_power);//pwm_write(RIGHT_DRIVE_PORT, right_power);
	COMF	_arcade_drive_routine_right_power_1_1, W, B
	MOVWF	r0x00
	INCF	r0x00, F
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	288; firmware.c	impeller_power = rc_read_data(ARCADE_IMPELLER_CHAN);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
;	.line	289; firmware.c	arm_power = rc_read_data(ARCADE_ARM_CHAN);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x01
	INCF	FSR1L, F
;	.line	290; firmware.c	pwm_write(IMPELLER_PORT, impeller_power);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	291; firmware.c	pwm_write(ARM_PORT, arm_power);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
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
S_firmware__tank_drive_routine	code
_tank_drive_routine:
;	.line	236; firmware.c	void    tank_drive_routine(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	245; firmware.c	left_power = -rc_read_data(TANK_DRIVE_LEFT_CHAN);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
	COMF	r0x00, W
	BANKSEL	_tank_drive_routine_left_power_1_1
	MOVWF	_tank_drive_routine_left_power_1_1, B
	INCF	_tank_drive_routine_left_power_1_1, F, B
;	.line	246; firmware.c	right_power = rc_read_data(TANK_DRIVE_RIGHT_CHAN);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	BANKSEL	_tank_drive_routine_right_power_1_1
	MOVWF	_tank_drive_routine_right_power_1_1, B
	INCF	FSR1L, F
	BANKSEL	_tank_drive_routine_right_power_1_1
;	.line	249; firmware.c	pwm_write(RIGHT_DRIVE_PORT, right_power);
	MOVF	_tank_drive_routine_right_power_1_1, W, B
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	_tank_drive_routine_left_power_1_1
;	.line	250; firmware.c	pwm_write(LEFT_DRIVE_PORT, left_power);
	MOVF	_tank_drive_routine_left_power_1_1, W, B
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	253; firmware.c	impeller_power = rc_read_data(TANK_IMPELLER_CHAN);
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	BANKSEL	_tank_drive_routine_impeller_power_1_1
	MOVWF	_tank_drive_routine_impeller_power_1_1, B
	INCF	FSR1L, F
;	.line	254; firmware.c	arm_power = rc_read_data(TANK_ARM_CHAN);
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	BANKSEL	_tank_drive_routine_arm_power_1_1
	MOVWF	_tank_drive_routine_arm_power_1_1, B
	INCF	FSR1L, F
	BANKSEL	_tank_drive_routine_impeller_power_1_1
;	.line	255; firmware.c	pwm_write(IMPELLER_PORT, impeller_power);
	MOVF	_tank_drive_routine_impeller_power_1_1, W, B
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	_tank_drive_routine_arm_power_1_1
;	.line	256; firmware.c	pwm_write(ARM_PORT, arm_power);
	MOVF	_tank_drive_routine_arm_power_1_1, W, B
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__rc_routine	code
_rc_routine:
;	.line	176; firmware.c	void    rc_routine(void)
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
;	.line	192; firmware.c	if ( io_read_digital(ARCADE_JUMPER_PORT) == 0 )
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	BNZ	_00156_DS_
;	.line	193; firmware.c	arcade_drive_routine();
	CALL	_arcade_drive_routine
	BRA	_00157_DS_
_00156_DS_:
;	.line	195; firmware.c	tank_drive_routine();
	CALL	_tank_drive_routine
_00157_DS_:
;	.line	197; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	205; firmware.c	elapsed_time = SYSTEM_TIMER_SECONDS();
	CALL	_timer0_read32
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	BTFSS	_T0CON, 3
	BRA	_00162_DS_
	MOVLW	0x01
	MOVWF	r0x04
	CLRF	r0x05
	BRA	_00163_DS_
_00162_DS_:
	MOVLW	0x07
	ANDWF	_T0CON, W
	MOVWF	r0x06
	MOVLW	0x02
	MOVWF	r0x04
	MOVLW	0x00
	MOVWF	r0x05
	MOVF	r0x06, W
	BZ	_00163_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00170_DS_:
	RLCF	r0x04, F
	RLCF	r0x05, F
	ADDLW	0x01
	BNC	_00170_DS_
_00163_DS_:
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
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
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
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
	BANKSEL	_rc_routine_elapsed_time_1_1
	MOVWF	_rc_routine_elapsed_time_1_1, B
	MOVFF	PRODL, (_rc_routine_elapsed_time_1_1 + 1)
	MOVFF	PRODH, (_rc_routine_elapsed_time_1_1 + 2)
	MOVFF	FSR0L, (_rc_routine_elapsed_time_1_1 + 3)
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 3)
;	.line	208; firmware.c	if ( elapsed_time > old_time )
	MOVF	(_rc_routine_elapsed_time_1_1 + 3), W, B
	BANKSEL	(_rc_routine_old_time_1_1 + 3)
	SUBWF	(_rc_routine_old_time_1_1 + 3), W, B
	BNZ	_00171_DS_
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 2)
	MOVF	(_rc_routine_elapsed_time_1_1 + 2), W, B
	BANKSEL	(_rc_routine_old_time_1_1 + 2)
	SUBWF	(_rc_routine_old_time_1_1 + 2), W, B
	BNZ	_00171_DS_
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 1)
	MOVF	(_rc_routine_elapsed_time_1_1 + 1), W, B
	BANKSEL	(_rc_routine_old_time_1_1 + 1)
	SUBWF	(_rc_routine_old_time_1_1 + 1), W, B
	BNZ	_00171_DS_
	BANKSEL	_rc_routine_elapsed_time_1_1
	MOVF	_rc_routine_elapsed_time_1_1, W, B
	BANKSEL	_rc_routine_old_time_1_1
	SUBWF	_rc_routine_old_time_1_1, W, B
_00171_DS_:
	BTFSC	STATUS, 0
	BRA	_00160_DS_
;	.line	210; firmware.c	old_time = elapsed_time;
	MOVFF	_rc_routine_elapsed_time_1_1, _rc_routine_old_time_1_1
	MOVFF	(_rc_routine_elapsed_time_1_1 + 1), (_rc_routine_old_time_1_1 + 1)
	MOVFF	(_rc_routine_elapsed_time_1_1 + 2), (_rc_routine_old_time_1_1 + 2)
	MOVFF	(_rc_routine_elapsed_time_1_1 + 3), (_rc_routine_old_time_1_1 + 3)
;	.line	218; firmware.c	DPRINTF("ET: %ld  RC: %d %d %d %d %d %d %d  Jumper: %d\n",
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x00
	INCF	FSR1L, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x02
	INCF	FSR1L, F
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x04
	INCF	FSR1L, F
	CLRF	r0x05
	BTFSC	r0x04, 7
	SETF	r0x05
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x06
	INCF	FSR1L, F
	CLRF	r0x07
	BTFSC	r0x06, 7
	SETF	r0x07
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x08
	INCF	FSR1L, F
	CLRF	r0x09
	BTFSC	r0x08, 7
	SETF	r0x09
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x0a
	INCF	FSR1L, F
	CLRF	r0x0b
	BTFSC	r0x0a, 7
	SETF	r0x0b
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x0c
	INCF	FSR1L, F
	CLRF	r0x0d
	BTFSC	r0x0c, 7
	SETF	r0x0d
	CALL	_rc_read_status
	MOVWF	r0x0e
	CLRF	r0x0f
	BTFSC	r0x0e, 7
	SETF	r0x0f
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 3)
	MOVF	(_rc_routine_elapsed_time_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 2)
	MOVF	(_rc_routine_elapsed_time_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 1)
	MOVF	(_rc_routine_elapsed_time_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_rc_routine_elapsed_time_1_1
	MOVF	_rc_routine_elapsed_time_1_1, W, B
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x17
	ADDWF	FSR1L, F
_00160_DS_:
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
S_firmware__custom_init	code
_custom_init:
;	.line	138; firmware.c	void    custom_init(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	149; firmware.c	for (c = 1; c <= 16; ++c)
	MOVLW	0x01
	MOVWF	r0x00
	CLRF	r0x01
_00141_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00150_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
_00150_DS_:
	BC	_00144_DS_
;	.line	150; firmware.c	io_set_direction(c, IO_DIRECTION_IN);
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_io_set_direction
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	149; firmware.c	for (c = 1; c <= 16; ++c)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00141_DS_
_00144_DS_:
;	.line	156; firmware.c	io_set_analog_port_count(ANALOG_PORTS);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_io_set_analog_port_count
	INCF	FSR1L, F
;	.line	167; firmware.c	controller_print_version();
	CALL	_controller_print_version
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x57, 0x61, 0x69, 0x74, 0x69, 0x6e, 0x67, 0x20, 0x66, 0x6f, 0x72, 0x20
	DB	0x52, 0x43, 0x20, 0x73, 0x69, 0x67, 0x6e, 0x61, 0x6c, 0x20, 0x74, 0x6f
	DB	0x20, 0x62, 0x65, 0x67, 0x69, 0x6e, 0x20, 0x61, 0x75, 0x74, 0x6f, 0x6e
	DB	0x6f, 0x6d, 0x6f, 0x75, 0x73, 0x20, 0x70, 0x65, 0x72, 0x69, 0x6f, 0x64
	DB	0x2e, 0x2e, 0x2e, 0x0a, 0x00
; ; Starting pCode block
__str_1:
	DB	0x45, 0x54, 0x3a, 0x20, 0x25, 0x6c, 0x64, 0x20, 0x20, 0x52, 0x43, 0x3a
	DB	0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64
	DB	0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x20, 0x4a
	DB	0x75, 0x6d, 0x70, 0x65, 0x72, 0x3a, 0x20, 0x25, 0x64, 0x0a, 0x00
; ; Starting pCode block
__str_2:
	DB	0x53, 0x74, 0x61, 0x72, 0x74, 0x69, 0x6e, 0x67, 0x20, 0x61, 0x75, 0x74
	DB	0x6f, 0x6e, 0x6f, 0x6d, 0x6f, 0x75, 0x73, 0x20, 0x72, 0x6f, 0x75, 0x74
	DB	0x69, 0x6e, 0x65, 0x2e, 0x2e, 0x2e, 0x0a, 0x00
; ; Starting pCode block
__str_3:
	DB	0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x20, 0x61, 0x75, 0x74, 0x6f, 0x6e
	DB	0x6f, 0x6d, 0x6f, 0x75, 0x73, 0x20, 0x72, 0x6f, 0x75, 0x74, 0x69, 0x6e
	DB	0x65, 0x2e, 0x2e, 0x2e, 0x0a, 0x00
; ; Starting pCode block
__str_4:
	DB	0x42, 0x75, 0x6d, 0x70, 0x20, 0x6c, 0x65, 0x66, 0x74, 0x0a, 0x00
; ; Starting pCode block
__str_5:
	DB	0x42, 0x75, 0x6d, 0x70, 0x20, 0x72, 0x69, 0x67, 0x68, 0x74, 0x0a, 0x00
; ; Starting pCode block
__str_6:
	DB	0x52, 0x75, 0x6e, 0x6e, 0x69, 0x6e, 0x67, 0x20, 0x63, 0x6f, 0x6d, 0x70
	DB	0x65, 0x74, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x20, 0x61, 0x75, 0x74, 0x6f
	DB	0x6e, 0x6f, 0x6d, 0x6f, 0x75, 0x73, 0x20, 0x72, 0x6f, 0x75, 0x74, 0x69
	DB	0x6e, 0x65, 0x2e, 0x2e, 0x2e, 0x0a, 0x00
; ; Starting pCode block
__str_7:
	DB	0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64
	DB	0x21, 0x0a, 0x00


; Statistics:
; code size:	 2766 (0x0ace) bytes ( 2.11%)
;           	 1383 (0x0567) words
; udata size:	   10 (0x000a) bytes ( 0.56%)
; access size:	   16 (0x0010) bytes


	end
