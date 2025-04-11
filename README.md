# CUDA-Puzzles C++
此仓库为[GPU-Puzzles](https://github.com/srush/GPU-Puzzles)的C++版本.
开发环境：
nvidia l40
NVIDIA-SMI 550.54.15
Driver Version: 550.54.15
CUDA Version: 12.4

## 01 Map
Implement a kernel that adds 10 to each position of vector a and stores it in vector out. You have 1 thread per position.
## 02 Zip
Implement a kernel that adds together each position of a and b and stores it in out. You have 1 thread per position.
## 03 Guards
Implement a kernel that adds 10 to each position of a and stores it in out. You have more threads than positions.
## 04 Map 2D
Implement a kernel that adds 10 to each position of a and stores it in out. Input a is 2D and square. You have more threads than positions.
## 05 Broadcast
Implement a kernel that adds a and b and stores it in out. Inputs a and b are vectors. You have more threads than positions.
## 06 Blocks
Implement a kernel that adds 10 to each position of a and stores it in out. You have fewer threads per block than the size of a.
## 07 Blocks 2D
Implement the same kernel in 2D. You have fewer threads per block than the size of a in both directions.
## 08 Shared
Implement a kernel that adds 10 to each position of a and stores it in out. You have fewer threads per block than the size of a.
## 09 Pooling
Implement a kernel that sums together the last 3 position of a and stores it in out. You have 1 thread per position. You only need 1 global read and 1 global write per thread.
## 10 Dot Product
Implement a kernel that computes the dot-product of a and b and stores it in out. You have 1 thread per position. You only need 2 global reads and 1 global write per thread.
## 11 1D Convolution
Implement a kernel that computes a 1D convolution between a and b and stores it in out. You need to handle the general case. You only need 2 global reads and 1 global write per thread.
## 12 Prefix Sum
Implement a kernel that computes a sum over a and stores it in out. If the size of a is greater than the block size, only store the sum of each block.
## 13 Axis Sum
Implement a kernel that computes a sum over each column of a and stores it in out.
## 14 Matrix Multiply
Implement a kernel that multiplies square matrices a and b and stores the result in out.