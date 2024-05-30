function [result] = bezier_one_check(B,n1,m1,n2,m2,h1,h2)
%将区域分成四份进行判断之后，留下保留的存储到数组中输出
[f1]= changed_bij(h1,n1,m1,B(1),B(2),B(3),B(4));
[f2]= changed_bij(h2,n2,m2,B(1),B(2),B(3),B(4));

[result] = check_coefficient(B,n1,m1,n2,m2,h1,h2);

