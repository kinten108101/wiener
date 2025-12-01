import numpy as np

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

def _cal__r_m1(input, *, M):
  import numpy as np
  a = np.array(input)
  v = np.array(input)
  m = np.correlate(a, v, mode='full')[:M]
  Rm = np.matrix([[None for _ in range(M)] for _ in range(M)], dtype=np.float32)
  for i in range(M):
    m_ = np.roll(m, -i)
    for j in range(M):
      Rm[i, j] = m_[j]
  return Rm

def _cal__r_m2(input, *, M):
  import numpy as np
  from scipy.linalg import toeplitz
  x = np.array(input)
  m = toeplitz(np.pad(x, (0, len(x) - 1), mode='constant'), np.pad([x[0]], (0, len(x) - 1), mode='constant')) @ x[::-1]
  m = m[:M]
  Rm = np.matrix([[None for _ in range(M)] for _ in range(M)], dtype=np.float32)
  for i in range(M):
    m_ = np.roll(m, -i)
    for j in range(M):
      Rm[i, j] = m_[j]
  return Rm

if __name__ == "__main__":
  input = [4.0, 5.2, 6.5]
  Rm = cal__r_m(input, M=3)
  print(f"input: {input}")
  print(f"output:\n{Rm}")
