function [y] = coder_gen(in)
L = length(in);
y = zeros(1,5*(L/3));

for i=1:L/3
    three_bit = [in(3*i-2) in(3*i-1) in(3*i)];
    
    if three_bit == [0 0 0]
        y(5*i-4:5*i) = [0 0 0 0 0]; 
    elseif three_bit == [0 0 1]
        y(5*i-4:5*i) = [0 0 0 1 1]; 
    elseif three_bit == [0 1 0]
        y(5*i-4:5*i) = [1 1 0 0 1];
    else
        y(5*i-4:5*i) = [1 1 1 1 0];
    end
end

