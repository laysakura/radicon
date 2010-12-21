#include "Ftdi.h"
#include <iostream>

int main()
{
    using namespace laysakura;

    try {
        Ftdi ftdi;

        ftdi.write(Ftdi::DB0 | Ftdi::DB7);

        sleep(3);        
    }
    catch (FtdiException e) {
        std::cerr << e.what();
    }
}
