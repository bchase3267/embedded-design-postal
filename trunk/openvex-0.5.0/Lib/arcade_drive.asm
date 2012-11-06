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
	global _arcade_drive

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput1
	extern _stdin
	extern _stdout
	extern __mulint
	extern __divsint
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

udata_arcade_drive_0	udata
_arcade_drive_left_power_1_1	res	2

udata_arcade_drive_1	udata
_arcade_drive_right_power_1_1	res	2

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_arcade_drive__arcade_drive	code
_arcade_drive:
;	.line	89; arcade_drive.c	status_t    arcade_drive(char joy_x, char joy_y, char power_max,
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
;	.line	95; arcade_drive.c	abs_joy_x = ABS(joy_x),
	BSF	STATUS, 0
	BTFSS	r0x00, 7
	BCF	STATUS, 0
	CLRF	r0x09
	RLCF	r0x09, F
	MOVF	r0x09, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x0a
	RLCF	r0x0a, F
	MOVF	r0x0a, W
	BZ	_00119_DS_
	MOVFF	r0x00, r0x0b
	CLRF	r0x0c
	BTFSC	r0x00, 7
	SETF	r0x0c
	BRA	_00120_DS_
_00119_DS_:
	MOVFF	r0x00, r0x0d
	CLRF	r0x0e
	BTFSC	r0x00, 7
	SETF	r0x0e
	COMF	r0x0e, W
	MOVWF	r0x0c
	COMF	r0x0d, W
	MOVWF	r0x0b
	INFSNZ	r0x0b, F
	INCF	r0x0c, F
_00120_DS_:
;	.line	96; arcade_drive.c	abs_joy_y = ABS(joy_y);
	BSF	STATUS, 0
	BTFSS	r0x01, 7
	BCF	STATUS, 0
	CLRF	r0x0d
	RLCF	r0x0d, F
	MOVF	r0x0d, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x0e
	RLCF	r0x0e, F
	MOVF	r0x0e, W
	BZ	_00121_DS_
	MOVFF	r0x01, r0x0f
	CLRF	r0x10
	BTFSC	r0x01, 7
	SETF	r0x10
	BRA	_00122_DS_
_00121_DS_:
	MOVFF	r0x01, r0x11
	CLRF	r0x12
	BTFSC	r0x01, 7
	SETF	r0x12
	COMF	r0x12, W
	MOVWF	r0x10
	COMF	r0x11, W
	MOVWF	r0x0f
	INFSNZ	r0x0f, F
	INCF	r0x10, F
_00122_DS_:
;	.line	99; arcade_drive.c	if ( (ABS(joy_x) > JOY_MAX) || (ABS(joy_y) > JOY_MAX) ||
	MOVF	r0x0a, W
	BZ	_00123_DS_
	MOVFF	r0x00, r0x0a
	CLRF	r0x11
	BTFSC	r0x00, 7
	SETF	r0x11
	BRA	_00124_DS_
_00123_DS_:
	CLRF	r0x12
	BTFSC	r0x00, 7
	SETF	r0x12
	COMF	r0x12, W
	MOVWF	r0x11
	COMF	r0x00, W
	MOVWF	r0x0a
	INFSNZ	r0x0a, F
	INCF	r0x11, F
_00124_DS_:
	MOVF	r0x11, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00141_DS_
	MOVLW	0x80
	SUBWF	r0x0a, W
_00141_DS_:
	BC	_00105_DS_
	MOVF	r0x0e, W
	BZ	_00125_DS_
	MOVFF	r0x01, r0x00
	CLRF	r0x0a
	BTFSC	r0x01, 7
	SETF	r0x0a
	BRA	_00126_DS_
_00125_DS_:
	CLRF	r0x0e
	BTFSC	r0x01, 7
	SETF	r0x0e
	COMF	r0x0e, W
	MOVWF	r0x0a
	COMF	r0x01, W
	MOVWF	r0x00
	INFSNZ	r0x00, F
	INCF	r0x0a, F
_00126_DS_:
	MOVF	r0x0a, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00143_DS_
	MOVLW	0x80
	SUBWF	r0x00, W
_00143_DS_:
	BC	_00105_DS_
;	.line	100; arcade_drive.c	! VALID_PWM_VAL(power_max) )
	MOVF	r0x02, W
	ADDLW	0x80
	ADDLW	0xff
	BC	_00106_DS_
_00105_DS_:
;	.line	101; arcade_drive.c	return OV_BAD_PARAM;
	MOVLW	0x80
	BRA	_00117_DS_
_00106_DS_:
;	.line	107; arcade_drive.c	left_power = abs_joy_y + abs_joy_x * ( JOY_MAX - abs_joy_y ) / JOY_MAX;
	MOVF	r0x0f, W
	SUBLW	0x7f
	MOVWF	r0x00
	MOVLW	0x00
	SUBFWB	r0x10, W
; #	MOVWF	r0x01
; #	MOVF	r0x01, W
	MOVWF	r0x01
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x0f, W
	ADDWF	r0x00, F
	MOVF	r0x10, W
	ADDWFC	r0x01, F
;	.line	108; arcade_drive.c	left_power = left_power * power_max / JOY_MAX;
	CLRF	r0x0a
	BTFSC	r0x02, 7
	SETF	r0x0a
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x00, _arcade_drive_left_power_1_1
	MOVFF	r0x01, (_arcade_drive_left_power_1_1 + 1)
;	.line	109; arcade_drive.c	right_power = (abs_joy_y - abs_joy_x);
	MOVF	r0x0b, W
	SUBWF	r0x0f, W
	MOVWF	r0x0b
	MOVF	r0x0c, W
	SUBWFB	r0x10, W
	MOVWF	r0x0c
;	.line	110; arcade_drive.c	right_power = right_power * power_max / JOY_MAX;
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x02
	MOVFF	PRODL, r0x0a
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x02
	MOVFF	PRODL, r0x0a
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x02, _arcade_drive_right_power_1_1
	MOVFF	r0x0a, (_arcade_drive_right_power_1_1 + 1)
;	.line	112; arcade_drive.c	if ( joy_y >= 0 )   /* Quadrants 1 and 2 */
	MOVF	r0x0d, W
	BNZ	_00115_DS_
;	.line	118; arcade_drive.c	if ( joy_x < 0 )    /* Swap for quadrant 2 */
	MOVF	r0x09, W
	BZ	_00116_DS_
;	.line	119; arcade_drive.c	SWAP(&left_power,&right_power);
	MOVFF	r0x00, _arcade_drive_right_power_1_1
	MOVFF	r0x01, (_arcade_drive_right_power_1_1 + 1)
	MOVFF	r0x02, _arcade_drive_left_power_1_1
	MOVFF	r0x0a, (_arcade_drive_left_power_1_1 + 1)
	BRA	_00116_DS_
_00115_DS_:
;	.line	130; arcade_drive.c	if ( joy_x >= 0 )   /* Swap for quadrant 4 only */
	MOVF	r0x09, W
	BNZ	_00113_DS_
;	.line	131; arcade_drive.c	SWAP(&left_power,&right_power);
	MOVFF	r0x02, _arcade_drive_left_power_1_1
	MOVFF	r0x0a, (_arcade_drive_left_power_1_1 + 1)
	MOVFF	r0x00, _arcade_drive_right_power_1_1
	MOVFF	r0x01, (_arcade_drive_right_power_1_1 + 1)
_00113_DS_:
	BANKSEL	(_arcade_drive_left_power_1_1 + 1)
;	.line	134; arcade_drive.c	left_power = -left_power;
	COMF	(_arcade_drive_left_power_1_1 + 1), F, B
	BANKSEL	_arcade_drive_left_power_1_1
	NEGF	_arcade_drive_left_power_1_1, B
	BNZ	_10105_DS_
	BANKSEL	(_arcade_drive_left_power_1_1 + 1)
	INCF	(_arcade_drive_left_power_1_1 + 1), F, B
_10105_DS_:
	BANKSEL	(_arcade_drive_right_power_1_1 + 1)
;	.line	135; arcade_drive.c	right_power = -right_power;
	COMF	(_arcade_drive_right_power_1_1 + 1), F, B
	BANKSEL	_arcade_drive_right_power_1_1
	NEGF	_arcade_drive_right_power_1_1, B
	BNZ	_20106_DS_
	BANKSEL	(_arcade_drive_right_power_1_1 + 1)
	INCF	(_arcade_drive_right_power_1_1 + 1), F, B
_20106_DS_:
_00116_DS_:
	BANKSEL	_arcade_drive_left_power_1_1
;	.line	137; arcade_drive.c	*left_power_ptr = left_power;
	MOVF	_arcade_drive_left_power_1_1, W, B
	MOVWF	r0x00
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	BANKSEL	_arcade_drive_right_power_1_1
;	.line	138; arcade_drive.c	*right_power_ptr = right_power;
	MOVF	_arcade_drive_right_power_1_1, W, B
	MOVWF	r0x00
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
;	.line	139; arcade_drive.c	return OV_OK;
	CLRF	WREG
_00117_DS_:
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



; Statistics:
; code size:	  804 (0x0324) bytes ( 0.61%)
;           	  402 (0x0192) words
; udata size:	    4 (0x0004) bytes ( 0.22%)
; access size:	   19 (0x0013) bytes


	end
