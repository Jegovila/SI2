clear all
close all
clc

f = @(x,y) (x-2).^2+(y-2).^2;
xl = [-5 -5]';
xu = [5 5]';

% f = @(x,y) x.*exp(-x.^2-y.^2);
% xl = [-2 -2]';
% xu = [2 2]';

G = 500;
D = 2;

x = [4 4]';

f_plot = zeros(1,G);

for g=1:G
    y = xl + (xu-xl).*rand(D,1);

    if f(y(1),y(2)) < f(x(1),x(2))
        x = y;
    end
    
%     Plot_Contour(f,[x y],xl,xu) % Gráfica
    f_plot(g) = f(x(1),x(2));
end

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(x(1)) ', y=' num2str(x(2)) ', f(x,y)=' num2str(f(x(1),x(2)))])

figure
hold on
grid on
plot(f_plot,'b-','LineWidth',2)
title('Gráfica de convergencia')
xlabel('iteración')
ylabel('f(x)')

