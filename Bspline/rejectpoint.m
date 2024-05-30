function[result] = rejectpoint(p1,p2,cpb1,cpb2,knot1,knot2,sknot1,sknot2)
        samplen = 3;
        result = 0;
        cpx11 = cpb1;
        cpx21 = cpb2;
        knot11 = knot1;
        knot21 = knot2;
        ang1=0;
        ang2=0;
        if sknot1 ~=knot1(1)&&sknot1~=knot1(2)&&abs(sknot1-knot1(1))>5e-4&&abs(sknot1-knot1(2))>5e-4
        [cpx11,cpx12,knot11,knot12] = Divide(cpb1,knot1,sknot1,p1);
        end
        if sknot2~=knot2(1)&&sknot2~=knot2(2)&&abs(sknot2-knot2(1))>5e-4&&abs(sknot2-knot2(2))>5e-4
        [cpx21,cpx22,knot21,knot22] = Divide(cpb2,knot2,sknot2,p2);
        end
        if sknot1 ~=knot1(1)&&sknot1~=knot1(2)&&abs(sknot1-knot1(1))>5e-4&&abs(sknot1-knot1(2))>5e-4
        tt1 = linspace(knot11(1),sknot1,samplen);
        [ps1, dps1, ddps1] = evalBern_rational_modify(cpx11, p1, knot11(1), sknot1, tt1);
        x1 = ps1(3,1);
        y1 = ps1(3,2);
        k2 = dps1(3,2)/dps1(3,1);
        [ang1]= angle([dps1(3,1),dps1(3,2)],[0,0]);
        elseif sknot1 == knot1(1)||abs(sknot1-knot1(1))<=5e-4
        tt1 = linspace(knot1(1),knot1(2),samplen);
        [ps1, dps1, ddps1] = evalBern_rational_modify(cpb1, p1, knot1(1),knot1(2), tt1);
        x1 = ps1(1,1);
        y1 = ps1(1,2);
        k2 = dps1(1,2)/dps1(1,1);
        [ang1]= angle([dps1(1,1),dps1(1,2)],[0,0]);
        elseif sknot1 == knot1(2)||abs(sknot1-knot1(2))<=5e-4
        tt1 = linspace(knot1(1),knot1(2),samplen);
        [ps1, dps1, ddps1] = evalBern_rational_modify(cpb1, p1, knot1(1),knot1(2), tt1);
        x1 = ps1(3,1);
        y1 = ps1(3,2);
        k2 = dps1(3,2)/dps1(3,1);
        [ang1]= angle([dps1(3,1),dps1(3,2)],[0,0]);
        end
        if sknot2~=knot2(1)&&sknot2~=knot2(2)&&abs(sknot2-knot2(1))>5e-4&&abs(sknot2-knot2(2))>5e-4
        tt2 = linspace(knot21(1),sknot2,samplen);
        [ps2, dps2, ddps2] = evalBern_rational_modify(cpx21, p2, knot21(1), sknot2, tt2);
        x2 = ps2(3,1);
        y2 = ps2(3,2);
        [ang2]= angle([dps2(3,1),dps2(3,2)],[0,0]);
        elseif sknot2==knot2(1)||abs(sknot2-knot2(1))<=5e-4
        tt2 = linspace(knot2(1),knot2(2),samplen);
        [ps2, dps2, ddps2] = evalBern_rational_modify(cpb2, p2,knot2(1),knot2(2), tt2);
        x2 = ps2(1,1);
        y2 = ps2(1,2);
        [ang2]= angle([dps2(1,1),dps2(1,2)],[0,0]);
        elseif sknot2==knot2(2)||abs(sknot2-knot2(2))<=5e-4
        tt2 = linspace(knot2(1),knot2(2),samplen);
        [ps2, dps2, ddps2] = evalBern_rational_modify(cpb2, p2,knot2(1),knot2(2), tt2);
        x2 = ps2(3,1);
        y2 = ps2(3,2);
        [ang2]= angle([dps2(3,1),dps2(3,2)],[0,0]);
        end
        k1 = (y2-y1)/(x2-x1);
        if abs(k1-k2)<=1e-2||((abs(ang1-90)<1||abs(ang1-270)<1)&&(abs(ang2-90)<1||abs(ang2-270)<1)&&abs(x1-x2)<=1e-2)
            result = 1;
        end
        