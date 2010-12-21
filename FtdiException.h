// 例外機構

#pragma once

// std::runtime_errorを継承した抽象クラスを定義
// エラーIDがほしいので

#include <stdexcept>

namespace laysakura {

typedef enum {
    INIT_ERR,
    OPEN_ERR,
    WRITE_ERR,
    CLOSE_ERR
} FtdiErrID;

class FtdiException : public std::runtime_error {
private:
    FtdiErrID errid;

public:
    FtdiException(const std::string& what_arg, FtdiErrID errid);
};

}
