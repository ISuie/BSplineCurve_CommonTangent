clc;
clear;
close all
B=[0,2,0,2];

h1 = [0,0,1];
n1 = 2;
m1 = 0;

h2 = [0,0,1];
n2 = 0;
m2 = 2;

y = [1;1];
hx1=find_derivative(n1,m1,h1,1);
hy1=find_derivative(n1,m1,h1,2);
hx2=find_derivative(n2,m2,h2,1);
hy2=find_derivative(n2,m2,h2,2);
Fmx = [binomialvalue(length(hx1(1,:))-1,length(hx1(:,1))-1,hx1,y(1,1),y(2,1)),binomialvalue(length(hy1(1,:))-1,length(hy1(:,1))-1,hy1,y(1,1),y(2,1));
       binomialvalue(length(hx2(1,:))-1,length(hx2(:,1))-1,hx2,y(1,1),y(2,1)),binomialvalue(length(hy2(1,:))-1,length(hy2(:,1))-1,hy2,y(1,1),y(2,1));];

bx1= changed_bij(hh_to_h(hx1),length(hx1(1,:))-1,length(hx1(:,1))-1,B(1),B(2),B(3),B(4));
by1= changed_bij(hh_to_h(hy1),length(hy1(1,:))-1,length(hy1(:,1))-1,B(1),B(2),B(3),B(4));
bx2= changed_bij(hh_to_h(hx2),length(hx2(1,:))-1,length(hx2(:,1))-1,B(1),B(2),B(3),B(4));
by2= changed_bij(hh_to_h(hy2),length(hy2(1,:))-1,length(hy2(:,1))-1,B(1),B(2),B(3),B(4));


