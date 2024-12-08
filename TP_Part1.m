% Elwalid Aboulaakoul
% Date : 07/12/2024
clear all
close all
clc

Fe = 44100; 
d = 2;      
frequencies = [300, 600, 900, 1200];
N = ceil(Fe * d);
t = (0:N-1)' / Fe;
fprintf('Les 10 premières valeurs du vecteur temp t[n] :\n');
disp(t(1:10)); 
fs = 8000;
f0 = 800;
d = 2;
n = ceil(fs * d);
t = (0:n-1)' / fs;
xn = sin(2 * pi * f0 * t);
m0 = fs / f0;
fprintf('la période fondamentale m0 du signal est de %.0f échantillons.\n', m0);
xn1 = xn(1:m0);
xn2 = xn(m0+1:2*m0);
d = sqrt(sum((xn1 - xn2).^2));
fprintf('distance euclidienne entre deux périodes : %.2e.\n', d);

d_long = 1000;
n_long = ceil(fs * d_long);
t_long = (0:n_long-1)' / fs;
xn_long = sin(2 * pi * f0 * t_long);
ex = sum(xn_long.^2) / fs;
px = mean(xn_long.^2);
fprintf('énergie totale Ex : %.2f\n', ex);
fprintf('puissance moyenne totale Px : %.2f\n', px);
px_periodic = sum(xn1.^2) / (fs * m0);
fprintf('puissance moyenne (définition périodique) : %.2f\n', px_periodic);

f_min = 2 * f0;
fprintf('la fréquence minimale selon nyquist est de %.0f hz.\n', f_min);
fs_values = [4000, 8000, 16000]; 

for fs_test = fs_values
    t_test = (0:ceil(fs_test * d) - 1)' / fs_test;
    xn_test = sin(2 * pi * f0 * t_test);
    fprintf('test pour fs = %.0f hz\n', fs_test);
    sound(xn_test, fs_test);
    pause(3);
end

xn_800 = sin(2 * pi * 800 * t);
xn_7200 = sin(2 * pi * 7200 * t);
fprintf('écoute des signaux avec f0 = 800 hz et f0 = 7200 hz.\n');
sound(xn_800, fs);
pause(3);
sound(xn_7200, fs);
fprintf('les signaux de f0 = 800 hz et f0 = 7200 hz ont la même fréquence apparente en raison de l aliasing.\n');


for f0 = frequencies
    x = sin(2 * pi * f0 * t); 
    T0 = 1 / f0; 
    t_plot = t(t <= 4 * T0); 
    x_plot = x(1:length(t_plot)); 

    figure;
    plot(t_plot, x_plot);
    title(['Signal échantillonné X(n)(t) pour f_0 = ', num2str(f0), ' Hz sur [0, 4T0]']);
    xlabel('temps (s)');
    ylabel('amplitude');
    xlim([0, 4 * T0]);
    ylim([-1, 1]);

    sound(x, Fe); 
    pause(d + 1); 
end
