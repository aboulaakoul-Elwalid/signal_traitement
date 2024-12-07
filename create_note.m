% Elwalid Aboulaakoul
% Date : 07/12/2024
clear all
close all
clc

function [x, t] = create_note(d, note, fs)
    n = round(fs * d);
    t = (0:n-1) / fs;
    if note >= 0
        f_note = 440 * 2^((note - 69) / 12);
        x = sin(2 * pi * f_note * t);
    else
        x = zeros(1, n);
    end
end