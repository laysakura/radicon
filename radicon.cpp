#include "Ftdi.h"
#include "MortorCtl.h"
#include "CarCtl.h"
#include "Console.h"
#include <iostream>

int main()
{
    using namespace laysakura;

    try {
        Ftdi ftdi;
        MortorCtl mctl(&ftdi);
        CarCtl cctl(&mctl);

        Console con;

        command cmd;
        while (cmd.size() == 0 || (cmd[0] != "q" && cmd[0] != "quit")) {
            cmd = con.input();
            cctl.perform_command(cmd);
        }
    }
    catch (FtdiException e) {
        std::cerr << e.what();
    }
}
