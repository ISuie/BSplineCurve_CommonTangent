function[result] = check_c_coefficient(n1,m1,n2,m2,h1,h2,B,c)
%检测f1+c*f2,f1-*cf2
result =0;
n_max = max(n1,n2);
m_max = max(m1,m2);
hh1 = h_to_hh(n1,h1);
hh2 = h_to_hh(n2,h2);
if n1 == n_max&&n2<n1
    z2 = zeros(m2+1,n1-n2);
    hh2 = [hh2 z2];
    n2 = n1;
elseif n2 == n_max&&n1<n2
    z1 = zeros(m1+1,n2-n1);
    hh1 = [hh1 z1]; 
    n1 = n2;
end
if m1 == m_max&&m2<m1
    z2 = zeros(m1-m2,n2+1);
    hh2 = [hh2;z2];
    m2=m1;
elseif m2 == m_max&&m1<m2
    z1 = zeros(m2-m1,n1+1);
    hh1 = [hh1;z1];
    m1=m2;
end
h1 = hh_to_h(hh1);
h2 = hh_to_h(hh2);
[f1]= changed_bij(h1,n1,m1,B(1),B(2),B(3),B(4));
[f2]= changed_bij(h2,n2,m2,B(1),B(2),B(3),B(4));
[result1] = check_one_coefficient(f1+c*f2);
[result2] = check_one_coefficient(f1-c*f2);
if result1==1&&result2==1
    result = 1;
end


