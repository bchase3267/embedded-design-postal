
/**************************************************************************
*
*   This code is free software: you can redistribute it and/or modify
*   it under the terms of the GNU General Public License as published by
*   the Free Software Foundation, either version 3 of the License, or
*   (at your option) any later version.
*               
*   This code is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU General Public License for more details.
*
*   You should have received a copy of the GNU General Public License
*   along with this code.  If not, see <http://www.gnu.org/licenses/>.
*
***************************************************************************
*   History:
*       Created Dec 2008    Jason W. Bacon
*
***************************************************************************/

#ifndef __firmware_h__
#define __firmware_h_

/* Place a jumper in I/O port for arcade drive. No jumper = tank drive. */
#define ARCADE_JUMPER_PORT      16
#define LEFT_BUMPER_PORT        9
#define RIGHT_BUMPER_PORT       10
#define AUTONOMOUS_TRIGGER_CHAN 5   /* RC Button */

/*
 *  The #defines below are the guide to configuring your robot.
 */

/* How many of the 16 I/O ports should be configured for analog input */
#define ANALOG_PORTS            4

/* Drive motors */
#define LEFT_DRIVE_PORT         1
#define RIGHT_DRIVE_PORT        2

/* Remote control channels */
#define TANK_DRIVE_LEFT_CHAN    3
#define TANK_DRIVE_RIGHT_CHAN   2

#define ARCADE_DRIVE_X_CHAN     4
#define ARCADE_DRIVE_Y_CHAN     3

#define AUTON_DRIVE_SPEED       70

/* General stuff */
#ifndef MIN
#define MIN(x,y)    ((x) < (y) ? (x) : (y))
#endif

#ifndef MAX
#define MAX(x,y)    ((x) > (y) ? (x) : (y))
#endif

#ifndef ABS
#define ABS(x)      ((x) >= 0 ? (x) : -(x))
#endif

#ifndef TRUE
#define TRUE    1
#endif

#ifndef FALSE
#define FALSE   0
#endif

char LEFT_MOTOR = LEFT_DRIVE_PORT,
      RIGHT_MOTOR = RIGHT_DRIVE_PORT;
//char left_motor_dir, right_motor_dir; // must be 1 or -1
unsigned char   LEFT_MOTOR_POWER = 0,
                RIGHT_MOTOR_POWER = 0;
signed char     SPEED = 70;

struct drive_mode
{
    signed char left_multiplier;
    signed char right_multiplier;
} ;

struct drive_mode forward = {1,-1};
struct drive_mode backward = {-1,1};
struct drive_mode rotate_left = {-1,-1};
struct drive_mode rotate_right = {1,1};
struct drive_mode halt = {0,0};
struct drive_mode DRIVE = {0,0};

float left_multiplier = 0.0;
float right_multiplier = 0.0;

/* Prototypes */
/* ifi_startup.c */
void _entry(void);
void _startup(void);
void _do_cinit(void);
/* firmware.c */
void main(void);
void custom_init(void);
void rc_routine(void);
void vex_default_routine(void);
void tank_drive_routine(void);
void arcade_drive_routine(void);
void autonomous_routine0(void);
void set_drives_LR(signed char leftPower,signed char rightPower);
void heartbeat(void);
void bump_front_left(void);
void bump_front_right(void);
void bump_front(void);
void sonar_scan(unsigned char port);
char usart_data_available(void);
char usart_get_byte_available(void);
char usart_get_byte(void);
void serial_control(void);
#endif /*__firmware_h__*/

