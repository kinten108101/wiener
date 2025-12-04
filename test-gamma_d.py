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

if __name__ == "__main__":
  desired = [1.0, 2.0, 3.0]
  input   = [4.0, 5.2, 6.5]
  gamma_d = calc__gamma_d(desired, input, M=3)
  print(f"input d(n):  {desired}")
  print(f"input x(n):  {input}")
  print(f"output:      {gamma_d}")
