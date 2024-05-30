clc;
clear;
close all

syms u
R = u^4+u^3-u+1;
[N,n1,Na] = find_sturmN(R);