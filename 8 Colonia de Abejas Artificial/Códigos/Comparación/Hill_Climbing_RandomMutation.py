import matplotlib.pyplot as plt
import numpy as np
from Plot_Surf import plot_surf
from Plot_Contour import plot_contour

f = lambda x, y: np.sin(x+y) + (x-y) ** 2 - 1.5 * x + 2.5 * y+1 # McCormick Function

xl = np.array([-1.5, -3])
xu = np.array([4, 4])

G = 500

x = xl + (xu-xl) * np.random.random(2)
f_plot = np.zeros(G)

for i in range(G):
    y = x.copy()
    j = np.random.randint(2)
    y[j] = xl[j] + (xu[j] - xl[j]) * np.random.random()

    if f(y[0], y[1]) < f(x[0], x[1]):
        x = y

    plot_contour(f, x, xl, xu)
    f_plot[i] = f(x[0], x[1])

plot_surf(f,x,xl,xu,0)
print("Mínimo global en x=", x[0], " y=", x[1], " f(x,y)=", f(x[0],x[1]))

plt.plot(range(G), f_plot)
plt.title("Convergencia")
plt.show()
