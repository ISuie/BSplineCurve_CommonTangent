function [c]=findc(f1,f2)
%求c

ff1 = max(abs(f1));
ff2 = max(abs(f2));
c = ff1/ff2;