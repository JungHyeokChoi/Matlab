function [y] = QPSK_mapper(x)

    L = length(x);

    for i=1:L/2
        two_bit = [x(2*i-1) x(2*i)];
        if two_bit == [0 0]
            y(i) = sqrt(0.5) + j*sqrt(0.5);
        elseif two_bit == [0 1]
            y(i) = -sqrt(0.5) + j*sqrt(0.5);
        elseif two_bit == [1 0]
            y(i) = sqrt(0.5) - j*sqrt(0.5);
        else
            y(i) = -sqrt(0.5) - j*sqrt(0.5);
        end
    end
end

