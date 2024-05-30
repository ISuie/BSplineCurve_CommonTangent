function[result,dcpb1,dknot1,dcpb2,dknot2]=reject(p1,p2,cpb1,cpb2,knot1,knot2)
%对单段曲线进行同段分割，以及拒绝判断
%result = 1没被拒绝
%result = 0被拒绝
dcpb1 =[];
dcpb2=[];
dknot1=[];
dknot2=[];
result = 0;
[dcpb1,dknot1,dcpb2,dknot2] = partition2(cpb1,cpb2,knot1,knot2,p1,p2);
if isempty(dknot1)==0&&isempty(dknot2)==0
    if isempty(dcpb1)==1||isempty(dcpb2)==1
    [result] = rejectpoint(p1,p2,cpb1,cpb2,knot1,knot2,(dknot1(1)+dknot1(2))/2,(dknot2(1)+dknot2(2))/2);
    else
    [result] = rejection3(p1,p2,dcpb1,dcpb2,dknot1,dknot2);
    end
end
