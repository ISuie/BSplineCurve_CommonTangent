function [sknot1,scpb1,sknot2,scpb2] = Bisection2(p1,p2,cpb1,cpb2,knot1,knot2)
result1 = 0;
result2 = 0;
dcpb1 = [];
dknot1 = [];
dcpb2 =[];
dknot2 =[];
sknot1 = [];
scpb1 =[];
sknot2 = [];
scpb2 = [];
for i1 = 1 : length(knot1(:,1)) 
    
    if isempty(cpb1(:,:,i1))==0
        p = (knot1(i1,1)+knot1(i1,2))/2;
        [dcpb11,dcpb12,dknot11,dknot12] = Divide(cpb1(:,:,i1),knot1(i1,:),p,p1);
        [dcpb11,dknot11,dcpb21,dknot21] = partition2(dcpb11,cpb2(:,:,i1),dknot11,knot2(i1,:),p1,p2);
        [dcpb12,dknot12,dcpb22,dknot22] = partition2(dcpb12,cpb2(:,:,i1),dknot12,knot2(i1,:),p1,p2);
            %[x11,y11,k11] = draw(p1,cpb1,knot1,dknot11(1,1));
            %[x21,y21,k21] = draw(p2,cpb2,knot2,dknot21(1,1));
            %[x12,y12,k12] = draw(p1,cpb1,knot1,dknot11(1,2));
            %[x22,y22,k22] = draw(p2,cpb2,knot2,dknot21(1,2));
            %plot([x11,x21],[y11,y21]);
            %plot([x12,x22],[y12,y22]);
    if isempty(dknot11)==0&&isempty(dknot21)==0
      if dknot11(1)==dknot11(2)
    [result1] = rejectpoint(p1,p2,cpb1(:,:,i1),cpb2(:,:,i1),knot1(i1,:),knot2(i1,:),dknot11(1),dknot21(1));
      else
    [result1] = rejection3(p1,p2,dcpb11,dcpb21,dknot11,dknot21);
      end
    end
    if result1 == 1
        sknot1 = [sknot1;dknot11];
        sknot2 = [sknot2;dknot21];
        scpb1 = cat(3,scpb1,dcpb11);
        scpb2 = cat(3,scpb2,dcpb21);
    end
    if isempty(dknot12)==0&&isempty(dknot22)==0
      if dknot12(1)==dknot12(2)
    [result2] = rejectpoint(p1,p2,cpb1(:,:,i1),cpb2(:,:,i1),knot1(i1,:),knot2(i1,:),dknot12(1),dknot22(1));
      else
    [result2] = rejection3(p1,p2,dcpb12,dcpb22,dknot12,dknot22);
      end
    end
    if result2 == 1
        sknot1 = [sknot1;dknot12];
        sknot2 = [sknot2;dknot22];
        scpb1 = cat(3,scpb1,dcpb12);
        scpb2 = cat(3,scpb2,dcpb22);
    end
    end
end