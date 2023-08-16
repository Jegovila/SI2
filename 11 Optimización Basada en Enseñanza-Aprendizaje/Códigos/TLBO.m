clear all
close all
clc

% f = @(x,y) (x-2).^2 + (y-2).^2; % Sphere
f = @(x,y) 10*2 + x.^2 + y.^2 - 10*cos(2*pi*x) - 10*cos(2*pi*y); % Rastrigin

xl = [-5; -5];
xu = [5; 5];

D = 2;
N = 30;
G = 100;

x = zeros(D,N);
fitness = zeros(1,N);

for i=1:N
    x(:,i) = xl+(xu-xl).*rand(D,1);
    fitness(i) = f(x(1,i),x(2,i));
end

for g=1:G
    Plot_Contour(f,x,xl,xu)
    
    for i=1:N
        % Teacher Phase
        [~,t] = min(fitness);
        Tf = randi([1,2]);
        c = zeros(D,1);
        
        for j=1:D
            x_mean = mean(x(j,:));
            r = rand();
            
            c(j) = x(j,i) + r*(x(j,t)-Tf*x_mean); 
        end
        
        fc = f(c(1),c(2));
        
        if fc < fitness(i)
            x(:,i) = c;
            fitness(i) = fc;
        end
        
        % Learner Phase
        k = i;
        while k==i
            k = randi([1,N]);
        end
        
        c = zeros(D,1);
        
        if fitness(i) < fitness(k)
            for j=1:D
                r = rand();
                c(j) = x(j,i)+r*(x(j,i)-x(j,k));
            end
        else
            for j=1:D
                r = rand();
                c(j) = x(j,i)+r*(x(j,k)-x(j,i));
            end
        end
        
        fc = f(c(1),c(2));
        
        if fc < fitness(i)
            x(:,i) = c;
            fitness(i) = fc;
        end
    end
end

[~,igb] = min(fitness);

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(x(1,igb)) ', y=' num2str(x(2,igb)) ', f(x,y)=' num2str(fitness(igb))])
