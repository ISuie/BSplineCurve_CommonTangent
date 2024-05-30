function[qij,m2,n2] = to_two_upgrades_p(pij,m1,n1,flag,k)
%m是第一个元的次数，n是第二个元的次数，m对应的是pij的列数-1，n对应得是pij的行数-1
%两种beizer相乘情况下对其中一种进行升一阶,flag=1,对m进行升阶，flag=2，对n进行升阶，若flag为3，则是m等于0的情况下升k数的阶,若flag为4，则是n等于0的情况下升k数的阶
if flag == 1 && m1~=0
    qij = [];
    for i = 1 : n1+1
    [q] = to_one_upgrades_p(pij(i,:));
    qij = [qij;q];
    end
    m2 = m1+1;
    n2 = n1;
elseif flag == 2 && n1~=0
    qij = [];
    for i = 1:m1+1
    [q] = to_one_upgrades_p(pij(:,i)');
    qij = [qij q']; 
    end
    m2 = m1;
    n2 = n1+1;
elseif m1==0&&flag == 3
 qij = [];
    for i = 0 : k
        qij = [qij pij];
    end
    m2 = k;
    n2 = n1;   
elseif n1 ==0&&flag ==4
    qij = [];
    for i = 0 :k
        qij = [qij;pij];
    end
    m2 = m1;
    n2 = k;
end
