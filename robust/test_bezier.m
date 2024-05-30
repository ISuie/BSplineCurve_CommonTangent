clc;
clear;
close all

h1=[5,-16,16,-4,0,0];
n1=2;
m1=1;

f=@(x,y)16*x.^2-16*x+4+1-4*y;
interval1=[-5,5,-5,5];
fimplicit(f,interval1);
hold on;
[f1]= tobij(h1,n1,m1);
a = 1;
b = 3;
c = 1;
d = 3;
[f3]= changed_bij(h1,n1,m1,a,b,c,d);
x = 1;
y = 2;
xx = (x-a)/(b-a);
yy = (y-c)/(d-c);
[v1]= beziervalue(n1,m1,xx,yy,f3);
[v2]= beziervalue(n1,m1,x,y,f1);
v3=16*x.^2-16*x+5-4*y;

h2=[5,-4,-16,0,16,0];
n2=1;
m2=2;
f=@(x,y)16*y.^2-16*y+4+1-4*x;
interval1=[-5,5,-5,5];
fimplicit(f,interval1);
[f2]= tobij(h2,n2,m2);
[f4]= changed_bij(h2,n2,m2,a,b,c,d);
[cc]=findc(f3,f4);
f5 = f3 + cc*f4;
f6 = f3 - cc*f4;

B1 = [0,1,0,1];
[B2] = bezier_check(B1,n1,m1,n2,m2,h1,h2);

B3=[0,1,0,1;
    1,2,0,1;
    1,2,1,2;
    0,1,1,2;
    2,3,3,4;
    2,3,4,5;
    1,2,2,3];
[result] = scan_connectedblock(B3);
[B4] = merge_block(B3,result);

A=[0.8,-0.2;
    2.4,0.4;];
AA = inv(A);