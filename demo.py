# Import libraries

import numpy as np
from numpy import matmul as matmul
from numpy.linalg import inv as inv

def cal__y(input, h, *, M):
  y = [None for _ in range(M)]
  for n in range(M):
    acc = 0.0
    for k in range(n + 1):
      acc += float(h[k]) * float(input[M - k - 1])
    y[n] = acc
  return y

def cal__r_m(input, *, M):
  Rm = np.matrix([[None for _ in range(M)] for _ in range(M)], dtype=np.float32)
  for k in range(M):
    for l in range(M):
      startrange = abs(l - k)
      acc = 0.0
      for n in range(startrange, M):
        acc += input[n - startrange] * input[n]
      Rm[k, l] = acc / M
  return Rm

def cal__gamma_d(desired, input, *, M):
  gamma_d = [None for _ in range(M)]
  for l in range(M):
    acc = 0.0
    for n in range(l, M):
      acc += desired[n] * input[n - l]
    gamma_d[l] = acc / M
  return gamma_d

def expectation_squared(h, *, M):
  acc = 0.0
  for i in range(M):
    acc += h[i]*h[i]
  return acc / M

def expectation_(h, *, M):
  acc = 0.0
  for i in range(M):
    acc += h[i]
  mean = acc / M
  acc = 0.0
  for i in range(M):
    acc += (h[i] - mean)**2
  return acc / M

expectation = expectation_squared
# -

# Main execution

# +
input   = [3.2, 2.8, 5.9, -2.3, -0.3, -8.3, 1.0, 9.1, 4.6, 5.6]
desired = [0.0, 3.6, 4.6, 2.3, -1.0, -2.3, -0.3, 3.5, 6.3, 6.0]

M = 10

sigma2 = expectation(desired, M=M)
gamma_d = cal__gamma_d(desired, input, M=M)
gamma_d = np.matrix(gamma_d, dtype=np.float32)
gamma_d = gamma_d.T
Rm  = cal__r_m(input, M=M)
Rm_ = inv(Rm)
h = matmul(Rm_, gamma_d)
gamma_h_gamma = matmul(gamma_d.T, h)[0, 0]
mmse = sigma2 - gamma_h_gamma
y = cal__y(input, np.array(h), M=M)
# -

# Explore

print(f"{sigma2=}\n{gamma_d=}\n{Rm=}\n{Rm_=}\n{h=}\n{gamma_h_gamma=}\n{y=}\n{mmse=}")

# Filtered output: 0.9 0.1 0.2 0.7 1.3 0.1 1.6 3.1 1.4 1.5
# MMSE: 9.4
