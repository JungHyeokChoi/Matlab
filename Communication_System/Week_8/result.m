close all;
clear all;

N = 51200;
SNR = [0:10];
fft_size = 256;
L_cp = 32;
h = 1;
h_m = [0.88 -0.44 0.11];

for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    y = OFDM_tx(x,fft_size,L_cp);
    z = AWGN(y,SNR(n));
    x_ = OFDM_rx(z,h,fft_size,L_cp);
    s_ = QPSK_demapper(x_);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
hold on;

for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    z = AWGN(x,SNR(n));
    s_ = QPSK_demapper(z);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'h-');
hold on;

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

semilogy(SNR,BER,'-');
hold on;

for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    z = multipath_fading(x,h_m,SNR(n));
    s_ = QPSK_demapper(z);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'-');
hold on;
grid on;

legend('OFDM with AWGN','QPSK with AWGN','OFDM with multipath','QPSK with multipath')