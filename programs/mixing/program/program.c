#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define PRINT_ERR fprintf(stderr, "Error(%s:%d): %s\n", \
	__FILE__,\
	__LINE__, \
	strerror(errno))

typedef unsigned long long qword;
typedef struct {
	qword x; /* Offset: 0 */
	qword y; /* Offset: 8 */
	qword z; /* Offset: 16 */
} xyz_t; /* Sizeof: 24 */

qword math_add(qword, qword);
qword math_factorial(qword);
qword math_sub(qword, qword);
qword math_mul(qword, qword);
qword math_sq(qword);
qword math_pow(qword, qword);

qword string_get_length(char *);

qword math_add_xyz(xyz_t *);
qword math_sum_array(qword *, qword);
signed long long math_compare(qword, qword);
xyz_t *make_struct();

unsigned char vga_entry_color(unsigned char, unsigned char);
unsigned short vga_entry(unsigned char, unsigned short);

qword math_fib(qword);


/* char *qword_to_string(char *, long long, unsigned char); */
char *number_to_string(
	long long num,
	char *buffer,
	unsigned char base
) {
	if(!buffer) {
		return buffer;
	}
	char	*ptr,
			*low,
			*rs;
	rs = ptr = buffer;

	/* Check for minus sign */
	if(num < 0) {
		*ptr++ = '-';
		num = -num;
	}
	low = ptr;

	/* Fill buffer with numbers */	
	do {
		*ptr++ = "0123456789abcdefghijklmnopqrstuvwxyz"[num % base];
	} while(num /= base);

	/* Terminate string */
	*ptr-- = '\0';

	/* Reverse a string */
	while (low < ptr) {
		char tmp = *low++;
		*low = *ptr--;
		*ptr = tmp;
	}
	return rs;
}

char *number_to_binary_string(
	long long num,
	char *buffer
) {
	memset(buffer, 0, 64);
	number_to_string(num, buffer, 2);
	return buffer;
}

long long math_gcd(long long, long long);
int main(void) {
	printf("Factorial of 7 according to assembly language: %llu\n", math_factorial(7LL));
	printf("6 + 6 according to assembly language: %llu\n", math_add(6LL, 6LL));
	printf("10 - 6 according to assembly language: %llu\n", math_sub(10LL, 6LL));
	printf("Square of 9 according to assembly language: %llu\n", math_sq(9LL));
	printf("6 * 9 according to assembly language: %llu\n", math_mul(6LL, 9LL));
	printf("Pow(5, 5) according to assembly language: %llu\n", math_pow(5LL, 5LL));
	printf("Pow(2, 8) according to assembly language: %llu\n", math_pow(2LL, 8LL));
	char *s = "Hello, world!";
	printf("Length of \"%s\" according to assembly language and C: \n", s);
	printf("Assembly language: %llu\n", string_get_length(s));
	printf("C language: %zu\n", strlen(s));
	xyz_t q = {
		.x = 100L,
		.y = 200L,
		.z = 300L
	};
	printf("Xyz(100, 200, 300) according to assembly language: %llu\n", math_add_xyz(&q));
	qword arr[] = {
		25LL, 35LL, 50LL, 31LL,
		32LL, 124LL, 1231LL, 23LL
	};
	/* Обязательно делим на 8, иначе получим большую цифру */
	printf("Sum of arr according to assembly language: %llu\n", math_sum_array(arr, (sizeof arr) / 8));
	printf("Compare 1 with 1 according to assembly language: %lld\n", math_compare(1LL, 1LL));
	printf("Compare 1 with 0 according to assembly language: %lld\n", math_compare(1LL, 0LL));
	printf("Compare 1 with 2 according to assembly language: %lld\n", math_compare(1LL, 2LL));
	xyz_t *p = make_struct();
	printf("p->x: %llu\n", p->x);
	printf("p->y: %llu\n", p->y);
	printf("p->z: %llu\n", p->z);
	printf("Vga_entry_color(0x00, 0x0f) according to assembly language: %hhu\n", vga_entry_color(0, 15));
	printf("Vga_entry('H', 0xf0) according to assembly language: %hu\n", vga_entry_color('H', 0xf0));
	printf("Fibonacci of 3 according to assembly language: %llu\n", math_fib(3LL));
	printf("Fibonacci of 7 according to assembly language: %llu\n", math_fib(7LL));
	printf("Fibonacci of 77 according to assembly language: %llu\n", math_fib(77LL));
	printf("Fibonacci of 500 according to assembly language: %llu\n", math_fib(250LL));
	char *buffer;
	buffer = calloc(32, sizeof(char));
	if(buffer) {
		printf("Converting -129...\n");
		number_to_string(-129, buffer, 10);
		printf("Convert successed: to string: %s\n", buffer);
		free(buffer);
		goto continue_program;
	}
	PRINT_ERR;
	goto continue_program;
	continue_program:
	
	buffer = calloc(64, sizeof(char));
	if(buffer) {
		printf("Converting -7289123...\n");
		number_to_binary_string(-7289123, buffer);
		printf("Convert successed: to string: %s\n", buffer);
		goto continue_program_2;
	}
	PRINT_ERR;
	
	goto continue_program_2;

	continue_program_2:
	#define PRINT_GCD(x,y) printf("Gcd of %lld, %lld: %lld\n", (x), (y), (math_gcd((x), (y))));
	PRINT_GCD(5LL, 25LL);
	PRINT_GCD(150LL, 255LL);
	PRINT_GCD(102LL, 225LL);
	PRINT_GCD(1062LL, 2215LL);
	return 0;
}
