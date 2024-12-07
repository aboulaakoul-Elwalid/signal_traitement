% Elwalid Aboulaakoul
% Date : 07/12/2024
clear all
close all
clc


Fs = 8000;   
note1 = 69;  
note2 = 49;  
d1 = 1;      
d2 = 1;      


t1 = 0:1/Fs:d1-1/Fs;
t2 = 0:1/Fs:d2-1/Fs; 


signal1 = sin(2*pi*note1*t1);  
signal2 = sin(2*pi*note2*t2);  


signal = [signal1, signal2];


[Y,f] = my_FFT(signal, Fs);


figure;
plot(f, abs(Y).^2);
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
title('Module au carré de la transformée de Fourier du signal');


fc = (note1 + note2) / 2;  


H_LP = double(abs(f) < fc);  
H_HP = double(abs(f) > fc);  


Y_LP = Y .* H_LP';   
Y_HP = Y .* H_HP';   


signal_LP = my_FFTinv(Y_LP, Fs);
signal_HP = my_FFTinv(Y_HP, Fs);


figure;
subplot(2,1,1);
plot((0:length(signal_LP)-1)/Fs, signal_LP);
title('Signal filtré avec le filtre passe-bas');
xlabel('Temps (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot((0:length(signal_HP)-1)/Fs, signal_HP);
title('Signal filtré avec le filtre passe-haut');
xlabel('Temps (s)');
ylabel('Amplitude');
