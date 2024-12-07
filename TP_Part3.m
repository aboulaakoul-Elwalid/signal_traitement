% Elwalid Aboulaakoul
% Date : 07/12/2024
clear all
close all
clc

Fs = 8000;      
d = 2;          
note = 69;     


[y, t] = create_note(note, Fs, d);


[Y, f] = my_FFT(y, Fs);


figure;
plot(f, abs(Y).^2);
title('Spectre de la note');
xlabel('Fréquence (Hz)');
ylabel('Module au carré de la TFD');
grid on;


note_observable = 72;
[y_observable, t_observable] = create_note(note_observable, Fs, d);
[Y_observable, f_observable] = my_FFT(y_observable, Fs);


note_non_observable = 84;
[y_non_observable, t_non_observable] = create_note(note_non_observable, Fs, d);
[Y_non_observable, f_non_observable] = my_FFT(y_non_observable, Fs);


figure;
subplot(2,1,1);
plot(f_observable, abs(Y_observable).^2);
title('Spectre de la note observable');
xlabel('Fréquence (Hz)');
ylabel('Module au carré');

subplot(2,1,2);
plot(f_non_observable, abs(Y_non_observable).^2);
title('Spectre de la note non observable');
xlabel('Fréquence (Hz)');
ylabel('Module au carré');

notes_melodie = [69, 72, 74, 77];  
durees_melodie = [2, 1, 1, 2];     

melodie = [];
for i = 1:length(notes_melodie)
    [y_note, t_note] = create_note(notes_melodie(i), Fs, durees_melodie(i));
    melodie = [melodie, y_note];
end

[Y_melodie, f_melodie] = my_FFT(melodie, Fs);
figure;
plot(f_melodie, abs(Y_melodie).^2);
title('Spectre de la mélodie');
xlabel('Fréquence (Hz)');
ylabel('Module au carré de la TFD');
grid on;
