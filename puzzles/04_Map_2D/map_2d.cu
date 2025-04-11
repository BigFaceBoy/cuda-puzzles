/**
 * Puzzle 4
 * Implement a kernel that adds 10 to each position of a and stores it in out. Input a is 2D and square. You have more threads than positions.
 * 
*/

#include <utils.h>
__global__ void matrix_add10(int* a, int *out, int M, int N){
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if(x < M && y < N){
        out[y * M + x] = a[y * M + x] + 10;
    }
}

#define M 1024
#define N 1024
#define SIZE (M * N)
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

    matrix_add10<<<block_num, THREAD_NUM_PER_BLOCK>>>(d_a, d_out, M, N); 

    cudaDeviceSynchronize();
    cudaMemcpy(h_out, d_out, sizeof(int) * SIZE, cudaMemcpyDeviceToHost);
    printMatrix(h_out, SIZE, 10);
}