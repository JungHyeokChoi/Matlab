function [y] = QAM16_mapper(x)

    L = length(x);

    for i=1:L/4
        four_bit = [x(4*i-3) x(4*i-2) x(4*i-1) x(4*i)];
        if four_bit == [0 0 0 0]
            y(i) = -3 -3j;
        elseif four_bit == [0 0 0 1]
            y(i) = -3 -1j;
        elseif four_bit == [0 0 1 0]
            y(i) = -3 + 3j;
        elseif four_bit == [0 0 1 1]
            y(i) = -3 + 1j;
            
        elseif four_bit == [0 1 0 0]
            y(i) = -1 - 3j;
        elseif four_bit == [0 1 0 1]
            y(i) = -1 - 1j;
        elseif four_bit == [0 1 1 0]
            y(i) = -1 + 3j;
        elseif four_bit == [0 1 1 1]
            y(i) = -1 + 1j;
            
        elseif four_bit == [1 0 0 0]
            y(i) = 3 - 3j;
        elseif four_bit == [1 0 0 1]
            y(i) = 3 - 1j;
        elseif four_bit == [1 0 1 0]
            y(i) = 3 + 3j;
        elseif four_bit == [1 0 1 1]
            y(i) = 3 + 1j;
            
        elseif four_bit == [1 1 0 0]
            y(i) = 1 - 3j;
        elseif four_bit == [1 1 0 1]
            y(i) = 1 - 1j;
        elseif four_bit == [1 1 1 0]
            y(i) = 1 + 3j;
        else
            y(i) = 1 + 1j;
        end
    end
    
    y = y/sqrt(10);
end