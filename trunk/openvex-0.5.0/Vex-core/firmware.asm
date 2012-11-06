;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Sat Nov  3 23:17:12 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _right_multiplier
	global _left_multiplier
	global _RIGHT_MOTOR_POWER
	global _LEFT_MOTOR_POWER
	global _RIGHT_MOTOR
	global _LEFT_MOTOR
	global _main
	global _custom_init
	global _rc_routine
	global _tank_drive_routine
	global _arcade_drive_routine
	global _autonomous_routine0
	global _usart_data_available
	global _usart_get_byte_available
	global _usart_get_byte
	global _serial_control
	global _heartbeat
	global _bump_front_left
	global _bump_front_right
	global _bump_front
	global _set_drives_LR
	global _SPEED
	global _forward
	global _backward
	global _rotate_left
	global _rotate_right
	global _halt
	global _DRIVE

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
	extern _putchar
	extern _io_set_analog_port_count
	extern _io_read_digital
	extern _io_set_direction
	extern _timer0_read32
	extern _rc_read_status
	extern _rc_read_data
	extern _controller_in_autonomous_mode
	extern _rc_new_data_available
	extern _pwm_write
	extern _pwm_read
	extern _controller_submit_data
	extern _controller_begin_autonomous_mode
	extern _controller_end_autonomous_mode
	extern _controller_print_version
	extern _controller_init
	extern _delay_msec
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
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_LEFT_MOTOR	db	0x01
_RIGHT_MOTOR	db	0x02
_LEFT_MOTOR_POWER	db	0x00
_RIGHT_MOTOR_POWER	db	0x00
_SPEED	db	0x46
_forward	db	0x01, 0xff
_backward	db	0xff, 0x01
_rotate_left	db	0xff, 0xff
_rotate_right	db	0x01, 0x01
_halt	db	0x00, 0x00
_DRIVE	db	0x00, 0x00
_left_multiplier	db	0x00, 0x00, 0x00, 0x00
_right_multiplier	db	0x00, 0x00, 0x00, 0x00
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
_arcade_drive_routine_left_power_1_1	res	1

udata_firmware_4	udata
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
;	.line	60; firmware.c	controller_init();
	CALL	_controller_init
;	.line	61; firmware.c	custom_init();
	CALL	_custom_init
;	.line	68; firmware.c	controller_begin_autonomous_mode();
	CALL	_controller_begin_autonomous_mode
_00114_DS_:
;	.line	87; firmware.c	if (!controller_in_autonomous_mode())
	CALL	_controller_in_autonomous_mode
	MOVWF	r0x00
	MOVF	r0x00, W
	BNZ	_00110_DS_
;	.line	89; firmware.c	if ( rc_new_data_available() )
	CALL	_rc_new_data_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00110_DS_
;	.line	91; firmware.c	rc_routine();
	CALL	_rc_routine
;	.line	94; firmware.c	if ( rc_read_data(AUTONOMOUS_TRIGGER_CHAN) == -127 ) autonomous_routine0();
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	XORLW	0x81
	BNZ	_00110_DS_
	CALL	_autonomous_routine0
_00110_DS_:
;	.line	97; firmware.c	controller_begin_autonomous_mode();
	CALL	_controller_begin_autonomous_mode
;	.line	98; firmware.c	if(usart_data_available())
	CALL	_usart_data_available
	MOVWF	r0x00
; #	MOVF	r0x00, W
; #	BTFSC	STATUS, 2
; #	GOTO	_00112_DS_
; #	CALL	_serial_control
; #;;multiply variable :_DRIVE by variable _SPEED and store in r0x00
; #	MOVF	_SPEED, W, B
;	.line	100; firmware.c	serial_control();
	MOVF	r0x00, W
;	.line	102; firmware.c	set_drives_LR(SPEED * DRIVE.left_multiplier,SPEED * DRIVE.right_multiplier);
	BTFSS	STATUS, 2
	CALL	_serial_control
	BANKSEL	_SPEED
	MOVF	_SPEED, W, B
	BANKSEL	_DRIVE
	MULWF	_DRIVE, B
	MOVFF	PRODL, r0x00
; ;multiply variable :(_DRIVE + 1) by variable _SPEED and store in r0x01
	BANKSEL	_SPEED
	MOVF	_SPEED, W, B
	BANKSEL	(_DRIVE + 1)
	MULWF	(_DRIVE + 1), B
	MOVFF	PRODL, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	103; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	104; firmware.c	controller_end_autonomous_mode();
	CALL	_controller_end_autonomous_mode
;	.line	105; firmware.c	printf("Speed: %d Left: %d Right %d\n",SPEED,DRIVE.left_multiplier,DRIVE.right_multiplier);
	MOVFF	(_DRIVE + 1), r0x00
	CLRF	r0x01
	BANKSEL	(_DRIVE + 1)
	BTFSC	(_DRIVE + 1), 7
	SETF	r0x01
	MOVFF	_DRIVE, r0x02
	CLRF	r0x03
	BANKSEL	_DRIVE
	BTFSC	_DRIVE, 7, B
	SETF	r0x03
	MOVFF	_SPEED, r0x04
	CLRF	r0x05
	BANKSEL	_SPEED
	BTFSC	_SPEED, 7, B
	SETF	r0x05
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
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x09
	ADDWF	FSR1L, F
	BRA	_00114_DS_
	RETURN	

; ; Starting pCode block
S_firmware__set_drives_LR	code
_set_drives_LR:
;	.line	463; firmware.c	void set_drives_LR(signed char leftPower,signed char rightPower)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	465; firmware.c	pwm_write(RIGHT_DRIVE_PORT, -rightPower);
	NEGF	r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	466; firmware.c	pwm_write(LEFT_DRIVE_PORT, leftPower);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__bump_front	code
_bump_front:
;	.line	440; firmware.c	void bump_front()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	443; firmware.c	reset_right = pwm_read(RIGHT_DRIVE_PORT);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x00
	INCF	FSR1L, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
;	.line	444; firmware.c	reset_left = pwm_read(LEFT_DRIVE_PORT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x02
	INCF	FSR1L, F
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
;	.line	447; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	448; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	449; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	452; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	453; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	454; firmware.c	delay_msec(2700);
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	0x8c
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	457; firmware.c	pwm_write(RIGHT_DRIVE_PORT, reset_right);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	458; firmware.c	pwm_write(LEFT_DRIVE_PORT, reset_left);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	459; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	460; firmware.c	delay_msec(100);
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
;	.line	415; firmware.c	void bump_front_right()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	419; firmware.c	reset_right = pwm_read(RIGHT_DRIVE_PORT);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x00
	INCF	FSR1L, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
;	.line	420; firmware.c	reset_left = pwm_read(LEFT_DRIVE_PORT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x02
	INCF	FSR1L, F
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
;	.line	423; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	424; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	425; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	428; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	429; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	430; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	433; firmware.c	pwm_write(RIGHT_DRIVE_PORT, reset_right);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	434; firmware.c	pwm_write(LEFT_DRIVE_PORT, reset_left);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	435; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	436; firmware.c	delay_msec(100);
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
;	.line	391; firmware.c	void bump_front_left()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	394; firmware.c	reset_right = pwm_read(RIGHT_DRIVE_PORT);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x00
	INCF	FSR1L, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
;	.line	395; firmware.c	reset_left = pwm_read(LEFT_DRIVE_PORT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pwm_read
	MOVWF	r0x02
	INCF	FSR1L, F
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
;	.line	398; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	399; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	400; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	403; firmware.c	set_drives_LR(AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0x46
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	404; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	405; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	408; firmware.c	pwm_write(RIGHT_DRIVE_PORT, reset_right);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	409; firmware.c	pwm_write(LEFT_DRIVE_PORT, reset_left);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	410; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	411; firmware.c	delay_msec(100);
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
;	.line	375; firmware.c	void heartbeat(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	379; firmware.c	dat = RCREG;
	MOVFF	_RCREG, r0x00
;	.line	380; firmware.c	if(dat == 'p')
	MOVF	r0x00, W
	XORLW	0x70
	BNZ	_00244_DS_
;	.line	382; firmware.c	printf("Hello, World!\n");
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	383; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
_00244_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__serial_control	code
_serial_control:
;	.line	332; firmware.c	void serial_control(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	335; firmware.c	if(usart_data_available())
	CALL	_usart_data_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00211_DS_
;	.line	336; firmware.c	command_byte = usart_get_byte();
	CALL	_usart_get_byte
	MOVWF	r0x00
	BRA	_00212_DS_
_00211_DS_:
;	.line	337; firmware.c	else return;
	BRA	_00220_DS_
_00212_DS_:
;	.line	339; firmware.c	switch(command_byte)
	MOVF	r0x00, W
	XORLW	0x20
	BNZ	_00229_DS_
	BRA	_00217_DS_
_00229_DS_:
	MOVF	r0x00, W
	XORLW	0x61
	BZ	_00215_DS_
	MOVF	r0x00, W
	XORLW	0x64
	BZ	_00216_DS_
	MOVF	r0x00, W
	XORLW	0x73
	BZ	_00214_DS_
	MOVF	r0x00, W
	XORLW	0x77
	BZ	_00237_DS_
	BRA	_00220_DS_
_00237_DS_:
	BANKSEL	_forward
;	.line	342; firmware.c	DRIVE.left_multiplier = forward.left_multiplier;
	MOVF	_forward, W, B
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	BANKSEL	(_forward + 1)
;	.line	343; firmware.c	DRIVE.right_multiplier = forward.right_multiplier;
	MOVF	(_forward + 1), W, B
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
;	.line	344; firmware.c	putchar('w');
	MOVLW	0x77
	CALL	_putchar
;	.line	345; firmware.c	break;
	BRA	_00220_DS_
_00214_DS_:
	BANKSEL	_backward
;	.line	347; firmware.c	DRIVE.left_multiplier = backward.left_multiplier;
	MOVF	_backward, W, B
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	BANKSEL	(_backward + 1)
;	.line	348; firmware.c	DRIVE.right_multiplier = backward.right_multiplier;
	MOVF	(_backward + 1), W, B
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
;	.line	349; firmware.c	putchar('s');
	MOVLW	0x73
	CALL	_putchar
;	.line	350; firmware.c	break;
	BRA	_00220_DS_
_00215_DS_:
	BANKSEL	_rotate_left
;	.line	352; firmware.c	DRIVE.left_multiplier = rotate_left.left_multiplier;
	MOVF	_rotate_left, W, B
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	BANKSEL	(_rotate_left + 1)
;	.line	353; firmware.c	DRIVE.right_multiplier = rotate_left.right_multiplier;
	MOVF	(_rotate_left + 1), W, B
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
;	.line	354; firmware.c	putchar('a');
	MOVLW	0x61
	CALL	_putchar
;	.line	355; firmware.c	break;
	BRA	_00220_DS_
_00216_DS_:
	BANKSEL	_rotate_right
;	.line	357; firmware.c	DRIVE.left_multiplier = rotate_right.left_multiplier;
	MOVF	_rotate_right, W, B
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	BANKSEL	(_rotate_right + 1)
;	.line	358; firmware.c	DRIVE.right_multiplier = rotate_right.right_multiplier;
	MOVF	(_rotate_right + 1), W, B
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
;	.line	359; firmware.c	putchar('d');
	MOVLW	0x64
	CALL	_putchar
;	.line	360; firmware.c	break;
	BRA	_00220_DS_
_00217_DS_:
	BANKSEL	_halt
;	.line	362; firmware.c	DRIVE.left_multiplier = halt.left_multiplier;
	MOVF	_halt, W, B
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	BANKSEL	(_halt + 1)
;	.line	363; firmware.c	DRIVE.right_multiplier = halt.right_multiplier;
	MOVF	(_halt + 1), W, B
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
;	.line	364; firmware.c	putchar(' ');
	MOVLW	0x20
	CALL	_putchar
_00220_DS_:
;	.line	369; firmware.c	}
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__usart_get_byte	code
_usart_get_byte:
;	.line	327; firmware.c	char usart_get_byte(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	329; firmware.c	return RCREG;
	MOVFF	_RCREG, r0x00
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__usart_get_byte_available	code
_usart_get_byte_available:
;	.line	318; firmware.c	char usart_get_byte_available(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	320; firmware.c	if(PIR1bits.RCIF)
	BTFSS	_PIR1bits, 5
	BRA	_00198_DS_
;	.line	321; firmware.c	return RCREG;
	MOVFF	_RCREG, r0x00
	MOVF	r0x00, W
	BRA	_00200_DS_
_00198_DS_:
;	.line	323; firmware.c	return 0;
	CLRF	WREG
_00200_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__usart_data_available	code
_usart_data_available:
;	.line	312; firmware.c	char usart_data_available(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	314; firmware.c	return PIR1bits.RCIF;
	CLRF	r0x00
	BTFSC	_PIR1bits, 5
	INCF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__autonomous_routine0	code
_autonomous_routine0:
;	.line	269; firmware.c	void    autonomous_routine0(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	272; firmware.c	DPRINTF("Starting autonomous routine...\n");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	276; firmware.c	set_drives_LR(AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x46
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	277; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	281; firmware.c	for(i=0; (rc_read_data(6) != -127) && (i < 400);i++)
	CLRF	r0x00
	CLRF	r0x01
_00175_DS_:
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	XORLW	0x81
	BZ	_00178_DS_
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x7f
	BNZ	_00187_DS_
	MOVLW	0x90
	SUBWF	r0x00, W
_00187_DS_:
	BC	_00178_DS_
;	.line	283; firmware.c	delay_msec(50);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	281; firmware.c	for(i=0; (rc_read_data(6) != -127) && (i < 400);i++)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00175_DS_
_00178_DS_:
;	.line	304; firmware.c	pwm_write(RIGHT_DRIVE_PORT, MOTOR_STOP);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	305; firmware.c	pwm_write(LEFT_DRIVE_PORT, MOTOR_STOP);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	306; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	309; firmware.c	DPRINTF("Ending autonomous routine...\n");
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
S_firmware__arcade_drive_routine	code
_arcade_drive_routine:
;	.line	241; firmware.c	void    arcade_drive_routine(void)
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
;	.line	247; firmware.c	joy_x = rc_read_data(ARCADE_DRIVE_X_CHAN);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
;	.line	248; firmware.c	joy_y = -rc_read_data(ARCADE_DRIVE_Y_CHAN);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x01
	INCF	FSR1L, F
	NEGF	r0x01
;	.line	249; firmware.c	arcade_drive(joy_x, joy_y, PWM_MAX, &left_power, &right_power);
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
	BANKSEL	_arcade_drive_routine_right_power_1_1
;	.line	253; firmware.c	set_drives_LR(left_power,right_power);
	MOVF	_arcade_drive_routine_right_power_1_1, W, B
	MOVWF	POSTDEC1
	BANKSEL	_arcade_drive_routine_left_power_1_1
	MOVF	_arcade_drive_routine_left_power_1_1, W, B
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
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
;	.line	217; firmware.c	void    tank_drive_routine(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	224; firmware.c	left_power = -rc_read_data(TANK_DRIVE_LEFT_CHAN);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
	COMF	r0x00, W
	BANKSEL	_tank_drive_routine_left_power_1_1
	MOVWF	_tank_drive_routine_left_power_1_1, B
	INCF	_tank_drive_routine_left_power_1_1, F, B
;	.line	225; firmware.c	right_power = rc_read_data(TANK_DRIVE_RIGHT_CHAN);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	BANKSEL	_tank_drive_routine_right_power_1_1
	MOVWF	_tank_drive_routine_right_power_1_1, B
	INCF	FSR1L, F
	BANKSEL	_tank_drive_routine_right_power_1_1
;	.line	228; firmware.c	set_drives_LR(left_power,right_power);
	MOVF	_tank_drive_routine_right_power_1_1, W, B
	MOVWF	POSTDEC1
	BANKSEL	_tank_drive_routine_left_power_1_1
	MOVF	_tank_drive_routine_left_power_1_1, W, B
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__rc_routine	code
_rc_routine:
;	.line	158; firmware.c	void    rc_routine(void)
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
;	.line	173; firmware.c	if ( io_read_digital(ARCADE_JUMPER_PORT) == 0 )
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	BNZ	_00144_DS_
;	.line	174; firmware.c	arcade_drive_routine();
	CALL	_arcade_drive_routine
	BRA	_00145_DS_
_00144_DS_:
;	.line	176; firmware.c	tank_drive_routine();
	CALL	_tank_drive_routine
_00145_DS_:
;	.line	178; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	186; firmware.c	elapsed_time = SYSTEM_TIMER_SECONDS();
	CALL	_timer0_read32
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	BTFSS	_T0CON, 3
	BRA	_00150_DS_
	MOVLW	0x01
	MOVWF	r0x04
	CLRF	r0x05
	BRA	_00151_DS_
_00150_DS_:
	MOVLW	0x07
	ANDWF	_T0CON, W
	MOVWF	r0x06
	MOVLW	0x02
	MOVWF	r0x04
	MOVLW	0x00
	MOVWF	r0x05
	MOVF	r0x06, W
	BZ	_00151_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00158_DS_:
	RLCF	r0x04, F
	RLCF	r0x05, F
	ADDLW	0x01
	BNC	_00158_DS_
_00151_DS_:
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
;	.line	189; firmware.c	if ( elapsed_time > old_time )
	MOVF	(_rc_routine_elapsed_time_1_1 + 3), W, B
	BANKSEL	(_rc_routine_old_time_1_1 + 3)
	SUBWF	(_rc_routine_old_time_1_1 + 3), W, B
	BNZ	_00159_DS_
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 2)
	MOVF	(_rc_routine_elapsed_time_1_1 + 2), W, B
	BANKSEL	(_rc_routine_old_time_1_1 + 2)
	SUBWF	(_rc_routine_old_time_1_1 + 2), W, B
	BNZ	_00159_DS_
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 1)
	MOVF	(_rc_routine_elapsed_time_1_1 + 1), W, B
	BANKSEL	(_rc_routine_old_time_1_1 + 1)
	SUBWF	(_rc_routine_old_time_1_1 + 1), W, B
	BNZ	_00159_DS_
	BANKSEL	_rc_routine_elapsed_time_1_1
	MOVF	_rc_routine_elapsed_time_1_1, W, B
	BANKSEL	_rc_routine_old_time_1_1
	SUBWF	_rc_routine_old_time_1_1, W, B
_00159_DS_:
	BTFSC	STATUS, 0
	BRA	_00148_DS_
;	.line	191; firmware.c	old_time = elapsed_time;
	MOVFF	_rc_routine_elapsed_time_1_1, _rc_routine_old_time_1_1
	MOVFF	(_rc_routine_elapsed_time_1_1 + 1), (_rc_routine_old_time_1_1 + 1)
	MOVFF	(_rc_routine_elapsed_time_1_1 + 2), (_rc_routine_old_time_1_1 + 2)
	MOVFF	(_rc_routine_elapsed_time_1_1 + 3), (_rc_routine_old_time_1_1 + 3)
;	.line	199; firmware.c	DPRINTF("ET: %ld  RC: %d %d %d %d %d %d %d  Jumper: %d\n",
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
_00148_DS_:
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
;	.line	120; firmware.c	void    custom_init(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	131; firmware.c	for (c = 1; c <= 16; ++c)
	MOVLW	0x01
	MOVWF	r0x00
	CLRF	r0x01
_00129_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00138_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
_00138_DS_:
	BC	_00132_DS_
;	.line	132; firmware.c	io_set_direction(c, IO_DIRECTION_IN);
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_io_set_direction
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	131; firmware.c	for (c = 1; c <= 16; ++c)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00129_DS_
_00132_DS_:
;	.line	138; firmware.c	io_set_analog_port_count(ANALOG_PORTS);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_io_set_analog_port_count
	INCF	FSR1L, F
;	.line	149; firmware.c	controller_print_version();
	CALL	_controller_print_version
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x53, 0x70, 0x65, 0x65, 0x64, 0x3a, 0x20, 0x25, 0x64, 0x20, 0x4c, 0x65
	DB	0x66, 0x74, 0x3a, 0x20, 0x25, 0x64, 0x20, 0x52, 0x69, 0x67, 0x68, 0x74
	DB	0x20, 0x25, 0x64, 0x0a, 0x00
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
	DB	0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64
	DB	0x21, 0x0a, 0x00


; Statistics:
; code size:	 2612 (0x0a34) bytes ( 1.99%)
;           	 1306 (0x051a) words
; udata size:	    8 (0x0008) bytes ( 0.45%)
; access size:	   16 (0x0010) bytes


	end
