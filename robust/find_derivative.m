function[h2]=find_derivative(n,m,h1,flag)
%求方程的导
hh = [];
k = length(h1)/(n+1);
for i = 1:k
    hh = [hh;h1((i-1)*(n+1)+1:i*(n+1))];
end
if flag ==1%对x求导
A = 0:n;
B = repmat(A,m+1,1);
h = hh.*B;
h2 = h(:,2:end);
elseif flag ==2%对y求导
A = (1:m)';
B = repmat(A,1,n+1);
h = hh(2:end,:);
h2 =B.*h;
end
if isempty(h2)==1
    h2 = [0];
end