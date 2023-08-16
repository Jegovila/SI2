clear all
close all
clc

f = @(x) x.^4 + 5*x.^3 + 4*x.^2 - 4*x + 1;
fp = @(x) 4*x.^3 + 15*x.^2 + 8*x - 4;
fpp = @(x) 12*x.^2 + 30*x + 8;
xl = -4;
xu = 1;
xi = -1.5;

n = 10;

for i=1:n
    Plot_2D(f,xi,xl,xu);
    
	xi = xi - (fp(xi)/fpp(xi));
end

% figure
% hold on 
% grid on
% xp = xl:0.01:xu;
% plot(xp,f(xp),'b-','LineWidth',3,'MarkerSize',12);
% plot(xp,fp(xp),'r-','LineWidth',3,'MarkerSize',12);
% plot(xp,fpp(xp),'g-','LineWidth',3,'MarkerSize',12);
% plot(xi,f(xi), '*r','MarkerSize',12)



if fpp(xi) >= 0
	disp(['mínimo en x=' num2str(xi) ', f(x)=' num2str(f(xi))]) 
else
	disp(['máximo en x=' num2str(xi) ', f(x)=' num2str(f(xi))])
end
