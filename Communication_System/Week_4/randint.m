function [y] = randint(N,M)

z = rand(N,M);
y = zeros(N,M);
for n = 1 : N
    for m = 1 :M
        if z(n,m) >= 0.5
            y(n,m) = 1;
        elseif z(n,m) < 0.5
            y(n,m) = 0;
        end
    end
end
end

