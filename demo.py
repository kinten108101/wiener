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
input   = [3.2, 2.8, 5.9, -2.3, -0.3, -8.3, 1.0, 9.1, 4.6, 5.6]
desired = [0.0, 3.6, 4.6, 2.3, -1.0, -2.3, -0.3, 3.5, 6.3, 6.0]

M = 10

sigma2 = expectation(desired, M=M)
gamma_d = cal__gamma_d(desired, input, M=M)
gamma_d = np.matrix(gamma_d, dtype=np.float64)
gamma_d = gamma_d.T
Rm  = cal__r_m(input, M=M)
Rm_ = inv(Rm)
h = matmul(Rm_, gamma_d)
gamma_h_gamma = matmul(gamma_d.T, h)[0, 0]
mmse = sigma2 - gamma_h_gamma
y = cal__y(input, np.array(h), M=M)
# -

# Explore

print(f"{sigma2=}\n{gamma_d=}\n{Rm=}\n{Rm_=}\n{h=}\n{gamma_h_gamma=}\n{y=}\n{mmse=}")


