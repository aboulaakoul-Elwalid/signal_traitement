% Elwalid Aboulaakoul
% Date : 07/12/2024
clear all
close all
clc
function [x, t] = create_melody(d_vect, note_vect, fs)
    x = [];
    t = [];
    for i = 1:length(note_vect)
        [note_signal, note_t] = create_note(d_vect(i), note_vect(i), fs);
        x = [x, note_signal];
        t = [t, note_t + (i-1)*d_vect(i)];
    end
end
