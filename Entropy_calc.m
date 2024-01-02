A0=zeros(512,1);
A1=ones(512,1);
p1=cat(1,A0,A1);
g1=zeros(16,1);
g2=zeros(16,1);
r=zeros(16,1);
keys=zeros(65536,1);
count_key=zeros(65536,1);
for round=1:65536
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
            if count < floor(i/2)
                r(i)=1;
            else
                r(i)=0;
            end
        end
     end

end
y=r.';
keys(round)=bi2de(y);
disp(keys(round));

count_key(keys(round)+1)=count_key(keys(round)+1)+1;

end

ent=0;
for j=1:65536
    if ne(count_key(j),0)
    p=count_key(j)/65536;
    ent=ent+(p*log2(1/p));
    end
end
disp('result');
disp(ent);
% 