import matplotlib.pyplot as plt
import numpy as np
from Plot_Surf import plot_surf

f = lambda x, y: (x-2)**2 + (y-2)**2

xl = np.array([-5, -5])
xu = np.array([5, 5])

G = 500
mu, sigma = 0, 0.2

x = xl + (xu-xl) * np.random.random(2)
f_plot = np.zeros(G)

for i in range(G):
    r = np.random.normal(mu, sigma, 2)
    y = x + r

    if f(y[0], y[1]) < f(x[0], x[1]):
        x = y

    f_plot[i] = f(x[0], x[1])

plot_surf(f,x,xl,xu)
print("Mínimo global en x=", x[0], " y=", x[1], " f(x,y)=", f(x[0],x[1]))

plt.plot(range(G), f_plot)
plt.title("Convergencia")
plt.show()
