def cal__y(input, h, *, M):
  y = [None for _ in range(M)]
  for n in range(M):
    acc = 0.0
    for k in range(n + 1):
      acc += float(h[k]) * float(input[M - k - 1])
    y[n] = acc
  return y

if __name__ == "__main__":
  input = [1.0, 2.0, 3.0]
  h     = [4.0, 5.2, 6.5]
  y = cal__y(input, h, M=3)
  print(f"input x(n): {input}")
  print(f"input h(n): {h}")
  print(f"output:     {y}")
