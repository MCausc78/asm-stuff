#include <cerrno>
#include <cstring>
#include <fstream>
#include <iostream>

int main(int argc, char **argv) {
	if(argc < 2) {
		std::cerr << argv[0] << ": usage: " << argv[0] << " FILES..." << std::endl;
		return 1;
	}
	for(int i = 1 ; i < argc ; i++) {
		std::ifstream j(std::string(argv[i]), std::ios::binary);
		if(j) {
			j.seekg(0, j.end);
			long long k = j.tellg();
			std::cout << k;
			j.close();
		} else {
			std::cerr << argv[0] << ": '" << argv[i] << "': " << strerror(errno) << std::endl;
		}
	}
	return 0;
}
