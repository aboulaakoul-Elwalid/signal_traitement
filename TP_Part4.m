% Elwalid Aboulaakoul
% Date : 07/12/2024
clear;
clc;
close all;

Fs = 8000; 
t = 0:1/Fs:10; 


notes_x1 = [50, 55, 60, 65, 70];
x1 = 0;
for i = 1:length(notes_x1)
    x1 = x1 + sin(2*pi*notes_x1(i)*t);
end
x1 = x1 / max(abs(x1)); 
sound(x1, Fs);


notes_x2 = [72, 75, 80, 85, 90];
x2 = 0;
for i = 1:length(notes_x2)
    x2 = x2 + sin(2*pi*notes_x2(i)*t);
end
x2 = x2 / max(abs(x2)); 
sound(x2, Fs);


x = x1 + x2;
sound(x, Fs);

[X, f] = my_FFT(x, Fs);


fc = 71;
HLP = double(abs(f) < fc);
HHP = double(abs(f) > fc);


Y1 = X .* HLP;
y1 = my_FFTinv(Y1); 
sound(y1, Fs);


Y2 = X .* HHP;
y2 = my_FFTinv(Y2); 
sound(y2, Fs);


distance_x1_y1 = norm(x1 - y1);
distance_x2_y2 = norm(x2 - y2);
fprintf('distance euclidienne entre x1 et y1: %.4f\n', distance_x1_y1);
fprintf('distance euclidienne entre x2 et y2: %.4f\n', distance_x2_y2);


figure;
subplot(2, 2, 1);
plot(f, abs(my_FFT(x1, Fs)));
title('spectre de x1');
xlabel('fréquence (Hz)');
ylabel('amplitude');

subplot(2, 2, 2);
plot(f, abs(my_FFT(y1, Fs)));
title('spectre de y1');
xlabel('fréquence (Hz)');
ylabel('amplitude');

subplot(2, 2, 3);
plot(f, abs(my_FFT(x2, Fs)));
title('spectre de x2');
xlabel('fréquence (Hz)');
ylabel('amplitude');

subplot(2, 2, 4);
plot(f, abs(my_FFT(y2, Fs)));
title('spectre de y2');
xlabel('fréquence (Hz)');
ylabel('amplitude');


fc2 = 80;
HLP2 = double(abs(f) < fc2);
HHP2 = double(abs(f) > fc2);

Y1_2 = X .* HLP2;
y1_2 = my_FFTinv(Y1_2); 
sound(y1_2, Fs);


Y2_2 = X .* HHP2;
y2_2 = my_FFTinv(Y2_2); 
sound(y2_2, Fs);
