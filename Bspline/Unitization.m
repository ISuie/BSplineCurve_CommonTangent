function [Y]=Unitization(X)
%对矩阵单位化的操作
[m,n]=size(X);
for i=1:n
    A(1,i)=norm(X(:,i));
end
A=repmat(A,m,1);
Y=X./A;