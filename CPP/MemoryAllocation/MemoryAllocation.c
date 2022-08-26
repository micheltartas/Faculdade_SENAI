#include <stdio.h>
#include <stdlib.h>

void Example1(){
	// Program to calculate the sum of n numbers entered by the user
	int n, i, *ptr, sum = 0;
	
	printf("-- Example 1 --\n");
	printf("Enter number of elements: ");
	scanf("%d", &n);
	
	ptr = (int*) malloc(n * sizeof(int));
	
	// if memory cannot be allocated
	if(ptr == NULL) {
		printf("Error! memory not allocated.");
		exit(0);
	}
	
	printf("Enter elements: ");
	for(i = 0; i < n; ++i) {
		scanf("%d", ptr + i);
		sum += *(ptr + i);
	}
	
	printf("Sum = %d", sum);
	
	// deallocating the memory
	free(ptr);
}

void Example2() {
	int *ptr, i , n1, n2;
	
	printf("-- Example 2 --\n");
	printf("Enter size: ");
	scanf("%d", &n1);
	
	ptr = (int*) malloc(n1 * sizeof(int));
	
	printf("Addresses of previously allocated memory:\n");
	for(i = 0; i < n1; ++i){
		printf("%pc\n",ptr + i);
	}
	
	printf("\nEnter the new size: ");
	scanf("%d", &n2);
	
	// rellocating the memory
	ptr = realloc(ptr, n2 * sizeof(int));
	
	printf("Addresses of newly allocated memory:\n");
	for(i = 0; i < n2; ++i){
		printf("%pc\n", ptr + i);	
	}

	free(ptr);
}

void main(){
	
	Example1();
	Example2();
}