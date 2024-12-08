% Elwalid Aboulaakoul
% Date : 07/12/2024
clear all
close all
clc

Fe = 8000;      
d = 2;          
note = 69;     


[y, t] = create_note(note, Fe, d);


[Y, f] = my_FFT(y, Fe);


figure;
plot(f, abs(Y).^2);
title('spectre de la note');
xlabel('fréquence (Hz)');
ylabel('module au carré de la TFD');
grid on;

notes_melodie = [69, 72, 74, 77];  
durees_melodie = [1.8, 1, 1.4, 2];     

melodie = [];
for i = 1:length(notes_melodie)
    [y_note, t_note] = create_note(notes_melodie(i), Fe, durees_melodie(i));
    melodie = [melodie, y_note];
end

[Y_melodie, f_melodie] = my_FFT(melodie, Fe);
figure;
plot(f_melodie, abs(Y_melodie).^2);
title('Spectre de la mélodie');
xlabel('Fréquence (Hz)');
ylabel('Module au carré de la TFD');
grid on;
