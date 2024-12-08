function [y]=my_FFTinv(Y)
%% Cette fonction calcule la transformee de Fourier discrete inverse grace a une FFT
% ENTREES
% Y : transformee de Fourier discrete
% SORTIES
% y : signal dans le domaine temporel

Y=ifftshift(Y);
y=ifft(Y);