import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator
import numpy as np

def Z(x, y):
   return (x-2)**2 + (y-2)**2

X = np.arange(-5, 5, 0.25)
Y = np.arange(-5, 5, 0.25)
X, Y = np.meshgrid(X, Y)

x = -2
y = -2

# SURFACE
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
surf = ax.plot_surface(X, Y, Z(X,Y), cmap=cm.coolwarm, alpha=0.8, linewidth=0)
ax.set_title('Surf')
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')

ax.scatter(x, y, Z(x, y), c='r', label='P', s=120)

# CONTOUR
plt.figure()
plt.contourf(X, Y, Z(X,Y))
#plt.contour(X, Y, Z(X,Y))
plt.colorbar()

plt.title("Contour")
plt.xlabel('x')
plt.ylabel('y')

plt.plot(x, y, marker="o", c='r', markersize=10)

plt.show()