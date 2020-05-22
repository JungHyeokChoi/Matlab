function[y] = randint(n,m)

x=rand(n,m);
y=zeros(n,m);

for a=1:n
    for b=1:m
        if x(a,b) >= 0.5
            y(a,b)=1;
        else
            y(a,b)=0;
        end
    end
end
