/**
 * Puzzle 3
 * Implement a kernel that adds 10 to each position of a and stores it in out. You have more threads than positions.
 * 
*/

#include <utils.h>
__global__ void vector_add10(int* a, int *out, int size){
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    if(idx < size){
        out[idx] = a[idx] + 10;
    }
}

#define SIZE 1024
int main(){
    int* h_a = (int*)malloc(sizeof(int) * SIZE);
    int* h_out = (int*)malloc(sizeof(int) * SIZE);
    for(int i = 0; i < SIZE; i++){
        h_a[i] = i;
    }

    int *d_a;
    int *d_out;
    cudaMalloc(&d_a, sizeof(int) * SIZE);
    cudaMalloc(&d_out, sizeof(int) * SIZE);
    cudaMemcpy(d_a, h_a, sizeof(int) * SIZE, cudaMemcpyHostToDevice);

    int THREAD_NUM_PER_BLOCK = 64;
    int block_num = (SIZE + THREAD_NUM_PER_BLOCK - 1) / THREAD_NUM_PER_BLOCK;

    vector_add10<<<block_num, THREAD_NUM_PER_BLOCK>>>(d_a, d_out, SIZE); 

    cudaDeviceSynchronize();
    cudaMemcpy(h_out, d_out, sizeof(int) * SIZE, cudaMemcpyDeviceToHost);
    printVector(h_out, SIZE, 10);
}