clear all
close all
clc

% f = @(x,y) (x-2).^2 + (y-2).^2; % Sphere
% f = @(x,y) -20*exp(-0.2*sqrt(0.5*(x.^2 + y.^2))) - exp(0.5*(cos(2*pi*x)+cos(2*pi*y)))+20+exp(1); % Ackley
% f = @(x,y) -((1+cos(12*sqrt(x.^2+y.^2)))./(0.5*(x.^2+y.^2)+2)); % Drop-Wave Function
% f = @(x,y) 10*2 + x.^2 + y.^2 - 10*cos(2*pi*x) - 10*cos(2*pi*y); % Rastrigin
f = @(x,y) ((x.^2/4000)+(y.^2/4000))-(cos(x).*cos(y/sqrt(2)))+1; % Griewank

xl = [-5; -5];
xu = [5; 5];

G = 150;
N = 50;
D = 2;

w = 0.6;
c1 = 2.05;
c2 = 2.05;

phi = c1+c2;
K = 2/abs(2-phi-sqrt(phi^2-4*phi));

x = zeros(D,N);
xp = zeros(D,N);
v = zeros(D,N);
fitness = zeros(1,N);

for i=1:N
    x(:,i) = xl+(xu-xl).*rand(D,1);
    xp(:,i) = x(:,i);
    v(:,i) = 0.5*randn(D,1);
    fitness(i) = f(x(1,i),x(2,i));
end

for g=1:G
    Plot_Contour(f,x,xl,xu); % Gráfica
    
    for i=1:N
        fx = f(x(1,i),x(2,i));
        
        if fx < fitness(i)
            xp(:,i) = x(:,i);
            fitness(i) = fx;
        end
    end
    
    [~,ig] = min(fitness);
    
    for i=1:N 
        v(:,i) = K*(v(:,i) + c1*rand*(xp(:,i)-x(:,i)) + c2*rand*(xp(:,ig)-x(:,i)));
        x(:,i) = x(:,i) + v(:,i);
    end
end

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(xp(1,ig)) ', y=' num2str(xp(2,ig)) ', f(x,y)=' num2str(f(xp(1,ig),xp(2,ig)))])
