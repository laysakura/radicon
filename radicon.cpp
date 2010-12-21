#include "Ftdi.h"
#include <iostream>

int main()
{
    using namespace laysakura;

    try {
        Ftdi ftdi;
    }
    catch (FtdiException e) {
        std::cerr << e.what();
    }
}
