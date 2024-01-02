A0=zeros(128,1);
A1=ones(128,1);
p1=cat(1,A0,A1);
g1=zeros(16,1);
g2=zeros(16,1);
r=zeros(16,1);
AC=zeros(10000,1);
reference=[1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0];
for round=1:10000
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
    elseif g1(i) ==0 && g2(i)==1
        r(i)=1;
    else
        count=0;
        for j=1:i-1
            count=count+r(j);
        end
            if count < floor(i/2)
                r(i)=1;
            else
                r(i)=0;
            end
     end
end

A=0;
for loop=1:16
    if eq(r(loop),reference(loop))
        A=A+1;
    end
end
D=16-A;
AC(round)=(A-D)/16;
reference=r;
end
