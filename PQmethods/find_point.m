function [point] = find_point(cpx)
point = cpx(:,1:2)./cpx(:,3);