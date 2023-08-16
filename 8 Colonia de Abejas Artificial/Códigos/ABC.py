import matplotlib.pyplot as plt
import numpy as np
from Plot_Surf import plot_surf
from Plot_Contour import plot_contour

# def Seleccion(aptitud):
#     aptitud_total = np.sum(aptitud)
#     N = (aptitud.size)
#
#     r = np.random.rand()
#     p_sum = 0
#
#     for i in range(N):
#         p_sum = p_sum + aptitud[i] / aptitud_total
#
#         if p_sum >= r:
#             n = i
#             return n
#     n = N
#
#     return n

def Seleccion(aptitud):
    Idx = np.argsort(aptitud)
    Idx = Idx[::-1]
    N = (aptitud.size)

    rank = np.arange(N,-1,-1)
    rank_total = np.sum(rank)

    r = np.random.rand()
    p_sum = 0

    for i in range(N):
        p_sum = p_sum + rank[i] / rank_total

        if p_sum >= r:
            n = Idx[i]
            return n

    n = Idx[N]
    return n

f = lambda x, y: (x-2)**2 + (y-2)**2
#f = lambda x, y: -20 * np.exp(-0.2 * np.sqrt(0.5*(x**2 + y**2))) - np.exp(0.5*(np.cos(2*np.pi*x)+np.cos(2*np.pi*y))) + 20 + np.exp(1)
#f = lambda x, y: -((1+np.cos(12*np.sqrt(x**2+y**2))) / (0.5*(x**2+y**2)+2))
#f = lambda x, y: 10*2 + x**2 + y**2 - 10*np.cos(2*np.pi*x) - 10*np.cos(2*np.pi*y)
#f = lambda x, y: ((x**2/4000)+(y**2/4000))-(np.cos(x)*np.cos(y/np.sqrt(2)))+1

xl = np.array([-5, -5])
xu = np.array([5, 5])

D = 2
G = 150

N = 50
L = 15

Pf = 30
Po = N - Pf

x = np.zeros((D,Pf))
l = np.zeros(Pf)
aptitud = np.zeros(Pf)
fitness = np.zeros(Pf)

for i in range(Pf):
    x[:, i] = xl + (xu - xl) * np.random.rand(D)
    fitness[i] = f(x[0, i], x[1, i])

for g in range(G):
    plot_contour(f, x, xl, xu)

    # Abejas empleadas:
    for i in range(Pf):
        k = i
        while k == i:
            k = np.random.randint(Pf)

        j = np.random.randint(D)
        phi = 2 * np.random.rand() - 1

        v = x[:, i].copy()
        v[j] = x[j, i] + phi * (x[j, i] - x[j, k])

        fv = f(v[0], v[1])

        if fv < fitness[i]:
            x[:, i] = v
            fitness[i] = fv
            l[i] = 0
        else:
            l[i] = l[i] + 1

        if fitness[i] >= 0:
            aptitud[i] = 1/(1 + fitness[i])
        else:
            aptitud[i] = 1 + np.abs(fitness[i])

    for i in range(Po):
        m = Seleccion(aptitud)

        k = m
        while k == m:
            k = np.random.randint(Pf)

        j = np.random.randint(D)
        phi = 2 * np.random.rand() - 1

        v = x[:, m].copy()
        v[j] = x[j, m] + phi * (x[j, m] - x[j, k])

        fv = f(v[0], v[1])

        if fv < fitness[m]:
            x[:, m] = v
            fitness[m] = fv

            l[m] = 0
        else:
            l[m] = l[m] + 1

    # Abejas exploradoras
    for i in range(Pf):
        if l[i] > L:
            x[:, i] = xl + (xu - xl) * np.random.rand(D)
            fitness[i] = f(x[0, i], x[1, i])
            l[i] = 0


igb = np.argmin(fitness)

print("Mínimo global en x=", x[0, igb], " y=", x[1, igb], " f(x,y)=", fitness[igb])
plot_surf(f, x, xl, xu, igb)