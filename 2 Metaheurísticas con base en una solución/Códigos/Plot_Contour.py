import matplotlib.pyplot as plt
import numpy as np

def plot_contour(f,x,y,xl,xu):
    plt.clf()
    X = np.arange(xl[0], xu[0], 0.25)
    Y = np.arange(xl[1], xu[1], 0.25)
    X, Y = np.meshgrid(X, Y)

    #plt.figure()
    plt.contourf(X, Y, f(X,Y))
    # plt.contour(X, Y, Z(X,Y))
    # plt.colorbar()

    plt.title("Contour")
    plt.xlabel('x')
    plt.ylabel('y')

    plt.plot(x[0], x[1], marker="o", c='r', markersize=10, label='Óptimo')
    plt.plot(y[0], y[1], marker="o", c='b', markersize=10, label='Random')
    plt.legend()

    plt.show(block=False)
    plt.pause(.05)


