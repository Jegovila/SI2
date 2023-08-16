import matplotlib.pyplot as plt
import numpy as np
from Plot_Surf import plot_surf
from Plot_Contour import plot_contour

def Penalty(x, xl, xu):
    D = x.size
    z = 0

    for j in range(D):
        if x[j] < xl[j]:
            z = z + (x[j]-xl[j]) ** 2
        elif x[j] > xu[j]:
            z = z + (x[j] - xu[j]) ** 2
        else:
            z = z + 0

    return z

f = lambda x, y: np.sin(x+y) + (x-y) ** 2 - 1.5 * x + 2.5 * y+1 # McCormick Function
fp = lambda x, xl, xu: f(x[0], x[1]) + 1000 * Penalty(x, xl, xu);

xl = np.array([-1.5, -3])
xu = np.array([4, 4])


G = 150
N = 50
D = 2

F = 0.6
CR = 0.9

x = np.zeros((D, N))
fitness = np.zeros(N)

for i in range(N):
    x[:, i] = xl + (xu - xl) * np.random.rand(D)
    fitness[i] = f(x[0, i], x[1, i])

fx_plot = np.zeros(G)

for n in range(G):
    plot_contour(f, x, xl, xu)

    for i in range(N):
        # Mutación
        r1 = i
        while r1 == i:
            r1 = np.random.randint(N)

        r2 = r1
        while r2 == r1 or r2 == i:
            r2 = np.random.randint(N)

        r3 = r2
        while r3 == r2 or r3 == r1 or r3 == i:
            r3 = np.random.randint(N)

        v = x[:, r1] + F * (x[:, r2] - x[:, r3])

        # Recombinación
        u = np.zeros(D)

        for j in range(D):
            r = np.random.rand()

            if r <= CR:
                u[j] = v[j]
            else:
                u[j] = x[j, i]

        # Selección
        fitness_u = fp(u, xl, xu)

        if fitness_u < fitness[i]:
            x[:, i] = u
            fitness[i] = fitness_u

    fx_plot[n] = np.min(fitness)
igb = np.argmin(fitness)

print("Mínimo global en x=", x[0, igb], " y=", x[1, igb], " f(x,y)=", f(x[0, igb], x[1, igb]))
plot_surf(f, x, xl, xu, igb)
