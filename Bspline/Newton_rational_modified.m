function [v1, no_itr, norm1, psqt] = Newton_rational_modified(cA, p0, ss0, ss1, sv, cB, p1, tt0, tt1, tv, no_itr, error)
% cA -- patch A control points
% p1 -- patch A degree
% cB -- patch B control points
% p2 -- patch B degree
% ss0 -- patch A [ss0, ss1]
% tt0 -- patch B [tt0,tt1]
% sv -- s parameter value in [ss0, ss1]; 
% tv -- t parameter value in [ss0, ss1]; 
% no-itr
% error

% modified on 2022/9/12, extend to any dimension

% nargin = no. of input arguments
if nargin <5, no_itr = 20 ; end
if nargin <4, error = 10^-5; no_itr = 20 ; end
if nargin <3, no_itr = 20; error = 10^-5; v = [1;1;1]; end


v1 = [sv; tv];




%fnv1 = evalf1f2_rational_modified(cA, p0, ss0, ss1, v1(1), cB, p1, tt0, tt1, v1(2)); 
i = 0;
while true
    % compute jacobian
    [fnv1, jacob_fnv1] = evalf1f2_rational_modified(cA, p0, ss0, ss1, v1(1), cB, p1, tt0, tt1, v1(2)); 
    [fnv1, jacob_fnv1] = evalf1f2_rational_modified(cA, p0, ss0, ss1, v1(1), cB, p1, tt0, tt1, v1(2)); 
    %jacob_fnv1 = feval(jacob_fn,v1);
    
    % avoid the ill-conditioned Jacobian
    %if(norm(fnv1)<=0.0000001 || cond(jacob_fnv1)>100000000.0)
    if( cond(jacob_fnv1)>100000000.0)
        break;
    end
    H = jacob_fnv1\fnv1;
    v1 = v1 - H;
    
    if (v1(1)>ss1 && v1(1)<ss0 && v1(2)>tt1 && v1(2)<tt0)
        break;
    end
    
    fnv1 = evalf1f2_rational_modified(cA, p0, ss0, ss1, v1(1), cB, p1, tt0, tt1, v1(2)); 
    % fnv1 = feval(fn,v1);
    i = i + 1 ;
    norm1 = norm(fnv1);
    %if (i > no_itr && norm1 < error) % original need to iter >20
    if (i > no_itr || norm1 < error)   % iteration not exceed 20;
        break; 
    end
    %noiter = i
    %if norm(fnv1) < error , break , end
end

% psqt = zeros(2,2);
%  if (v1(1)<=ss1 && v1(1)>=ss0 && v1(2)<=tt1 && v1(2)>=tt0)
%     ps = evalBern_rational_s0s1(cA, p0, ss0, ss1, v1(1));
%     qt = evalBern_rational_s0s1(cB, p1, tt0, tt1, v1(2));
%     psqt = [ps; qt];
%  end

ptdim = length(cA(1,:)); 
psqt = zeros(2, ptdim-1);
if (v1(1)<=ss1 && v1(1)>=ss0 && v1(2)<=tt1 && v1(2)>=tt0)
    nps = evalBern_rational_modify(cA, p0, ss0, ss1, v1(1));
    nqt = evalBern_rational_modify(cB, p1, tt0, tt1, v1(2));
    psqt = [nps; nqt];
end 

% if (length(cA(1,:)) <=3)
%     psqt = zeros(2,2);
%     if (v1(1)<=ss1 && v1(1)>=ss0 && v1(2)<=tt1 && v1(2)>=tt0)
%         ps = evalBern_rational_modify(cA, p0, ss0, ss1, v1(1));
%         qt = evalBern_rational_modify(cB, p1, tt0, tt1, v1(2));
%         psqt = [ps; qt];
%     end
% elseif (length(cA(1,:)) ==4)  
%     psqt = zeros(2,3);
%     if (v1(1)<=ss1 && v1(1)>=ss0 && v1(2)<=tt1 && v1(2)>=tt0)
%         ps =  evalBern_rational_modify(cA, p0, ss0, ss1, ss);
%         qt =  evalBern_rational_modify(cB, p1, tt0, tt1, tt);
%         psqt = [ps; qt];
%     end
% end

end


    
 