#include <stdio.h>
#include <time.h>
#include <string.h>
static float a[64][64], b[64][64], c[64][64];
static volatile float sink;
static double now(void) { struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t); return t.tv_sec+t.tv_nsec/1e9; }
int main(void) {
    for(int i=0;i<64;i++) for(int j=0;j<64;j++) {
        a[i][j]=(float)((i*17+j*13)%97+1)/100.0f;
        b[i][j]=(float)((i*11+j*7)%89+1)/100.0f;
    }
    double deadline=now()+65.0;
    while(now()<deadline) {
        memset(c,0,sizeof(c));
        for(int i=0;i<64;i++) for(int k=0;k<64;k++) for(int j=0;j<64;j++)
            c[i][j] += a[i][k]*b[k][j];
        sink=c[31][31];
    }
    return 0;
}
