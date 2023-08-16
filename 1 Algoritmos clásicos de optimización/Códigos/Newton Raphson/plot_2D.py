import matplotlib.pyplot as plt
import numpy as np

def plot_2d(f,x,xl,xu):
    plt.clf()
    X = np.arange(xl, xu, 0.25)
    Y = f(X)

    plt.plot(X,Y)
    plt.plot(x, f(x), marker="o", c='r', markersize=10)

    plt.title("Plot")
    plt.xlabel('x')
    plt.ylabel('f(x)')

    plt.show(block=False)
    plt.pause(.05)