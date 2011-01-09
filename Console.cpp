#include "Console.h"
#include "util.h"

namespace laysakura {

Console::Console()
{
}

command Console::input()
{
    std::string cmd;;
    std::cerr << ">>> ";
    std::getline(std::cin, cmd);
    return splitStr(cmd);
}
                             
void Console::output_status(CarCtl* cctl)
{
    std::cout << std::endl;
    std::cout << "==INFO==" << std::endl;
    std::cout << "status:\t";
    if (cctl->ishalt()) std::cout << "halt" << std::endl;
    else std::cout << "running" << std::endl;

    std::cout << "left-speed: " << itoa(cctl->left_speed())
              << "\tright-speed: " << itoa(cctl->right_speed())
              << std::endl;

    std::cout << std::endl;
}

void Console::output_commands()
{
    std::cout << "==Commands==" << std::endl;
    std::cout << "(g)o\t(b)ack" << std::endl;
    std::cout << "(l)eft\t(r)ight" << std::endl;
    std::cout << "(s)top" << std::endl;
    std::cout << "(q)uit" << std::endl;

    std::cout << std::endl;
}

}
