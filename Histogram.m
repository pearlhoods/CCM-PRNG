A0=zeros(128,1);
A1=ones(128,1);
p1=cat(1,A0,A1);
g1=zeros(16,1);
g2=zeros(16,1);
r=zeros(16,1);
numbers=zeros(5000,1);
for round=1:5000
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
y=r.';
numbers(round)=bi2de(y);
end
