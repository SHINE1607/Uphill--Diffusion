clear all
clc

n = 100;
R = 8.314;
T_arr = [300, 400, 500];
%for up-hill diffusion O > 2RT
O = 10000;
D = 100;
dx= 0.5;
dt=1/(20*D);
mu  = zeros(100);
arr_conc_old = zeros(100);
arr_conc = zeros(100);

