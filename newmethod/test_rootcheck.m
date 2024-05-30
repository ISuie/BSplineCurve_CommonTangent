clc;
clear;
close all

f = [0,0,1,-1,0,0;];
 g = [0,-1,0,0,1,0;];
n1 = 2;
m1 = 1;
n2 = 1;
m2 = 2;
B = [-1,1.1,-1,1.2];
e = 1e-3;
[I1,I2] = block_rootcheck(n1,m1,n2,m2,f,g,B,e);

