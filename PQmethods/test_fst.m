clc;
clear;
close all
P = [-2.71449,5.62952;
     -0.7173,1.6932;
     5.27426,6.15051;
     6.23066,2.79305];
n1 = 3;
s0= 0;
s1= 1;
[p2,nn1] = find_derivative_beizer(P,n1,s0,s1);
[p3] = find_conjugate(p2);
[pp1,pp2]=point_to_h(P);
[pp3,pp4]=point_to_h(p3);
[pp5,pp6]=point_to_h(p2);

[ps1] = multiply_s_control_points(pp1,pp3);
[ps2] = multiply_s_control_points(pp2,pp4);
ps = ps1+ps2;

Q = [-6.84951,0.217077;
     -4.2616,-4.6165;
     -0.829817,-2.56151;
     0.914205,-5.31114;];
 n2 = 3;
 t0 = 0;
 t1 = 1;
[qq1,qq2]=point_to_h(Q);

[pq1] = multiply_control_points(pp3,qq1);
[pq2] = multiply_control_points(pp4,qq2);
pq = pq1+pq2;

[pq1] = to_upgrades_p(pq,nn1,n2,nn1+n1,n2);
[ps1] = to_upgrades_p(ps,nn1+n1,0,nn1+n1,n2);

fst = ps1-pq1;
[q2,nn2] = find_derivative_beizer(Q,n2,t0,t1);
[q3] = find_conjugate(q2);
[qq3,qq4]=point_to_h(q3);
[qst1] = multiply_control_points(pp5,qq3);
[qst2] = multiply_control_points(pp6,qq4);
qst = qst1+qst2;
