close all;
clear all;

SNR = [0:2:30];
fft_size = 256;
idx = 2;

N = 512;
L_cp = 14;
SG = 1;

for n=1:length(SNR)
    err_count = 0;
    for i=1:100000
        msg = randint(1,N);
        QPSK_map = QPSK_mapper(msg);
        PN_spread = PN_sp(QPSK_map,SG,idx);
        OFDM_t = OFDM_tx(PN_spread,fft_size,L_cp);
        
        h = [0.73 0.52 0.37 0.22].*(randn(1,4) + 1j*randn(1,4));
        channel = multipath_fading(OFDM_t,h,SNR(n));
            
        OFDM_r = OFDM_rx(channel,h,fft_size,L_cp);
        PN_despread = PN_desp(OFDM_r,SG,idx);
        msg_ = QPSK_demapper(PN_despread);
        
        current_err_count = sum(abs(msg-msg_));
        err_count = err_count + current_err_count;
    end
    BER(n) = err_count/100000/512;
end

semilogy(SNR,BER,'o-');
hold on;

%% SG = 16 CP = 1 Channel = Multipath fading

N = 32;
SG = 16;
L_cp = 1;

for n=1:length(SNR)
    err_count = 0;
    for i=1:100000
        msg = randint(1,N);
        QPSK_map = QPSK_mapper(msg);
        PN_spread = PN_sp(QPSK_map,SG,idx);
        OFDM_t = OFDM_tx(PN_spread,fft_size,L_cp);
        
        h = [0.73 0.52 0.37 0.22].*(randn(1,4) + 1j*randn(1,4));
        channel = multipath_fading(OFDM_t,h,SNR(n));
            
        OFDM_r = OFDM_rx(channel,h,fft_size,L_cp);
        PN_despread = PN_desp(OFDM_r,SG,idx);
        msg_ = QPSK_demapper(PN_despread);
        
        current_err_count = sum(abs(msg-msg_));
        err_count = err_count + current_err_count;
    end
    BER(n) = err_count/100000/32;
end

semilogy(SNR,BER,'o-');
hold on;

%% SG = 16 CP = 14 Channel = Multipath fading
N = 32;
SG = 16;
L_cp = 14;

for n=1:length(SNR)
    err_count = 0;
    for i=1:100000
        msg = randint(1,N);
        QPSK_map = QPSK_mapper(msg);
        PN_spread = PN_sp(QPSK_map,SG,idx);
        OFDM_t = OFDM_tx(PN_spread,fft_size,L_cp);
        
        h = [0.73 0.52 0.37 0.22].*(randn(1,4) + 1j*randn(1,4));
        channel = multipath_fading(OFDM_t,h,SNR(n));
            
        OFDM_r = OFDM_rx(channel,h,fft_size,L_cp);
        PN_despread = PN_desp(OFDM_r,SG,idx);
        msg_ = QPSK_demapper(PN_despread);
        
        current_err_count = sum(abs(msg-msg_));
        err_count = err_count + current_err_count;
    end
    BER(n) = err_count/100000/32;
end

semilogy(SNR,BER,'o-');
xlabel('SNR(dB)');
ylabel('BER');
hold on;
grid on;

legend('SG = 1, CP = 14','SG = 16, CP = 1', 'SG = 16 CP = 14');
