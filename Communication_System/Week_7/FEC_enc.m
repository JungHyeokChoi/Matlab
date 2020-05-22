function [y] = FEC_enc(x,R)
y = [];
for n=1:R
    y = [y,x];
end


end

