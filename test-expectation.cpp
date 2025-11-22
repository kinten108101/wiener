int M = 3;

void matmul(float output[], int N, float first[], float second[]) {
	extern int M;
	output[5] = 10.0;
	for (int i = 0; i < N; i++) {
		float acc = 0;
		for (int j = 0; j < M; j++) {
			acc += first[i*M+j] * second[j];
		}
		output[i] = acc;
	}
}

float expectation(float h[]) {
	extern int M;
	float acc = 0;
	for (int i = 0; i < M; i++) {
		acc += h[i];
	}
	float mean = acc / ((float)M);
	acc = 0;
	for (int i = 0; i < M; i++) {
		float f = (h[i] - mean);
		acc += f*f;
	}
	return acc / ((float)M);
}

float expectation_of_squared(float h[], float *out) {
	extern int M;
	float acc = 0;
	for (int i = 0; i < M; i++) {
		acc += h[i]*h[i];
	}
	*out = acc / ((float)M);
	return expectation(h);
}

void add_prefix(char *source, char *global_iterator) {
	char ch = *source;
	while (ch != 0) {
		*global_iterator = ch;
		global_iterator++;
		source++;
		ch = *source;
	}
}

#include <iostream>

std::string ai2s(float a[], int len, std::string delim = " ") {
	using namespace std;
	string buf = "";
	for (int i = 0; i < len; i++) {
		buf += to_string(a[i]);
		buf += delim;
	}
	return buf;
}

void export_(/* char *output_buf, char *final_msg */) {
	extern int M;
	char globalbuf[1024] = {};
	char msg_MMSE[] = "MMSE: ";
	std::cout << globalbuf << '\0' << std::endl;
}

int main0() {
	float output[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	float first[] = {1,2,3,4,5,6,7,8,9};
	float second[] = {1,2,3};
	int N = M;
	matmul(output, N, first, second);
	std::cout << "matmul: " << output[2] << std::endl;
	float test_expectation[] = {1,2,3};
	std::cout << "sigma^2 version 1: " << expectation(test_expectation) << std::endl;
	float e2 = 0;
	float sigma2 = expectation_of_squared(test_expectation, &e2);
	std::cout << "sigma^2 version 2: " << sigma2 << "--" << e2 << std::endl;
	export_();
	return 0;
}

int main() {
	using namespace std;
	float test_expectation[] = {1,2,3};
	cout << "input:  " << ai2s(test_expectation, 3) << endl;
	cout << "output: " << expectation(test_expectation) << endl;
	return 0;
}
