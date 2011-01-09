// モータの基本機能，
// ・動作をやめる
// ・stop
// ・逆回転
// ・正回転
// に対応する信号を出力するためのクラス．
// モータを状態数1(現状態のみ)のステートマシン
// としてコントロールする．

#pragma once

#include "Ftdi.h"

namespace laysakura {

typedef unsigned char leftright;
typedef unsigned char behavior;

class MortorCtl {
public:
    // 左右どちらのモータに対する操作か
    // 左右同時の指定は， L | R による．
    static const leftright L = 0x1;
    static const leftright R = 0x2;

    // モータの動作
    static const behavior HALT = 0x0;
    static const behavior STOP = 0x1;
    static const behavior BROT = 0x2; // BackwardRotate
    static const behavior FROT = 0x3; // ForwardRotate
    
private:
    Ftdi* ftdi;
    behavior bhv;

public:
    MortorCtl(Ftdi* ftdi);

    void command(behavior bhv_);
    behavior cur_behavior();
};

}
