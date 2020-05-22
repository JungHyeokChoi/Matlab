clear all;
close all;

BER = zeros(1,10);
SNR = 0:2:20;

for n=1:length(SNR)
    N = 100000;
    en_msg = randint(1,N);
    sym = QPSK_mapper(en_msg);
    r = fading(sym,SNR(n));
    de_msg = QPSK_demapper(r);

    BER(n) = sum(abs(en_msg - de_msg))/N;
end

plot(sym,'.');

hold on;
grid on;
%%
for n=1:length(SNR)
    N = 100000;
    en_msg = randint(1,N);
    sym = QPSK_mapper(en_msg);
    r = AWGN(sym,SNR(n));
    de_msg = QPSK_demapper(r);

    BER(n) = sum(abs(en_msg - de_msg))/N;
end


semilogy(SNR,BER,'o-');