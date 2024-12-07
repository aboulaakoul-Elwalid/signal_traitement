% Elwalid Aboulaakoul
% Date : 07/12/2024
clear all
close all
clc

fs = 8000;
d_vect = [1, 0.5, 1, 0.5, 1];
note_vect = [60, 62, 64, 65, 67];

[x, t] = create_melody(d_vect, note_vect, fs);

plot(t, x);
xlabel('temps (s)');
ylabel('amplitude');
title('melodie');

sound(x, fs);
