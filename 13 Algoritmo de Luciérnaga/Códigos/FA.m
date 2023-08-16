clear all
close all
clc

% f = @(x,y) (x-2).^2 + (y-2).^2; % Sphere
f = @(x,y) 10*2 + x.^2 + y.^2 - 10*cos(2*pi*x) - 10*cos(2*pi*y); % Rastrigin

xl = [-5; -5];
xu = [5; 5];

D = 2;
G = 150;
N = 50;

beta0 = 0.5; % 0.1, 0.6
gamma = 0.6; % 0.1, 0.8

alpha = 2.5; % 0.5, 1.5
delta = 0.95; % 0.01, 0.95

x = zeros(D,N);
I = zeros(1,N);

for i=1:N
	x(:,i) = xl+(xu-xl).*rand(D,1);
    I(i) = f(x(1,i),x(2,i));
end

for g=1:G
    Plot_Contour(f,x,xl,xu)
    
    for i=1:N
        for j=1:N
            if I(j)<I(i)
                rij = norm(x(:,i)-x(:,j));
                r = rand(D,1);
                
                x(:,i) = x(:,i) + beta0*exp(-gamma*rij^2)*(x(:,j)-x(:,i)) + alpha*(r-0.5);
                
                I(i) = f(x(1,i),x(2,i));
            end
        end
    end
    
    alpha = delta*alpha;
end

[~,igb] = min(I);

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(x(1,igb)) ', y=' num2str(x(2,igb)) ', f(x,y)=' num2str(I(igb))])
