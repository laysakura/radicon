#include "MortorCtl.h"
#include <iostream>

namespace laysakura {

MortorCtl::MortorCtl(Ftdi* ftdi)
    : ftdi(ftdi),
      l_behavior(0x00),
      r_behavior(0x00)
{
}


void MortorCtl::command(behavior bhv, leftright lr)
{
    byte output = (l_behavior << 4) | (r_behavior << 6); // 基本，現状態を保存
    if (lr & L) {
        output = (bhv << 4); // (DB5,DB4)が左側モータ制御
        l_behavior = bhv;
    }
    if (lr & R) {
        output = (bhv << 6); // (DB7,DB6)が右側モータ制御
        r_behavior = bhv;
    }
    ftdi->write(output);
}

behavior MortorCtl::cur_behavior(leftright lr)
{
    if (lr == (L | R)) {
        std::cerr << "** NEVER ask left & right status at once to MortorCtl::cur_behavior() **"
                  << std::endl;
        return 0xff;
    }
    return lr == L ?
        l_behavior : r_behavior;
}

}
