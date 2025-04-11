/**
 * Puzzle 6
 * Implement a kernel that adds 10 to each position of a and stores it in out. You have fewer threads per block than the size of a.
 * 
*/

#include <utils.h>
__global__ void vector_add10(int* a, int *out, int size){
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // 网格跨步循环处理多个元素
    for(int i = idx; i < size; i += stride) {
        out[i] = a[i] + 10;  // 无分支连续内存访问
    }
}


#define SIZE 1000
int main(){

    int* h_a = (int*)malloc(sizeof(int) * SIZE);
    int* h_b = (int*)malloc(sizeof(int) * SIZE);
    int* h_out = (int*)malloc(sizeof(int) * SIZE);
    for(int i = 0; i < SIZE; i++){
        h_a[i] = i;
        h_b[i] = i+1;
    }
    

    int *d_a;
    int *d_b;
    int *d_out;
    cudaMalloc(&d_a, sizeof(int) * SIZE);
    cudaMalloc(&d_b, sizeof(int) * SIZE);
    cudaMalloc(&d_out, sizeof(int) * SIZE);
    cudaMemcpy(d_a, h_a, sizeof(int) * SIZE, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, h_b, sizeof(int) * SIZE, cudaMemcpyHostToDevice);

    int THREAD_NUM_PER_BLOCK = 64;
    int block_num = (SIZE + THREAD_NUM_PER_BLOCK - 1) / THREAD_NUM_PER_BLOCK;

    vector_add_vector<<<block_num, THREAD_NUM_PER_BLOCK>>>(d_a,d_b, d_out, SIZE); 

    cudaDeviceSynchronize();
    cudaMemcpy(h_out, d_out, sizeof(int) * SIZE, cudaMemcpyDeviceToHost);
    printVector(h_out, SIZE, 10);
}