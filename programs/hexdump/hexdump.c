#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <errno.h>
#include <string.h>

/********************************
 *								*
 * bytes to read for every row 	*
 * by default it is 16			*
 *								*
 ********************************/

#define DEFAULT_ROW 16

int main(int argc, char **argv) {
	if(argc < 2) {
		fprintf(stderr, "%s: usage: %s FILENAME [ROWS]\n", argv[0], argv[0]);
		return 1;
	}
	long long row = DEFAULT_ROW - 1;
	if(argc > 2) {
		errno = 0;
		row = strtol(argv[2], NULL, 10);
		if(errno) {
			fprintf(stderr, "%s: failed to parse rows parameter: %s\n", argv[0],
				strerror(errno));
			return 3;
		}
		if(row-- < 1) {
			fprintf(stderr, "%s: negative numbers are not allowed\n", argv[0]);
			return 4;
		}
	}
	
	FILE *fp;
	fp = fopen(argv[1], "r");
	if(!fp) {
		fprintf(stderr, "%s: cannot open file: %s\n", argv[0], strerror(errno));
		return 2;
	}
	
	int c;
	long long i, j = 0, k;
	printf("   Offset\n       ");
	for(j = 0; j < 0x0f; j++)
		putchar(' ');
	for(j = 0; j <= row; j++)
		printf("%02X ", (unsigned int)j & 0xFF);
	j = 0;
	
	printf("\n | %016lX | ", ftell(fp));
	
	/* loop over file characters... */
	while((c = getc(fp)) != EOF) {
		/* then print hex... */
		printf("%02X ", c);
		if(++j > row) {
			printf(" |\t '");
			fseek(fp, (-(row + 1)), SEEK_CUR);
			for(k = 0; k <= row; k++) {
				/* and ASCII */
				printf("%c", isprint(c = getc(fp))
					? c
					: '.');
			}

			/* then make new row */
			j = 0;
			printf("'\n | %016lX | ", ftell(fp));
		}
	}

	/* print latest row as hex.. */
	long long l = row - j;
	
	for(i = 0; i <= l; i++) {
		printf("   ");
	}
	
	/* walk back.. */
	fseek(fp, -(j), SEEK_CUR);
	printf(" |\t '");
	
	/* print latest row as ASCII.. */
	while((c = getc(fp)) != EOF) {
		printf("%c", isprint(c)
			? c
			: '.');
	}
	/* and exit. */
	puts("'");
	fclose(fp);
	return 0;
}
