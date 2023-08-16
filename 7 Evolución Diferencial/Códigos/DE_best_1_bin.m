clear all
% close all
clc

% f = @(x,y) (x-2).^2 + (y-2).^2; % Sphere
% f = @(x,y) -20*exp(-0.2*sqrt(0.5*(x.^2 + y.^2))) - exp(0.5*(cos(2*pi*x)+cos(2*pi*y)))+20+exp(1); % Ackley
% f = @(x,y) -((1+cos(12*sqrt(x.^2+y.^2)))./(0.5*(x.^2+y.^2)+2)); % Drop-Wave Function
f = @(x,y) 10*2 + x.^2 + y.^2 - 10*cos(2*pi*x) - 10*cos(2*pi*y); % Rastrigin
% f = @(x,y) ((x.^2/4000)+(y.^2/4000))-(cos(x).*cos(y/sqrt(2)))+1; % Griewank

xl = [-5; -5];
xu = [5; 5];

G = 150;
N = 50;
D = 2;

F = 0.6;
CR = 0.9;

x = zeros(D,N);
fitness = zeros(1,N);

for i=1:N
   x(:,i) = xl+(xu-xl).*rand(D,1);
   fitness(i) = f(x(1,i),x(2,i));
end

fx_plot = zeros(1,G);

for n=1:G
%     Plot_Contour(f,x,xl,xu); % Gráfica
    
    for i=1:N
        % Mutación
        r1 = i;
        while r1==i
            r1 = randi([1,N]);  
        end

        r2 = r1;
        while r2==r1 || r2==i
            r2 = randi([1,N]);
        end

        [~,best] = min(fitness);

        v = x(:,best) + F*(x(:,r1)-x(:,r2));

        % Recombinación
        u = zeros(D,1);
        k = randi([1 D]);
        
        for j=1:D
            r = rand;

            if r<=CR || j==k
                u(j) = v(j);
            else
                u(j) = x(j,i);
            end
        end

        % Selección
        fitness_u = f(u(1),u(2));
        
        if fitness_u < fitness(i)
            x(:,i) = u;
            fitness(i) = fitness_u;
        end
    end
    
    fx_plot(n) = min(fitness);
end

[~,igb] = min(fitness);

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(x(1,igb)) ', y=' num2str(x(2,igb)) ', f(x,y)=' num2str(fitness(igb))])

figure
grid on
hold on
plot(fx_plot,'LineWidth',2)
title('Convergencia')
xlabel('iteraciones')
ylabel('f(x)')

