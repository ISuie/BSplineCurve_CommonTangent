function[result] = check_res(f,g,X,Y)
%输入f,g,以及x和y的区间，进行结式的计算，并判断是否存在同根
%result = 1即存在
syms u
result = 0;

[E] = find_E(f,g,X(1),X(2),Y(1),Y(2));
if E >0
    result = 1;
end