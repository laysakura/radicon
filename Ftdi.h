// デバイスの扱いをラップするクラス
// 現時点では，出力のみを意識して設計している．

#pragma once

#include <ftdi.h>
#include <vector>
#include "FtdiException.h"

namespace laysakura {

typedef unsigned char byte;

class Ftdi {
public:
    // 出力ポート番号
    static const byte DB0 = 0x01;
    static const byte DB1 = 0x02;
    static const byte DB2 = 0x04;
    static const byte DB3 = 0x08;
    static const byte DB4 = 0x10;
    static const byte DB5 = 0x20;
    static const byte DB6 = 0x40;
    static const byte DB7 = 0x80;

private:
    struct ftdi_context ftdic;

public:
    Ftdi();
    ~Ftdi();

    void write(byte b) throw (FtdiException);

private:
    void _init() throw (FtdiException);
    void _close();                   // 機能的には例外を投げたいが，
                                // デストラクタ内で呼び出すため，
                                // 例外は投げずにexit(1)をする．
};

}
