function [sknot1,sknot2,scpb1,scpb2] = bisection3(p1,p2,cpb1,cpb2,knot1,knot2)

scpb1 = [];
scpb2 = [];
sknot1 = [];
sknot2 = [];
[sknot1,scpb1,sknot2,scpb2] = Bisection2(p1,p2,cpb1,cpb2,knot1,knot2);
            %[x11,y11,k11] = draw(p1,cpb1,knot1,sknot1(1,1));
            %[x21,y21,k21] = draw(p2,cpb2,knot2,sknot2(1,1));
            %[x12,y12,k12] = draw(p1,cpb1,knot1,sknot1(1,2));
            %[x22,y22,k22] = draw(p2,cpb2,knot2,sknot2(1,2));
            %plot([x11,x21],[y11,y21]);
            %plot([x12,x22],[y12,y22]);
if isempty(scpb1)==0
for i = 1 : 6
    [sknot1,scpb1,sknot2,scpb2] = Bisection2(p1,p2,scpb1,scpb2,sknot1,sknot2);
    if isempty(scpb1)==1
        break;
    end
end
end
