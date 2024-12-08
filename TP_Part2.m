% Elwalid Aboulaakoul
% Date : 07/12/2024
clear all
close all
clc

d = 1;
note = 60;
Fe = 8000;
d_vect = [1, 0.5, 1, 0.5, 1];
note_vect = [60, 62, 64, 65, 67];

[x1, t1] = create_note(d, note, Fe);
figure;
plot(t1, x1);
xlabel('temps (s)');
ylabel('amplitude');
title('note');



[x2, t2] = create_melody(d_vect, note_vect, Fe);
figure;
plot(t2, x2);
xlabel('temps (s)');
ylabel('amplitude');
title('melodie');

sound(x1, Fe);
pause(3);

sound(x2, Fe);

load('melody1.mat'); 
[x3, t3] = create_melody(d_vect, note_vect, Fe); 
figure;
plot(t3, x3);
xlabel('temps (s)');
ylabel('amplitude');
title('melodie');


sound(x3, Fe);


% Jouer une octave plus bas et accélérer de 50%
note_vect_dessus = note_vect - 12;  
d_vect_0.5_vite = d_vect * 0.5;     
[x2_modified, t2_modified] = create_melody(d_vect_0.5_vite, note_vect_dessus, Fe);
plot(t2_modified, x2_modified);
xlabel('temps (s)');
ylabel('amplitude');
title('mélodie modifiée (octave plus bas et accélérée)');