function [y] = OFDM_tx_change(x,fft_pt,L_cp)
L = length(x);
N_block = L/(fft_pt/2);
y = zeros(1,L+L_cp*N_block);

for n=1:N_block
    div_block(65:192) = x(1+(fft_pt/2)*(n-1):(fft_pt/2)*n);
    div_block(1:64) = 0;
    div_block(193:256) = 0;
    temp_block = sqrt(fft_pt)*ifft(div_block,fft_pt);
    cp_block = temp_block(fft_pt-L_cp+1:end);
    y(1+(n-1)*(fft_pt+L_cp):(fft_pt+L_cp)*n) = [cp_block temp_block];
end

