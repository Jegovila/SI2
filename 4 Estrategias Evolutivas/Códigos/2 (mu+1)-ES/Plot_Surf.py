import matplotlib.pyplot as plt
from matplotlib import cm
import numpy as np

def plot_surf(f,x,xl,xu):
    X = np.arange(xl[0], xu[0], 0.25)
    Y = np.arange(xl[1], xu[1], 0.25)
    X, Y = np.meshgrid(X, Y)
    Z = f(X, Y)

    # SURFACE
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    surf = ax.plot_surface(X, Y, Z, cmap=cm.coolwarm, alpha=0.8, linewidth=0)
    ax.set_title('Surf')
    ax.set_xlabel('x')
    ax.set_ylabel('y')
    ax.set_zlabel('z')

    ax.scatter(x[0], x[1], f(x[0],x[1]), c='r', label='Óptimo', s=120)
    ax.legend()

    plt.show()