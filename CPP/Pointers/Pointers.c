#include <stdio.h>

void Example1(){
	int* pc, c;
	c = 5;
	pc = &c;
	c = 1;
	
	printf("-- Example 1 --\n");
	printf("  C: %d \n", c);    // Output: 1
	printf("*pc: %d \n", *pc);  // Ouptut: 1	
}

void Example2(){
	int* pc, c, d;
	c = 5;
	d = -15;
	
	printf("\n-- Example 2 --\n");
	
	pc = &c; 
	printf("*pc: %d \n", *pc); // Output: 5
	
	pc = &d;
	printf("*pc: %d \n", *pc); // Ouptut: -15
}

void Example3(){
   int* pc, c;
   
	printf("\n-- Example 3 --\n");
   
	c = 22;
	printf("Address of c: %p\n", &c);
	printf("Value of c: %d\n\n", c);  // 22
	
	pc = &c;
	printf("Address of pointer pc: %p\n", pc);
	printf("Content of pointer pc: %d\n\n", *pc); // 22
	
	c = 11;
	printf("Address of pointer pc: %p\n", pc);
	printf("Content of pointer pc: %d\n\n", *pc); // 11
	
	*pc = 2;
	printf("Address of c: %p\n", &c);
	printf("Value of c: %d\n", c); // 2
}

void Example4(){
	int x[5] = {1, 2, 3, 4, 5};
	int* ptr;
	
	printf("\n-- Example 4 --\n");
	
	// ptr is assigned the address of the third element
	ptr = &x[2]; 
	
	printf("*ptr = %d \n", *ptr);   // 3
	printf("*(ptr+1) = %d \n", *(ptr+1)); // 4
	printf("*(ptr-1) = %d\n", *(ptr-1));  // 2
}

void addOne(int* ptr) {
	(*ptr)++; // adding 1 to *ptr
}

void Example5() {
	int* p, i = 10;
	p = &i;
	addOne(p);

	printf("\n-- Example 5 --\n");	
	printf("%d \n", *p); // 11
}

void swap(int* n1, int* n2) {
    int temp;
    temp = *n1;
    *n1 = *n2;
    *n2 = temp;
}

void Example6() {
    int num1 = 5, num2 = 10;

    // address of num1 and num2 is passed
    swap( &num1, &num2);

	printf("\n-- Example 6 --\n");	
    printf("num1 = %d\n", num1);
    printf("num2 = %d", num2);
}


void main(){
	
	Example1();
	Example2();
	Example3();
	Example4();
	Example5();
	Example6();

}