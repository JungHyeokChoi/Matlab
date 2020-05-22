clear all;
close all;

N = 200000;
SNR = [-10:10];
%%
for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    z = AWGN(x,SNR(n));
    s_ = QPSK_demapper(z);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
grid on;
hold on;
%%
SG = 8;
idx = 2;

for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    y = hadamard_sp(x,SG,idx);
    z = AWGN(y,SNR(n));
    x_ = hadamard_desp(z,SG,idx);
    s_ = QPSK_demapper(x_);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
grid on;
hold on;
%%
for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    y = PN_sp(x,SG,idx);
    z = AWGN(y,SNR(n));
    x_ = PN_desp(z,SG,idx);
    s_ = QPSK_demapper(x_);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'x-');
grid on;
hold on;
%%
SG = 16;

for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    y = hadamard_sp(x,SG,idx);
    z = AWGN(y,SNR(n));
    x_ = hadamard_desp(z,SG,idx);
    s_ = QPSK_demapper(x_);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'o-');
grid on;
hold on;


for n=1:length(SNR)
    s = randint(1,N);
    x = QPSK_mapper(s);
    y = PN_sp(x,SG,idx);
    z = AWGN(y,SNR(n));
    x_ = PN_desp(z,SG,idx);
    s_ = QPSK_demapper(x_);
    
    err_count = sum(abs(s-s_));
    BER(n) = err_count/N;
end

semilogy(SNR,BER,'x-');
grid on;
hold on;

legend('QPSK without spreading','QPSK with hadamard(SG = 8)','QPSK with PN(SG = 8)','QPSK with hadamard(SG = 16)','QPSK with PN(SG = 16)')
