function fvalue = det_nd(v1,v2)
% determine two vectors are parallel or not 

vn = length(v1);


fvalue = 0.0;
for i = 1:vn
    for j = 1:vn
        fvalue = fvalue + abs(det([v1(i),v1(j); v2(i),v2(j)])); 
    end
end