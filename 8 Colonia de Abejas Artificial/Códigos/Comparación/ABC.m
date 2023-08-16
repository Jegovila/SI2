clear all
close all
clc

f = @(x,y) sin(x+y)+(x-y).^2-1.5*x+2.5*y+1; % McCormick Function
xl = [-1.5; -3];
xu = [4; 4];

D = 2;
G = 200;

N = 50;
L = 30;

Pf = 30;
Po = N-Pf;

x = zeros(D,Pf);
l = zeros(1,Pf);
aptitud = zeros(1,Pf);
fitness = zeros(1,Pf);

for i=1:Pf
	x(:,i) = xl+(xu-xl).*rand(D,1);
    fitness(i) = f(x(1,i),x(2,i));
end

for g=1:G
    Plot_Contour(f,x,xl,xu)
    
	% Abejas empleadas:
	for i=1:Pf
        k = i;
        while k==i
            k = randi([1,Pf]);
        end
        
        j = randi([1,D]);
        phi = 2*rand()-1;
         
        v = x(:,i);
        v(j) = x(j,i)+phi*(x(j,i)-x(j,k));
        
        fv = f(v(1),v(2));
        
        if fv < fitness(i)
            x(:,i) = v;
            fitness(i) = fv;
            l(i) = 0;
        else
            l(i) = l(i)+1;
        end
        
        if fitness(i)>=0
            aptitud(i) = 1/(1+fitness(i));
        else
            aptitud(i) = 1+abs(fitness(i));
        end
    end
	
	% Abejas observadoras:
	for i=1:Po
        m = Seleccion(aptitud);
            
        k = m;
        while k==m
            k = randi([1,Pf]);
        end
            
        j = randi([1,D]);
        phi = 2*rand()-1;
            
        v = x(:,m);
        v(j) = x(j,m)+phi*(x(j,m)-x(j,k));
        
        fv = f(v(1),v(2));
        
        if fv < fitness(m)
            x(:,m) = v;
            fitness(m) = fv;
            
            l(m) = 0;
        else
            l(m) = l(m)+1;
        end
    end
        
	% Abejas exploradoras:
	for i=1:Pf
        if l(i) > L
            x(:,i) = xl+(xu-xl).*rand(D,1);
            fitness(i) = f(x(1,i),x(2,i));
            l(i) = 0;
        end
	end
end

[~,igb] = min(fitness);

figure
Plot_Surf(f,x,xl,xu) % Gráfica
disp([' mínimo global en: x=' num2str(x(1,igb)) ', y=' num2str(x(2,igb)) ', f(x,y)=' num2str(fitness(igb))])

%% Funciones
function [n] = Seleccion (aptitud)
    aptitud_total = sum(aptitud);
    N = numel(aptitud);
    
    r = rand;
    P_sum = 0;
    
    for i=1:N
        P_sum = P_sum + aptitud(i)/aptitud_total;
        
        if P_sum >= r 
            n = i;
            return
        end
    end
    
    n = N;
end

% function [n] = Seleccion (aptitud)
%     [~,I] = sort(aptitud,'descend');
%     N = numel(aptitud);
%     
%     rank = N:-1:1;
%     rank_total = sum(rank);
%     
%     r = rand;
%     p_sum = 0;
%     
%     for i=1:N
%         p_sum = p_sum + rank(i)/rank_total;
%         
%         if p_sum >= r 
%             n = I(i);
%             return 
%         end
%     end
%     
%     n = I(N);
% end