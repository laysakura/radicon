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

        cctl._run_mortor(10, 20);
        sleep(5);
        cctl._stop_mortor();

    }
    catch (FtdiException e) {
        std::cerr << e.what();
    }
}
