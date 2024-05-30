function[rs] = check_remainder(q)
%对斯图姆序列的余项进行查看是否已经除尽
%1已经除尽，0未除尽
rs = 1;
for i = 1:length(q)-1
    if q(i) ~= 0
        rs = 0;
    end
end