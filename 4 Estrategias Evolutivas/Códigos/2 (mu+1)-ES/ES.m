clear all
close all
clc

f = @(x,y) x.*exp(-x.^2-y.^2);
xl = [-2 -2]';
xu = [2 2]';

% f = @(x,y) (x-2).^2+(y-2).^2;
% xl = [-5 -5]';
% xu = [5 5]';

G = 300;
mu = 30;
D = 2;

x = zeros(D,mu+1);
sigma = zeros(D,mu+1);
fitness = zeros(1,mu+1);

for i=1:mu
    x(:,i) = xl+(xu-xl).*rand(D,1);
    sigma(:,i) = 0.2*rand(D,1);
    fitness(i) = f(x(1,i),x(2,i));
end

for t=1:G
    Plot_Contour(f,x,xl,xu); % Gráfica
    
    r1 = randi([1 mu]);
    r2 = r1;
    while r1==r2
        r2 = randi([1 mu]);
    end
    
    x(:,mu+1) = Recombination(x(:,r1),x(:,r2));
    sigma(:,mu+1) = Recombination(sigma(:,r1),sigma(:,r2));

    r = normrnd(0,sigma(:,mu+1),[D 1]);
    x(:,mu+1) = x(:,mu+1) + r;
    
    fitness(mu+1) = f(x(1,mu+1),x(2,mu+1));

    [~,I] = sort(fitness);
    x = x(:,I);
    sigma = sigma(:,I);
    fitness = fitness(I);
end

[~,ib] = min(fitness);

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(x(1,ib)) ', y=' num2str(x(2,ib)) ', f(x,y)=' num2str(f(x(1,ib),x(2,ib)))])

%% Funciones
function y = Recombination (x1,x2)
    y = 0.5*(x1+x2);
end
