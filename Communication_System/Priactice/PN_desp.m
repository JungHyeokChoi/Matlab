function [y] = PN_desp(x, SG, idx)
L = length(x);
y = zeros(1,L/SG);
P = PN_gen2(SG, idx);

for n=1:L/SG 
   y(n) = x(SG*(n-1)+1:SG*n)*P'/SG;     %'<-- 때문에 행이 열로 바뀜
end