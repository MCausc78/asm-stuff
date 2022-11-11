#include <stdio.h>
#include <stdint.h>
#include <string.h>

typedef unsigned long long qword;
typedef struct {
	unsigned long long x; /* Offset: 0 */
	unsigned long long y; /* Offset: 8 */
	unsigned long long z; /* Offset: 16 */
} xyz_t;

qword math_add(qword, qword);
qword math_factorial(qword);
qword math_sub(qword, qword);
qword math_mul(qword, qword);
qword math_sq(qword);
qword math_pow(qword, qword);

qword string_get_length(char *);

qword math_add_xyz(xyz_t *);

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
	return 0;
}
