clc;
clear;
close all


h1=[5,-16,16,-4,0,0];
n1=2;
m1=1;
h2=[5,-4,-16,0,16,0];
n2=1;
m2=2;
x1 = 0;
x2 = 1;
y1 = 0;
y2 = 1;
b = block(x1,x2,y1,y2,h1,h2,n1,n2,m1,m2);

b = changed_block(b,0,2,0,2);