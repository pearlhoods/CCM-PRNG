A0=zeros(128,1);
A1=ones(128,1);
p1=cat(1,A0,A1);
g1=zeros(16,1);
g2=zeros(16,1);
r=zeros(16,1);
rand_ar=zeros(10000,1);
c=1;
for round=1:625
ind=randperm(numel(p1));

for i = 1:16
    g1(i)=p1(ind(i));
end
%disp(g1);

p2=cat(1,A1,A0);
ind2=randperm(numel(p2));

for i = 1:16
    g2(i)=p2(ind(i));
end
%disp(g2);

for i=1:16
    if g1(i)== 1 && g2(i)==0
        r(i)=0;
        rand_ar(c)=0;
        c=c+1;
    elseif g1(i) ==0 && g2(i)==1
        r(i)=1;
        rand_ar(c)=1;
        c=c+1;
        
    else
        count=0;
        for j=1:i-1
            count=count+r(j);
        end
            if count < floor(i/2)
                r(i)=1;
                rand_ar(c)=1;
                c=c+1;            
            else
                r(i)=0;
                rand_ar(c)=0;
                c=c+1;
            end
     end
end
end

xaxis=zeros(500,1);
ini=-250;
for i=1:501
    xaxis(i)=ini;
    ini=ini+1;
end
AC=zeros(500,1);
l=1;
for k=-250:250
new_ar=circshift(rand_ar,k);
new_ar=new_ar.';
A=0;
for loop=1:10000
    if eq(rand_ar(loop),new_ar(loop))
        A=A+1;
    end
end
D=10000-A;
AC(l)=(A-D)/10000;
l=l+1;
end
xlswrite('Auto_Corr.xlsx',AC);
% 