clear all
close all
clc

% f = @(x,y) (x-2).^2+(y-2).^2;
% g = @(x,y) [2*(x-2) 2*(y-2)]';
% xl = [-5 -5]';
% xu = [5 5]';
% xi = [0 -2]';

f = @(x,y) x.*exp(-x.^2-y.^2);
g = @(x,y) [(1-2*x^2)*exp(-x^2-y^2) -2*x*y*exp(-x^2-y^2)]';
xl = [-3 -3]';
xu = [3 3]';
xi = [-1 1]';

h = 0.1;

for i=1:50
    Plot_Contour(f,xi,xl,xu) % Gráfica
    
    %Plot_Surf(f,xi,xl,xu) % Gráfica
    %hold on
    
    xi = xi - h*g(xi(1),xi(2));
end

figure
Plot_Surf(f,xi,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(xi(1)) ', y=' num2str(xi(2)) ', f(x,y)=' num2str(f(xi(1),xi(2)))])
