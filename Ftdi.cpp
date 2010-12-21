#include "Ftdi.h"
#include "util.h"
#include <iostream>

namespace laysakura {

Ftdi::Ftdi()
{
    _init();
}

Ftdi::~Ftdi()
{
    _close();
}

void Ftdi::write(const bytes& b) throw (FtdiException)
{
}

bytes Ftdi::read() throw (FtdiException)
{
}

void Ftdi::_init() throw (FtdiException)
{
    if (ftdi_init(&ftdic) < 0)
        throw FtdiException(
            "ftdi_init failed\n",
            INIT_ERR);

    int ret = ftdi_usb_open(&ftdic, 0x0403, 0x6001);
    if (ret < 0 && ret != -5)
        throw FtdiException(
            "Unable to open ftdi device: "
            + itoa(ret)
            + " ("
            + ftdi_get_error_string(&ftdic)
            + ")\n",
            OPEN_ERR);

#ifdef DEBUG
    std::cerr << "ftdi open succeeded: " << itoa(ret) << std::endl;
#endif
    
    ftdi_set_bitmode(&ftdic, 0xff, BITMODE_BITBANG);

#ifdef DEBUG
    std::cerr << "Enabled bitbang mode" << std::endl;
#endif
}

void Ftdi::_close()
{
    ftdi_disable_bitbang(&ftdic);

#ifdef DEBUG
    std::cerr << "Disabled bitbang mode" << std::endl;
#endif
    
    int ret = ftdi_usb_close(&ftdic);
    if (ret < 0) {
        std::cerr << "Unable to close ftdi device: "
                  << itoa(ret)
                  << " ("
                  << ftdi_get_error_string(&ftdic)
                  << ")"
                  << std::endl;
        exit(1);
    }

    ftdi_deinit(&ftdic);

#ifdef DEBUG
    std::cerr << "ftdi close succeeded" << std::endl;
#endif
        
}

}
