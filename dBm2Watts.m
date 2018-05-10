function P = dBm2Watts(x)
% function P = dBm2Watts(x)
% transform dBm to power
% P:  powerin mW 
% x:  in dBm
% By Shu Cai @NJUPT  China

xa = (x-30)./10;

P = 10.^(xa);

