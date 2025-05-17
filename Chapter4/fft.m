clear all
close all
clc
%فراخانی تصویر
i = imread("image/fft.png");
i = rgb2gray(i);
%تبدیل فوریه
F = fft2(i);
F_shiftes = fftshift(F);
%تبدیل لگاریتمی با C = 0.5 
E=(0.5*log(1+(F_shiftes)))*256;
%نمایش تصاویر
subplot (1,2,1);
imshow (i);
title ('orginal image');
subplot (1,2,2);
imshow (E,[]);
title('Fourier Transform');