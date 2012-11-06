/**************************************************************************
*
*   This project contains free simple code for the VEX robotics system.
*   It is provided as an aid to students, mentors, and hobbyists
*   for the purpose of programming VEX robots.
*
*   This code is based in part on the VEX default code, and Sutekh's open
*   source VEX library.  The goal of this project is to provide source
*   code for VEX robots which:
*
*   1.  Is easy to read and modify
*   2.  Provides a positive example of software engineering practices for
*       students to learn from.  This includes:
*
*       a.  Consistency in naming conventions and descriptive variable
*           and type names.
*       b.  An API (application program interface) layer between the
*           application and hardware access.  This layer hides the
*           details of hardware access, provides a forward-compatible
*           interface for new programs, and performs sanity checking.
*
*   This file should use the VEX application program interface.
*   All hardware access in this file goes through API functions such as
*   pwm_write(), io_set_digitial(), rc_read_data(), etc.  If you
*   want to code at a lower level, you shoud enhance the library
*   code in the Lib directory and create more API functions to use
*   here if necessary.
*
***************************************************************************
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
***************************************************************************/ 

#include <OpenVex.h>
#include "firmware.h"

/****************************************************************************
 * Description:
 *  Main robot loop.
 *
 * History:
 *  Dec 2008    J Bacon
 ***************************************************************************/

void    main(void)

{
    controller_init();
    custom_init();

    /*
     *  Main loop.  Watch for the master processor to indicate
     *  that new data is available.
     */

    controller_begin_autonomous_mode();

    while (TRUE)
    {
	/*
	 *  This program runs on the VEX "user" processor. The VEX
	 *  "master" processor monitors the remote control and
	 *  generates PWMs (pulse-width modulation for motor power).  It
	 *  interrupts the user processor every 18.5ms to signal the
	 *  availability of new data.
	 *
	 *  Code that processes new data from the master processor
	 *  should go inside this if statement.  The if condition will
	 *  only evaluate to true every 18.5ms, so this loop "spins"
	 *  a lot waiting for new data, unless
	 *  process_master_data() takes up a good chunk of 18.5ms.
	 *  If it takes more than 18.5ms, data from the master processor
	 *  will be lost.  ( May or may not be a big deal. )
	 */
        if (!controller_in_autonomous_mode())
        {
            if ( rc_new_data_available() )
            {
                rc_routine();

                /* Run autonomous routine when a RC lower button is pressed. */
                if ( rc_read_data(AUTONOMOUS_TRIGGER_CHAN) == -127 ) autonomous_routine0();
            }
        }
        controller_begin_autonomous_mode();
        if(usart_data_available())
        {
            serial_control();
        }
        set_drives_LR(SPEED * DRIVE.left_multiplier,SPEED * DRIVE.right_multiplier);
        controller_submit_data(NO_WAIT);
        controller_end_autonomous_mode();
        printf("Speed: %d Left: %d Right %d\n",SPEED,DRIVE.left_multiplier,DRIVE.right_multiplier);

    }
}


/****************************************************************************
 * Description: 
 *  This function initializes the controller according to the needs of
 *  this program.  Modify it to suite the needs of your robot.
 *
 * History: 
 *  Dec 2008    J Bacon
 ***************************************************************************/

void    custom_init(void)

{
    int     c;

    /*
     *  Below are custom configurations for your robot.  This is where
     *  you set up digital output ports, analog ports, sensors, etc.
     */
     
    /* Set some of the 16 I/O ports as inputs */
    for (c = 1; c <= 16; ++c)
	io_set_direction(c, IO_DIRECTION_IN);

    /*
     *  Configure the number of analog input ports. Ports 1 through N
     *  will be analog, and N+1 through 16 will be digital.
     */
    io_set_analog_port_count(ANALOG_PORTS);

    /* Set some of the 16 I/O ports as outputs (digital output only). */
    /* These can be used to drive LEDs and other low-current devices. */
    //for (c = 9; c <= 16; ++c)
    //    io_set_direction(c, IO_DIRECTION_OUT);

    /* Initialize the values on the digital outputs. */
    //for (c = 9; c <= 16; ++c)
    //    io_set_digital(c,0);
    
    controller_print_version();
}


/****************************************************************************
 * Description: 
 *  Process data from master controller.
 ***************************************************************************/

void    rc_routine(void)
{ 
    /*
     *  Keep a count of calls to this function.  This will overflow
     *  at 2^16 (65, 536), but we don't really care since we're only
     *  interested in whether or not calls is a multiple of some number.
     */ 
    static unsigned int     sonar_distance = 0;
    static unsigned long    elapsed_time,
			    old_time = 0;

    /*
     *  Alternative to default code behavior for robots with TANK
     *  drive (wheels driven directly by motors, no gearing).
     */
    if ( io_read_digital(ARCADE_JUMPER_PORT) == 0 )
        arcade_drive_routine();
    else
        tank_drive_routine();

    controller_submit_data(NO_WAIT);

    /*
     *  Since serial output is slow, we only display once per second
     *  so that the program won't be constantly waiting for terminal
     *  output to finish.
     */

    elapsed_time = SYSTEM_TIMER_SECONDS();
    //printf("TIMER0 = %ld  elapsed_time = %ld  overflows = %d\n",
    //   timer0_read32(), elapsed_time, Timer0_overflows);
    if ( elapsed_time > old_time )
    {
	old_time = elapsed_time;
#if DEBUG_STACK
	stack_report();
#endif

	/* 
	 *  Display status of various sensors and rc inputs.
	 */
	DPRINTF("ET: %ld  RC: %d %d %d %d %d %d %d  Jumper: %d\n",
	    elapsed_time, rc_read_status(),
	    rc_read_data(1), rc_read_data(2),
	    rc_read_data(3), rc_read_data(4),
	    rc_read_data(5), rc_read_data(6),
	    io_read_digital(ARCADE_JUMPER_PORT));
    }
}


/****************************************************************************
 * Description: 
 *  VEX code for a tank-drive RC robot.
 *  
 * History: 
 *  Dec 2008    J Bacon
 ***************************************************************************/

void    tank_drive_routine(void)

{
    static char left_power,
        right_power;
    
    /* Drive motors face opposite directions, so reverse one side. */
    left_power = -rc_read_data(TANK_DRIVE_LEFT_CHAN);
    right_power = rc_read_data(TANK_DRIVE_RIGHT_CHAN);
    
    /* Drive motors */
    set_drives_LR(left_power,right_power);

}


/****************************************************************************
 * Description: 
 *  VEX code for a arcade-drive RC robot.
 *  
 * History: 
 *  June 2009   J Bacon
 ***************************************************************************/

void    arcade_drive_routine(void)

{
    char left_power, right_power,
        joy_x, joy_y;
    
    joy_x = rc_read_data(ARCADE_DRIVE_X_CHAN);
    joy_y = -rc_read_data(ARCADE_DRIVE_Y_CHAN);
    arcade_drive(joy_x, joy_y, PWM_MAX, &left_power, &right_power);
    // printf("%d %d %d %d\n", joy_x, joy_y, left_power, right_power);

    /* Drive motors */
    set_drives_LR(left_power,right_power);
}


/***************************************************************************
 *  Description:
 *      Run the robot autonomously.
 *
 *  Arguments:
 *      None.
 *
 *  History: 
 *      Jan 2010    J Bacon     Created stub.
 ***************************************************************************/


void    autonomous_routine0(void)
{
    int i;
    DPRINTF("Starting autonomous routine...\n");
    //controller_begin_autonomous_mode(); // uncomment to disable RC interruption

    // start driving forward
    set_drives_LR(AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);

    // RUN FOR ~20 SECONDS OR UNTIL KILL COMMAND
    // pauses if signal is lost
    for(i=0; (rc_read_data(6) != -127) && (i < 400);i++)
    {
        delay_msec(50);
        /*
        if ( io_read_digital(LEFT_BUMPER_PORT) == 0 )
        {

            if ( io_read_digital(RIGHT_BUMPER_PORT) == 0 )
            {
                DPRINTF("Bump left\n");
                bump_front();
            }
            else
                bump_front_left();
        }
        else if ( io_read_digital(RIGHT_BUMPER_PORT) == 0 )
        {
            DPRINTF("Bump right\n");
            bump_front_right();
        }
        controller_submit_data(NO_WAIT);
        */
    }
    pwm_write(RIGHT_DRIVE_PORT, MOTOR_STOP);
    pwm_write(LEFT_DRIVE_PORT, MOTOR_STOP);
    controller_submit_data(WAIT);

    //controller_end_autonomous_mode(); // uncomment to disable RC interruption
    DPRINTF("Ending autonomous routine...\n");
}
// check if data is available
char usart_data_available(void)
{
    return PIR1bits.RCIF;
}

// check if data is available and return if it is
char usart_get_byte_available(void)
{
    if(PIR1bits.RCIF)
        return RCREG;
    else
        return 0;
}

// get last byte available
char usart_get_byte(void)
{
    return RCREG;
}

void serial_control(void)
{
    char command_byte;
    if(usart_data_available())
        command_byte = usart_get_byte();
    else return;

    switch(command_byte)
    {
    case 'w':
        DRIVE.left_multiplier = forward.left_multiplier;
        DRIVE.right_multiplier = forward.right_multiplier;
        putchar('w');
        break;
    case 's':
        DRIVE.left_multiplier = backward.left_multiplier;
        DRIVE.right_multiplier = backward.right_multiplier;
        putchar('s');
        break;
    case 'a':
        DRIVE.left_multiplier = rotate_left.left_multiplier;
        DRIVE.right_multiplier = rotate_left.right_multiplier;
        putchar('a');
        break;
    case 'd':
        DRIVE.left_multiplier = rotate_right.left_multiplier;
        DRIVE.right_multiplier = rotate_right.right_multiplier;
        putchar('d');
        break;
    case ' ':
        DRIVE.left_multiplier = halt.left_multiplier;
        DRIVE.right_multiplier = halt.right_multiplier;
        putchar(' ');
        break;
    default:
        break;

    }

}
/***************************************************************************/
// respond to pulse

void heartbeat(void)
{
    char dat;

    dat = RCREG;
    if(dat == 'p')
    {
    printf("Hello, World!\n");
    controller_submit_data(NO_WAIT);
    }
}


/****************************************************************************/
// bump routines

void bump_front_left()
{
    int reset_left,reset_right;
    reset_right = pwm_read(RIGHT_DRIVE_PORT);
    reset_left = pwm_read(LEFT_DRIVE_PORT);

    // reverse
    set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // turn right
    set_drives_LR(AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // as you were
    pwm_write(RIGHT_DRIVE_PORT, reset_right);
    pwm_write(LEFT_DRIVE_PORT, reset_left);
    controller_submit_data(WAIT);
    delay_msec(100);

}

void bump_front_right()

{
    int reset_left,reset_right;
    reset_right = pwm_read(RIGHT_DRIVE_PORT);
    reset_left = pwm_read(LEFT_DRIVE_PORT);

    // reverse
    set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // turn left
    set_drives_LR(-AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // as you were
    pwm_write(RIGHT_DRIVE_PORT, reset_right);
    pwm_write(LEFT_DRIVE_PORT, reset_left);
    controller_submit_data(WAIT);
    delay_msec(100);

}

void bump_front()
{
    int reset_left,reset_right;
    reset_right = pwm_read(RIGHT_DRIVE_PORT);
    reset_left = pwm_read(LEFT_DRIVE_PORT);

    // reverse
    set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // do a 180
    set_drives_LR(-AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(2700);

    // as you were
    pwm_write(RIGHT_DRIVE_PORT, reset_right);
    pwm_write(LEFT_DRIVE_PORT, reset_left);
    controller_submit_data(WAIT);
    delay_msec(100);
}

void set_drives_LR(signed char leftPower,signed char rightPower)
{
    pwm_write(RIGHT_DRIVE_PORT, -rightPower);
    pwm_write(LEFT_DRIVE_PORT, leftPower);
}
