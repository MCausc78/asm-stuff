#include <cerrno>
#include <cstring>
#include <fstream>
#include <iostream>

#define FSTDIN "/dev/stdin"

int main(
	int argc,
	char **argv
) {
	char c;
	if(argc > 1) {
		for(int i = 1; i < argc; i++) {
			std::ifstream j(
				strcmp(argv[i], "-") == 0
					? FSTDIN
					: std::string(argv[i]),
				std::ios::binary);
			if(j) {
				while(j.read(&c, 1)) {
					std::cout << c;
				}
				j.close();
			} else {
				std::cerr << argv[0] << ": '" << argv[i] << "': " << strerror(errno) << std::endl;
				return 1;
			}
		}
	} else {
		while(std::cin.read(&c, 1)) {
			std::cout << c;
		}
	}
	return 0;
}
