// 車の操作をするインターフェース

#pragma once

#include "MortorCtl.h"
#include <pthread.h>
#include <signal.h>
#include <cstring>

namespace laysakura {

typedef std::string command;

typedef struct _thread_arg {
    int lspeed;
    int rspeed;
    MortorCtl* mctl;
} thread_arg;


class CarCtl {
private:
    MortorCtl* mctl;

public:
    CarCtl(MortorCtl* mctl);

    void perform_command(const command& cmd);

private:
    void run(int lspeed, int rspeed);    // -100 <= speed <= 100


public:
    pthread_t _tid;
    bool _is_thread_running;    // スレッドの二重起動を避ける．
    thread_arg _arg;

    void _run_mortor(int lspeed, int rspeed); // この関数を呼ぶことで，
                                 // speedに見合ったモータ回転を
                                 // 得るための信号を送出するスレッドが
                                 // _send_mortor_signal()が走り出す．
                                 // このスレッドは，_stop_mortor()
                                 // によって殺す．
    void _stop_mortor();

    static void* _send_mortor_signal(void* p);
};

}
