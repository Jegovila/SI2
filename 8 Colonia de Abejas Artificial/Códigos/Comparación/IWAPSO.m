clear all
% close all
clc

f = @(x,y) sin(x+y)+(x-y).^2-1.5*x+2.5*y+1; % McCormick Function
xl = [-1.5; -3];
xu = [4; 4];

G = 150;
N = 50;
D = 2;

w_max = 0.8;
w_min = 0.1;

c1 = 2;
c2 = 2;

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
    
    w = w_max - (g/G)*(w_max-w_min);
    
    for i=1:N 
        v(:,i) = w*v(:,i) + c1*rand*(xp(:,i)-x(:,i)) + c2*rand*(xp(:,ig)-x(:,i));
        x(:,i) = x(:,i) + v(:,i);
    end
end

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(xp(1,ig)) ', y=' num2str(xp(2,ig)) ', f(x,y)=' num2str(f(xp(1,ig),xp(2,ig)))])
