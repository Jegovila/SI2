clear all
close all
clc

f = @(x,y) sin(x+y)+(x-y).^2-1.5*x+2.5*y+1; % McCormick Function
xl = [-1.5; -3];
xu = [4; 4];

G = 300;
D = 2;

x = xl+(xu-xl).*rand(D,1);

for g=1:G
    fx = f(x(1),x(2));
    
    j = randi(D);
    y = x;
    
    y(j) = xl(j)+(xu(j)-xl(j))*rand();

    fy = f(y(1),y(2));
    
    if fy < fx
        x = y;
    end

    Plot_Contour(f,[x y],xl,xu) % Gráfica
end

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(x(1)) ', y=' num2str(x(2)) ', f(x,y)=' num2str(fx)])