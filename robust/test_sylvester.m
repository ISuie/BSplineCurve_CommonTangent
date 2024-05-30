clc;
clear;
close all

f = [1,0,1;
     0,0,2];
g = [1,0,2;
    0,0,1;];
X = [0,2];
Y = [0,2];
[result] = check_res(f,g,X,Y);