function [fnv, jacob_fnv] = evalf1f2_rational_modified(cA, p0, s0, s1, ss, cB, p1, t0, t1, tt)
%input: cA -- control points;
%       p1 -- degree; 
%       s0 -- parameter in [-1,1]
% output: ps -- value
%       : dps -- first derivative;
%       : ddps -- second derivative if exist. 

[ps, dps, ddps] =  evalBern_rational_modify(cA, p0, s0, s1, ss);
[qt, dqt, ddqt] =  evalBern_rational_modify(cB, p1, t0, t1, tt);

ps = ps(2:3);
dps = dps(2:3);
ddps = ddps(2:3);
qt = qt(2:3);
dqt = dqt(2:3);
ddqt = ddqt(2:3);

        

% if (length(cA(1,:)) <=3)     
%     [ps, dps, ddps] =  evalBern_rational_modify(cA, p0, s0, s1, ss);
%     [qt, dqt, ddqt] =  evalBern_rational_modify(cB, p1, t0, t1, tt);
% elseif (length(cA(1,:)) ==4)  
%     [tps, tdps, tddps] =  evalBern_rational_modify(cA, p0, s0, s1, ss);
%     [tqt, tdqt, tddqt] =  evalBern_rational_modify(cB, p1, t0, t1, tt);
%     ps = tps(1:2); dps = tdps(1:2); ddps = tddps(1:2);
%     qt = tqt(1:2); dqt = tdqt(1:2); ddqt = tddqt(1:2);
% end
    
    


psqt = (ps-qt);
f1 = det([psqt;dps]);
f2 = det([psqt;dqt]);

fnv = [f1; f2];


f11 = det([psqt;ddps]);
f22 = det([psqt;ddqt]);
f12 = det([dps;dqt]);
jacob_fnv = [f11 f12; f12 f22];


end 