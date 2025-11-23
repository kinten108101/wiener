def cal__y(M, input, h):
  y = [None for _ in range(M)]
  for n in range(M):
    acc = 0.0
    for k in range(n + 1):
      acc = acc + float(h[k]) * float(input[M - k - 1])
    y[n] = acc
  return y

if __name__ == "__main__":
  input = [1.0, 2.0, 3.0]
  h     = [4.0, 5.2, 6.5]
  y = cal__y(3, input, h)
  print(f"input x(n): {input}")
  print(f"input h(n): {h}")
  print(f"output:     {y}")
