function [y] = PN_sp(x, SG, idx)
L = length(x);
y = zeros(1,L*SG);
P = PN_gen2(SG, idx);

for n=1:L
    y(SG*(n-1)+1:SG*n) = x(n)*P;    
end

