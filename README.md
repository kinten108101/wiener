# Compile and run

```sh
g++ [INPUT_FILE].cpp -std=c++20 -O2 -pthread -lstdc++fs && ./a.out
```

```sh
java -jar Mars4_5.jar [INPUT_FILE].s
```

where `INPUT_FILE` is `test-expectation.cpp`, `test-matmul.cpp`, etc (if running Mars MIPS, change the extension to `.s` to refer to the MIPS file counterpart)

# Info

For matrix mathematics, we use fengwang::matrix in the form of single-header file library and [can be found here](https://github.com/fengwang/matrix)
