function [y] = coder_cheak(in)
    L = length(in);
    y = zeros(1,L);
    
    c_0 = [0 0 0 0 0];
    c_1 = [0 0 1 1 1];
    c_2 = [1 1 0 0 1];
    c_3 = [1 1 1 1 0];
   
 for i=1:L/5
        coder = [in(5*i-4) in(5*i-3) in(5*i-2) in(5*i-1) in(5*i)];
        if sum(xor(coder,c_0)) == 0
            y(5*i-4:5*i) = [0 0 0 0 0];
        elseif sum(xor(coder,c_0)) == 1
            y(5*i-4:5*i) = [0 0 0 0 0];
        elseif sum(xor(coder,c_1)) == 0
            y(5*i-4:5*i) = [0 0 1 1 1]; 
        elseif sum(xor(coder,c_1)) == 1
            y(5*i-4:5*i) = [0 0 1 1 1]; 
        elseif sum(xor(coder,c_2)) == 0
            y(5*i-4:5*i) = [1 1 0 0 1];
        elseif sum(xor(coder,c_2)) == 1
            y(5*i-4:5*i) = [1 1 0 0 1];
        elseif sum(xor(coder,c_3)) == 0
            y(5*i-4:5*i) = [1 1 1 1 0];
        elseif sum(xor(coder,c_3)) == 1
            y(5*i-4:5*i) = [1 1 1 1 0];
        end     
end

