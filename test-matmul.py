import numpy as np

if __name__ == "__main__":
  A = np.matrix([
    [1,2,3],
    [4,5,6],
    [7,8,9]
  ])
  print(f"input A:\n{A}\n")
  B = np.matrix([
    [1],
    [2],
    [3]
  ])
  print(f"input B:\n{B}\n")
  C = A @ B
  print(f"output:\n{C}\n")
