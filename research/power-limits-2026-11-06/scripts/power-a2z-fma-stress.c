#include <immintrin.h>
#include <time.h>
#include <stdlib.h>
static volatile float sink;
static double now(void){struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return t.tv_sec+t.tv_nsec/1e9;}
int main(int argc,char**argv){
 double end=now()+(argc>1?atoi(argv[1]):30);
 __m256 a=_mm256_set1_ps(0.99999994f),b=_mm256_set1_ps(0.0000001f);
 __m256 x0=b,x1=b,x2=b,x3=b,x4=b,x5=b,x6=b,x7=b,x8=b,x9=b,x10=b,x11=b;
 while(now()<end){for(int i=0;i<100000;i++){
 #define F(x) x=_mm256_fmadd_ps(x,a,b)
 F(x0);F(x1);F(x2);F(x3);F(x4);F(x5);F(x6);F(x7);F(x8);F(x9);F(x10);F(x11);
 asm volatile("" : "+x"(x0),"+x"(x1),"+x"(x2),"+x"(x3),"+x"(x4),"+x"(x5),"+x"(x6),"+x"(x7),"+x"(x8),"+x"(x9),"+x"(x10),"+x"(x11));
 }sink=_mm_cvtss_f32(_mm256_castps256_ps128(_mm256_add_ps(x0,x11)));}
 return 0;
}
