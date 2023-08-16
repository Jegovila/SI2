import numpy as np
import Plot_Contour
import Plot_Surf

def F(x, y):
    return x * np.exp(-x**2 - y**2)
def G(x, y):
    return np.array([(1 - 2*(x**2))*np.exp(-x**2-y**2), - 2*x*y*np.exp(-x**2-y**2)])

xl = [-3, -3]
xu = [3, 3]
xi = [-1, 1]

h = .1
for i in range(50):
    Plot_Contour.plot_contour(F, xi, xl, xu)
    xi = xi - h * G(xi[0], xi[1])

Plot_Surf.plot_surf(F, xi, xl, xu)
print("Mínimo global en:", xi)



