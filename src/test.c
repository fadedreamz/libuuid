#include <uuid/uuid.h>
#include <stdio.h>
#include <string.h>

int main() {
	uuid_t test;
	unsigned char * t;
	uuid_generate(test);
	t = test;
	for(int i=0; i<16; i++) {
		printf("%02x", t[i]);
	}
	printf("\n");
	return 0;
}
