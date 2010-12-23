// 端末のインターフェースを作るクラス

#pragma once

#include <iostream>
#include <vector>
#include <string>
#include "CarCtl.h"

namespace laysakura {

typedef std::vector<std::string> command;

class Console {
public:
    Console();

    command input();            // 端末からの入力があるまで
                                // 処理を止めることになる．
    void output_status(CarCtl* cctl);
    void output_commands();
};

}
