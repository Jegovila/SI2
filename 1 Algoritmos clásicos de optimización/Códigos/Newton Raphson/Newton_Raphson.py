import numpy as np
from plot_2D import plot_2d

def f(x):
    return np.sin(2*x)
def fp(x):
    return 2 * np.cos(2*x)

xl = -3.3
xu = 4
xi = 2.1

for i in range(20):
    plot_2d(f,xi,xl,xu)
    xi = xi - (f(xi) / fp(xi))

print("cero en: x= ", xi)
