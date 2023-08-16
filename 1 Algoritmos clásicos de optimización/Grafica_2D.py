import matplotlib.pyplot as plt
import numpy as np

def f(x):
   return x**4 + 5*(x**3) + 4*(x**2) - 4*x + 1

# Graficar la función
x = np.linspace(-4, 1, 100) # 100 elementos
plt.plot(x, f(x), color='red')

# Graficar un punto en la función
xi = -0.8
plt.plot(xi,f(xi), marker="o", markersize=12)

# Títulos y etiqueta
plt.title("Gráfica")
plt.xlabel('x')
plt.ylabel('f(x)')

plt.show()