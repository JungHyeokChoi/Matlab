close all;
clear all;

N = 200000;
SNR = [-12:-2];
SG = 16;

for n=1:length(SNR)
    s1 = randint(1,N);
    s2 = randint(1,N);
    x1 = QPSK_mapper(s1);
    x2 = QPSK_mapper(s2);
    y1 = hadamard_sp(x1,SG,3);
    y2 = hadamard_sp(x2,SG,4);
    y2 = delay(y2,1);
    y = y1 + y2;
    z = AWGN(y,SNR(n));
    x_ = hadamard_desp(z,SG,3);
    s_ = QPSK_demapper(x_);
    
    err_count = sum(abs(s1-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
grid on;
hold on;

for n=1:length(SNR)
    s1 = randint(1,N);
    s2 = randint(1,N);
    x1 = QPSK_mapper(s1);
    x2 = QPSK_mapper(s2);
    y1 = PN_sp(x1,SG,3);
    y2 = PN_sp(x2,SG,4);
    y2 = delay(y2,1);
    y = y1 + y2;
    z = AWGN(y,SNR(n));
    x_ = PN_desp(z,SG,3);
    s_ = QPSK_demapper(x_);
    
    err_count = sum(abs(s1-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
legend('hadamard','PN');

