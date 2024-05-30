function[B2] = merge_one_block(B1)
%将相邻区域合一起

minB = min(B1,[],1);
maxB = max(B1,[],1);
B2=[minB(1),maxB(2),minB(3),maxB(4)];

