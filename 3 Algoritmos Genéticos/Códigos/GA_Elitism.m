clear all
close all
clc

% f = @(x,y) x.*exp(-x.^2-y.^2);
% xl = [-2 -2]';
% xu = [2 2]';

f = @(x,y) (x-2).^2+(y-2).^2;
xl = [-5 -5]';
xu = [5 5]';

N = 50;
E = 10;
D = 2;
G = 300;
pm = 0.01;

x = zeros(D,N);
aptitud = zeros(1,N);

for i=1:N
	x(:,i) = xl+(xu-xl).*rand(D,1); 
end

for g=1:G
    % Plot_Contour(f,x,xl,xu); % Gráfica
    
    for i=1:N
        fx = f(x(1,i),x(2,i));
        
        if fx >= 0
            aptitud(i) = 1/(1+fx);
        else
            aptitud(i) = 1+abs(fx);
        end
    end
    
    y = zeros(D,N-E);
    
    for i=1:2:(N-E)
        r1 = Seleccion(aptitud);
        r2 = r1;
        
        while r2 == r1
            r2 = Seleccion(aptitud);
        end
        
        [y1,y2] = Cruza(x(:,r1),x(:,r2));
        
        y(:,i) = y1;
        y(:,i+1) = y2; 
    end
    
    y = Mutacion(y,pm);
    
    [~,I] = sort(aptitud,'descend');
    
    x = [y x(:,I(1:E))];
end

for i=1:N
	fx = f(x(1,i),x(2,i));
    
	if fx >= 0
        aptitud(i) = 1/(1+fx);
    else
        aptitud(i) = 1+abs(fx);
	end
end

[~,i_mejor] = max(aptitud);

figure
Plot_Surf(f,x,xl,xu) % Gráfica

disp([' mínimo global en: x=' num2str(x(1,i_mejor)) ', y=' num2str(x(2,i_mejor)) ', f(x,y)=' num2str(f(x(1,i_mejor),x(2,i_mejor)))])

%% Funciones
% function [n] = Seleccion (aptitud)
%     N = numel(aptitud);
%     tao = round(N*0.3);
%     
%     I = randi(N,[1 tao]);
%     [~,i] = max(aptitud(I));
%     
%     n = I(i);
% end

function [n] = Seleccion (aptitud)
    aptitud_total = sum(aptitud);
    N = numel(aptitud);
    
    r = rand;
    p_sum = 0;
    
    for i=1:N
        p_sum = p_sum + aptitud(i)/aptitud_total;
        
        if p_sum >= r 
            n = i;
            return 
        end
    end
    
    n = N;
end

function [y1,y2] = Cruza (x1,x2)
    r = rand();

    y1 = r*x1 + (1-r)*x2;
    y2 = (1-r)*x1 + r*x2;
end

function [y] = Mutacion (y,pm)
    [D,N] = size(y);
    
    for i=1:N
        for j=1:D
            if rand<pm
                y(j,i) = y(j,i) + normrnd(0,1);
            end
        end
    end
end
