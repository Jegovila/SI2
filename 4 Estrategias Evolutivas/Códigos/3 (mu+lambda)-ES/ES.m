clear all
% close all
clc

% f = @(x,y) x.*exp(-x.^2-y.^2);
% xl = [-2 -2]';
% xu = [2 2]';

f = @(x,y) (x-2).^2+(y-2).^2;
xl = [-5 -5]';
xu = [5 5]';

G = 300;
mu = 30;
lambda = 50;
D = 2;

x = zeros(D,mu+lambda);
sigma = zeros(D,mu+lambda);
fitness = zeros(1,mu+lambda);

p_plot = zeros(1,G);

for i=1:mu
    x(:,i) = xl+(xu-xl).*rand(D,1);
    sigma(:,i) = 0.5*rand(D,1);
    fitness(i) = f(x(1,i),x(2,i));
end

for t=1:G
    Plot_Contour(f,x(:,1:mu),xl,xu);
    
    for i=1:lambda
        r1 = randi([1 mu]);
        r2 = r1;

        while r1==r2
            r2 = randi([1 mu]);
        end
        
        x(:,mu+i) = Recombination(x(:,r1),x(:,r2));
        sigma(:,mu+i) = Recombination(sigma(:,r1),sigma(:,r2));

        r = normrnd(0,sigma(:,mu+i),[D 1]);
        x(:,mu+i) = x(:,mu+i)+r;
        fitness(mu+i) = f(x(1,mu+i),x(2,mu+i));
    end
    
	[~,I] = sort(fitness);
	x = x(:,I);
	sigma = sigma(:,I);
	fitness = fitness(I);

    p_plot(t) = min(fitness);
end

figure
plot(p_plot)

[~,i_mejor] = min(fitness);

figure
Plot_Surf(f,x(:,1:mu),xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(x(1,i_mejor)) ', y=' num2str(x(2,i_mejor)) ', f(x,y)=' num2str(f(x(1,i_mejor),x(2,i_mejor)))])

%% Funciones
function y = Recombination (x1,x2)
    n = numel(x1);
    y = zeros(n,1);
    Tipo_Recomb = 0; % sexual discreta -> 1, sexual intermedia -> 0
    
    for d=1:n
        if Tipo_Recomb
            if randi([0 1])
                y(d) = x1(d);
            else
                y(d) = x2(d);
            end
        else
            y(d) = 0.5*(x1(d) + x2(d));
        end
    end
end
