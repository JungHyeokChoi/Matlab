function [y] = EPSK_mapper(x)
%8PSK mapper

    L = length(x);

    for i=1:L/3
        Three_bit = [x(3*i-2) x(3*i-1) x(3*i)];
        if Three_bit == [0 0 0]
            y(i) = 1;
        elseif Three_bit == [0 0 1]
            y(i) = sqrt(0.5) + j*sqrt(0.5);
        elseif Three_bit == [0 1 0]
            y(i) = -sqrt(0.5) + j*sqrt(0.5);
        elseif Three_bit == [0 1 1]
            y(i) = 1*j;
        elseif Three_bit == [1 0 0]
            y(i) = sqrt(0.5) - j*sqrt(0.5);
        elseif Three_bit == [1 0 1]
            y(i) = -1*j;
        elseif Three_bit == [1 1 0]
            y(i) = -1;
        else
            y(i) = -sqrt(0.5) - j*sqrt(0.5);
        end
    end
end

