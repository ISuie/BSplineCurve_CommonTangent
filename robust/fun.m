function f = fun(x)
  k=2;
    for i=1:k
      x(i)=sym (['x',num2str(i)]);
    end 

  f(1)=0.5*sin(x(1))+0.1*cos(x(1)*x(2))-x(1);
  f(2)=0.5*cos(x(1))-0.1*cos(x(2))-x(2);
end