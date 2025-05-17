clc;
clear all;
close all;
%فراخانی تصویر
I = imread("image/notch.png");
I = rgb2gray(I);
%تبدیل فوریه
F = fft2(I);
Fshift = fftshift(F);
% ایجاد فیلتر ناچ
[M , N] = size(F);
H = ones(M , N);
D0 = 0; %شعاع دایره فیلتر ناچ
u0 = 0; v0 = 0; %مرکز دایره فیلتر ناچ
[U , V] = meshgrid(-N/2:N/2-1 , -M/2:M/2-1);
D = sqrt((U-u0).^2+(V-v0).^2);
H(D<=D0) = 0;
H(M/2+1-D <= D0) = 0; % برای حذف نویز در فرکانس قرینه
H(D+M/2+1 <= D0) = 0;
H(M/2+1-D+M/2+1 <= D0) = 0;
% اعمال فیلتر
Gshift = Fshift .* H;
G = ifftshift(Gshift);
g = ifft2(G);
E=(0.5*log(1+(Fshift)))*256;
% نمایش تصاویر
subplot (1,3,1);
imshow (I);
title ('orginal image');
subplot (1,3,2);
imshow (uint8(abs(g)));
title('notch fillter');
subplot (1,3,3);
imshow (E,[]);
title('notch fillter');