function [B2] = bezier_check(B1,n1,m1,n2,m2,h1,h2)
%bezier方法
B2 = [];
[b1,b2,b3,b4] = partition_four(B1);
[result1] = bezier_one_check(b1,n1,m1,n2,m2,h1,h2);
[result2] = bezier_one_check(b2,n1,m1,n2,m2,h1,h2);
[result3] = bezier_one_check(b3,n1,m1,n2,m2,h1,h2);
[result4] = bezier_one_check(b4,n1,m1,n2,m2,h1,h2);
if result1 == 1
    B2=[B2;b1];
end
if result2 == 1
    B2=[B2;b2];
end
if result3 == 1
    B2=[B2;b3];
end
if result4 == 1
    B2=[B2;b4];
end