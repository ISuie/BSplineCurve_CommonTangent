function[result] = scan_connectedblock(B)
%扫描所有区域并将相邻区域分类
k = length(B(:,1));
result = zeros(1,k);
result(1)=1;
for i = 1:k
    for j = i+1:k
        [result1] = check_connected(B(i,:),B(j,:));
        if result1 == 1
            if result(j)==0
            result(j)= result(i);
            else
            key = result(i);
            for l = 1 : k 
                if result(l) == key
                    result(l) = result(j);
                end
            end
            result(i) = result(j);
            end
        elseif result1 == 0&&result(j)==0
            result(j)=j;
        end
    end
end