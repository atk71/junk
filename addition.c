#include <stdio.h>
#include <stdlib.h>
#define N 10000000

int main() {
	int* a;
	int* b;
	int* c;
	
	a = (int*) malloc(sizeof(int) * N);
	b = (int*) malloc(sizeof(int) * N);
	c = (int*) malloc(sizeof(int) * N);

	for (int i = 0; i < N; i++) {
		a[i] = 0;
		b[i] = 1;
	}

	for (int i = 0; i < N; i++) {
		c[i] = a[i] + b[i];
	}

	free(a);
	free(b);
	free(c);
	return 0;
}