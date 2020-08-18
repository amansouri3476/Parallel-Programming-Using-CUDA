//ONLY MODIFY THIS FILE

#include "mm.h"
	
#define tx threadIdx.x
#define ty threadIdx.y
#define tz threadIdx.z

#define bx blockIdx.x
#define by blockIdx.y
#define bz blockIdx.z

// you may change the following values
#define TILEX 512
#define TILEY 2

// you may define other parameters here!
// you may define other macros here!
// you may define other functions here!

dim3 getDimGrid(const int m, const int n) {
	dim3 dimGrid(n/TILEX,n/TILEY);
	return dimGrid;
}
dim3 getDimBlock(const int m, const int n) {
	dim3 dimBlock(TILEX,TILEY);
	return dimBlock;
}

//-----------------------------------------------------------------------------
__global__ void kernelFunc(float* ad, float* bd, float* cd, const int m,const int n) {
	// write your GPU kernel function here
float Pvalue = 0;
for (int k ; k<n; k++)
{
float Mdelement = ad[ty*n+k];
float Ndelement = bd[k*n + tx];
Pvalue += Mdelement*Ndelement;
}
cd[ty*n+tx] = Pvalue;
	// note that maximum # of threads per block is 1024
}
