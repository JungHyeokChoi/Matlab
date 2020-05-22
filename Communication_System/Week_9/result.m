close all;
clear all;

N = 51200;
SNR = [0:18];
fft_size = 256;
L_cp = 24;
Fs = 20e6;
h_m = [0.88 -0.44 -0.18];

figure(1)
H = fft(h_m,fft_size);
plot(abs(H));
grid on;


for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    y = OFDM_tx(x,fft_size,L_cp);
    z = multipath_fading(y,h_m,SNR(n));
    x_ = OFDM_rx(z,h_m,fft_size,L_cp);
    s_ = QPSK_demapper(x_);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end
figure(2)
semilogy(SNR,BER,'o-');
hold on;


for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    y = OFDM_tx_change(x,fft_size,L_cp);
    z = multipath_fading(y,h_m,SNR(n));
    x_ = OFDM_rx_change(z,h_m,fft_size,L_cp);
    s_ = QPSK_demapper(x_);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
hold on;
grid on;


legend('QPSK with multipath','QPSK with multipath (IFFT 128)')