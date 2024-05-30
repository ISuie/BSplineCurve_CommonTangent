function[result] = check_connected(b1,b2)
result =0;
[result1] = check_overlap(b1(1),b1(2),b2(1),b2(2));
[result2] = check_overlap(b1(3),b1(4),b2(3),b2(4));
[result3] = check_overlop_corner(b1,b2);
if result1==1&&result2==1&&result3==0
    result=1;
end
