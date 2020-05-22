function [y] = QPSK_demapper(X)

L = length(X);
y = zeros(1,2*L);

for n=1:L
    if real(X(n)) >= 0 && imag(X(n)) >= 0
        y(2*(n-1)+1:2*n) = [0 0];
    elseif real(X(n)) < 0 && imag(X(n)) >= 0
        y(2*(n-1)+1:2*n) = [0 1];    
    elseif real(X(n)) < 0 && imag(X(n)) < 0
        y(2*(n-1)+1:2*n) = [1 1];
    else 
        y(2*(n-1)+1:2*n) = [1 0];
    end
end

