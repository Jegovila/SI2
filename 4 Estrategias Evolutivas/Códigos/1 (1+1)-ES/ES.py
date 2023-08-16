import numpy as np
from Plot_Contour import plot_contour
from Plot_Surf import plot_surf

# f = lambda x, y: x * np.exp((-x**2) - (y**2))
# xl = np.array([-2, -2])
# xu = np.array([2, 2])

f = lambda x, y: (x-2)**2 + (y-2)**2
xl = np.array([-5, -5])
xu = np.array([5, 5])

G = 100
D = 2

sigma = 0.2

x = xl + (xu - xl) * np.random.rand(D)

for i in range(G):
    r = np.random.normal(0, sigma, D)
    y = x + r

    if f(y[0], y[1]) < f(x[0], x[1]):
        x = y.copy()

    plot_contour(f,x, y, xl, xu)

plot_surf(f, x, xl, xu)
print("Mínimo en x=", x[0], " y=", x[1], " f(x,y)=", f(x[0], x[1]))