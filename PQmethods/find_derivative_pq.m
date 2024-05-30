function[dpq]=find_derivative_pq(n,point)
%求P（s）和Q（t）的导
f = toBernstein(n,0);
dfx = [];
dfy = [];
for i = 1 : n
    dfx = [dfx;find_derivative(n,0,f(i,:),1).*point(i,1),0];
    dfy = [dfy;find_derivative(n,0,f(i,:),1).*point(i,2),0];
end
dfx = sum(dfx,1);
dfy = sum(dfy,1);
dpq = [dfx;dfy];
