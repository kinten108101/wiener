M = 3

def expectation(h):
  global M
  acc = 0.0
  for i in range(M):
    acc += h[i]
  mean = acc / M
  for i in range(M):
    acc += (h[i] - mean)**2
  return acc / M

if __name__ == "__main__":
  test_expectation = [1.0, 2.0, 3.0]
  print(f"input:  {test_expectation}")
  print(f"output: {expectation(test_expectation)}")
