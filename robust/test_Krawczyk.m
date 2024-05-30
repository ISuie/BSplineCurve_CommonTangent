clc;
clear;
close all

h1=[5,-16,16,-4,0,0];
n1=2;
m1=1;
[hh] = h_to_hh(n1,h1);

h2=[5,-4,-16,0,16,0];
n2=1;
m2=2;
B = [0,1,0,1];
e = 1e-8;
T0=5;
N0=100;
[I] =  Intersections_with_interval(n1,m1,n2,m2,h1,h2,B,T0,e,N0);


