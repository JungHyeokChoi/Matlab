clear all;
close all;

BER = zeros(1,10);

for SNR=1:10
    N = 100000;
    en_msg = randint(1,N);
    sym = QPSK_mapper(en_msg);
    r = AWGN(sym,SNR);
    de_msg = QPSK_demapper(r);
    
    BER(SNR) = sum(abs(en_msg - de_msg))/N;
end

semilogy(BER,'o-')
