function x = Watts2dBm(P)
% transform power to dBm 
% P:  powerin mW 
% x:  in dBm
% By Shu Cai @NJUPT  China

x = 30 + 10*log10(P);
