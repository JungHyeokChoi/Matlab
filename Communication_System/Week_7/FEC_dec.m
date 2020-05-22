function [y] = FEC_dec(x,R)
L = length(x);
y = zeros(1,L/R);

for n=1:R
    y = y + x((L/R)*(n-1)+1:(L/R)*n);
end

y = (y/R) > 0.5;


end

