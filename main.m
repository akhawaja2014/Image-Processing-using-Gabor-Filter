% Gabor Filtering
% Yunke Li,MSCV 1
clc;clearvars;close all;
size = 	31;
lambda = 4;
psi = 0;
theta = 3*pi/4;
sigma = 3;
gamma = 0.5;
G = Gabor_Kernel(size,lambda,theta,psi,sigma,gamma);
x = linspace(-(size-1)/2,(size-1)/2,size);
y = linspace(-(size-1)/2,(size-1)/2,size);
figure(1);
surf(x,y,real(G))
colorbar
title('Gabor filter:real component');
xlabel('x');
ylabel('y');
zlabel('z');
figure(2);
surf(x,y,imag(G))
colorbar
title('Gabor filter:imaginary component');
xlabel('x');
ylabel('y');
zlabel('z');
colorbar

I_lines = rgb2gray(imread('lines.png'));
I_filtered = filter2(G,I_lines);
figure
subplot(1,2,1),imshow(I_lines,[]);
subplot(1,2,2),imshow(I_filtered,[]);

I = imread('lena.png');
I_filtered = filter2(G,I);
figure,imshow(I_filtered,[]);
subplot(1,2,1),imshow(I,[]);
subplot(1,2,2),imshow(I_filtered,[]);

G1 = Gabor_Kernel(size,lambda,0,psi,sigma,gamma);      % theta = 0
G2 = Gabor_Kernel(size,lambda,pi/4,psi,sigma,gamma);   % theta = pi/4
G3 = Gabor_Kernel(size,lambda,pi/2,psi,sigma,gamma);   % theta = pi/2
G4 = Gabor_Kernel(size,lambda,3*pi/4,psi,sigma,gamma); % theta = 3*pi/4
I = imread('cameraman.tif');
figure,imshow(I,[]);
I_filtered1 = real(filter2(G1,I));
I_filtered2 = real(filter2(G2,I));
I_filtered3 = real(filter2(G3,I));
I_filtered4 = real(filter2(G4,I));
figure
subplot(2,2,1),imshow(I_filtered1,[]);
subplot(2,2,2),imshow(I_filtered2,[]);
subplot(2,2,3),imshow(I_filtered3,[]);
subplot(2,2,4),imshow(I_filtered4,[]);

I_add =I_filtered1 + I_filtered2 + I_filtered3 + I_filtered4;
figure,imshow(I_add,[]);


