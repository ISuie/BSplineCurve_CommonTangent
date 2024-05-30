function[qij] = to_upgrades_p(pij,m1,n1,m2,n2)
%升阶，原阶是m1,n1,升后阶是m2,n2
mm1 = m1;
nn1 = n1;
if m2>m1&&m1~=0
    for i = 1 : m2-m1
        [qij,mm2,nn2] = to_two_upgrades_p(pij,mm1,nn1,1,0);
        mm1 =mm2;
        nn1 = nn2;
        pij = qij;
    end
end
if n2 >n1&&n1~=0
    for i = 1 : n2-n1
        [qij,mm2,nn2] = to_two_upgrades_p(pij,mm1,nn1,2,0);
        mm1 =mm2;
        nn1 = nn2;
        pij = qij;
    end
end
if m2>m1&&m1==0
    [qij] = to_two_upgrades_p(pij,mm1,nn1,3,m2-m1);
end
if n2>n1&&n1==0
    [qij] = to_two_upgrades_p(pij,mm1,nn1,4,n2-n1);
end