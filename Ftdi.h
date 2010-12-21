// デバイスの扱いをラップするクラス

#pragma once

#include <ftdi.h>
#include <vector>
#include "FtdiException.h"

namespace laysakura {

typedef std::vector<unsigned char> bytes;

class Ftdi {
private:
    struct ftdi_context ftdic;

public:
    Ftdi();
    ~Ftdi();

    void write(const bytes& b) throw (FtdiException);
    bytes read() throw (FtdiException);

private:
    void _init() throw (FtdiException);
    void _close();                   // 機能的には例外を投げたいが，
                                // デストラクタ内で呼び出すため，
                                // 例外は投げずにexit(1)をする．
};

}
