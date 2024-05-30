function [f_h,n1,m1] = turn_to_h(fst)
%将fst形式转换为h形式                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
k1 = length(fst(1,:));
k2 = length(fst(:,1));
[f]= toBernstein(k1-1,k2-1);
fh = [];
for i = 1 : length(f(:,1))
    w = fix((i-1)/k1)+1;
    r = i - k1*(w-1);
    k = fst(w,r);
    fh = [fh;k*f(i,:)];
end
f_h = zeros(1,length(fh(1,:)));
for i = 1 : length(fh(:,1))
    f_h = f_h + fh(i,:);
end
n1 = k1-1;
m1 = k2-1;
