function[p1,p2]=point_to_h(P)
p1 =[];
p2= [];
for i = 1 : length(P(:,1))
    p1 = [p1,P(i,1)];
    p2 = [p2,P(i,2)];
end