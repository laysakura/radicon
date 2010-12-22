#pragma once

#include <string>
#include <vector>

namespace laysakura {

std::string itoa(int i);
std::string itoa16(int i);
std::vector<std::string> splitStr(const std::string& str, char splitter = ' ');
}

