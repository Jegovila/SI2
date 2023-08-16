clear all
close all
clc

% f = @(x,y) (x-2).^2 + (y-2).^2; % Sphere
f = @(x,y) 10*2 + x.^2 + y.^2 - 10*cos(2*pi*x) - 10*cos(2*pi*y); % Rastrigin

xl = [-5; -5];
xu = [5; 5];

G = 150;
D = 2;
N = 50;

p = 0.8;
lambda = 1.5;
sigma2 = (((gamma(1+lambda))/(lambda*gamma((1+lambda)/2)))*((sin((pi*lambda)/2))/(2^((lambda-1)/2))))^(1/lambda);

x = zeros(D,N);
fitness = zeros(1,N);

for i = 1:N
    x(:,i) = xl + (xu-xl).*rand(D,1);
    fitness(i) = f(x(1,i),x(2,i));
end

for t = 1:G
    Plot_Contour(f,x,xl,xu)
    
    [~,igb] = min(fitness);
    
    for i=1:N
        if rand()<p
            u = normrnd(0,sigma2,[D 1]);
            v = normrnd(0,1,[D 1]);
            L = u./(abs(v).^(1/lambda));
            
            y = x(:,i) + L.*(x(:,igb)-x(:,i));
        else
            j = i;
            while j==i
                j = randi([1 N]);
            end
            
            k = j;
            while k==j && k~=i
                k = randi([1 N]);
            end
            
            y = x(:,i) + rand()*(x(:,j)-x(:,k)); 
        end
        
        fy = f(y(1),y(2));
        
        if fy<fitness(i)
            x(:,i) = y;
            fitness(i) = fy;
        end
    end
end

[~,igb] = min(fitness);

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(x(1,igb)) ', y=' num2str(x(2,igb)) ', f(x,y)=' num2str(fitness(igb))])
