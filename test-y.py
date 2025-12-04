def calc__y(input, h, *, M):
  y = [None for _ in range(M)]
  for n in range(M):
    acc = 0.0
    for k in range(n + 1):
      acc += float(h[k]) * float(input[M - k - 1])
    y[n] = acc
  return y

if __name__ == "__main__":
  input = [3.2, 2.8, 5.9, -2.3, -0.3, -8.3, 1.0, 9.1, 4.6, 5.6]
  h     = [0.33709744, 0.38910022, 0.17019221, -0.16845231, -0.02934894, 0.19211298, -0.007419303, -0.0066480916, 0.023330953, 0.039674878]
  y = calc__y(input, h, M=10)
  print(f"input x(n): {input}")
  print(f"input h(n): {h}")
  print(f"output:     {y}")
