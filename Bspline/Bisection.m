function [sknot1,sknot2] = Bisection(p1,p2,cpb1,cpb2,knot1,knot2)
%对曲线二分法的操作
    sknot1 = [];
    sknot2 = [];
    left = knot1(1);
    right = knot1(2);
    p = (left+right)/2;
    dknot11 = [];
    dknot12 = [];
    dcpb11 = [];
    dcpb12 = [];
    dcpb21 = [];
    dcpb22 = [];    
    flag = 0;
    xcpb2 = cpb2;
    xknot2 = knot2;
    while (abs(left-right)>5e-3)
        knot1 = [left,right];
        [dcpb11,dcpb12,dknot11,dknot12] = Divide(cpb1,knot1,p,p1);
        [result1,dcpb11,dknot11,dcpb21,dknot21]=reject(p1,p2,dcpb11,xcpb2,dknot11,xknot2);
        [result2,dcpb12,dknot12,dcpb22,dknot22]=reject(p1,p2,dcpb12,xcpb2,dknot12,xknot2);
        
        
        if result1==0&&result2==0
            flag = 1;
            break;
        elseif result1==0&&result2==1
            left=p;
            p=(left+right)/2;
            xcpb2 = dcpb22;
            xknot2 = dknot22;
            if dknot12(1)==dknot12(2)
            sknot1 = dknot12;
            sknot2 = dknot22;
            flag = 1;
            break;
            end
        elseif result2==0&&result1==1
            right=p;
            p=(left+right)/2;
            xcpb2 = dcpb21;
            xknot2 = dknot21;
            if dknot11(1)==dknot11(2)
            sknot1 = dknot11;
            sknot2 = dknot21;
            flag = 1;
            break;
            end
            
        elseif result1==1&&result2==1
            if dknot11(1)==dknot11(2)
            sknot1 = dknot11;
            sknot2 = dknot21;
            flag = 1; 
            flag = 2;
           [sknot11,sknot21] = Bisection(p1,p2,dcpb11,dcpb21,dknot11,dknot21);
           [sknot12,sknot22] = Bisection(p1,p2,dcpb12,dcpb22,dknot12,dknot22);
           break;
        end
    end
    if flag == 0
        sknot1 = p;
        sknot2 = (xknot2(1)+xknot2(2))/2;
    elseif flag == 2
        sknot1 =[sknot11,sknot12];
        sknot2 =[sknot21,sknot22];
    end
        
        
