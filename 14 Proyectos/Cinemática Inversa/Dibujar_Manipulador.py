import numpy as np
import matplotlib.pyplot as plt

def dibujar_manipulador(q):
    a_1 = 0.35
    a_2 = 0.35
    a_3 = 0.25

    theta_1 = q[0]
    theta_2 = q[1]
    theta_3 = q[2]

    t01 = np.array([a_1 * np.cos(theta_1), a_1 * np.sin(theta_1)])
    t02 = np.array([a_2*np.cos(theta_1 + theta_2) + a_1*np.cos(theta_1),
                    a_2*np.sin(theta_1 + theta_2) + a_1*np.sin(theta_1)])
    t03 = np.array([a_2*np.cos(theta_1 + theta_2) + a_1*np.cos(theta_1) + a_3*np.cos(theta_1 + theta_2 + theta_3),
                    a_2*np.sin(theta_1 + theta_2) + a_1*np.sin(theta_1) + a_3*np.sin(theta_1 + theta_2 + theta_3)])

    plt.plot([0, t01[0]], [0, t01[1]])
    plt.plot([t01[0], t02[0]], [t01[1], t02[1]])
    plt.plot([t02[0], t03[0]], [t02[1], t03[1]])

    plt.scatter(0, 0, marker='o', s=100)
    plt.scatter(t01[0], t01[1], marker='o', s=100)
    plt.scatter(t02[0], t02[1], marker='o', s=100)

    plt.xlim([-1, 1])
    plt.ylim([-1, 1])

    plt.grid()
    #plt.show()


# dibujar_manipulador([3*np.pi/2,0.3,0.4])
