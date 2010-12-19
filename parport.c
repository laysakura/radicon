#include <linux/types.h>
#include <sys/io.h>
#include <unistd.h>

#define OUT_PORT 0x2305 /* 出力ポート。0xは16進数を示す */

int main(void){
  int i;
  ioperm(OUT_PORT, 8, 1); /* 初期化(ポートをいじるという宣言) */
  for(i = 0; i < 5; i++){
    outb(0x00, OUT_PORT); /* 2-9番の全部のピンにLを出力 */
    sleep(1);
    outb(0xff, OUT_PORT); /* 2-9番の全部のピンにHを出力 */
    sleep(1);
  }
  return 0;
}

