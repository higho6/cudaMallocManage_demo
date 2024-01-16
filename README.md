# cudaMallocManage_demo
jetson cudamallocmanage bug
### 编译指令
```
nvcc -shared -Xcompiler -fPIC -o ./lib/lib_test.so class_A.cu class_B.cu
生成lib_test.so
```
进入build目录
```
cmake .. && make
```
