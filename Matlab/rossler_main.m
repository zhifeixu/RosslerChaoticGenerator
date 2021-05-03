total_points=5000;
step_size=0.01;
extraction_window = 1000:5000; %drop first 1000 values
a=0.20;
b=0.20;
c=5.4;
show_plot=1;
x0=1;y0=1;z0=1;
plot_char='-';
[xx,yy,zz,ii,oo]=rossler(total_points,step_size,extraction_window,...
    a,b,c,show_plot,x0,y0,z0,plot_char);


