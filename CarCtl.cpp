#include "CarCtl.h"
#include "util.h"
#include <iostream>

namespace laysakura {

CarCtl::CarCtl(MortorCtl* mctl)
    : mctl(mctl),
      _is_thread_running(false)
{
}

void CarCtl::perform_command(const command& cmd)
{
}

void CarCtl::run(int lspeed, int rspeed)
{
}

void CarCtl::_run_mortor(int lspeed, int rspeed)
{
    _arg.lspeed = lspeed;
    _arg.rspeed = rspeed;
    _arg.mctl = mctl;

    if (_is_thread_running) _stop_mortor();

    if (pthread_create(&_tid, NULL, _send_mortor_signal, &_arg) != 0) {
        std::cerr << "Faild to create _send_mortor_signal() thread"
                  << std::endl;
    }
    _is_thread_running = true;
}

void CarCtl::_stop_mortor()
{
    if (!_is_thread_running) {
        std::cerr << "Thread already stops"
                  << std::endl;
        return;
    }

    if (pthread_cancel(_tid) != 0) {
        std::cerr << "Faild to kill _send_mortor_signal() thread"
                  << std::endl;
    }
    _is_thread_running = false;
}

void* CarCtl::_send_mortor_signal(void* p)
{
    thread_arg* arg = static_cast<thread_arg*>(p);
    int lspeed = arg->lspeed;
    int rspeed = arg->rspeed;
    MortorCtl* mctl = arg->mctl;

    while (true) {
        // ここはメンテナンスのしがいがある
        for (int i = 0; i < 100; ++i) {
            if (lspeed >= 0 && i <= lspeed)
                mctl->command(MortorCtl::FROT, MortorCtl::L);
            else if (lspeed >= 0 && i > lspeed)
                mctl->command(MortorCtl::STOP, MortorCtl::L);
            else if (lspeed < 0 && i <= -lspeed)
                mctl->command(MortorCtl::FROT, MortorCtl::L);
            else if (lspeed < 0 && i > -lspeed)
                mctl->command(MortorCtl::STOP, MortorCtl::L);

            if (rspeed >= 0 && i <= rspeed)
                mctl->command(MortorCtl::FROT, MortorCtl::R);
            else if (rspeed >= 0 && i > rspeed)
                mctl->command(MortorCtl::STOP, MortorCtl::R);
            else if (rspeed < 0 && i <= -rspeed)
                mctl->command(MortorCtl::FROT, MortorCtl::R);
            else if (rspeed < 0 && i > -rspeed)
                mctl->command(MortorCtl::STOP, MortorCtl::R);
        }
    }
}

}
