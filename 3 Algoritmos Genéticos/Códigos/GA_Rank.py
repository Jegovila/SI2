import numpy as np
from Plot_Contour import plot_contour
from Plot_Surf import plot_surf

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
            n = Idx(i)
            return n

    n = N
    return n

def Cruza(x1, x2):
    r = np.random.rand()

    y1 = r * x1 + (1-r) * x2
    y2 = (1-r) * x1 + r * x2
    return y1, y2

def Mutacion(y, pm):
    D, N = y.shape

    for i in range(N):
        for j in range(D):
            if np.random.rand() < pm:
                y[j,i] = y[j,i] + np.random.normal(0, 1)
    return y


f = lambda x, y: (x-2)**2 + (y-2)**2

xl = np.array([-5, -5])
xu = np.array([5, 5])

N = 50
D = 2
G = 100
pm = 0.01

x = np.zeros((D,N))
aptitud = np.zeros(N)

for i in range(N):
    x[:, i] = xl + (xu - xl) * np.random.rand(D)

for g in range(G):
    plot_contour(f, x, xl, xu)

    for i in range(N):
        fx = f(x[0, i], x[1, i])

        if fx >= 0:
            aptitud[i] = 1 / (1 + fx)
        else:
            aptitud[i] = 1 + np.abs(fx)

    y = np.zeros((D, N))

    for i in range(0, N, 2):
        r1 = Seleccion(aptitud)
        r2 = r1

        while r2 == r1:
            r2 = Seleccion(aptitud)

        y1, y2 = Cruza(x[:, r1], x[:, r2])

        y[:, i] = y1
        y[:, i+1] = y2

    y = Mutacion(y, pm)
    x = y.copy()

for i in range(N):
    fx = f(x[0, i], x[1, i])

    if fx >= 0:
        aptitud[i] = 1 / (1 + fx)
    else:
        aptitud[i] = 1 + abs(fx)

i_mejor = np.argmax(aptitud)
plot_surf(f, x, xl, xu, i_mejor)

print("Mínimo global en x=", x[0,i_mejor], " y=", x[1,i_mejor], " f(x,y)=", f(x[0,i_mejor], x[1,i_mejor]))


