%% COMPUTE THE NORMALIZED CROSS-CORRELATION OF TWO AUDIO FILES
%% Measuring Signal Similarities
% https://www.mathworks.com/help/signal/ug/measuring-signal-similarities.html
[x1,fs1]=audioread("D:\BackupData\3rdYear2021\29.Paper5\ValmetDataset\Experiment21Sept27\Valmet_Ori_Gen_2class_Sept27\Break\fault_65.wav");
[x2,fs2]=audioread("D:\BackupData\3rdYear2021\29.Paper5\ValmetDataset\Experiment21Sept27\Valmet_Ori_Gen_2class_Sept27\Break\032.wav");

x1 = x1(:, 1);
N1 = length(x1);                      % signal length
t1 = (0:N1-1)/fs1; 

x2 = x2(:, 1);                        % get the first channel
N2 = length(x2);                      % signal length
t2 = (0:N2-1)/fs2;     

figure
ax(1) = subplot(3,1,1);
plot(t1*1000, x1, 'b')
xlim([0 max(t1)*1000])
ylim([-1.1*max(abs(x1)) 1.1*max(abs(x1))])
ylabel('Original sound')
grid on

ax(2) = subplot(3,1,2); 
plot(t2*1000, x2, 'b')
xlim([0 max(t2)*1000])
ylim([-1.1*max(abs(x2)) 1.1*max(abs(x2))])
ylabel('Synthesized sound')
grid on

xlabel('Time (secs)')

%% Different lengths prevent you from calculating the difference between two signals but this can easily be remedied by extracting the common part of signals. Furthermore, it is not always necessary to equalize lengths. 
samples = 1:min(length(x1),length(x2));

%% cross-correlate signal 1 to signal 2
[C1,lag1] = xcorr(x1(samples),x2(samples));            

subplot(3,1,3), plot(lag1/fs1,C1);
ylabel('Amplitude')
grid on
title('Cross-correlation between the original sound and the synthesized sound')
xlabel('Time(secs)') 

%% 
[~,I] = max(abs(C1));
SampleDiff = lag1(I)

%% The peak of the cross correlation implies that the signal is present in template T2 starting after 61 ms. In other words, signal T2 leads signal S by 499 samples as indicated by SampleDiff. This information can be used to align the signals.
timeDiff = SampleDiff/fs1

%% Comparing the Frequency Content of Signals
[x1,fs1]=audioread("D:\BackupData\3rdYear2021\29.Paper5\ValmetDataset\Experiment21Sept27\Valmet_Ori_Gen_2class_Sept27\Break\fault_65.wav");
[x2,fs2]=audioread("D:\BackupData\3rdYear2021\29.Paper5\ValmetDataset\Experiment21Sept27\Valmet_Ori_Gen_2class_Sept27\Break\032.wav");

[P1,f1] = periodogram(x1,[],[],fs1,'power');
[P2,f2] = periodogram(x2,[],[],fs2,'power');

samples = 1:min(length(x1),length(x2));

figure
t = (0:numel(x2)-1)/fs2;
subplot(2,2,1)
plot(t,x1(samples),'k')
ylabel('Original sound - Amplitude')
grid on
title('Time Series')

subplot(2,2,3)
plot(t,x2)
ylabel('Synthesized sound - Amplitude')
grid on
xlabel('Time (secs)')

subplot(2,2,2)
plot(f1,P1,'k')
ylabel('Original sound - Power (dB)')
grid on
axis tight
title('Power Spectrum')

subplot(2,2,4)
plot(f2,P2)
ylabel('Synthesized sound - Power (dB)')
grid on
axis tight
xlabel('Frequency (Hz)')

%% The mscohere function calculates the spectral coherence between the two signals. It confirms that sig1 and sig2 have two correlated components around 35 Hz and 165 Hz. In frequencies where spectral coherence is high, the relative phase between the correlated components can be estimated with the cross-spectrum phase.
[Cxy,f] = mscohere(x1(samples),x2(samples),[],[],[],fs1);
Pxy = cpsd(x1(samples),x2(samples),[],[],[],fs1);
phase = -angle(Pxy)/pi*180;
[pks,locs] = findpeaks(Cxy,'MinPeakHeight',0.05);

figure
subplot(2,1,1)
plot(f,Cxy)
title('Coherence Estimate')
grid on
hgca = gca;
hgca.XTick = f(locs);
hgca.YTick = 0.05;
axis([0 10000 0 1])
subplot(2,1,2)
plot(f,phase)
title('Cross-spectrum Phase (deg)')
grid on

hgca = gca;
hgca.XTick = f(locs); 
hgca.YTick = round(numel(phase(locs)));
xlabel('Frequency (Hz)')
axis([0 10000 -180 180])
