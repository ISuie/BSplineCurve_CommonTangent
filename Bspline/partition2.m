function [dcpb1,dknot1,dcpb2,dknot2] = partition2(cpb1,cpb2,knot1,knot2,p1,p2)
%对两段曲线的相同曲线段进行分割
[vector,vtpart] = findpartition(cpb1,cpb2,knot1,knot2,p1,p2);
dcpb1 = [];
dknot1 =[];
dcpb2 =[];
dknot2 =[];
dknot10 = [];
dknot11 = [];
dknot20 = [];
dknot21 = [];
if isempty(vector)==0
        [dknot10] = partitionknot(cpb1,knot1,p1,vector(1,:));
        [dknot11] = partitionknot(cpb1,knot1,p1,vector(2,:));
        if dknot10 == dknot11
            dknot1 = [dknot10,dknot11];
        else
        dknot1 = [dknot10,dknot11];
        dknot1 = sort(dknot1);
        
        if isequal(dknot1,knot1)==0
        [dcpb1,dknot1] = Divide2(cpb1,knot1,dknot1(1),dknot1(2),p1);
        else
        dknot1 = knot1;
        dcpb1 = cpb1;
        end
        end
        [dknot20] = partitionknot(cpb2,knot2,p2,vector(1,:));
        [dknot21] = partitionknot(cpb2,knot2,p2,vector(2,:));
        if dknot20 == dknot21
        dknot2=[dknot20,dknot21];
        else
        dknot2 = [dknot20,dknot21];
        dknot2 = sort(dknot2);
        if isequal(dknot2,knot2)==0
        [dcpb2,dknot2] = Divide2(cpb2,knot2,dknot2(1),dknot2(2),p2);
        else
        dknot2 = knot2;
        dcpb2 = cpb2;
        end
        end
end

