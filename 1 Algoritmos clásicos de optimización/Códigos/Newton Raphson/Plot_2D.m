function Plot_2D (f,x,xl,xu)
    cla
    hold on
    grid on
    
    xp = xl:0.01:xu;
    plot(xp,f(xp),'b-','LineWidth',3,'MarkerSize',12)
	plot(x,f(x),'*r','LineWidth',3,'MarkerSize',12);

    xlabel('x')
    ylabel('f(x)')
    
    pause(0.5)
    