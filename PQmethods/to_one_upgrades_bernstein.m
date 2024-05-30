function[bs2] = to_one_upgrades_bernstein(bs1)
%升一阶的bernstein基函数，输入[a,m,i]的数组bs1，a是bernstein前系数，m和i是Bm i（m在上）
%输出具有两行数据的bs2数组
i = bs1(3);
m = bs1(2);
a = bs1(1);
bs2 = [a*((i+1)/(m+1)),m+1,i+1;
       a*((m+1-i)/(m+1)),m+1,i];