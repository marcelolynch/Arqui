int fibonacci(int n){
	if(n == 0)
		return 0;
	if(n == 1)
		return 1;
	int n_1 = fibonacci(n-1);
	int n_2 = fibonacci(n-2);
	return n_1 + n_2;
}