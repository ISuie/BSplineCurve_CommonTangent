function [ps, dps, ddps] = evalBern_rational_modify(cA, p1, s0, s1, ss)
%input: cA -- control points;
%       p1 -- degree; 
%       Bernstein function defined over [t0,t1];
%       tt  -- parameter in [t0, t1]
% output: ps -- value
%       : dps -- first derivative;
%       : ddps -- second derivative if exist. 

% updated in 2022/09/12, extend to any dimension

ptdim = length(cA(1,:)); 
sdim = length(ss); 
s0s1 = s1 - s0; 
svalue = (2*ss - s0 - s1)/s0s1; % need to convert to [-1,1]
[B,dB,ddB] = bernstein_basis(svalue, p1);  %svalue in [-1,1]; 
% value
xyw = B*cA;  %Sum P_i B_i
ww = xyw(:,end); 
txyw = xyw./ww;
ps = txyw(:,1:end-1);




% first derivative;
dxyw = dB*cA;

tdps = zeros(sdim, ptdim-1); 
dww = dxyw(:,end);
for i = 1: ptdim-1
    tdps(:,i) = (dxyw(:,i).*ww  - xyw(:,i).*dxyw(:,end))./(ww.^2);
end 

dps = 1.0/s0s1*tdps;

% second derivative
if (p1>=3)    
    ddxyw = ddB*cA;    
    tddps = zeros(sdim, ptdim-1); 
    for i = 1: ptdim-1
        tddps(:,i) = (ddxyw(:,i).*ww - xyw(:,i).*ddxyw(:,end))./ww.^2  - 2.0* dww.* (dxyw(:,i).*ww - xyw(:,i).*dww)./(ww.^3);
    end
    ddps = 1.0/(s0s1^2)*tddps;    
end






end 