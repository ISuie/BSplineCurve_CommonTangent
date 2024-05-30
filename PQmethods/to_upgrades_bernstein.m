function[bs2] = to_upgrades_bernstein(bs1,n)
%加n阶的bernstein基函数

for i = 1 : n
    k = length(bs1(:,1));
    bs2 = [];
    for j = 1 : k
        bs = to_one_upgrades_bernstein(bs1(j,:));
        bs2 = [bs2;bs];
    end
    bs1 = bs2;
end