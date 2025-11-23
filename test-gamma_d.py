M = 3

def cal__gamma_d(desired, input, gamma_d):
  for l in range(M):
    acc = 0.0
    for n in range(l, M):
      acc = acc + desired[n] * input[n - l]
    gamma_d[l] = acc / (M - l)

if __name__ == "__main__":
  desired = [1.0, 2.0, 3.0]
  input   = [4.0, 5.2, 6.5]
  gamma_d = [1.0, 1.0, 1.0]
  cal__gamma_d(desired, input, gamma_d)
  print(f"input d(n):  {desired}")
  print(f"input x(n):  {input}")
  print(f"output:      {gamma_d}")
