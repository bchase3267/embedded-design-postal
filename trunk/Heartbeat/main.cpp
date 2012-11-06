#include <cstdio>
#include <stdio.h>
#include <iostream>
#include <cstdlib>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>

using namespace std;

int main()
{

    int pd;
    pd = open("/dev/ttySO",O_RDWR | O_NOCTTY | O_NDELAY);

    if(pd == -1)
    {
        cerr << "Unable to open port /dev/ttySO";
        char d;
        cin >> d;
        return 1;
    }
    else
        fcntl(pd,F_SETFL,0);

    char char1[2],vexdata[16];
    cout << "Type 'p' and return to begin exchange: " << endl;
    cin >> char1;
    int operation_status;

    operation_status = write(pd,char1,1);
    operation_status = read(pd,vexdata,16);
    if(vexdata == "Hello, World!\n")
        cout << "Cause for a celebration" << endl;

    return 0;
}

