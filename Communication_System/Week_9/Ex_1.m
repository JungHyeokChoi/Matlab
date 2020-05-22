clear all;
close all;

N = 51200;
FFT_size = 64;
L_cp = 4;
Fs = 20e6;

msg = randint(1,N);
tx_sym = QPSK_mapper(msg);
tx_OFDM = OFDM_tx(tx_sym,FFT_size,L_cp);
plot_spectrum(tx_OFDM,Fs);