function[x,y,z,input_1,output_1] = rossler(nn,dt,window,a,b,c,show_plot,x_ini,y_ini,z_ini,plot_char)
% inputs:
% nn: No of data points
% dt: time step
% window: range indices for output vectors i.e window value of [500:nn]
% will drop the first 499 datapoints. Used to drop the transient data.
% a: a, b: a, c: c
% show_plot: display's attractor when 1
% x_ini, y_ini, z_ini: initial values for x, y and z.
% plot_char: plot formatting characters
% output_1 one sample delayed version of input_1=[x,y,z]. can be used as
% input and target vectors in NN training.
a=a; b=b; c=c; % Parameters
t(1)=0.1; % Initial t
x(1)=x_ini;
y(1)=y_ini; 
z(1)=z_ini; % Initial x,y,z

for k=1:nn % Time loop
    fx=-y(k)-z(k); % RHS of x equation
        fy=x(k)+a*y(k); % RHS of y equation
        fz=b+z(k)*(x(k)-c); % RHS of z equation
        x(k+1)=x(k)+dt*fx; % Find new x
        y(k+1)=y(k)+dt*fy; % Find new y
        z(k+1)=z(k)+dt*fz; % Find new z
        t(k+1)=t(k)+dt; % Find new t
end % Close time loop
% x=x(end-last_n_samples:end);
% y=y(end-last_n_samples:end);
% z=z(end-last_n_samples:end);
x=x(window);
y=y(window);
z=z(window);
if(show_plot==1)
    plot3(x,y,z,plot_char) % Plot x vs t
end
title('Rossler system') % Title
xlabel('x'); ylabel('y');zlabel('z');grid % Label axes

x_norm = (x-min(x))/(max(x)-min(x));
y_norm = (y-min(y))/(max(y)-min(y));
z_norm = (z-min(z))/(max(z)-min(z));

% this will generate the normalized input_1 and output_1 that can be
% used as input and target for neural networks.
 output_1 = [x_norm(2:end)', y_norm(2:end)', z_norm(2:end)'];
 input_1  = [x_norm(1:end-1)', y_norm(1:end-1)', z_norm(1:end-1)'];

