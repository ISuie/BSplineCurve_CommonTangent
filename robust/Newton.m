function [allx,ally,r,n]=Newton(F,x0,eps)
  if nargin==2
    eps=1.0e-4;
  end
  x0 = transpose(x0);
  Fx = subs(F,transpose(symvar(F)),x0);
  var = transpose(symvar(F));
  dF = jacobian(F,var);
  dFx = subs(dF,transpose(symvar(F)),x0);
  n=dFx;
  r=x0-inv(dFx)*Fx';
  n=1;
  tol=1;
  N=100;
  symx=length(x0);
  ally=zeros(symx,N);
  allx=zeros(symx,N);
while tol>eps
    x0=r;
    Fx = subs(F,transpose(symvar(F)),x0);
    dFx = subs(dF,transpose(symvar(F)),x0);
    r=vpa(x0-inv(dFx)*Fx');
    tol=norm(r-x0);
    if(n>N)
        break;
    end
    allx(:,n)=x0;
    ally(:,n)=Fx;
    n=n+1;
end