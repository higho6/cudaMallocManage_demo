#include "class_B.h"
#include <device_launch_parameters.h>

__global__ void Fill(const int num,float *a,float *b)
{
    int tid = threadIdx.x;
    
    // float param[3];
    // param[0] = 1.f;
    // param[1] = 2.f;
    // param[2] = 3.f;

    for(int i=tid;i<num;i+=blockDim.x)
    {
        // for(int j=0;j<3;j++)
        // {
        //     a[i]+=param[j];
        // }
        b[i] = a[i]+b[i];
    }

}

void B::TestForward()
{
    float *dev_array_zero;
    float *dev_array_one;

    int num = 1000000;
    cudaMalloc(&dev_array_zero,num*sizeof(float));
    cudaMalloc(&dev_array_one,num*sizeof(float));

    cudaMemset(dev_array_zero,0,num*sizeof(float));
    cudaMemset(dev_array_one,0,num*sizeof(float));

    dim3 grid(1);
    dim3 block(512);
    Fill<<<grid,block>>>(num,dev_array_zero,dev_array_one);
    cudaDeviceSynchronize();
    cudaError_t err = cudaGetLastError();
    std::cout<<"error: "<<cudaGetErrorName(err)<<std::endl;

    cudaFree(dev_array_zero);
    cudaFree(dev_array_one);
}