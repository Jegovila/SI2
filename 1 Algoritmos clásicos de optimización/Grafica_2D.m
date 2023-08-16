clear all
close all
clc

f = @(x) x.^4 + 5*x.^3 + 4*x.^2 - 4*x + 1; % funcion objetivo

xl = -4; % l�mite superior
xu = 1; % l�mite inferior

x = xl:0.01:xu; % 0.1 define el paso de xl a xu

xi = -0.8;

figure
hold on % para poder graficar m�s de una vez en un mismo plot
grid on % genera una cuadricula en el plot

plot(x,f(x),'-b','LineWidth',2,'MarkerSize',10) % crea el plot con estilo de linea '-', color 'b', ancho de linea '2' y tama�o del marcador '10'
plot(xi,f(xi),'*r','LineWidth',2,'MarkerSize',10) % agregamos un punto extra al grafico con estilo '*', color 'r', ancho de linea '2' y tama�o del marcador '10'

legend({'funci�n','�ptimo'},'FontSize',15)
title('Gr�fica en 2D','FontSize',15)
xlabel('eje x','FontSize',15) % etiqueta en el eje x
ylabel('eje y','FontSize',15) % etiqueta en el eje y
