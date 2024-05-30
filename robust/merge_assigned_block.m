function [B2,B4] = merge_assigned_block(B,num,n)
%合并制定的区域
B1 = [];
B3 = [];
for i = length(num)
    if num(i) ==n
        B1 = [B1;B(i,:)];
    else
        B3 = [B3;B(i,:)];
    end
end
B2 = connected_component(B1);
B4 = connected_component(B3);