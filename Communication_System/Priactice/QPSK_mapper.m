function [QPSK_symbol] = QPSK_mapper(x)

N = length(x);
QPSK_symbol = zeros(1,N/2);
for i=1:N/2
    two_bit = [x(2*i-1) x(2*i)];
    if two_bit ==[0 0]
        QPSK_symbol(i) = sqrt(0.5) + 1j*sqrt(0.5);
    else if two_bit == [0 1]
        QPSK_symbol(i) = - sqrt(0.5) + 1j*sqrt(0.5);
    else if two_bit == [1 0]
        QPSK_symbol(i) = sqrt(0.5) - 1j*sqrt(0.5);
    else
        QPSK_symbol(i) = -sqrt(0.5) - 1j*sqrt(0.5);
        end
        end
    end
end