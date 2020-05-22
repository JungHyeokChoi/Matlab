function [y] = OFDM_tx(x,fft_pt,L_cp)
L = length(x);
N_block = L/fft_pt;
y = zeros(1,L+L_cp*N_block);

for n=1:N_block
    div_block = x(1+fft_pt*(n-1):fft_pt*n);
    temp_block = sqrt(fft_pt)*ifft(div_block,fft_pt);
    cp_block = temp_block(fft_pt-L_cp+1:end);
    y(1+(n-1)*(fft_pt+L_cp):(fft_pt+L_cp)*n) = [cp_block temp_block];
end

