clc
clear all

C1 = 5;
C2 = 3;
n = 30;
arr_conc = [];
D = 100;
dx= 0.5;
dt=1/(20*D);
R = 8.314;
T = 400;
%for down-hill diffusion O < 2RT
O = 8000;


for i  = 1:n
    if i < n/2
        arr_conc_old(i) = C1;
        
    elseif i >= n/2
        arr_conc_old(i) = C2;
    end
end

figure
plot(1:n, arr_conc_old);
axis([1 n 3 5])
hold on
arr_conc = arr_conc_old;
for j = 1:200
    for i = 2:n-1
        arr_conc(i) = arr_conc(i) + dt*D*(arr_conc(i+1) + arr_conc(i-1) -2*arr_conc(i))/((dx)^2);
    end
    arr_conc(1) = arr_conc(2);
    arr_conc(n) = arr_conc(n-1);
    hold on
    plot(1:n, arr_conc);
    axis([1 n 3 5])
    title('plot of downhill diffusion')
    ylabel('concentration')
    xlabel('time')
end


