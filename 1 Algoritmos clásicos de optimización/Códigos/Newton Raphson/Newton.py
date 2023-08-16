from plot_2D import plot_2d

f = lambda x: x**4 + 5*(x**3) + 4*(x**2) - 4*x +1
fp = lambda x: 4*(x**3) + 15*(x**2) + 8*x - 4
fpp = lambda x: 12*(x**2) + 30*x +8

xl = -4
xu = 1
xi = -2.5

for i in range(20):
    plot_2d(f,xi,xl,xu)
    xi = xi - (fp(xi) / fpp(xi))

if fpp(xi) >= 0:
    print("Mínimo en x= ", xi, " f(x)= ", f(xi))
else:
    print("Máximo en x= ", xi, " f(x)= ", f(xi))

# Pausar para mantener la imagen
input()
