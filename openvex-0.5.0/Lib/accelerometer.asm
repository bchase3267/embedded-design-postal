;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Fri Nov  2 01:06:42 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f8520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _read_accelerometer_axis

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput2
	extern __gptrget4
	extern __gptrput4
	extern _stdin
	extern _stdout
	extern _Timer0_overflows
	extern _Timer1_overflows
	extern _Timer2_overflows
	extern _Timer3_overflows
	extern _Timer4_overflows
	extern _printf
	extern _timer0_read32
	extern _io_read_analog
	extern __divslong
	extern __mullong
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_read_accelerometer_axis_old_velocity_1_1	db	0x00, 0x00, 0x00, 0x00
_read_accelerometer_axis_old_acceleration_1_1	db	0x00, 0x00
_read_accelerometer_axis_calls_1_1	db	0x00, 0x00


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

udata_accelerometer_0	udata
_read_accelerometer_axis_timer_1_1	res	4

udata_accelerometer_1	udata
_read_accelerometer_axis_old_timer_1_1	res	4

udata_accelerometer_2	udata
_read_accelerometer_axis_dt_1_1	res	4

udata_accelerometer_3	udata
_read_accelerometer_axis_raw_1_1	res	4

udata_accelerometer_4	udata
_read_accelerometer_axis_c_1_1	res	2

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_accelerometer__read_accelerometer_axis	code
_read_accelerometer_axis:
;	.line	78; accelerometer.c	void    read_accelerometer_axis(unsigned char port, int base_val,
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
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x0a
	MOVLW	0x0d
	MOVFF	PLUSW2, r0x0b
	MOVLW	0x0e
	MOVFF	PLUSW2, r0x0c
	MOVLW	0x0f
	MOVFF	PLUSW2, r0x0d
;	.line	96; accelerometer.c	timer = timer0_read32();
	CALL	_timer0_read32
	BANKSEL	_read_accelerometer_axis_timer_1_1
	MOVWF	_read_accelerometer_axis_timer_1_1, B
	MOVFF	PRODL, (_read_accelerometer_axis_timer_1_1 + 1)
	MOVFF	PRODH, (_read_accelerometer_axis_timer_1_1 + 2)
	MOVFF	FSR0L, (_read_accelerometer_axis_timer_1_1 + 3)
	BANKSEL	_read_accelerometer_axis_old_timer_1_1
;	.line	97; accelerometer.c	dt = (timer - old_timer);
	MOVF	_read_accelerometer_axis_old_timer_1_1, W, B
	BANKSEL	_read_accelerometer_axis_timer_1_1
	SUBWF	_read_accelerometer_axis_timer_1_1, W, B
	BANKSEL	_read_accelerometer_axis_dt_1_1
	MOVWF	_read_accelerometer_axis_dt_1_1, B
	BANKSEL	(_read_accelerometer_axis_old_timer_1_1 + 1)
	MOVF	(_read_accelerometer_axis_old_timer_1_1 + 1), W, B
	BANKSEL	(_read_accelerometer_axis_timer_1_1 + 1)
	SUBWFB	(_read_accelerometer_axis_timer_1_1 + 1), W, B
	BANKSEL	(_read_accelerometer_axis_dt_1_1 + 1)
	MOVWF	(_read_accelerometer_axis_dt_1_1 + 1), B
	BANKSEL	(_read_accelerometer_axis_old_timer_1_1 + 2)
	MOVF	(_read_accelerometer_axis_old_timer_1_1 + 2), W, B
	BANKSEL	(_read_accelerometer_axis_timer_1_1 + 2)
	SUBWFB	(_read_accelerometer_axis_timer_1_1 + 2), W, B
	BANKSEL	(_read_accelerometer_axis_dt_1_1 + 2)
	MOVWF	(_read_accelerometer_axis_dt_1_1 + 2), B
	BANKSEL	(_read_accelerometer_axis_old_timer_1_1 + 3)
	MOVF	(_read_accelerometer_axis_old_timer_1_1 + 3), W, B
	BANKSEL	(_read_accelerometer_axis_timer_1_1 + 3)
	SUBWFB	(_read_accelerometer_axis_timer_1_1 + 3), W, B
	BANKSEL	(_read_accelerometer_axis_dt_1_1 + 3)
	MOVWF	(_read_accelerometer_axis_dt_1_1 + 3), B
;	.line	98; accelerometer.c	old_timer = timer;
	MOVFF	_read_accelerometer_axis_timer_1_1, _read_accelerometer_axis_old_timer_1_1
	MOVFF	(_read_accelerometer_axis_timer_1_1 + 1), (_read_accelerometer_axis_old_timer_1_1 + 1)
	MOVFF	(_read_accelerometer_axis_timer_1_1 + 2), (_read_accelerometer_axis_old_timer_1_1 + 2)
	MOVFF	(_read_accelerometer_axis_timer_1_1 + 3), (_read_accelerometer_axis_old_timer_1_1 + 3)
	BANKSEL	_read_accelerometer_axis_raw_1_1
;	.line	112; accelerometer.c	raw = 0;
	CLRF	_read_accelerometer_axis_raw_1_1, B
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 1)
	CLRF	(_read_accelerometer_axis_raw_1_1 + 1), B
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 2)
	CLRF	(_read_accelerometer_axis_raw_1_1 + 2), B
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 3)
	CLRF	(_read_accelerometer_axis_raw_1_1 + 3), B
;	.line	113; accelerometer.c	for (c=0; c < SAMPLE_SIZE; ++c)
	MOVLW	0x10
	BANKSEL	_read_accelerometer_axis_c_1_1
	MOVWF	_read_accelerometer_axis_c_1_1, B
	MOVLW	0x27
	BANKSEL	(_read_accelerometer_axis_c_1_1 + 1)
	MOVWF	(_read_accelerometer_axis_c_1_1 + 1), B
_00107_DS_:
;	.line	114; accelerometer.c	raw += (int)io_read_analog(port) - base_val;
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_io_read_analog
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	INCF	FSR1L, F
	MOVF	r0x01, W
	SUBWF	r0x0e, F
	MOVF	r0x02, W
	SUBWFB	r0x0f, F
	CLRF	WREG
	BTFSC	r0x0f, 7
	MOVLW	0xff
	MOVWF	r0x10
	MOVWF	r0x11
	MOVF	r0x0e, W
	BANKSEL	_read_accelerometer_axis_raw_1_1
	ADDWF	_read_accelerometer_axis_raw_1_1, F, B
	MOVF	r0x0f, W
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 1)
	ADDWFC	(_read_accelerometer_axis_raw_1_1 + 1), F, B
	MOVF	r0x10, W
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 2)
	ADDWFC	(_read_accelerometer_axis_raw_1_1 + 2), F, B
	MOVF	r0x11, W
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 3)
	ADDWFC	(_read_accelerometer_axis_raw_1_1 + 3), F, B
	MOVLW	0xff
	BANKSEL	_read_accelerometer_axis_c_1_1
	ADDWF	_read_accelerometer_axis_c_1_1, F, B
	BC	_10105_DS_
	BANKSEL	(_read_accelerometer_axis_c_1_1 + 1)
	DECF	(_read_accelerometer_axis_c_1_1 + 1), F, B
_10105_DS_:
	BANKSEL	_read_accelerometer_axis_c_1_1
;	.line	113; accelerometer.c	for (c=0; c < SAMPLE_SIZE; ++c)
	MOVF	_read_accelerometer_axis_c_1_1, W, B
	BANKSEL	(_read_accelerometer_axis_c_1_1 + 1)
	IORWF	(_read_accelerometer_axis_c_1_1 + 1), W, B
	BNZ	_00107_DS_
	MOVLW	0x10
	BANKSEL	_read_accelerometer_axis_c_1_1
	MOVWF	_read_accelerometer_axis_c_1_1, B
	MOVLW	0x27
	BANKSEL	(_read_accelerometer_axis_c_1_1 + 1)
	MOVWF	(_read_accelerometer_axis_c_1_1 + 1), B
;	.line	115; accelerometer.c	raw /= SAMPLE_SIZE;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 3)
	MOVF	(_read_accelerometer_axis_raw_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 2)
	MOVF	(_read_accelerometer_axis_raw_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 1)
	MOVF	(_read_accelerometer_axis_raw_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_read_accelerometer_axis_raw_1_1
	MOVF	_read_accelerometer_axis_raw_1_1, W, B
	MOVWF	POSTDEC1
	CALL	__divslong
	BANKSEL	_read_accelerometer_axis_raw_1_1
	MOVWF	_read_accelerometer_axis_raw_1_1, B
	MOVFF	PRODL, (_read_accelerometer_axis_raw_1_1 + 1)
	MOVFF	PRODH, (_read_accelerometer_axis_raw_1_1 + 2)
	MOVFF	FSR0L, (_read_accelerometer_axis_raw_1_1 + 3)
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	116; accelerometer.c	*acceleration = raw / 8;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 3)
	MOVF	(_read_accelerometer_axis_raw_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 2)
	MOVF	(_read_accelerometer_axis_raw_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 1)
	MOVF	(_read_accelerometer_axis_raw_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_read_accelerometer_axis_raw_1_1
	MOVF	_read_accelerometer_axis_raw_1_1, W, B
	MOVWF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x0e
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput2
;	.line	119; accelerometer.c	*velocity += (*acceleration + old_acceleration) * dt / 2 / scaling_factor;
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrget4
	MOVWF	r0x02
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	BANKSEL	_read_accelerometer_axis_old_acceleration_1_1
	MOVF	_read_accelerometer_axis_old_acceleration_1_1, W, B
	ADDWF	r0x00, W
	MOVWF	r0x0e
	BANKSEL	(_read_accelerometer_axis_old_acceleration_1_1 + 1)
	MOVF	(_read_accelerometer_axis_old_acceleration_1_1 + 1), W, B
	ADDWFC	r0x01, W
	MOVWF	r0x0f
	CLRF	WREG
	BTFSC	r0x0f, 7
	MOVLW	0xff
	MOVWF	r0x10
	MOVWF	r0x11
	BANKSEL	(_read_accelerometer_axis_dt_1_1 + 3)
	MOVF	(_read_accelerometer_axis_dt_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_dt_1_1 + 2)
	MOVF	(_read_accelerometer_axis_dt_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_dt_1_1 + 1)
	MOVF	(_read_accelerometer_axis_dt_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_read_accelerometer_axis_dt_1_1
	MOVF	_read_accelerometer_axis_dt_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVFF	PRODH, r0x10
	MOVFF	FSR0L, r0x11
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVFF	PRODH, r0x10
	MOVFF	FSR0L, r0x11
	MOVLW	0x08
	ADDWF	FSR1L, F
	CLRF	WREG
	BTFSC	r0x04, 7
	MOVLW	0xff
	MOVWF	r0x12
; #	MOVWF	r0x13
; #	MOVF	r0x13, W
	MOVWF	r0x13
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVFF	PRODH, r0x10
	MOVFF	FSR0L, r0x11
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x0e, W
	ADDWF	r0x02, F
	MOVF	r0x0f, W
	ADDWFC	r0x05, F
	MOVF	r0x10, W
	ADDWFC	r0x06, F
	MOVF	r0x11, W
	ADDWFC	r0x07, F
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x07, TBLPTRH
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput4
;	.line	122; accelerometer.c	*position += (*velocity + old_velocity) * dt / 2 / scaling_factor;
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget4
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVFF	PRODH, r0x0a
	MOVFF	FSR0L, r0x0e
	BANKSEL	_read_accelerometer_axis_old_velocity_1_1
	MOVF	_read_accelerometer_axis_old_velocity_1_1, W, B
	ADDWF	r0x02, W
	MOVWF	r0x0f
	BANKSEL	(_read_accelerometer_axis_old_velocity_1_1 + 1)
	MOVF	(_read_accelerometer_axis_old_velocity_1_1 + 1), W, B
	ADDWFC	r0x05, W
	MOVWF	r0x10
	BANKSEL	(_read_accelerometer_axis_old_velocity_1_1 + 2)
	MOVF	(_read_accelerometer_axis_old_velocity_1_1 + 2), W, B
	ADDWFC	r0x06, W
	MOVWF	r0x11
	BANKSEL	(_read_accelerometer_axis_old_velocity_1_1 + 3)
	MOVF	(_read_accelerometer_axis_old_velocity_1_1 + 3), W, B
	ADDWFC	r0x07, W
	MOVWF	r0x14
	BANKSEL	(_read_accelerometer_axis_dt_1_1 + 3)
	MOVF	(_read_accelerometer_axis_dt_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_dt_1_1 + 2)
	MOVF	(_read_accelerometer_axis_dt_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_dt_1_1 + 1)
	MOVF	(_read_accelerometer_axis_dt_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_read_accelerometer_axis_dt_1_1
	MOVF	_read_accelerometer_axis_dt_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x0f
	MOVFF	PRODL, r0x10
	MOVFF	PRODH, r0x11
	MOVFF	FSR0L, r0x14
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x0f
	MOVFF	PRODL, r0x10
	MOVFF	PRODH, r0x11
	MOVFF	FSR0L, r0x14
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x0f
	MOVFF	FSR0L, r0x10
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	ADDWF	r0x08, F
	MOVF	r0x04, W
	ADDWFC	r0x09, F
	MOVF	r0x0f, W
	ADDWFC	r0x0a, F
	MOVF	r0x10, W
	ADDWFC	r0x0e, F
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, PRODH
	MOVFF	r0x0a, TBLPTRL
	MOVFF	r0x0e, TBLPTRH
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput4
;	.line	124; accelerometer.c	old_acceleration = *acceleration;
	MOVFF	r0x00, _read_accelerometer_axis_old_acceleration_1_1
	MOVFF	r0x01, (_read_accelerometer_axis_old_acceleration_1_1 + 1)
;	.line	125; accelerometer.c	old_velocity = *velocity;
	MOVFF	r0x02, _read_accelerometer_axis_old_velocity_1_1
	MOVFF	r0x05, (_read_accelerometer_axis_old_velocity_1_1 + 1)
	MOVFF	r0x06, (_read_accelerometer_axis_old_velocity_1_1 + 2)
	MOVFF	r0x07, (_read_accelerometer_axis_old_velocity_1_1 + 3)
;	.line	127; accelerometer.c	printf("raw = %ld  accel = %d  velo = %ld  pos = %ld\n",
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 3)
	MOVF	(_read_accelerometer_axis_raw_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 2)
	MOVF	(_read_accelerometer_axis_raw_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_read_accelerometer_axis_raw_1_1 + 1)
	MOVF	(_read_accelerometer_axis_raw_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_read_accelerometer_axis_raw_1_1
	MOVF	_read_accelerometer_axis_raw_1_1, W, B
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x11
	ADDWF	FSR1L, F
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
__str_0:
	DB	0x72, 0x61, 0x77, 0x20, 0x3d, 0x20, 0x25, 0x6c, 0x64, 0x20, 0x20, 0x61
	DB	0x63, 0x63, 0x65, 0x6c, 0x20, 0x3d, 0x20, 0x25, 0x64, 0x20, 0x20, 0x76
	DB	0x65, 0x6c, 0x6f, 0x20, 0x3d, 0x20, 0x25, 0x6c, 0x64, 0x20, 0x20, 0x70
	DB	0x6f, 0x73, 0x20, 0x3d, 0x20, 0x25, 0x6c, 0x64, 0x0a, 0x00


; Statistics:
; code size:	 1288 (0x0508) bytes ( 0.98%)
;           	  644 (0x0284) words
; udata size:	   18 (0x0012) bytes ( 1.00%)
; access size:	   21 (0x0015) bytes


	end
