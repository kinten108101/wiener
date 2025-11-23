# Import libraries

import numpy as np
from numpy import matmul as matmul
from numpy.linalg import inv as inv
from test_expectation import expectation
from test_gamma_d import cal__gamma_d
from test_y import cal__y
from test_r_m import cal__r_m

# Main execution

# +
input   = [1.7, 2.0, 2.6, 1.2, 8.2, 1.7, 1.4, 5.5, 3.67, 3.1]
desired = [1.1, 2.0, 2.3, 1.2, 8.0, 1.9, 1.4, 5.5, 3.6,  2.1]

M = 10

sigma2 = expectation(M, desired)
gamma_d = cal__gamma_d(M, desired, input)
Rm = cal__r_m(M, input)
Rm_ = inv(Rm)
h = matmul(Rm_, gamma_d)
gamma_h_gamma = matmul(np.matrix(gamma_d, dtype=np.float64).T, h)[0, 0]
mmse = sigma2 - gamma_h_gamma
y = cal__y(M, input, np.array(h.T))
# -

# Explore

print(f"{y=}\n{mmse=}")
