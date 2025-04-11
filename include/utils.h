#include <stdio.h>
#include <iostream>

template <typename T>
void printVector(T* t, int size, int printNum = -1){
    printNum =  printNum < 0 ? size : printNum;
    printNum =  printNum >= size ? size : printNum;
    for(int i = 0 ; i < printNum; i++){
        std::cout<<t[i]<<" ";
    }
    std::cout<<std::endl;
}

template <typename T>
void printMatrix(T* t, int cols, int rows, int printNum = -1){
    printNum =  printNum < 0 ? (cols * rows) : printNum;
    printNum =  printNum >= (cols * rows) ? (cols * rows) : printNum;

    for(int i = 0; i < rows; i++){
        for(int j = 0; j < cols; j++){
            int idx = i * cols + j;
            if(idx < printNum){
                std::cout<<t[idx]<<" ";
            }
        }
        std::cout<<std::endl;
    }
    std::cout<<std::endl;
}