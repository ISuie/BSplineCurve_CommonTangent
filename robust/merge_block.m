function[B2] = merge_block(B1,result)
%将全部相邻的区域合并
B2=[];
scan = unique(result);
for i = 1:length(scan)
    B=[];
    for j = 1:length(result)
        if result(j)==scan(i)
            B=[B;B1(j,:)];
        end
    end
    [BB] = merge_one_block(B);
    B2 = [B2;BB];
end
