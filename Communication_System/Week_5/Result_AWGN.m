clear all;
close all;

N = 200000;
SNR = 0:10;
R = 1;

for n=1:length(SNR)
    msg = randint(1,N);
    x = FEC_enc(msg,R);
    y = QPSK_mapper(x);
    
    z = AWGN(y,SNR(n));
    
    x_ = QPSK_demapper(z);
    msg_ = FEC_dec(x_,R);
    
    err_count = sum(abs(msg-msg_));
    BER(n) = err_count/N;
end

plot(z,'.')

semilogy(SNR,BER,'o-');
hold on;
grid on;

R = 3;

for n=1:length(SNR)
    msg = randint(1,N);
    x = FEC_enc(msg,R);
    y = QPSK_mapper(x);
    
    z = AWGN(y,SNR(n));
    
    x_ = QPSK_demapper(z);
    msg_ = FEC_dec(x_,R);
    
    err_count = sum(abs(msg-msg_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
hold on;

R = 5;

for n=1:length(SNR)
    msg = randint(1,N);
    x = FEC_enc(msg,R);
    y = QPSK_mapper(x);
    
    z = AWGN(y,SNR(n));
    
    x_ = QPSK_demapper(z);
    msg_ = FEC_dec(x_,R);
    
    err_count = sum(abs(msg-msg_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
legend('R = 1','R = 3','R = 5');
title('AWGN');