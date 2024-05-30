clc;
clear;
close all


%% Krawczyk
f_h = [5,-16,16,-4,0,0];
g_h = [5,-4,-16,0,16,0];
block1 = [0,1];
block2 = [0,1];
n1 = 2;
m1 = 1;
n2 = 1;
m2 = 2;
[f_hh] = h_to_hh(n1,f_h);
[g_hh] = h_to_hh(n2,g_h);

[v1] = fst_curve(f_hh);
[v2] = fst_curve(g_hh);

B = [block1,block2];

e =1e-4;
T0=5;
N0=100;
[I] =  Intersections_with_interval(n1,m1,n2,m2,f_h,g_h,B,T0,e,N0);
figure(2)
subplot(2,3,1);
hold on;
c1=fimplicit(v1,B);
set(c1,'color','b');
fimplicit(v2,B);
for i = 1 : length(I(:,1))
    scatter(I(i,1),I(i,2));
end
