function [num] = block_number(B1,B2)
%根据合并后的block1,对合并前block2进行编号分类
num = zeros(length(B2(:,1)),1);
for i = 1:length(B1(:,1))
    for j = 1:length(B2(:,1))
        if B2(j,1)>=B1(i,1)&&B2(j,2)<=B1(i,2)&&B2(j,3)>=B1(i,3)&&B2(j,4)<=B1(i,4)
            num(j) = i;
        end
    end
end