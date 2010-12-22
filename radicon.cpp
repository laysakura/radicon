#include "Ftdi.h"
#include "MortorCtl.h"
#include "CarCtl.h"
#include <iostream>

int main()
{
    using namespace laysakura;

    try {
        Ftdi ftdi;

        MortorCtl mctl(&ftdi);

        CarCtl cctl(&mctl);

        cctl.run(50, 50);
        sleep(1);
        cctl.turnleft();
        sleep(1);
        cctl.turnleft();
        sleep(1);
        cctl.turnleft();
        sleep(1);
        cctl.turnleft();
        sleep(1);
        cctl.stop();
        sleep(1);

    }
    catch (FtdiException e) {
        std::cerr << e.what();
    }
}
