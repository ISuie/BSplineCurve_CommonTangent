function [A,I,B2] = Krawczyk_method(n1,m1,n2,m2,h1,h2,B,e)
%K方法的总和
A =0;
I = [];
B2 = [];
result = zeros(1,2);
[K,R,Fmx] = Krawczyk(n1,m1,n2,m2,h1,h2,B);
%disp('Fmx');
%disp(det(Fmx));
Fmx1 = mapminmax(Fmx);
if abs(det(Fmx))<=1e-3 
    B2 = B;
else
K2 = [K{1}(1),K{1}(2),K{2}(1),K{2}(2)];
if isempty(K2)==0&&~any(isnan(K2))&&~any(isinf(K2))
[result(1),result(2)] = check_one_Krawczyk(K2,R,B);
if result(1)==0
    A = 1;
end
if result(1)==2
   B2 = [max(K2(1),B(1)),min(K2(2),B(2)),max(K2(3),B(3)),min(K2(4),B(4))];
end
if result(1)==1&&result(2)==1
   [I] = Krawczyk_circulate(n1,m1,n2,m2,h1,h2,K,e);
   A = 1;
end
end
end
disp('X2');
disp(B2);

