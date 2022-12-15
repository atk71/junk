import numba

@numba.jit # decorators: wrapper to existing functions which extend them

def main():
	N = 10000000
	a = [0] * N
	b = [1] * N
	c = [i + j for i, j in zip(a,b)]

if __name__ == '__main__':
	main()