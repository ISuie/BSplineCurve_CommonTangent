function [h] = hh_to_h(hh)
h = [];
m = length(hh(:,1));
for i = 1:m
    h = [h,hh(i,:)];
end