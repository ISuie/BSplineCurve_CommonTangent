function [f]= toTwobernstein(n1,m1,n2,m2)
%输入为Bn1 m1（x）和Bn2 m2(y)形式(n在上)，输出xy的系数矩阵
[fx]= toOnebernstein(n1,m1);
[fy]= toOnebernstein(n2,m2);
f = [];
f1 = fy'*fx;
for i = 1 : length(f1(:,1))
    f = [f,f1(i,:)];
end
