function [Y,f]=my_FFT(y,Fs)
%% Cette fonction calcule la transformee de Fourier discrete grace a une FFT
% ENTREES
% y : signal originel
% Fs : frequence d'echantillonnage
% SORTIES
% Y : transformee de Fourier discrete
% f : vecteur de frequences

NFFT=length(y);
f=(0:NFFT-1)'*Fs/NFFT;
f(f>=Fs/2)=f(f>=Fs/2)-Fs;
f=fftshift(f);
Y=fftshift(fft(y,NFFT));
