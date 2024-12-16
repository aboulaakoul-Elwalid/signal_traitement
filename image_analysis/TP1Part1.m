% Elwalid Aboulaakoul
% Date : 16/12/2024
clear all;
close all;
clc;

X1 = ones(200,300);
figure, imshow(X1/255);

X2 = zeros(200,300);
figure, imshow(X2/255);

X3 = 0.5*zeros(200,300);
figure, imshow(X2/255);

X4 = 0.25*zeros(200,300);
figure, imshow(X2/255);

X5 = 0.75*zeros(200,300);

figure, imshow(X2/255);
X5 = 0.25 * ones(200, 300); % Fond gris clair
X5(95:104, :) = 0; % Bande horizontale noire de 10 pixels de largeur
figure, imshow(X5, [0 255]); % Affichage de l'image