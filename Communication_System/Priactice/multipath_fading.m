function y = multipath_fading(x,h,SNR)

noise = sqrt(0.5*10^(-SNR/10)) ...
    *(randn(1,length(x)) + 1j*randn(1,length(x)));
L = length(h);
y = zeros(1,length(x));

for k = 1:L
    y = y + h(k)*delay(x,k-1);
end

y = y + noise;