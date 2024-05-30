function[q1,q2,q3,q4] = divide_one_block(p,s0,s1,s,t0,t1,t)
%输入一个mxn的矩阵或者元胞数组，s0,s1是参数范围，s是分割线的参数取值
lams = (s-s0)/(s1-s0);
lamt = (t-t0)/(t1-t0);
if iscell(p)==0
[p1,p2] = divide_two_curve(p,lams,1);
[q1,q3] = divide_two_curve(p1,lamt,2);
[q2,q4] = divide_two_curve(p2,lamt,2);
else
[m,n] = cell_to_matrix(p);
qq1 = [];
qq2 = [];
qq3 = [];
qq4 = [];
for i = 1 : n
    [p1,p2] = divide_two_curve(m(:,:,i),lams,1);
    [q11,q33] = divide_two_curve(p1,lamt,2);
    [q22,q44] = divide_two_curve(p2,lamt,2);
    qq1 = cat(3,qq1,q11);
    qq2 = cat(3,qq2,q22);
    qq3 = cat(3,qq3,q33);
    qq4 = cat(3,qq4,q44);
end
[q1] = metrix_to_cell(qq1);
[q2] = metrix_to_cell(qq2);
[q3] = metrix_to_cell(qq3);
[q4] = metrix_to_cell(qq4);
end