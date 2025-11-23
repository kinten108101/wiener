import numpy as np

M = 3

def cal__r_m(input):
  Rm = np.matrix([[None, None, None], [None, None, None], [None, None, None]])
  for k in range(M):
    for l in range(M):
      startrange = abs(l - k)
      acc = 0.0
      for n in range(startrange, M):
        acc += input[n - startrange] * input[n]
      Rm[k, l] = acc / (M - startrange)
  return Rm

if __name__ == "__main__":
  input = [4.0, 5.2, 6.5]
  Rm = cal__r_m(input)
  print(f"input: {input}")
  print(f"output:\n{Rm}")
