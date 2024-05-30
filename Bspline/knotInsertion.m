function [nknot, ncpx] = knotInsertion(knot, cpx, p, s0)
% knot insertion. 
% After knot insertion, the control points are changed, but the curve is preserved. 
% knot - original knot
% cpx -- cpts*weights
% s0 -- inserted knot
% p -- degree

uknot = unique(knot);
ii = 0; 
for i = 1: length(knot)-1
    if (s0 > knot(i) && s0 <= knot(i+1))
        nknot = [knot(1:i) s0 knot(i+1:end)];
        ii = i; 
    end
end

for j = 1:ii-p
    ncpx(j,:)= cpx(j,:);
end
for j = ii-p+1:ii
    alpha = (s0 - knot(j))/(knot(j+p)- knot(j)); 
    ncpt = (1-alpha)*cpx(j-1,:) + alpha*cpx(j,:);
    ncpx(j,:) = ncpt;
end

for j = ii+1:length(cpx(:,1))+1
    ncpx(j,:) = cpx(j-1,:);
end
    

        




