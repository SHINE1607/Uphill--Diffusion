clc
clear all

C1 = 5;
C2 = 3;
n = 100;

D = 100;
dx= 0.5;
dt=0.001;
R = 8.314;
T = 400;
a=3*10^-5
%for down-hill diffusion O < 2RT

arr_conc = zeros(100);

arr_conc_old = zeros(100);
%loop to find the initial array concentration
for i = 1:100
    for j = 1:100
        %creating a 3d array with random numbers between 0.5 and 1
        arr_conc_old(i,j) = 0.5+0.01*sin(i*pi/10) + 0.01*cos(j*pi/10);
    end
end
surf(arr_conc_old)
arr_conc = arr_conc_old;
count =1;
for m = 1:30
    count = count +1;
    for i = 2:n-1
         for j = 2:n-1
              arr_conc(i,j) = arr_conc(i,j) + dt*D*(arr_conc(i+1,j+1) + arr_conc(i-1,j-1) -2*arr_conc(i,j))/(dx^2);
         end
    arr_conc(i,1) = arr_conc(i,2);
    arr_conc(i,n) = arr_conc(i,n-1);
    
    end
    
    if mod((count/6),1) == 0
        hold off
        figure
        surf(arr_conc);
        str = sprintf('plot of downhill diffusion after time t =%d', m*dt); 
        title(str)

        zlabel('Concentration')
    end
end
hold off

