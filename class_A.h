#include <iostream>
#include <cuda_runtime.h>

class A{
    public:
        A(){ cudaMallocManaged(&size_ , sizeof(u_int));}
        ~A(){ cudaFree(size_);}
    void TestForward();

    private:
        u_int *size_;
};
