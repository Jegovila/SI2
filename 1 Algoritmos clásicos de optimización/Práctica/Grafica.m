clear all
close all
clc

L = 20;
f = @(l) ((L-2*l).^2).*l;

l = 0:0.1:10;

figure
hold on
grid on
plot(l,f(l),'LineWidth',2,'MarkerSize',10)
xlabel('l')
ylabel('f(l)')
