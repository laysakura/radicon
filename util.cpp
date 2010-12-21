#include "util.h"
#include <cstdio>

namespace laysakura {

std::string itoa(int i)
{
    char s[20];
    sprintf(s, "%d", i);
    return std::string(s);
}

std::string itoa16(int i)
{
    char s[20];
    sprintf(s, "%x", i);
    return std::string(s);
}

}
