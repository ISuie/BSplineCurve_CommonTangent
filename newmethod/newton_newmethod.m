function [psqt] = newton_newmethod(cpb1,cpb2,p1,p2,I1,no_itr, error, vari)
psqt = [];
while(isempty(psqt)==1)
    s1 = (I1(2)-I1(1))*rand+I1(1);
    t1 = (I1(4)-I1(3))*rand+I1(3);
[st, no_itr, norm1, psqt]=Newton_rational_modified2_vari(cpb1, p1, I1(1), I1(2), s1,cpb2, p2, I1(3), I1(4),t1,no_itr, error, vari);
end