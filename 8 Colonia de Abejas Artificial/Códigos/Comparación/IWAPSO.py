import matplotlib.pyplot as plt
import numpy as np
from Plot_Surf import plot_surf
from Plot_Contour import plot_contour

f = lambda x, y: np.sin(x+y) + (x-y) ** 2 - 1.5 * x + 2.5 * y+1 # McCormick Function

xl = np.array([-1.5, -3])
xu = np.array([4, 4])

G = 150
N = 50
D = 2

w_max = 0.8
w_min = 0.1

c1 = 2
c2 = 2

x = np.zeros((D, N))
xp = np.zeros((D, N))
v = np.zeros((D, N))
fitness = np.zeros(N)

for i in range(N):
    x[:, i] = xl + (xu - xl) * np.random.rand(D)
    xp[:, i] = x[:, i]
    v[:, i] = 0.5 * np.random.randn(D)
    fitness[i] = f(x[0, i], x[1, i])

for g in range(G):
    plot_contour(f, x, xl, xu)

    for i in range(N):
        fx = f(x[0, i], x[1, i])

        if fx < fitness[i]:
            xp[:, i] = x[:, i]
            fitness[i] = fx

    ig = np.argmin(fitness)
    w = w_max - (g / G) * (w_max - w_min)


    for i in range(N):
        v[:, i] = w * v[:, i] + c1 * np.random.rand() * (xp[:, i] - x[:, i]) + c2 * np.random.rand() * (xp[:, ig] - x[:, i])
        x[:, i] = x[:, i] + v[:, i]


print("Mínimo global en x=", xp[0, ig], " y=", xp[1, ig], " f(x,y)=", f(xp[0, ig], xp[1, ig]))
plot_surf(f, x, xl, xu, ig)