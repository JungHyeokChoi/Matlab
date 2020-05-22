function [y] = AWGN(x,SNR)

L = length(x);
z = sqrt(0.5*10^(-SNR/10))*(randn(1,length(x)) + 1j*randn(1,length(x)));
y = x + z;

end

