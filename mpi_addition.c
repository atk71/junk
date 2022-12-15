#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define N 10000000

int main(int argc, char* argv[]) {
	int* a1;
	int* b1;
	int* c1;
	int* a2;
	int* b2;
	int* c2;
	int pid, np, elements_per_process, n_elements_received;
	MPI_Status status;
	MPI_Init(&argc, &argv);
	
	MPI_Comm_rank(MPI_COMM_WORLD, &pid);
	MPI_Comm_size(MPI_COMM_WORLD, &np);
	
	if (pid == 0) {
		a1 = (int*) malloc((sizeof(int) * N));
		b1 = (int*) malloc((sizeof(int) * N));
		c1 = (int*) malloc((sizeof(int) * N));
		
		for (int i = 0; i < N; i++) {
			a[i] = 0;
			b[i] = 1;
		}
	}
	
	elements_per_process = n / np;
	a2 = (int*) malloc((sizeof(int) * elements_per_process));
	b2 = (int*) malloc((sizeof(int) * elements_per_process));
	c2 = (int*) malloc((sizeof(int) * elements_per_process));	
	
	MPI_Scatter(a1, elements_per_process, MPI_INT, a2, elements_per_process, MPI_INT, 0, MPI_COMM_WORLD);
	MPI_Scatter(b1, elements_per_process, MPI_INT, b2, elements_per_process, MPI_INT, 0, MPI_COMM_WORLD);
	
	for (int i = 0; i < elements_per_process; i++) {
		c2[i] = a2[i] + b2[i];
	}
	
	MPI_Gather(c2, elements_per_process, MPI_INT, c1, elements_per_process, MPI_INT, 0, MPI_COMM_WORLD);
	
	if (pid == 0) {
		free(a1);
		free(b1);
		free(c1);
	}

	free(a2);
	free(b2);
	free(c2);
	
	MPI_Finalize();
	
	return 0;
}