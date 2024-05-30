function [result] = check_coefficient(B,n1,m1,n2,m2,h1,h2)
%对f1,f2,f1-cf2,f1+cf2进行符号判断，result==1是留下，result==0舍去
result = 0;
[f1]= changed_bij(h1,n1,m1,B(1),B(2),B(3),B(4));
[f2]= changed_bij(h2,n2,m2,B(1),B(2),B(3),B(4));
[c]=findc(f1,f2);
[result1] = check_one_coefficient(f1);
if result1 == 1
[result2] = check_one_coefficient(f2);
if result2 == 1
[result3] = check_c_coefficient(n1,m1,n2,m2,h1,h2,B,c);
if result3 == 1
result = 1;
end
end
end