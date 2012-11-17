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
    unsigned int i=10000;
    unsigned int sonar_dist = 0, old_sonar_dist = 1;
    unsigned int light_level = 0;

    unsigned left_enc_ticks=0,
            right_enc_ticks=0;

    controller_init();
    custom_init();

    /*
     *  Main loop.  Watch for the master processor to indicate
     *  that new data is available.
     */

    controller_end_autonomous_mode();

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
        //controller_begin_autonomous_mode();

        if(usart_data_available())
        {
            serial_control();
            if(DRIVE == &differential)
                set_drives_LR(LEFT_SPEED,RIGHT_SPEED);
            else
                set_drives_LR(SPEED * DRIVE->left_multiplier,SPEED * DRIVE->right_multiplier);

            controller_submit_data(NO_WAIT);
            //controller_end_autonomous_mode();
        }
/*
        if(i++ % 128 == 0)
            printf("Speed: %d Left: %d Right %d\n",SPEED,DRIVE->left_multiplier,DRIVE->right_multiplier);
*/
        if(io_read_digital(LEFT_BUMPER_PORT)==0)
        {
            if(io_read_digital(RIGHT_BUMPER_PORT)==0)
            {
                printf("BF\n");
                bump_front();
            }
            else
            {
                printf("BL");
                bump_front_left();
            }
        }
        else
        {
            if(io_read_digital(RIGHT_BUMPER_PORT)==0)
            {
                printf("BR");
                bump_front_right();
            }
        }

        if((sonar_dist = sonar_read(SONAR_DOWN_SENSOR_INT)) > 20)
        {
            printf("CF");
            cliff_avoidance();
        }
        if(i++ == 10000)
        {
            if(io_read_analog(LIGHT_SENSOR_PORT) != light_level)
            {
                light_level = io_read_analog(LIGHT_SENSOR_PORT);
                printf("L%d\n",light_level);
            }
            i = 0;
        }

        if(sonar_dist - old_sonar_dist > 1 || old_sonar_dist - sonar_dist > 1)
        {
            printf("UD: %d\n",sonar_dist);
            old_sonar_dist = sonar_dist;
        }

        if(shaft_encoder_read_std(LEFT_WHEEL_ENCODER_INT)!=left_enc_ticks)
        {
            printf("EL");
            left_enc_ticks = shaft_encoder_read_std(LEFT_WHEEL_ENCODER_INT);
        }

        if(shaft_encoder_read_std(RIGHT_WHEEL_ENCODER_INT)!=right_enc_ticks)
        {
            printf("ER");
            right_enc_ticks = shaft_encoder_read_std(RIGHT_WHEEL_ENCODER_INT);
        }
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

    rotation_circumference_cm = (PI * TRACK_WIDTH_mm) / 10;
    wheel_circumference_cm = (PI * MEDIUM_WHEEL_DIA_mm) / 10;
    rotation_deg_per_tick = (360 / 90) * wheel_circumference_cm / rotation_circumference_cm;
    distance_cm_per_15_ticks = 15 * wheel_circumference_cm / 90;
/*
    printf("wheel circumf: %d, rotation_circumf: %d, degree/tick: %d, cm/15tick %d \n",
           wheel_circumference_cm,rotation_circumference_cm,rotation_deg_per_tick, distance_cm_per_15_ticks);
*/
    /* Set some of the 16 I/O ports as inputs */
    for (c = 1; c <= 15; ++c)
	io_set_direction(c, IO_DIRECTION_IN);

    /*
     *  Configure the number of analog input ports. Ports 1 through N
     *  will be analog, and N+1 through 16 will be digital.
     */
    io_set_analog_port_count(ANALOG_PORTS);

    /* Set some of the 16 I/O ports as outputs (digital output only). */
    /* These can be used to drive LEDs and other low-current devices. */
    for (c = 16; c <= 16; ++c)
        io_set_direction(c, IO_DIRECTION_OUT);

    /* Initialize the values on the digital outputs. */
    for (c = 16; c <= 16; ++c)
        io_write_digital(c,0);

    /*
    if(sonar_init(SONAR_DOWN_SENSOR_INT,SONAR_DOWN_SENSOR_OUT) == OV_OK)
        printf("Sonar initialized!\n");
    else
        printf("Sonar failed!\n");
    */
    sonar_init(SONAR_DOWN_SENSOR_INT,SONAR_DOWN_SENSOR_OUT);

    shaft_encoder_enable_std(RIGHT_WHEEL_ENCODER_INT);
    shaft_encoder_enable_std(LEFT_WHEEL_ENCODER_INT);

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

    if(sonar_read(SONAR_DOWN_SENSOR_INT) > 15)
    {
        cliff_avoidance();
    }

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
    set_drives_LR(halt.left_multiplier,halt.left_multiplier);
    controller_submit_data(WAIT);

    //controller_end_autonomous_mode(); // uncomment to disable RC interruption
    DPRINTF("Ending autonomous routine...\n");
}

// reset the usart
void reset_usart()
{
    PIR1bits.RCIF = 0;
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
    signed int j,k;
    if(usart_data_available())
        command_byte = usart_get_byte();
    else return;

    switch(command_byte)
    {
    case 'w':
        DRIVE = &forward;   usart_puts("w\n");
        break;
    case 's':
        DRIVE = &backward;  usart_puts("s\n");
        break;
    case 'a':
        DRIVE = &rotate_left;   usart_puts("a\n");
        break;
    case 'd':
        DRIVE = &rotate_right;   usart_puts("d\n");
        break;
    case 'b':
        DRIVE = &halt;  usart_puts("b\n");
        break;
    case '1':
        controller_end_autonomous_mode();
        usart_puts("Radio control\n");
        break;
    case '0':
        controller_begin_autonomous_mode();
        usart_puts("Serial control\n");
        break;
    case 'z':
        SPEED = 000;    printf("S%d",SPEED);
        break;
    case 'Z':
        SPEED = 127;    printf("S%d",SPEED);
        break;
    case '+':
        SPEED += 5;
        if(SPEED < 0) SPEED = 127;  printf("S%d",SPEED);
        break;
    case '-':
        SPEED -= 5;
        if(SPEED < 0) SPEED = 0;    printf("S%d",SPEED);
        break;

    case 'S':
        for(j=0;!usart_data_available() && j<0x7FFE;j++);
        if(j>=0x7FFE)
            SPEED = usart_get_byte();
        printf("S%d",SPEED);
        break;

    case 'H':
        for(j=0;!usart_data_available() && j<0x7FFE;j++);
        if(j<0x7FFE)
            k = usart_getc();
        else
            break;
        for(j=0;!usart_data_available() && j<0x7FFE;j++);
        if(j<0x7FFE)
        {
            RIGHT_SPEED = usart_getc();
            LEFT_SPEED = k;
            printf("H%c%c\n",LEFT_SPEED,RIGHT_SPEED);
            DRIVE = &differential;
        }
        break;

    case 'h':
        DRIVE = &differential;
        break;

    case 'l':
        for(j=0;!usart_data_available() && j<0x7FFE;j++);
        if(j<0x7FFE)
            LEFT_SPEED = usart_getc();
        printf("l%c",LEFT_SPEED);
        break;
    case 'r':
        for(j=0;!usart_data_available() && j<0x7FFE;j++);
        if(j<0x7FFE)
            RIGHT_SPEED = usart_getc();
        printf("r%c",RIGHT_SPEED);
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
    // reverse
    set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // turn right
    set_drives_LR(AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // as you were
    set_drives_LR(SPEED * DRIVE->left_multiplier, SPEED * DRIVE->right_multiplier);
    controller_submit_data(WAIT);
    delay_msec(100);

}

void bump_front_right()
{
    // reverse
    set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // turn left
    set_drives_LR(-AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // as you were
    set_drives_LR(SPEED * DRIVE->left_multiplier, SPEED * DRIVE->right_multiplier);
    controller_submit_data(WAIT);

}

void bump_front()
{
    // reverse
    set_drives_LR(-AUTON_DRIVE_SPEED,-AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(500);

    // do a 180
    set_drives_LR(-AUTON_DRIVE_SPEED,AUTON_DRIVE_SPEED);
    controller_submit_data(WAIT);
    delay_msec(2700);

    // as you were
    set_drives_LR(SPEED * DRIVE->left_multiplier, SPEED * DRIVE->right_multiplier);
    controller_submit_data(WAIT);
}

void set_drives_LR(signed char leftPower,signed char rightPower)
{
    pwm_write(RIGHT_DRIVE_PORT1, rightPower);
    pwm_write(LEFT_DRIVE_PORT1, -leftPower);
    pwm_write(RIGHT_DRIVE_PORT2, rightPower);
    pwm_write(LEFT_DRIVE_PORT2, -leftPower);
}

void cliff_avoidance()
{
    set_drives_LR(-127,-127);
    controller_submit_data(NO_WAIT);
    delay_msec(60);
    set_drives_LR(0,0);
    controller_submit_data(NO_WAIT);
    DRIVE = &halt;
}
