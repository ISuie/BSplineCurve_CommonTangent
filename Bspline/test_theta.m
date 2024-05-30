clc;
clear;
close all

theta = [];
vector = [];
theta10 = 185;
theta11 = 270;
theta12 = 280;
vt10= 1;
vt12= 2;
theta20 = 180;
theta21 = 185;
theta22 = 190;
vt20= 3;
vt22= 4;
[theta1,vt1] = Thetarange(theta10,theta11,theta12,vt10,vt12);
[theta2,vt2] = Thetarange(theta20,theta21,theta22,vt20,vt22);
[vector,vtpart] = thetatovector2(theta1,theta2,vt1,vt2);