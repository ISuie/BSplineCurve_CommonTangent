function [cpb,dknot] = Divide2(cpx,knot,s0,s1,p)
%对析出的相同段分割曲线的操作
       dknot = [ ];
       cpb = [ ];
    if s0 ~= knot(1)&& s1 ~= knot(2)
        [cpx1,cpx2,knot1,knot2] = Divide(cpx,knot,s0,p);
        [cpx1,cpx2,knot1,knot2] = Divide(cpx2,knot2,s1,p);
        cpb = cpx1;
        dknot = knot1;
    elseif s0 == knot(1)&& s1 ~= knot(2)
        [cpx1,cpx2,knot1,knot2] = Divide(cpx,knot,s1,p);
        cpb = cpx1;
        dknot = knot1;
    elseif s0 ~= knot(1)&& s1 == knot(2)
        [cpx1,cpx2,knot1,knot2] = Divide(cpx,knot,s0,p);
        cpb = cpx2;
        dknot = knot2;
    end