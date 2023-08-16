import matplotlib.pyplot as plt
import numpy as np
from Plot_Contour import plot_contour
from Plot_Surf import plot_surf

def Recombination(x1, x2):
    y = 0.5 * (x1 + x2)
    return y

f = lambda x, y: x * np.exp(-x**2 - y**2)
xl = np.array([-2, -2])
xu = np.array([2, 2])

# f = lambda x, y: (x-2)**2 + (y-2)**2
# xl = np.array([-5, -5])
# xu = np.array([5, 5])

G = 100
D = 2
mu = 30

x = np.zeros((D, mu+1))
sigma = np.zeros((D, mu+1))
fitness = np.zeros(mu+1)

for i in range(mu):
    x[:, i] = xl + (xu - xl) * np.random.rand(D)
    sigma[:, i] = 0.2 * np.random.rand(D)
    fitness[i] = f(x[0, i], x[1, i])

for g in range(G):
    plot_contour(f, x, xl, xu)

    r1 = np.random.randint(mu)
    r2 = r1

    while r2 == r1:
        r2 = np.random.randint(mu)

    x[:, mu] = Recombination(x[:, r1], x[:, r2])
    sigma[:, mu] = Recombination(sigma[:, r1], sigma[:, r2])

    r = np.random.normal(0, sigma[:, mu], D)
    x[:, mu] = x[:, mu] + r

    fitness[mu] = f(x[0, mu], x[1, mu])

    Idx = np.argsort(fitness)
    x = x[:, Idx]
    sigma = sigma[:, Idx]
    fitness = fitness[Idx]

Idx_b = np.argmin(fitness)
plot_surf(f, x, xl, xu)
print("Mínimo en x=", x[0, Idx_b], " y=", x[1, Idx_b], " f(x,y)=", f(x[0, Idx_b], x[1, Idx_b]))