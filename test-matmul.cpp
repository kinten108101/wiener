#include "./lib/matrix.hpp"
#include <iostream>

int main() {
	using namespace std;
	using namespace feng;

	matrix<float> m { 3, 3 };
	int val = 1;
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			m[i][j] = val;
			val++;
		}
	}

	cout << "input A:" << endl;
	cout << m << endl;

	matrix<float> n { 3, 1 };
	n[0][0] = 1;
	n[1][0] = 2;
	n[2][0] = 3;

	cout << "input B:" << endl;
	cout << n << endl;

	matrix<float> o = m * n;

	cout << "output:" << endl;
	cout << o << endl;
}
