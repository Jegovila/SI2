import numpy as np
import matplotlib.pyplot as plt

L = 20
f = lambda l: 4*(l**3) - 4*L*(l**2) + l*(L**2)


X = np.arange(0, 10, 0.25)

plt.plot(X, f(X), label="f(l)")

plt.title("Gráfica")
plt.xlabel('l')
plt.ylabel('f(l)')

plt.legend()
plt.show()