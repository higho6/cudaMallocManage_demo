#include "class_A.h"
#include <device_launch_parameters.h>

__global__ void Add(u_int *size)
{
    int tid = threadIdx.x;
    for(int i=tid;i<1000;i+=blockDim.x)
    {
        atomicAdd(&size[0],1);
    }
}


void A::TestForward()
{
    cudaMemset(size_,0,sizeof(u_int));
    dim3 grid(1);
    dim3 block(512);
    Add<<<grid,block>>>(size_);
    cudaDeviceSynchronize();
    cudaError_t err = cudaGetLastError();
    std::cout<<"error: "<<cudaGetErrorName(err)<<std::endl;
    std::cout<<"size: "<<size_[0]<<std::endl;
}