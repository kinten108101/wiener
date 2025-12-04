import numpy as np

def __autocorr_gamma_xx(x, *, M):
  x = np.array(x, dtype=float)
  gamma = np.zeros(M)

  for m in range(M):
    s = 0.0
    for n in range(m, M):
      s += x[n] * x[n - m]
    gamma[m] = s / M
  return gamma

def cal__r_m(x, *, M):
  x = np.array(x, dtype=float)
  M = len(x)

  gamma = __autocorr_gamma_xx(x, M=M)
  R = np.zeros((M, M))

  for l in range(M):
    for k in range(M):
      lag = abs(l - k)     
      R[l, k] = gamma[lag]
  return R

if __name__ == "__main__":
  x = [3.2, 2.8, 5.9, -2.3, -0.3, -8.3, 1.0, 9.1, 4.6, 5.6]
  rm = cal__r_m(x, M=10)
  print(f"input:  {x}")
  print(f"output: {rm}")
