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
    else if (op == "h" || op == "halt") halt();
    else if (op == "l" || op == "left") turnleft();
    else if (op == "r" || op == "right") turnright();
    else if (op == "g" || op == "go") {
        int lspeed_, rspeed_;
        if (cmd.size() == 1) {
            std::cerr << "Need 1 or 2 args" << std::endl;
            return;
        }
        else if (cmd.size() == 2) {
            lspeed_ = rspeed_ = atoi(cmd[1].c_str());
        }
        else {
            lspeed_ = atoi(cmd[1].c_str());
            rspeed_ = atoi(cmd[2].c_str());
        }
        run(lspeed_, rspeed_);
    }
}

void CarCtl::run(int lspeed_, int rspeed_)
{
    lspeed = lspeed_;
    rspeed = rspeed_;
    _run_mortor();
}

void CarCtl::stop()
{
    lspeed = rspeed = 0;
    _run_mortor();
}

void CarCtl::halt()
{
    lspeed = rspeed = 0;
    _stop_mortor();
}

void CarCtl::turnleft()
{
    // 要カスタマイズ
    rspeed -= 5;
    if (rspeed < -100) rspeed = -100;
    _run_mortor();
}

void CarCtl::turnright()
{
    // 要カスタマイズ
    lspeed -= 5;
    if (lspeed < -100) rspeed = -100;
    _run_mortor();
}

void CarCtl::neutral()
{
    // 要カスタマイズ
    if (lspeed > rspeed) {
        rspeed = lspeed;
        _run_mortor();
    }
    else if (lspeed < rspeed) {
        lspeed = rspeed;
        _run_mortor();
    }
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

void CarCtl::_run_mortor()
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
    mctl->command(MortorCtl::HALT, MortorCtl::L | MortorCtl::R);
    _is_thread_running = false;
}

void* CarCtl::_send_mortor_signal(void* p)
{
    thread_arg* arg = static_cast<thread_arg*>(p);
    int lspeed_ = arg->lspeed;
    int rspeed_ = arg->rspeed;
    MortorCtl* mctl = arg->mctl;

    // ここはメンテナンスのしがいがある
    // 例えば，sleepを使うような手も考えられる．
    if (lspeed_ >= 0 && rspeed_ >= 0) {
        while (true) {
            for (int i = 0; i < 100; ++i) {
                if (lspeed_ > i) mctl->command(MortorCtl::FROT, MortorCtl::L);
                else mctl->command(MortorCtl::STOP, MortorCtl::L);

                if (rspeed_ > i) mctl->command(MortorCtl::FROT, MortorCtl::R);
                else mctl->command(MortorCtl::STOP, MortorCtl::R);
            }
        }
    }
    else if (lspeed_ >= 0 && rspeed_ < 0) {
        while (true) {
            for (int i = 0; i < 100; ++i) {
                if (lspeed_ > i) mctl->command(MortorCtl::FROT, MortorCtl::L);
                else mctl->command(MortorCtl::STOP, MortorCtl::L);

                if (-rspeed_ > i) mctl->command(MortorCtl::BROT, MortorCtl::R);
                else mctl->command(MortorCtl::STOP, MortorCtl::R);
            }
        }
    }
    else if (lspeed_ < 0 && rspeed_ >= 0) {
        while (true) {
            for (int i = 0; i < 100; ++i) {
                if (-lspeed_ > i) mctl->command(MortorCtl::BROT, MortorCtl::L);
                else mctl->command(MortorCtl::STOP, MortorCtl::L);

                if (rspeed_ > i) mctl->command(MortorCtl::FROT, MortorCtl::R);
                else mctl->command(MortorCtl::STOP, MortorCtl::R);
            }
        }
    }
    else {
        while (true) {
            for (int i = 0; i < 100; ++i) {
                if (-lspeed_ > i) mctl->command(MortorCtl::BROT, MortorCtl::L);
                else mctl->command(MortorCtl::STOP, MortorCtl::L);

                if (-rspeed_ > i) mctl->command(MortorCtl::BROT, MortorCtl::R);
                else mctl->command(MortorCtl::STOP, MortorCtl::R);
            }
        }
    }
    return (void*)0;
}

}
