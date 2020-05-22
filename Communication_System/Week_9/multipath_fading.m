function [y] = multipath_fading(x,h,SNR)

z = sqrt(0.5*10^(-SNR/10)) * (randn(1,length(x)) + 1j*randn(1,length(x)));
k = (h(1)*delay(x,0)) + (h(2)*delay(x,1)) + (h(3)*delay(x,2));

y = k + z;
