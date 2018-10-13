clc
clear all
%Cu atom as specimen
O = 10000;
D = 100;
dx= 0.5;
dt=1/(20*D);
R=8.314;
n = 100;
count = 1;
T_arr =  [200, 300, 400, 500, 600];
G = [];
for j =1:5
    count = 1;
    for i = 0:0.01:1
        
        G(count) = O*i*(1-i) +R*T_arr(j)*(i*log(i) + (1-i)*log(1-i));
        count = count+1;
        
    end
    hold on
    disp(find(min(G)))
    plot(G);
    str = sprintf('plot of Gmix vs concentration');
    title(str)
    xlabel('concentrtaion')
    ylabel('Gmix')
    
    
    legend(['T=' num2str(T_arr(1))],['T=' num2str(T_arr(2))],['T=' num2str(T_arr(3))],['T=' num2str(T_arr(4))],['T=' num2str(T_arr(5))])
    hold on
end

        