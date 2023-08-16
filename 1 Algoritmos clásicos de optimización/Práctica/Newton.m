clear all
close all
clc

%% Newton
L = 20;

f = @(l) 4*l.^3 - 4*L*l.^2 + L^2*l;
fp = @(l) 12*l.^2 - 8*L*l + L^2;
fpp = @(l) 24*l - 8*L;
  
xi = 5;
n = 10;

for i=1:n
	xi = xi - (fp(xi)/fpp(xi));
end

if fpp(xi) > 0
	disp(['mínimo en x=' num2str(xi) ', f(x)=' num2str(f(xi))]) 
else
	disp(['máximo en x=' num2str(xi) ', f(x)=' num2str(f(xi))])
end

%% Gráfica
x = 0:0.1:10;
figure
hold on
grid on
plot(xi,f(xi),'m*','LineWidth',2,'MarkerSize',10)
plot(x,f(x),'r-','LineWidth',2,'MarkerSize',10)
plot(x,fp(x),'g--','LineWidth',2,'MarkerSize',10)
plot(x,fpp(x),'b-.','LineWidth',2,'MarkerSize',10)
xlabel('l')
ylabel('f(x), fp(x), fpp(x)')
legend('xi','f(x)','fp(x)','fpp(x)')
