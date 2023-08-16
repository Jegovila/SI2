import numpy as np
import matplotlib.pyplot as plt

L = 20
f = lambda l: 4*(l**3) - 4*L*(l**2) + l*(L**2)
fp = lambda l: 12*(l**2) - 8*L*l + L**2
fpp = lambda l: 24*l - 8*L

xi = 5

for i in range(10):
    xi = xi - (fp(xi) / fpp(xi))

if fpp(xi) > 0:
    print("Mínimo en x=", xi, " f(l): ", f(xi))
else:
    print("Máximo en x=", xi, " f(l): ", f(xi))

X = np.arange(0, 10, 0.25)

plt.plot(X, f(X), label="f(l)")
plt.plot(X, fp(X), label="fp(l)")
plt.plot(X, fpp(X), label="fpp(l)")

plt.plot(xi, f(xi), label="xi")

plt.legend()
plt.show()
