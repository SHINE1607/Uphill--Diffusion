clc
clear all

C1 = 5;
C2 = 3;
n = 100;
R = 8.314;
T = 500;
%for up-hill diffusion O > 2RT
O = 10000;
D = 100;
dx= 0.5;
dt=1/(20*D);
mu  = [];



%loop to find the initial concentration(sin cuurve)
for i  = 1:100
     arr_conc_old(i)=0.5+0.01*sin(2*i*pi/10);
end
plot(1:100,arr_conc_old)
axis([1 100 0.3 0.6])
hold on

%loop to find the mu(chemical potential) array
for i = 1:n
    mu(i) =  O*(1-arr_conc_old(i))^2 + R * T * log(arr_conc_old(i));
end
arr_conc = arr_conc_old;
%loop to find  the uphill diffusion concentration array
for j = 1 :5
     for i = 2:n-1
        arr_conc(i) = arr_conc(i) + dt*D*(mu(i+1) + mu(i-1) -2*mu(i))/((dx)^2);
    end 
    arr_conc(1) = arr_conc(2);
    arr_conc(n) = arr_conc(n-1);
    hold on
    plot(1:n, arr_conc);
    axis([1 n -10 10])
    title('plot of uphill diffusion')
    ylabel('concentration')
    xlabel('time')
end
hold off;










