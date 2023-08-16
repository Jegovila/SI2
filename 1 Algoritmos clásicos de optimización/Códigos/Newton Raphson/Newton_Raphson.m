clear all
close all
clc

% f = @(x) x.^4 + 5*x.^3 + 4*x.^2 - 4*x + 1;
% fp = @(x) 4*x.^3 + 15*x.^2 + 8*x - 4;
% xl = -4;
% xu = 1;
% xi = -4.0;

f = @(x) sin(2*x);
fp = @(x) 2*cos(2*x);
xl = -3.3;
xu = 4;
xi = 2.1;

n = 10;

for i=1:n
    Plot_2D(f,xi,xl,xu); % Gráfica
    
	xi = xi - (f(xi)/fp(xi));
end

disp(['cero en: x=' num2str(xi)])
