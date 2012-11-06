#include <OpenVex.h>
#include "firmware.h"

void    main(void)
{
    controller_init();/* This must be done first! */
    //custom_init();

    while (TRUE) // evaluates true every 18.5ms
    {

       // pwm_write(LEFT_MOTOR, LEFT_MOTOR_POWER);
       // pwm_write(RIGHT_MOTOR, RIGHT_MOTOR_POWER);

       // controller_submit_data(NO_WAIT);
        printf("%d,%d,%d,%d,%d,%d,%d,%d\n",
               pwm_read(1),pwm_read(2),pwm_read(3),pwm_read(4),
               pwm_read(5),pwm_read(6),pwm_read(7),pwm_read(2));

    }
}
