#include <stdio.h>
#include <stdint.h>
#include <string.h>

typedef unsigned long long qword;
typedef struct {
	qword x; /* Offset: 0 */
	qword y; /* Offset: 8 */
	qword z; /* Offset: 16 */
} xyz_t;

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

int main(void) {
	printf("Factorial of 7 according to assembly language: %llu\n", math_factorial(7));
	printf("6 + 6 according to assembly language: %llu\n", math_add(6, 6));
	printf("10 - 6 according to assembly language: %llu\n", math_sub(10, 6));
	printf("Square of 9 according to assembly language: %llu\n", math_sq(9));
	printf("6 * 9 according to assembly language: %llu\n", math_mul(6, 9));
	printf("Pow(5, 5) according to assembly language: %llu\n", math_pow(5, 5));
	printf("Pow(2, 8) according to assembly language: %llu\n", math_pow(2, 8));
	char *s = "Hello, world!";
	printf("Length of \"%s\" according to assembly language and C: \n", s);
	printf("Assembly language: %llu\n", string_get_length(s));
	printf("C language: %zu\n", strlen(s));
	xyz_t q = {
		.x = 100,
		.y = 200,
		.z = 300
	};
	printf("Xyz(100, 200, 300) according to assembly language: %llu\n", math_add_xyz(&q));
	qword arr[] = {
		25, 35, 50, 31,
		32, 124, 1231, 23
	};
	/* Обязательно делим на 8, иначе получим большую цифру */
	printf("Sum of arr according to assembly language: %llu\n", math_sum_array(arr, (sizeof arr) / 8));
	printf("Compare 1 with 1 according to assembly language: %lld\n", math_compare(1, 1));
	printf("Compare 1 with 0 according to assembly language: %lld\n", math_compare(1, 0));
	printf("Compare 1 with 2 according to assembly language: %lld\n", math_compare(1, 2));
	return 0;
}
