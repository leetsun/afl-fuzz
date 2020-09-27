#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv){
    //unsigned int v = atoi(argv[1]);
    unsigned int v;
    while(1){
        scanf("%x", &v);
        printf("v = 0x%x\n", v);
        if(v == 0){
            break;
        }
        int ret = 0;
        v -= ((v >> 1) & 0x55555555);
        v = (v & 0x33333333) + ((v >> 2) & 0x33333333);
        ret = (((v + (v >> 4)) & 0xF0F0F0F) * 0x01010101) >> 24;
        printf("ret = 0x%x\n", ret);
    }
    return 0;
}
