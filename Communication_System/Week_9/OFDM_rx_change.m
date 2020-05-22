function [y] = OFDM_rx_change(x,h,fft_pt,L_cp)

L = length(x);
L_block = fft_pt+L_cp;
N_block = L/(L_block);
H = fft(h,fft_pt);
y = zeros(1,(fft_pt/2)*N_block);

for n=1:N_block
    X_block = x(1+(n-1)*L_block+L_cp:L_block*n);
    temp_block = fft(X_block,fft_pt);
    dec_block  = temp_block./H;
    y(1+(n-1)*(fft_pt/2):(fft_pt/2)*n) = dec_block(65:192); 
end

