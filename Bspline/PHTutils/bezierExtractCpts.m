function [cpbsA,intervals] = bezierExtractCpts(knot, p, cpx)
% compute Bezier control points based on B-spline control points and knot
% vector; 
% input: cpx - control pts of B-splines;
% output: cpb(:,:,j) --- the jth patch bezier control points; 
%         The jth patch bezier curve is defined over---- [intervals(j,1),
%         interval(j,2)]

uknot = unique(knot);
cbs = bezierExtraction(knot,p);
n = length(knot)-p-2;
ptdim = length(cpx(1,:));
cpbsA(:,:,1) = zeros(p+1,ptdim);
intervals = zeros(length(uknot)-1,2);
for j = 1:length(uknot)-1
    bi = findspan (n, p, uknot, knot);
    cpn = cpx((bi(j)-p+1):(bi(j)+1),:);  % for knot vector with multiple knots 
    %cpn = cpx(j:j+3,:);  %works for knots vector with no inner multiple knot 
    cpbsA(:,:,j) = (cbs(:,:,j))'*cpn;
    intervals(j,1) = uknot(j);
    intervals(j,2) = uknot(j+1);
end
