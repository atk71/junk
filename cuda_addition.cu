#include "device_launch_parameters.h"
#include "cuda_runtime.h"
#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#define N 10000000

__global__ void vector_add(int *c, int *a, int *b, int n) {
	for (int i = 0; i < n; i++) {
		c[i] = a[i] + b[i];
	}
}
int main() {
	int* a1;
	int* b1;
	int* c1;
	int* a2;
	int* b2;
	int* c2;
	
	a1 = (int*) malloc((sizeof(int) * N));
	b1 = (int*) malloc((sizeof(int) * N));
	c1 = (int*) malloc((sizeof(int) * N));
	
	cudaMalloc((void**)&a2, sizeof(int) * N);
	cudaMalloc((void**)&b2, sizeof(int) * N);
	cudaMalloc((void**)&c2, sizeof(int) * N);
	
	for (int i = 0; i < N; i++) {
		a[i] = 0;
		b[i] = 1;
	}
	
	cudaMemcpy(a2, a1, sizeof(int) * N, cudaMemcpyHostToDevice);
	cudaMemcpy(b2, b1, sizeof(int) * N, cudaMemcpyHostToDevice);
	
	vector_add<<<1, 1>>>(c2, a2, b2, N);
	
	cudaMemcpy(c1, c2, sizeof(int) * N, cudaMemcpyHostToDevice);
	
	cudaFree(a2);
	cudaFree(b2);
	cudaFree(c2);
	
	free(a1);
	free(b1);
	free(c1);
	
	return 0;
}