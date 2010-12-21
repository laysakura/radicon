#include "Ftdi.h"
#include "MortorCtl.h"
#include <iostream>

int main()
{
    using namespace laysakura;

    try {
        Ftdi ftdi;

        MortorCtl mctl(&ftdi);
        mctl.command(MortorCtl::BROT, MortorCtl::R);
        sleep(3);        

        mctl.command(MortorCtl::BROT, MortorCtl::L);
        mctl.command(MortorCtl::STOP, MortorCtl::R);
        sleep(3);        
    }
    catch (FtdiException e) {
        std::cerr << e.what();
    }
}
