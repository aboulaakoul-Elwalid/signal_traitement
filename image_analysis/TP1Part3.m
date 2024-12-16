% Elwalid Aboulaakoul
% Date : 16/12/2024

clear; 
close all;
clc;


Z = imread('cameraman.tif');
Z = double(Z) / 255;
[M, N] = size(Z);
disp(['taille de l image : ', num2str(M), ' lignes et ', num2str(N), ' colonnes'])

x_sous = 1:2:M;
y_sous = 1:2:N;
Z_sous = Z(x_sous, y_sous);
figure; imshow(Z_sous, []); title('image 2 fois plus petite')
%%l'image est plus petite car seuls certains pixels sont conservés 
% (1 sur 2 en lignes et colonnes). cela peut provoquer une perte de qualité 
% (effet d'aliasing).

x_sur = repmat(1:M, 2, 1);
x_sur = x_sur(:);          
y_sur = repmat(1:N, 2, 1); 
y_sur = y_sur(:);          

Z_sur = Z(x_sur, y_sur);

figure; imshow(Z_sur, []); title('Image sur-échantillonnée');
%%l'image semble plus grande, mais elle contient des répétitions de pixels. 
% cela entraîne une image plus "pixellisée" sans ajout de nouvelles informations.


M = 200; N = 300; dx = 0.05; dy = 0.05;
x = 0:dx:(M-1)*dx;
y = 0:dy:(N-1)*dy;
[X, Y] = ndgrid(x, y);
Z1 = 0.5 + 0.5 * cos(2 * pi * (3 * X + 4 * Y));
figure; imshow(Z1, []); title('image z1')

disp('image z1')

new_dx = 0.3; new_dy = 0.3;
x = 0:new_dx:(M-1)*new_dx;
y = 0:new_dy:(N-1)*new_dy;
[X, Y] = ndgrid(x, y);
Z1_varied = 0.5 + 0.5 * cos(2 * pi * (3 * X + 4 * Y));
figure; imshow(Z1_varied, []); title('image z1 avec dx=0.3 et dy=0.3')

disp('variation de dx et dy terminee')








