#include "FtdiException.h"

namespace laysakura {

FtdiException::FtdiException
(const std::string& what_arg, FtdiErrID errid)
    : std::runtime_error(what_arg), // 親クラスのコンストラクタ呼び出し
      errid(errid)
{}

}
