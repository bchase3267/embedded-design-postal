#include <OpenVex.h>

/****************************************************************************
 * Description:
 *  Simplest possible OpenVex program.
 *
 * History:
 *  Aug 2009    J Bacon
 ***************************************************************************/

#define TRUE    1

void heartbeat(void);

void    main(void)

{
    /* 
     *  Gory hardware initialization.  This will set the controller
     *  to a reasonable default state.
     *
     *  Must be done first!
     */
    controller_init();

    usart_init();
    
    /*
     *  To keep the Vex master code happy, you must either
     *  a.  Enter autonomous mode using
     *      controller_begin_autonomous_mode();
     *  b.  Run controller_submit_data() periodically
     */

    /* RC mode main loop */
    while (TRUE)
    {
        if(PIR1bits.RCIF) heartbeat();

    delay_msec(125);
    }
}

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
