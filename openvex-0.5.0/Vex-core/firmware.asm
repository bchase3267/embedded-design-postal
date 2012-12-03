;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Sun Dec  2 03:58:30 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _RIGHT_MOTOR_POWER
	global _LEFT_MOTOR_POWER
	global _integerByte
	global _stringOfChars
	global _distance_cm_per_15_ticks
	global _rotation_circumference_cm
	global _wheel_circumference_cm
	global _rotation_deg_per_tick
	global _main
	global _custom_init
	global _rc_routine
	global _tank_drive_routine
	global _arcade_drive_routine
	global _autonomous_routine0
	global _reset_usart
	global _usart_data_available
	global _usart_get_byte_available
	global _usart_get_byte
	global _serial_control
	global _heartbeat
	global _bump_front_left
	global _bump_front_right
	global _bump_front
	global _set_drives_LR
	global _cliff_avoidance
	global _debugMode
	global _SPEED
	global _LEFT_SPEED
	global _RIGHT_SPEED
	global _forward
	global _backward
	global _rotate_left
	global _rotate_right
	global _halt
	global _differential
	global _DRIVE

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
	extern _usart_getc
	extern _usart_puts
	extern _io_set_analog_port_count
	extern _io_read_analog
	extern _io_read_digital
	extern _io_write_digital
	extern _io_set_direction
	extern _timer0_read32
	extern _shaft_encoder_read_std
	extern _shaft_encoder_enable_std
	extern _rc_read_status
	extern _rc_read_data
	extern _controller_in_autonomous_mode
	extern _rc_new_data_available
	extern _pwm_write
	extern _controller_submit_data
	extern _controller_begin_autonomous_mode
	extern _controller_end_autonomous_mode
	extern _controller_print_version
	extern _sonar_init
	extern _sonar_read
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
_debugMode	db	0x00
_LEFT_MOTOR_POWER	db	0x00
_RIGHT_MOTOR_POWER	db	0x00
_SPEED	db	0x46
_LEFT_SPEED	db	0x46
_RIGHT_SPEED	db	0x46
_forward	db	0x01, 0x01
_backward	db	0xff, 0xff
_rotate_left	db	0xff, 0x01
_rotate_right	db	0x01, 0xff
_halt	db	0x00, 0x00
_differential	db	0x80, 0x80
_DRIVE	db	LOW(_halt), HIGH(_halt), 0x80
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
_rotation_deg_per_tick	res	2

udata_firmware_1	udata
_wheel_circumference_cm	res	2

udata_firmware_2	udata
_rotation_circumference_cm	res	2

udata_firmware_3	udata
_distance_cm_per_15_ticks	res	2

udata_firmware_4	udata
_stringOfChars	res	15

udata_firmware_5	udata
_integerByte	res	1

udata_firmware_6	udata
_rc_routine_elapsed_time_1_1	res	4

udata_firmware_7	udata
_tank_drive_routine_left_power_1_1	res	1

udata_firmware_8	udata
_tank_drive_routine_right_power_1_1	res	1

udata_firmware_9	udata
_arcade_drive_routine_left_power_1_1	res	1

udata_firmware_10	udata
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
;	.line	60; firmware.c	unsigned int i=10000;
	MOVLW	0x10
	MOVWF	r0x00
	MOVLW	0x27
	MOVWF	r0x01
;	.line	61; firmware.c	unsigned int sonar_dist = 0, old_sonar_dist = 1;
	MOVLW	0x01
	MOVWF	r0x02
	CLRF	r0x03
;	.line	62; firmware.c	unsigned int light_level = 0;
	CLRF	r0x04
	CLRF	r0x05
;	.line	64; firmware.c	unsigned left_enc_ticks=0,
	CLRF	r0x06
	CLRF	r0x07
;	.line	65; firmware.c	right_enc_ticks=0;
	CLRF	r0x08
	CLRF	r0x09
;	.line	67; firmware.c	controller_init();
	CALL	_controller_init
;	.line	68; firmware.c	custom_init();
	CALL	_custom_init
;	.line	75; firmware.c	controller_end_autonomous_mode();
	CALL	_controller_end_autonomous_mode
_00138_DS_:
;	.line	94; firmware.c	if (!controller_in_autonomous_mode())
	CALL	_controller_in_autonomous_mode
	MOVWF	r0x0a
	MOVF	r0x0a, W
	BNZ	_00110_DS_
;	.line	96; firmware.c	if ( rc_new_data_available() )
	CALL	_rc_new_data_available
	MOVWF	r0x0a
	MOVF	r0x0a, W
	BZ	_00110_DS_
;	.line	98; firmware.c	rc_routine();
	CALL	_rc_routine
;	.line	101; firmware.c	if ( rc_read_data(AUTONOMOUS_TRIGGER_CHAN) == -127 ) autonomous_routine0();
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x0a
	INCF	FSR1L, F
	MOVF	r0x0a, W
	XORLW	0x81
	BNZ	_00110_DS_
	CALL	_autonomous_routine0
_00110_DS_:
;	.line	106; firmware.c	if(usart_data_available())
	CALL	_usart_data_available
	MOVWF	r0x0a
	MOVF	r0x0a, W
	BTFSC	STATUS, 2
	BRA	_00115_DS_
;	.line	108; firmware.c	serial_control();
	CALL	_serial_control
;	.line	109; firmware.c	if(DRIVE == &differential)
	MOVLW	HIGH(_differential)
	MOVWF	r0x0b
	MOVLW	LOW(_differential)
	MOVWF	r0x0a
	MOVLW	0x80
	MOVWF	r0x0c
	BANKSEL	_DRIVE
	MOVF	_DRIVE, W, B
	XORWF	r0x0a, W
	BNZ	_00159_DS_
	BANKSEL	(_DRIVE + 1)
	MOVF	(_DRIVE + 1), W, B
	XORWF	r0x0b, W
	BNZ	_00159_DS_
	BANKSEL	(_DRIVE + 2)
	MOVF	(_DRIVE + 2), W, B
	XORWF	r0x0c, W
	BZ	_00160_DS_
_00159_DS_:
	BRA	_00112_DS_
_00160_DS_:
	BANKSEL	_RIGHT_SPEED
;	.line	110; firmware.c	set_drives_LR(LEFT_SPEED,RIGHT_SPEED);
	MOVF	_RIGHT_SPEED, W, B
	MOVWF	POSTDEC1
	BANKSEL	_LEFT_SPEED
	MOVF	_LEFT_SPEED, W, B
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
	BRA	_00113_DS_
_00112_DS_:
;	.line	112; firmware.c	set_drives_LR(SPEED * DRIVE->left_multiplier,SPEED * DRIVE->right_multiplier);
	MOVFF	_DRIVE, r0x0a
	MOVFF	(_DRIVE + 1), r0x0b
	MOVFF	(_DRIVE + 2), r0x0c
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget1
; #	MOVWF	r0x0a
; #;;multiply variable :r0x0a by variable _SPEED and store in r0x0a
; #	MOVF	r0x0a, W
	MOVWF	r0x0a
	BANKSEL	_SPEED
	MULWF	_SPEED, B
	MOVFF	PRODL, r0x0a
	MOVFF	_DRIVE, r0x0b
	MOVFF	(_DRIVE + 1), r0x0c
	MOVFF	(_DRIVE + 2), r0x0d
	INCF	r0x0b, F
	BTFSC	STATUS, 0
	INCF	r0x0c, F
	BTFSC	STATUS, 0
	INCF	r0x0d, F
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
; #	MOVWF	r0x0b
; #;;multiply variable :r0x0b by variable _SPEED and store in r0x0b
; #	MOVF	r0x0b, W
	MOVWF	r0x0b
	BANKSEL	_SPEED
	MULWF	_SPEED, B
	MOVFF	PRODL, r0x0b
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
_00113_DS_:
;	.line	114; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
_00115_DS_:
;	.line	121; firmware.c	if(io_read_digital(LEFT_BUMPER_PORT)==0)
	MOVLW	0x0f
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x0a
	INCF	FSR1L, F
	MOVF	r0x0a, W
	BNZ	_00122_DS_
;	.line	123; firmware.c	if(io_read_digital(RIGHT_BUMPER_PORT)==0)
	MOVLW	0x0e
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x0a
	INCF	FSR1L, F
	MOVF	r0x0a, W
	BNZ	_00117_DS_
;	.line	125; firmware.c	printf("BF");
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	126; firmware.c	bump_front();
	CALL	_bump_front
	BRA	_00123_DS_
_00117_DS_:
;	.line	130; firmware.c	printf("BL");
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	131; firmware.c	bump_front_left();
	CALL	_bump_front_left
	BRA	_00123_DS_
_00122_DS_:
;	.line	136; firmware.c	if(io_read_digital(RIGHT_BUMPER_PORT)==0)
	MOVLW	0x0e
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x0a
	INCF	FSR1L, F
	MOVF	r0x0a, W
	BNZ	_00123_DS_
;	.line	138; firmware.c	printf("BR");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	139; firmware.c	bump_front_right();
	CALL	_bump_front_right
_00123_DS_:
;	.line	143; firmware.c	if((sonar_dist = sonar_read(SONAR_DOWN_SENSOR_INT)) > 20)
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_sonar_read
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	INCF	FSR1L, F
	MOVFF	r0x0a, r0x0c
	MOVFF	r0x0b, r0x0d
	MOVLW	0x00
	SUBWF	r0x0b, W
	BNZ	_00161_DS_
	MOVLW	0x15
	SUBWF	r0x0a, W
_00161_DS_:
	BNC	_00125_DS_
;	.line	145; firmware.c	printf("CF");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	146; firmware.c	cliff_avoidance();
	CALL	_cliff_avoidance
_00125_DS_:
;	.line	148; firmware.c	if(i++ == 10000)
	MOVFF	r0x00, r0x0a
	MOVFF	r0x01, r0x0b
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVF	r0x0a, W
	XORLW	0x10
	BNZ	_00162_DS_
	MOVF	r0x0b, W
	XORLW	0x27
	BZ	_00163_DS_
_00162_DS_:
	BRA	_00129_DS_
_00163_DS_:
;	.line	150; firmware.c	if(io_read_analog(LIGHT_SENSOR_PORT) != light_level)
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_io_read_analog
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	INCF	FSR1L, F
	MOVF	r0x0a, W
	XORWF	r0x04, W
	BNZ	_00165_DS_
	MOVF	r0x0b, W
	XORWF	r0x05, W
	BZ	_00127_DS_
_00165_DS_:
;	.line	152; firmware.c	light_level = io_read_analog(LIGHT_SENSOR_PORT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_io_read_analog
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	INCF	FSR1L, F
;	.line	153; firmware.c	printf("Li%d",light_level);
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
_00127_DS_:
;	.line	155; firmware.c	i = 0;
	CLRF	r0x00
	CLRF	r0x01
_00129_DS_:
;	.line	158; firmware.c	if(sonar_dist - old_sonar_dist > 1 || old_sonar_dist - sonar_dist > 1)
	MOVF	r0x02, W
	SUBWF	r0x0c, W
	MOVWF	r0x0a
	MOVF	r0x03, W
	SUBWFB	r0x0d, W
	MOVWF	r0x0b
	MOVLW	0x00
	SUBWF	r0x0b, W
	BNZ	_00166_DS_
	MOVLW	0x02
	SUBWF	r0x0a, W
_00166_DS_:
	BC	_00130_DS_
	MOVF	r0x0c, W
	SUBWF	r0x02, W
	MOVWF	r0x0a
	MOVF	r0x0d, W
	SUBWFB	r0x03, W
	MOVWF	r0x0b
	MOVLW	0x00
	SUBWF	r0x0b, W
	BNZ	_00167_DS_
	MOVLW	0x02
	SUBWF	r0x0a, W
_00167_DS_:
	BNC	_00131_DS_
_00130_DS_:
;	.line	160; firmware.c	printf("UD%d",sonar_dist);
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	161; firmware.c	old_sonar_dist = sonar_dist;
	MOVFF	r0x0c, r0x02
	MOVFF	r0x0d, r0x03
_00131_DS_:
;	.line	164; firmware.c	if(shaft_encoder_read_std(LEFT_WHEEL_ENCODER_INT)!=left_enc_ticks)
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_read_std
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	INCF	FSR1L, F
	MOVF	r0x0a, W
	XORWF	r0x06, W
	BNZ	_00169_DS_
	MOVF	r0x0b, W
	XORWF	r0x07, W
	BZ	_00134_DS_
_00169_DS_:
;	.line	166; firmware.c	printf("EL");
	MOVLW	UPPER(__str_6)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_6)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_6)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	167; firmware.c	left_enc_ticks = shaft_encoder_read_std(LEFT_WHEEL_ENCODER_INT);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_read_std
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	INCF	FSR1L, F
_00134_DS_:
;	.line	170; firmware.c	if(shaft_encoder_read_std(RIGHT_WHEEL_ENCODER_INT)!=right_enc_ticks)
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_read_std
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	INCF	FSR1L, F
	MOVF	r0x0a, W
	XORWF	r0x08, W
	BNZ	_00171_DS_
	MOVF	r0x0b, W
	XORWF	r0x09, W
	BNZ	_00171_DS_
	BRA	_00138_DS_
_00171_DS_:
;	.line	172; firmware.c	printf("ER");
	MOVLW	UPPER(__str_7)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_7)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_7)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	173; firmware.c	right_enc_ticks = shaft_encoder_read_std(RIGHT_WHEEL_ENCODER_INT);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_read_std
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	INCF	FSR1L, F
	BRA	_00138_DS_
	RETURN	

; ; Starting pCode block
S_firmware__cliff_avoidance	code
_cliff_avoidance:
;	.line	604; firmware.c	void cliff_avoidance()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	606; firmware.c	set_drives_LR(-127,-127);
	MOVLW	0x81
	MOVWF	POSTDEC1
	MOVLW	0x81
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	607; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	608; firmware.c	delay_msec(60);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x3c
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	609; firmware.c	set_drives_LR(0,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	610; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	611; firmware.c	DRIVE = &halt;
	MOVLW	HIGH(_halt)
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
	MOVLW	LOW(_halt)
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	MOVLW	0x80
	BANKSEL	(_DRIVE + 2)
	MOVWF	(_DRIVE + 2), B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__set_drives_LR	code
_set_drives_LR:
;	.line	596; firmware.c	void set_drives_LR(signed char leftPower,signed char rightPower)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	598; firmware.c	pwm_write(RIGHT_DRIVE_PORT1, rightPower);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	599; firmware.c	pwm_write(LEFT_DRIVE_PORT1, -leftPower);
	NEGF	r0x00
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	600; firmware.c	pwm_write(RIGHT_DRIVE_PORT2, rightPower);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_pwm_write
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	601; firmware.c	pwm_write(LEFT_DRIVE_PORT2, -leftPower);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x04
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
;	.line	579; firmware.c	void bump_front()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	582; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	583; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	584; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	587; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	588; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	589; firmware.c	delay_msec(2700);
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	0x8c
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	592; firmware.c	set_drives_LR(SPEED * DRIVE->left_multiplier, SPEED * DRIVE->right_multiplier);
	MOVFF	_DRIVE, r0x00
	MOVFF	(_DRIVE + 1), r0x01
	MOVFF	(_DRIVE + 2), r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
; #	MOVWF	r0x00
; #;;multiply variable :r0x00 by variable _SPEED and store in r0x00
; #	MOVF	r0x00, W
	MOVWF	r0x00
	BANKSEL	_SPEED
	MULWF	_SPEED, B
	MOVFF	PRODL, r0x00
	MOVFF	_DRIVE, r0x01
	MOVFF	(_DRIVE + 1), r0x02
	MOVFF	(_DRIVE + 2), r0x03
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget1
; #	MOVWF	r0x01
; #;;multiply variable :r0x01 by variable _SPEED and store in r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	BANKSEL	_SPEED
	MULWF	_SPEED, B
	MOVFF	PRODL, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	593; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__bump_front_right	code
_bump_front_right:
;	.line	561; firmware.c	void bump_front_right()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	564; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	565; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	566; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	569; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	570; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	571; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	574; firmware.c	set_drives_LR(SPEED * DRIVE->left_multiplier, SPEED * DRIVE->right_multiplier);
	MOVFF	_DRIVE, r0x00
	MOVFF	(_DRIVE + 1), r0x01
	MOVFF	(_DRIVE + 2), r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
; #	MOVWF	r0x00
; #;;multiply variable :r0x00 by variable _SPEED and store in r0x00
; #	MOVF	r0x00, W
	MOVWF	r0x00
	BANKSEL	_SPEED
	MULWF	_SPEED, B
	MOVFF	PRODL, r0x00
	MOVFF	_DRIVE, r0x01
	MOVFF	(_DRIVE + 1), r0x02
	MOVFF	(_DRIVE + 2), r0x03
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget1
; #	MOVWF	r0x01
; #;;multiply variable :r0x01 by variable _SPEED and store in r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	BANKSEL	_SPEED
	MULWF	_SPEED, B
	MOVFF	PRODL, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	575; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__bump_front_left	code
_bump_front_left:
;	.line	542; firmware.c	void bump_front_left()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	545; firmware.c	set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0xba
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	546; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	547; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	550; firmware.c	set_drives_LR(AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
	MOVLW	0xba
	MOVWF	POSTDEC1
	MOVLW	0x46
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	551; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	552; firmware.c	delay_msec(500);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xf4
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	555; firmware.c	set_drives_LR(SPEED * DRIVE->left_multiplier, SPEED * DRIVE->right_multiplier);
	MOVFF	_DRIVE, r0x00
	MOVFF	(_DRIVE + 1), r0x01
	MOVFF	(_DRIVE + 2), r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
; #	MOVWF	r0x00
; #;;multiply variable :r0x00 by variable _SPEED and store in r0x00
; #	MOVF	r0x00, W
	MOVWF	r0x00
	BANKSEL	_SPEED
	MULWF	_SPEED, B
	MOVFF	PRODL, r0x00
	MOVFF	_DRIVE, r0x01
	MOVFF	(_DRIVE + 1), r0x02
	MOVFF	(_DRIVE + 2), r0x03
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget1
; #	MOVWF	r0x01
; #;;multiply variable :r0x01 by variable _SPEED and store in r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	BANKSEL	_SPEED
	MULWF	_SPEED, B
	MOVFF	PRODL, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	556; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	557; firmware.c	delay_msec(100);
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
;	.line	526; firmware.c	void heartbeat(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	530; firmware.c	dat = RCREG;
	MOVFF	_RCREG, r0x00
;	.line	531; firmware.c	if(dat == 'p')
	MOVF	r0x00, W
	XORLW	0x70
	BNZ	_00448_DS_
;	.line	533; firmware.c	printf("Hello, World!\n");
	MOVLW	UPPER(__str_19)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_19)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_19)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	534; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
_00448_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__serial_control	code
_serial_control:
;	.line	423; firmware.c	void serial_control(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
;	.line	427; firmware.c	if(usart_data_available())
	CALL	_usart_data_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00286_DS_
;	.line	428; firmware.c	command_byte = usart_get_byte();
	CALL	_usart_get_byte
	MOVWF	r0x00
	BRA	_00287_DS_
_00286_DS_:
;	.line	429; firmware.c	else return;
	GOTO	_00350_DS_
_00287_DS_:
;	.line	431; firmware.c	switch(command_byte)
	MOVF	r0x00, W
	XORLW	0x2b
	BNZ	_00399_DS_
	BRA	_00297_DS_
_00399_DS_:
	MOVF	r0x00, W
	XORLW	0x2d
	BNZ	_00401_DS_
	BRA	_00300_DS_
_00401_DS_:
	MOVF	r0x00, W
	XORLW	0x30
	BNZ	_00403_DS_
	BRA	_00294_DS_
_00403_DS_:
	MOVF	r0x00, W
	XORLW	0x31
	BNZ	_00405_DS_
	BRA	_00293_DS_
_00405_DS_:
	MOVF	r0x00, W
	XORLW	0x44
	BNZ	_00407_DS_
	GOTO	_00319_DS_
_00407_DS_:
	MOVF	r0x00, W
	XORLW	0x48
	BNZ	_00409_DS_
	BRA	_00378_DS_
_00409_DS_:
	MOVF	r0x00, W
	XORLW	0x53
	BNZ	_00411_DS_
	BRA	_00374_DS_
_00411_DS_:
	MOVF	r0x00, W
	XORLW	0x5a
	BNZ	_00413_DS_
	BRA	_00296_DS_
_00413_DS_:
	MOVF	r0x00, W
	XORLW	0x61
	BNZ	_00415_DS_
	BRA	_00290_DS_
_00415_DS_:
	MOVF	r0x00, W
	XORLW	0x62
	BNZ	_00417_DS_
	BRA	_00292_DS_
_00417_DS_:
	MOVF	r0x00, W
	XORLW	0x64
	BNZ	_00419_DS_
	BRA	_00291_DS_
_00419_DS_:
	MOVF	r0x00, W
	XORLW	0x68
	BNZ	_00421_DS_
	BRA	_00312_DS_
_00421_DS_:
	MOVF	r0x00, W
	XORLW	0x6c
	BNZ	_00423_DS_
	BRA	_00386_DS_
_00423_DS_:
	MOVF	r0x00, W
	XORLW	0x72
	BNZ	_00425_DS_
	BRA	_00390_DS_
_00425_DS_:
	MOVF	r0x00, W
	XORLW	0x73
	BZ	_00289_DS_
	MOVF	r0x00, W
	XORLW	0x77
	BZ	_00288_DS_
	MOVF	r0x00, W
	XORLW	0x7a
	BNZ	_00431_DS_
	BRA	_00295_DS_
_00431_DS_:
	GOTO	_00350_DS_
_00288_DS_:
;	.line	435; firmware.c	DRIVE = &forward;   putchar('w'); //usart_puts("w\n");
	MOVLW	HIGH(_forward)
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
	MOVLW	LOW(_forward)
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	MOVLW	0x80
	BANKSEL	(_DRIVE + 2)
	MOVWF	(_DRIVE + 2), B
	MOVLW	0x77
	CALL	_putchar
;	.line	436; firmware.c	break;
	BRA	_00350_DS_
_00289_DS_:
;	.line	438; firmware.c	DRIVE = &backward;  putchar('s'); //usart_puts("s\n");
	MOVLW	HIGH(_backward)
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
	MOVLW	LOW(_backward)
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	MOVLW	0x80
	BANKSEL	(_DRIVE + 2)
	MOVWF	(_DRIVE + 2), B
	MOVLW	0x73
	CALL	_putchar
;	.line	439; firmware.c	break;
	BRA	_00350_DS_
_00290_DS_:
;	.line	441; firmware.c	DRIVE = &rotate_left;   putchar('a'); //usart_puts("a\n");
	MOVLW	HIGH(_rotate_left)
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
	MOVLW	LOW(_rotate_left)
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	MOVLW	0x80
	BANKSEL	(_DRIVE + 2)
	MOVWF	(_DRIVE + 2), B
	MOVLW	0x61
	CALL	_putchar
;	.line	442; firmware.c	break;
	BRA	_00350_DS_
_00291_DS_:
;	.line	444; firmware.c	DRIVE = &rotate_right;   putchar('d'); //usart_puts("d\n");
	MOVLW	HIGH(_rotate_right)
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
	MOVLW	LOW(_rotate_right)
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	MOVLW	0x80
	BANKSEL	(_DRIVE + 2)
	MOVWF	(_DRIVE + 2), B
	MOVLW	0x64
	CALL	_putchar
;	.line	445; firmware.c	break;
	BRA	_00350_DS_
_00292_DS_:
;	.line	447; firmware.c	DRIVE = &halt;  putchar('b'); //usart_puts("b\n");
	MOVLW	HIGH(_halt)
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
	MOVLW	LOW(_halt)
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	MOVLW	0x80
	BANKSEL	(_DRIVE + 2)
	MOVWF	(_DRIVE + 2), B
	MOVLW	0x62
	CALL	_putchar
;	.line	448; firmware.c	break;
	BRA	_00350_DS_
_00293_DS_:
;	.line	450; firmware.c	controller_end_autonomous_mode();
	CALL	_controller_end_autonomous_mode
;	.line	451; firmware.c	usart_puts("rc");
	MOVLW	UPPER(__str_11)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_11)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_11)
	MOVWF	POSTDEC1
	CALL	_usart_puts
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	452; firmware.c	break;
	BRA	_00350_DS_
_00294_DS_:
;	.line	454; firmware.c	controller_begin_autonomous_mode();
	CALL	_controller_begin_autonomous_mode
;	.line	455; firmware.c	usart_puts("sc");
	MOVLW	UPPER(__str_12)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_12)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_12)
	MOVWF	POSTDEC1
	CALL	_usart_puts
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	456; firmware.c	break;
	BRA	_00350_DS_
_00295_DS_:
	BANKSEL	_SPEED
;	.line	458; firmware.c	SPEED = 000;    printf("S%d",SPEED);
	CLRF	_SPEED, B
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_13)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_13)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_13)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	459; firmware.c	break;
	BRA	_00350_DS_
_00296_DS_:
;	.line	461; firmware.c	SPEED = 127;    printf("S%d",SPEED);
	MOVLW	0x7f
	BANKSEL	_SPEED
	MOVWF	_SPEED, B
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_13)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_13)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_13)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	462; firmware.c	break;
	BRA	_00350_DS_
_00297_DS_:
;	.line	464; firmware.c	SPEED += 5;
	MOVLW	0x05
	BANKSEL	_SPEED
	ADDWF	_SPEED, F, B
;	.line	465; firmware.c	if(SPEED < 0) SPEED = 127;  printf("S%d",SPEED);
	BSF	STATUS, 0
	BANKSEL	_SPEED
	BTFSS	_SPEED, 7, B
	BCF	STATUS, 0
	BNC	_00299_DS_
	MOVLW	0x7f
	BANKSEL	_SPEED
	MOVWF	_SPEED, B
_00299_DS_:
	MOVFF	_SPEED, r0x00
	CLRF	r0x01
	BANKSEL	_SPEED
	BTFSC	_SPEED, 7, B
	SETF	r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_13)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_13)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_13)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	466; firmware.c	break;
	BRA	_00350_DS_
_00300_DS_:
;	.line	468; firmware.c	SPEED -= 5;
	MOVLW	0xfb
	BANKSEL	_SPEED
	ADDWF	_SPEED, F, B
;	.line	469; firmware.c	if(SPEED < 0) SPEED = 0;    printf("S%d",SPEED);
	BSF	STATUS, 0
	BANKSEL	_SPEED
	BTFSS	_SPEED, 7, B
; #	BCF	STATUS, 0
; #	BTFSS	STATUS, 0
; #	GOTO	_00302_DS_
; #	CLRF	_SPEED, B
; #	MOVFF	_SPEED, r0x00
	BCF	STATUS, 0
	BNC	_10477_DS_
	BANKSEL	_SPEED
	CLRF	_SPEED, B
_10477_DS_:
	MOVFF	_SPEED, r0x00
	CLRF	r0x01
	BANKSEL	_SPEED
	BTFSC	_SPEED, 7, B
	SETF	r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_13)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_13)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_13)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	470; firmware.c	break;
	BRA	_00350_DS_
_00374_DS_:
;	.line	473; firmware.c	for(j=0;!usart_data_available() && j<0x7FFE;j++);
	CLRF	r0x00
	CLRF	r0x01
_00326_DS_:
	CALL	_usart_data_available
	MOVWF	r0x02
	MOVF	r0x02, W
	BNZ	_00329_DS_
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00432_DS_
	MOVLW	0xfe
	SUBWF	r0x00, W
_00432_DS_:
	BC	_00329_DS_
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00326_DS_
_00329_DS_:
;	.line	474; firmware.c	if(j<=0x7FFE)
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00433_DS_
	MOVLW	0xff
	SUBWF	r0x00, W
_00433_DS_:
	BC	_00305_DS_
;	.line	475; firmware.c	SPEED = usart_get_byte();
	CALL	_usart_get_byte
	BANKSEL	_SPEED
	MOVWF	_SPEED, B
_00305_DS_:
;	.line	476; firmware.c	printf("S%d",SPEED);
	MOVFF	_SPEED, r0x00
	CLRF	r0x01
	BANKSEL	_SPEED
	BTFSC	_SPEED, 7, B
	SETF	r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_13)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_13)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_13)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	477; firmware.c	break;
	BRA	_00350_DS_
_00378_DS_:
;	.line	480; firmware.c	for(j=0;!usart_data_available() && j<0x7FFE;j++);
	CLRF	r0x00
	CLRF	r0x01
_00331_DS_:
	CALL	_usart_data_available
	MOVWF	r0x02
	MOVF	r0x02, W
	BNZ	_00334_DS_
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00434_DS_
	MOVLW	0xfe
	SUBWF	r0x00, W
_00434_DS_:
	BC	_00334_DS_
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00331_DS_
_00334_DS_:
;	.line	481; firmware.c	if(j<0x7FFE)
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00435_DS_
	MOVLW	0xfe
	SUBWF	r0x00, W
_00435_DS_:
	BTFSC	STATUS, 0
	BRA	_00350_DS_
;	.line	482; firmware.c	k = usart_getc();
	CALL	_usart_getc
	MOVWF	r0x00
	CLRF	r0x01
;	.line	485; firmware.c	for(j=0;!usart_data_available() && j<0x7FFE;j++);
	CLRF	r0x02
	CLRF	r0x03
_00336_DS_:
	CALL	_usart_data_available
	MOVWF	r0x04
	MOVF	r0x04, W
	BNZ	_00339_DS_
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00436_DS_
	MOVLW	0xfe
	SUBWF	r0x02, W
_00436_DS_:
	BC	_00339_DS_
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00336_DS_
_00339_DS_:
;	.line	486; firmware.c	if(j<0x7FFE)
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00437_DS_
	MOVLW	0xfe
	SUBWF	r0x02, W
_00437_DS_:
	BTFSC	STATUS, 0
	BRA	_00350_DS_
;	.line	488; firmware.c	RIGHT_SPEED = usart_getc();
	CALL	_usart_getc
	BANKSEL	_RIGHT_SPEED
	MOVWF	_RIGHT_SPEED, B
;	.line	489; firmware.c	LEFT_SPEED = k;
	MOVF	r0x00, W
	BANKSEL	_LEFT_SPEED
	MOVWF	_LEFT_SPEED, B
;	.line	490; firmware.c	printf("H%c%c",LEFT_SPEED,RIGHT_SPEED);
	MOVFF	_RIGHT_SPEED, r0x00
	CLRF	r0x01
	BANKSEL	_RIGHT_SPEED
	BTFSC	_RIGHT_SPEED, 7, B
	SETF	r0x01
	MOVFF	_LEFT_SPEED, r0x02
	CLRF	r0x03
	BANKSEL	_LEFT_SPEED
	BTFSC	_LEFT_SPEED, 7, B
	SETF	r0x03
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_14)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_14)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_14)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	491; firmware.c	DRIVE = &differential;
	MOVLW	HIGH(_differential)
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
	MOVLW	LOW(_differential)
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	MOVLW	0x80
	BANKSEL	(_DRIVE + 2)
	MOVWF	(_DRIVE + 2), B
;	.line	493; firmware.c	break;
	BRA	_00350_DS_
_00312_DS_:
;	.line	496; firmware.c	DRIVE = &differential;
	MOVLW	HIGH(_differential)
	BANKSEL	(_DRIVE + 1)
	MOVWF	(_DRIVE + 1), B
	MOVLW	LOW(_differential)
	BANKSEL	_DRIVE
	MOVWF	_DRIVE, B
	MOVLW	0x80
	BANKSEL	(_DRIVE + 2)
	MOVWF	(_DRIVE + 2), B
;	.line	497; firmware.c	putchar('h');
	MOVLW	0x68
	CALL	_putchar
;	.line	498; firmware.c	break;
	BRA	_00350_DS_
_00386_DS_:
;	.line	501; firmware.c	for(j=0;!usart_data_available() && j<0x7FFE;j++);
	CLRF	r0x00
	CLRF	r0x01
_00341_DS_:
	CALL	_usart_data_available
	MOVWF	r0x02
	MOVF	r0x02, W
	BNZ	_00344_DS_
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00438_DS_
	MOVLW	0xfe
	SUBWF	r0x00, W
_00438_DS_:
	BC	_00344_DS_
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00341_DS_
_00344_DS_:
;	.line	502; firmware.c	if(j<0x7FFE)
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00439_DS_
	MOVLW	0xfe
	SUBWF	r0x00, W
_00439_DS_:
	BC	_00315_DS_
;	.line	503; firmware.c	LEFT_SPEED = usart_getc();
	CALL	_usart_getc
	BANKSEL	_LEFT_SPEED
	MOVWF	_LEFT_SPEED, B
_00315_DS_:
;	.line	504; firmware.c	printf("l%c",LEFT_SPEED);
	MOVFF	_LEFT_SPEED, r0x00
	CLRF	r0x01
	BANKSEL	_LEFT_SPEED
	BTFSC	_LEFT_SPEED, 7, B
	SETF	r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_15)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_15)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_15)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	505; firmware.c	break;
	BRA	_00350_DS_
_00390_DS_:
;	.line	507; firmware.c	for(j=0;!usart_data_available() && j<0x7FFE;j++);
	CLRF	r0x00
	CLRF	r0x01
_00346_DS_:
	CALL	_usart_data_available
	MOVWF	r0x02
	MOVF	r0x02, W
	BNZ	_00349_DS_
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00440_DS_
	MOVLW	0xfe
	SUBWF	r0x00, W
_00440_DS_:
	BC	_00349_DS_
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00346_DS_
_00349_DS_:
;	.line	508; firmware.c	if(j<0x7FFE)
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x01
	BNZ	_00441_DS_
	MOVLW	0xfe
	SUBWF	r0x00, W
_00441_DS_:
	BC	_00318_DS_
;	.line	509; firmware.c	RIGHT_SPEED = usart_getc();
	CALL	_usart_getc
	BANKSEL	_RIGHT_SPEED
	MOVWF	_RIGHT_SPEED, B
_00318_DS_:
;	.line	510; firmware.c	printf("r%c",RIGHT_SPEED);
	MOVFF	_RIGHT_SPEED, r0x00
	CLRF	r0x01
	BANKSEL	_RIGHT_SPEED
	BTFSC	_RIGHT_SPEED, 7, B
	SETF	r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_16)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_16)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_16)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
_00319_DS_:
	BANKSEL	_debugMode
;	.line	513; firmware.c	if(debugMode)
	MOVF	_debugMode, W, B
	BZ	_00321_DS_
;	.line	514; firmware.c	usart_puts("D1");
	MOVLW	UPPER(__str_17)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_17)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_17)
	MOVWF	POSTDEC1
	CALL	_usart_puts
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00350_DS_
_00321_DS_:
;	.line	516; firmware.c	usart_puts("D0");
	MOVLW	UPPER(__str_18)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_18)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_18)
	MOVWF	POSTDEC1
	CALL	_usart_puts
	MOVLW	0x03
	ADDWF	FSR1L, F
_00350_DS_:
;	.line	521; firmware.c	}
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__usart_get_byte	code
_usart_get_byte:
;	.line	418; firmware.c	char usart_get_byte(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	420; firmware.c	return RCREG;
	MOVFF	_RCREG, r0x00
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__usart_get_byte_available	code
_usart_get_byte_available:
;	.line	409; firmware.c	char usart_get_byte_available(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	411; firmware.c	if(PIR1bits.RCIF)
	BTFSS	_PIR1bits, 5
	BRA	_00273_DS_
;	.line	412; firmware.c	return RCREG;
	MOVFF	_RCREG, r0x00
	MOVF	r0x00, W
	BRA	_00275_DS_
_00273_DS_:
;	.line	414; firmware.c	return 0;
	CLRF	WREG
_00275_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__usart_data_available	code
_usart_data_available:
;	.line	403; firmware.c	char usart_data_available(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	405; firmware.c	return PIR1bits.RCIF;
	CLRF	r0x00
	BTFSC	_PIR1bits, 5
	INCF	r0x00, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__reset_usart	code
_reset_usart:
;	.line	397; firmware.c	void reset_usart()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	399; firmware.c	PIR1bits.RCIF = 0;
	BCF	_PIR1bits, 5
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_firmware__autonomous_routine0	code
_autonomous_routine0:
;	.line	354; firmware.c	void    autonomous_routine0(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	357; firmware.c	DPRINTF("Starting autonomous routine...\n");
	MOVLW	UPPER(__str_9)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_9)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_9)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	361; firmware.c	set_drives_LR(AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
	MOVLW	0x46
	MOVWF	POSTDEC1
	MOVLW	0x46
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	362; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	366; firmware.c	for(i=0; (rc_read_data(6) != -127) && (i < 400);i++)
	CLRF	r0x00
	CLRF	r0x01
_00245_DS_:
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	XORLW	0x81
	BZ	_00248_DS_
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x7f
	BNZ	_00257_DS_
	MOVLW	0x90
	SUBWF	r0x00, W
_00257_DS_:
	BC	_00248_DS_
;	.line	368; firmware.c	delay_msec(50);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x32
	MOVWF	POSTDEC1
	CALL	_delay_msec
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	366; firmware.c	for(i=0; (rc_read_data(6) != -127) && (i < 400);i++)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00245_DS_
_00248_DS_:
	BANKSEL	_halt
;	.line	389; firmware.c	set_drives_LR(halt.left_multiplier,halt.left_multiplier);
	MOVF	_halt, W, B
	MOVWF	POSTDEC1
	BANKSEL	_halt
	MOVF	_halt, W, B
	MOVWF	POSTDEC1
	CALL	_set_drives_LR
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	390; firmware.c	controller_submit_data(WAIT);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	393; firmware.c	DPRINTF("Ending autonomous routine...\n");
	MOVLW	UPPER(__str_10)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_10)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_10)
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
;	.line	329; firmware.c	void    arcade_drive_routine(void)
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
;	.line	334; firmware.c	joy_x = rc_read_data(ARCADE_DRIVE_X_CHAN);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
;	.line	335; firmware.c	joy_y = -rc_read_data(ARCADE_DRIVE_Y_CHAN);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x01
	INCF	FSR1L, F
	NEGF	r0x01
;	.line	336; firmware.c	arcade_drive(joy_x, joy_y, PWM_MAX, &left_power, &right_power);
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
;	.line	340; firmware.c	set_drives_LR(left_power,right_power);
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
;	.line	307; firmware.c	void    tank_drive_routine(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	313; firmware.c	left_power = -rc_read_data(TANK_DRIVE_LEFT_CHAN);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	MOVWF	r0x00
	INCF	FSR1L, F
	COMF	r0x00, W
	BANKSEL	_tank_drive_routine_left_power_1_1
	MOVWF	_tank_drive_routine_left_power_1_1, B
	INCF	_tank_drive_routine_left_power_1_1, F, B
;	.line	314; firmware.c	right_power = rc_read_data(TANK_DRIVE_RIGHT_CHAN);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_rc_read_data
	BANKSEL	_tank_drive_routine_right_power_1_1
	MOVWF	_tank_drive_routine_right_power_1_1, B
	INCF	FSR1L, F
	BANKSEL	_tank_drive_routine_right_power_1_1
;	.line	317; firmware.c	set_drives_LR(left_power,right_power);
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
;	.line	243; firmware.c	void    rc_routine(void)
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
;	.line	258; firmware.c	if ( io_read_digital(ARCADE_JUMPER_PORT) == 0 )
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_io_read_digital
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVF	r0x00, W
	BNZ	_00207_DS_
;	.line	259; firmware.c	arcade_drive_routine();
	CALL	_arcade_drive_routine
	BRA	_00208_DS_
_00207_DS_:
;	.line	261; firmware.c	tank_drive_routine();
	CALL	_tank_drive_routine
_00208_DS_:
;	.line	263; firmware.c	controller_submit_data(NO_WAIT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_controller_submit_data
	INCF	FSR1L, F
;	.line	265; firmware.c	if(sonar_read(SONAR_DOWN_SENSOR_INT) > 15)
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_sonar_read
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	INCF	FSR1L, F
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00224_DS_
	MOVLW	0x10
	SUBWF	r0x00, W
_00224_DS_:
	BNC	_00210_DS_
;	.line	267; firmware.c	cliff_avoidance();
	CALL	_cliff_avoidance
_00210_DS_:
;	.line	276; firmware.c	elapsed_time = SYSTEM_TIMER_SECONDS();
	CALL	_timer0_read32
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	BTFSS	_T0CON, 3
	BRA	_00217_DS_
	MOVLW	0x01
	MOVWF	r0x04
	CLRF	r0x05
	BRA	_00218_DS_
_00217_DS_:
	MOVLW	0x07
	ANDWF	_T0CON, W
	MOVWF	r0x06
	MOVLW	0x02
	MOVWF	r0x04
	MOVLW	0x00
	MOVWF	r0x05
	MOVF	r0x06, W
	BZ	_00218_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00228_DS_:
	RLCF	r0x04, F
	RLCF	r0x05, F
	ADDLW	0x01
	BNC	_00228_DS_
_00218_DS_:
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
;	.line	279; firmware.c	if ( elapsed_time > old_time )
	MOVF	(_rc_routine_elapsed_time_1_1 + 3), W, B
	BANKSEL	(_rc_routine_old_time_1_1 + 3)
	SUBWF	(_rc_routine_old_time_1_1 + 3), W, B
	BNZ	_00229_DS_
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 2)
	MOVF	(_rc_routine_elapsed_time_1_1 + 2), W, B
	BANKSEL	(_rc_routine_old_time_1_1 + 2)
	SUBWF	(_rc_routine_old_time_1_1 + 2), W, B
	BNZ	_00229_DS_
	BANKSEL	(_rc_routine_elapsed_time_1_1 + 1)
	MOVF	(_rc_routine_elapsed_time_1_1 + 1), W, B
	BANKSEL	(_rc_routine_old_time_1_1 + 1)
	SUBWF	(_rc_routine_old_time_1_1 + 1), W, B
	BNZ	_00229_DS_
	BANKSEL	_rc_routine_elapsed_time_1_1
	MOVF	_rc_routine_elapsed_time_1_1, W, B
	BANKSEL	_rc_routine_old_time_1_1
	SUBWF	_rc_routine_old_time_1_1, W, B
_00229_DS_:
	BTFSC	STATUS, 0
	BRA	_00215_DS_
;	.line	281; firmware.c	old_time = elapsed_time;
	MOVFF	_rc_routine_elapsed_time_1_1, _rc_routine_old_time_1_1
	MOVFF	(_rc_routine_elapsed_time_1_1 + 1), (_rc_routine_old_time_1_1 + 1)
	MOVFF	(_rc_routine_elapsed_time_1_1 + 2), (_rc_routine_old_time_1_1 + 2)
	MOVFF	(_rc_routine_elapsed_time_1_1 + 3), (_rc_routine_old_time_1_1 + 3)
	BANKSEL	_debugMode
;	.line	289; firmware.c	if(debugMode)
	MOVF	_debugMode, W, B
	BTFSC	STATUS, 2
	BRA	_00215_DS_
;	.line	290; firmware.c	DPRINTF("ET: %ld  RC: %d %d %d %d %d %d %d  Jumper: %d\n",
	MOVLW	0x04
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
	MOVLW	UPPER(__str_8)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_8)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_8)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x17
	ADDWF	FSR1L, F
_00215_DS_:
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
;	.line	188; firmware.c	void    custom_init(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	197; firmware.c	rotation_circumference_cm = (PI * TRACK_WIDTH_mm) / 10;
	MOVLW	0x3e
	BANKSEL	_rotation_circumference_cm
	MOVWF	_rotation_circumference_cm, B
	BANKSEL	(_rotation_circumference_cm + 1)
	CLRF	(_rotation_circumference_cm + 1), B
;	.line	198; firmware.c	wheel_circumference_cm = (PI * MEDIUM_WHEEL_DIA_mm) / 10;
	MOVLW	0x2f
	BANKSEL	_wheel_circumference_cm
	MOVWF	_wheel_circumference_cm, B
	BANKSEL	(_wheel_circumference_cm + 1)
	CLRF	(_wheel_circumference_cm + 1), B
;	.line	199; firmware.c	rotation_deg_per_tick = (360 / 90) * wheel_circumference_cm / rotation_circumference_cm;
	MOVLW	0x03
	BANKSEL	_rotation_deg_per_tick
	MOVWF	_rotation_deg_per_tick, B
	BANKSEL	(_rotation_deg_per_tick + 1)
	CLRF	(_rotation_deg_per_tick + 1), B
;	.line	200; firmware.c	distance_cm_per_15_ticks = 15 * wheel_circumference_cm / 90;
	MOVLW	0x07
	BANKSEL	_distance_cm_per_15_ticks
	MOVWF	_distance_cm_per_15_ticks, B
	BANKSEL	(_distance_cm_per_15_ticks + 1)
	CLRF	(_distance_cm_per_15_ticks + 1), B
;	.line	206; firmware.c	for (c = 1; c <= 15; ++c)
	MOVLW	0x01
	MOVWF	r0x00
	CLRF	r0x01
_00176_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00199_DS_
	MOVLW	0x10
	SUBWF	r0x00, W
_00199_DS_:
	BC	_00179_DS_
;	.line	207; firmware.c	io_set_direction(c, IO_DIRECTION_IN);
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_io_set_direction
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	206; firmware.c	for (c = 1; c <= 15; ++c)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00176_DS_
_00179_DS_:
;	.line	213; firmware.c	io_set_analog_port_count(ANALOG_PORTS);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_io_set_analog_port_count
	INCF	FSR1L, F
;	.line	217; firmware.c	for (c = 16; c <= 16; ++c)
	MOVLW	0x10
	MOVWF	r0x00
	CLRF	r0x01
_00180_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00200_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
_00200_DS_:
	BC	_00183_DS_
;	.line	218; firmware.c	io_set_direction(c, IO_DIRECTION_OUT);
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_io_set_direction
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	217; firmware.c	for (c = 16; c <= 16; ++c)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00180_DS_
_00183_DS_:
;	.line	221; firmware.c	for (c = 16; c <= 16; ++c)
	MOVLW	0x10
	MOVWF	r0x00
	CLRF	r0x01
_00184_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00201_DS_
	MOVLW	0x11
	SUBWF	r0x00, W
_00201_DS_:
	BC	_00187_DS_
;	.line	222; firmware.c	io_write_digital(c,0);
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_io_write_digital
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	221; firmware.c	for (c = 16; c <= 16; ++c)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00184_DS_
_00187_DS_:
;	.line	230; firmware.c	sonar_init(SONAR_DOWN_SENSOR_INT,SONAR_DOWN_SENSOR_OUT);
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_sonar_init
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	232; firmware.c	shaft_encoder_enable_std(RIGHT_WHEEL_ENCODER_INT);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_enable_std
	INCF	FSR1L, F
;	.line	233; firmware.c	shaft_encoder_enable_std(LEFT_WHEEL_ENCODER_INT);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_shaft_encoder_enable_std
	INCF	FSR1L, F
;	.line	235; firmware.c	controller_print_version();
	CALL	_controller_print_version
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x42, 0x46, 0x00
; ; Starting pCode block
__str_1:
	DB	0x42, 0x4c, 0x00
; ; Starting pCode block
__str_2:
	DB	0x42, 0x52, 0x00
; ; Starting pCode block
__str_3:
	DB	0x43, 0x46, 0x00
; ; Starting pCode block
__str_4:
	DB	0x4c, 0x69, 0x25, 0x64, 0x00
; ; Starting pCode block
__str_5:
	DB	0x55, 0x44, 0x25, 0x64, 0x00
; ; Starting pCode block
__str_6:
	DB	0x45, 0x4c, 0x00
; ; Starting pCode block
__str_7:
	DB	0x45, 0x52, 0x00
; ; Starting pCode block
__str_8:
	DB	0x45, 0x54, 0x3a, 0x20, 0x25, 0x6c, 0x64, 0x20, 0x20, 0x52, 0x43, 0x3a
	DB	0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64
	DB	0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x20, 0x20, 0x4a
	DB	0x75, 0x6d, 0x70, 0x65, 0x72, 0x3a, 0x20, 0x25, 0x64, 0x0a, 0x00
; ; Starting pCode block
__str_9:
	DB	0x53, 0x74, 0x61, 0x72, 0x74, 0x69, 0x6e, 0x67, 0x20, 0x61, 0x75, 0x74
	DB	0x6f, 0x6e, 0x6f, 0x6d, 0x6f, 0x75, 0x73, 0x20, 0x72, 0x6f, 0x75, 0x74
	DB	0x69, 0x6e, 0x65, 0x2e, 0x2e, 0x2e, 0x0a, 0x00
; ; Starting pCode block
__str_10:
	DB	0x45, 0x6e, 0x64, 0x69, 0x6e, 0x67, 0x20, 0x61, 0x75, 0x74, 0x6f, 0x6e
	DB	0x6f, 0x6d, 0x6f, 0x75, 0x73, 0x20, 0x72, 0x6f, 0x75, 0x74, 0x69, 0x6e
	DB	0x65, 0x2e, 0x2e, 0x2e, 0x0a, 0x00
; ; Starting pCode block
__str_11:
	DB	0x72, 0x63, 0x00
; ; Starting pCode block
__str_12:
	DB	0x73, 0x63, 0x00
; ; Starting pCode block
__str_13:
	DB	0x53, 0x25, 0x64, 0x00
; ; Starting pCode block
__str_14:
	DB	0x48, 0x25, 0x63, 0x25, 0x63, 0x00
; ; Starting pCode block
__str_15:
	DB	0x6c, 0x25, 0x63, 0x00
; ; Starting pCode block
__str_16:
	DB	0x72, 0x25, 0x63, 0x00
; ; Starting pCode block
__str_17:
	DB	0x44, 0x31, 0x00
; ; Starting pCode block
__str_18:
	DB	0x44, 0x30, 0x00
; ; Starting pCode block
__str_19:
	DB	0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64
	DB	0x21, 0x0a, 0x00


; Statistics:
; code size:	 4580 (0x11e4) bytes ( 3.49%)
;           	 2290 (0x08f2) words
; udata size:	   32 (0x0020) bytes ( 1.79%)
; access size:	   16 (0x0010) bytes


	end
