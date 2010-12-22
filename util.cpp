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

// strをsplitterで区切った結果を配列として返す
std::vector<std::string> splitStr(const std::string& str, char splitter)
{
    std::vector<std::string> ret;

    std::size_t from = 0;
    std::size_t to = 0;
    while ( (to = str.find(splitter, from)) != std::string::npos) {
        ret.push_back(str.substr(from, to - from));
        from = to + 1;
    }
    ret.push_back(str.substr(from, to - from));
    return ret;
}

}
