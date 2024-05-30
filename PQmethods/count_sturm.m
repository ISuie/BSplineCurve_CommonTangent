function[N,Na] = count_sturm(n)
%数斯图姆序列变号数,
N = 0;
Na = zeros(1,length(n));
for i = 1 : length(n)
    if(n(i)<(-1e-4))
        Na(i)=-1;
    elseif(n(i)>(1e-4))
        Na(i)=1;
    end
end
flag = Na(1);
for i = 2 : length(n)
    if Na(i)~=0&& Na(i)~=flag
        N = N+1;
        flag = Na(i);
    end
end
