#include "MortorCtl.h"
#include <iostream>

namespace laysakura {

MortorCtl::MortorCtl(Ftdi* ftdi)
    : ftdi(ftdi),
      bhv(0x00)
{
}

void MortorCtl::command(behavior bhv_)
{
    bhv = bhv_;
    ftdi->write(bhv);
}

behavior MortorCtl::cur_behavior()
{
    return bhv;
}

}
