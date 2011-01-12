#include "CarCtl.h"
#include "util.h"
#include <iostream>

namespace laysakura {

CarCtl::CarCtl(MortorCtl* mctl)
    : mctl(mctl),
      lspeed(0),
      rspeed(0),
      _is_thread_running(false)
{
    stop();
}

void CarCtl::perform_command(const command& cmd)
{
    std::string op = cmd[0];

    if (op == "s" || op == "stop") stop();
    else if (op == "l" || op == "left") turnleft();
    else if (op == "r" || op == "right") turnright();
    else if (op == "g" || op == "go") go();
    else if (op == "b" || op == "back") back();
}

void CarCtl::go()
{
    mctl->command(0xa);
}

void CarCtl::back()
{
    mctl->command(0x5);
}

void CarCtl::stop()
{
    mctl->command(0xf);
}

void CarCtl::halt()
{
    lspeed = rspeed = 0;
}

void CarCtl::turnleft()
{
     mctl->command(0x8);
}

void CarCtl::turnright()
{
    mctl->command(0x2);
}

void CarCtl::neutral()
{
}

int CarCtl::left_speed()
{
    return lspeed;
}

int CarCtl::right_speed()
{
    return rspeed;
}

bool CarCtl::ishalt()
{
    return _is_thread_running;
}


}
