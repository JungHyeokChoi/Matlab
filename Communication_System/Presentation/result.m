clear all;
close all;

BER = zeros(1,10);
N = 99999;
SG = 2;
SNR = [0:2:20];
idx = 1;

for n=1:length(SNR)
    en_msg = randint(1,N);
    sym = EPSK_mapper(en_msg);
    PN_spread = PN_sp(sym,SG,idx);
    r = AWGN(PN_spread,SNR(n));
    PN_despread = PN_desp(r,SG,idx);
    de_msg = EPSK_demapper(PN_despread);

    err_count = sum(abs(en_msg-de_msg));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
grid on;
