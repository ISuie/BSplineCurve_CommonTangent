function[f] = changed_onebernstein(n,m,a,b)
%求区间变化后的bernstein系数
[f1] = Binomial_theorem(m,a*(1/(a-b)),1/(b-a));
[f2] = Binomial_theorem(n-m,b*(1/(b-a)),1/(a-b));
f3 = conv(f1,f2);
f = nchoosek(n,m)*f3;
