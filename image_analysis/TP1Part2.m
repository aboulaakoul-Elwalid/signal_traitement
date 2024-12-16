% Elwalid Aboulaakoul
% Date : 16/12/2024

clear; 
close all;
clc;

Y1= imread('cameraman.tif');
Y1 = double(Y1);
taille_Y1 =size(Y1);
bits = 8; 
disp(['taille: ', num2str(taille_Y1)]);
disp(['Bits: ', num2str(bits)]);
figure, imshow(Y1/255);
title('image Y1');


histogramme = zeros(1, 256);
for i = 1:taille_Y1(1)
    for j = 1:taille_Y1(2)
        valeur_pixel = Y1(i, j);
        histogramme(valeur_pixel + 1) = histogramme(valeur_pixel + 1) + 1;
    end
end
figure;
bar(0:255, histogram);
title('l’histogramme de l’image Y 1');
xlabel('niveau de gris');
ylabel('nombre des pixels');

Y2 = Y1 - 10;
Y2(Y2 < 0) = 0;
figure, imshow(Y2 / 255);
title('image Y2 assombrie');

histogram_Y2 = zeros(1, 256);
for i = 1:taille_Y1(1)
    for j = 1:taille_Y1(2)
        valeur_pixel = Y2(i, j);
        histogram_Y2(valeur_pixel + 1) = histogram_Y2(valeur_pixel + 1) + 1;
    end
end
figure;
bar(0:255, histogram_Y2);
title('histogramme de l’image Y2');
xlabel('niveau de gris');
ylabel('nombre de pixels');
%% je remarque que l'histogramme de l'image Y2 est décalé vers la gauche par rapport à l'histogramme Y1


Y3 = floor(Y1 / 4);
figure, imshow(Y3 / 63);
title('image Y3 quantifi´ee sur 6 bits');
histogram_Y3 = zeros(1, 256);
for i = 1:taille_Y1(1)
    for j = 1:taille_Y1(2)
        valeur_pixel = Y3(i, j);
        histogram_Y3(valeur_pixel + 1) = histogram_Y3(valeur_pixel + 1) + 1;
    end
end
figure;
bar(0:255, histogram_Y3);
title('histogramme de l’image Y3');
xlabel('niveau de gris');
ylabel('nombre de pixels');

%% je remarque que l'histogramme de l'image Y3 est décalé vers la gauche par rapport à l'histogramme Y1


Y4 = floor(Y1 / 16) * 16;

figure, imshow(Y4 / 255);
title('image Y4 quantifiée sur 4 bits');
histogram_Y4 = zeros(1, 256);
for i = 1:taille_Y1(1)
    for j = 1:taille_Y1(2)
        valeur_pixel = Y3(i, j);
        histogram_Y3(valeur_pixel + 1) = histogram_Y3(valeur_pixel + 1) + 1;
    end
end
figure;
bar(0:255, histogram_Y4);
title('histogramme de l’image Y4');
xlabel('niveau de gris');
ylabel('nombre de pixels');
%% je remarque que l'histogramme de l'image Y4 est décalé vers la gauche par rapport à l'histogramme Y3
%% l image Y4 est plus claire que l'image Y3


Y1_normalize = double(Y1) / 255;
Y4_normalize = double(Y4) / 255;
D4 = abs(Y4_normalize - Y1_normalize);
figure, imshow(D4);
title('Différence D4 = |Y4 - Y1|');
%% je remarque que l'image D4 est plus claire que l'image Y1
% et l'histogramme je remarque qu'il est devenue stable comme une ligne horizontale dont l'amplitudeest null
%% on perd la precision de l'image en quantifiant l'image Y1,plus en quantifiant l'image plus on perd la precision de l'image
