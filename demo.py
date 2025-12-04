# Import libraries

import numpy as np
from numpy import matmul as matmul
from numpy.linalg import inv as inv

def calc__y(input, h, *, M):
  y = [None for _ in range(M)]
  for n in range(M):
    acc = 0.0
    for k in range(n + 1):
      acc += float(h[k]) * float(input[M - k - 1])
    y[n] = acc
  return y

def __autocorr_gamma_xx(x, *, M):
  x = np.array(x, dtype=float)
  gamma = np.zeros(M)

  for m in range(M):
    s = 0.0
    for n in range(m, M):
      s += x[n] * x[n - m]
    gamma[m] = s / M
  return gamma

def calc__r_m(x, *, M):
  x = np.array(x, dtype=float)
  M = len(x)

  gamma = __autocorr_gamma_xx(x, M=M)
  R = np.zeros((M, M))

  for l in range(M):
    for k in range(M):
      lag = abs(l - k)     
      R[l, k] = gamma[lag]
  return R

def calc__gamma_d(d, x, *, M):
  import numpy as np
  d = np.array(d, dtype=float)
  x = np.array(x, dtype=float)
  M = len(d)
    
  gamma = np.zeros(M)

  for l in range(M):
    s = 0
    for n in range(l, M):
      s += d[n] * x[n - l]
    gamma[l] = s / M
  return gamma.reshape(M, 1).T

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
with open("./data/inout/input9.txt", "r") as f:
  line = f.readline()
  input = [float(x) for x in line.split(' ')]
with open("./data/desired.txt", "r") as f:
  line = f.readline()
  desired = [float(x) for x in line.split(' ')]

M = 10

sigma2 = expectation(desired, M=M)
gamma_d = calc__gamma_d(desired, input, M=M)
gamma_d = np.matrix(gamma_d, dtype=np.float32)
gamma_d = gamma_d.T
Rm  = cal__r_m(input, M=M)
Rm_ = inv(Rm)
h = matmul(Rm_, gamma_d)
gamma_h_gamma = matmul(gamma_d.T, h)[0, 0]
mmse = sigma2 - gamma_h_gamma
y = calc__y(input, np.array(h), M=M)
# -

# Explore

print(f"{sigma2=}\n{gamma_d=}\n{Rm=}\n{Rm_=}\n{h=}\n{gamma_h_gamma=}\n{y=}\n{mmse=}")

# Filtered output: 0.9 0.1 0.2 0.7 1.3 0.1 1.6 3.1 1.4 1.5
# MMSE: 9.4
