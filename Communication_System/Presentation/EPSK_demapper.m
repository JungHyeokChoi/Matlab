function [y] = EPSK_demapper(X)
%8PSK demapper

L = length(X);
y = zeros(1,L*3);

for n=1:L
    if real(X(n)) >= 0 && imag(X(n)) >= -0.3826  && imag(X(n)) < 0.3826 
        y(3*(n-1)+1:3*n) = [0 0 0];
    elseif real(X(n)) >= 0.3826 && imag(X(n)) >= 0.3826 && imag(X(n)) < 0.9238
        y(3*(n-1)+1:3*n) = [0 0 1];
    elseif real(X(n)) < -0.3826  && imag(X(n)) >= 0.3826  && imag(X(n)) < 0.9238
        y(3*(n-1)+1:3*n) = [0 1 0];
    elseif real(X(n)) >= -0.3826 && real(X(n)) <= 0.3826 && imag(X(n)) >= 0
        y(3*(n-1)+1:3*n) = [0 1 1];
    elseif real(X(n)) > 0.3826 && imag(X(n)) > -0.9238 && imag(X(n)) < -0.3826 
        y(3*(n-1)+1:3*n) = [1 0 0];
    elseif real(X(n)) >=  -0.3826 && real(X(n)) <= 0.3826  && imag(X(n)) <= 0
        y(3*(n-1)+1:3*n) = [1 0 1];
    elseif real(X(n)) <= 0  && imag(X(n)) >= -0.3826 && imag(X(n)) < 0.3826
        y(3*(n-1)+1:3*n) = [1 1 0];
    else 
        y(3*(n-1)+1:3*n) = [1 1 1];
    end
end

