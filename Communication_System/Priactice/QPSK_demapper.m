function [x_hat] = QPSK_demapper(z)

L = length(z);
x_hat = zeros(1, 2*L);

for n=1:L
    if real(z(n))>=0 && imag(z(n))>=0
        x_hat(2*(n-1)+1:2*n)=[0 0];
    elseif real(z(n))<0 && imag(z(n))>=0
        x_hat(2*(n-1)+1:2*n)=[0 1];
    elseif real(z(n))<0 && imag(z(n))<0
        x_hat(2*(n-1)+1:2*n)=[1 1];
    else 
        x_hat(2*(n-1)+1:2*n)=[1 0];
    end
end
