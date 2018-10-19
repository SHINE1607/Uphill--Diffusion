clear all
clc


%initializing the variables
n = 100;
R = 8.314;
T = 500;
%for up-hill diffusion O > 2RT
O = 10000;
D = 100;
dx= 0.5;
dt=1/(20*D);
mu  = zeros(100);
arr_conc_old = zeros(100);
arr_conc = zeros(100);

%loop to find the initial concentration 2d array
for i = 1:100
    for j = 1:100
        %creating a 3d array with random numbers between 0.5 and 1
        arr_conc_old(i,j) = 0.5+0.01*sin(i*pi/10) + 0.01*cos(j*pi/10);
    end
end
surf(arr_conc_old)
        hold on
%loop to find the mu 2d array
for i= 1:100
    for j = 1:100
        mu(i,j) =  O*(1-arr_conc_old(i,j))^2 + R * T * log(arr_conc_old(i,j));
    end
end
arr_conc = arr_conc_old;
%loop to find the concentraion after uphill diffusion
for m = 1 : 5
    for i = 2:n-1
     for j = 2:n-1
        arr_conc(i,j) = arr_conc(i,j) + dt*D*(mu(i+1,j+1) + mu(i-1,j-1) -2*mu(i,j))/((dx)^2);
    end 
    arr_conc(i,1) = arr_conc(i,2);
    arr_conc(i,n) = arr_conc(i,n-1);
    hold on
    %plotting the surface 
    surf(1:100,1:100,arr_conc);
    title('plot of uphill diffusion')
    zlabel('Concentration')
    end
end
hold off;
        
        
        
        
        
