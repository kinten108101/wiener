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

if __name__ == "__main__":
  input = [4.0, 5.2, 6.5]
  Rm = cal__r_m(input, M=3)
  print(f"input: {input}")
  print(f"output:\n{Rm}")
