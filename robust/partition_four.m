function [b1,b2,b3,b4] = partition_four(B) 
%将区域四等分
xmid = (B(1)+B(2))/2;
ymid = (B(3)+B(4))/2;

b1 = [B(1),xmid,B(3),ymid];
b2 = [xmid,B(2),B(3),ymid];
b3 = [B(1),xmid,ymid,B(4)];
b4 = [xmid,B(2),ymid,B(4)];
