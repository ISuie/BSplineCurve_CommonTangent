function[f] = changed_twobernstein(n1,m1,a,b,n2,m2,c,d)

[fx]= changed_onebernstein(n1,m1,a,b);
[fy]= changed_onebernstein(n2,m2,c,d);

f = [];
f1 = fy'*fx;
for i = 1:length(f1(:,1))
    f = [f,f1(i,:)];
end