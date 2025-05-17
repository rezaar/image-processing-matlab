clc
clear all
close all

% بارگذاری تصویر
img = imread('image/bb.PNG');
img = rgb2gray(img);

% ایجاد نویز پریودیک
[rows, cols] = size(img);
[X, Y] = meshgrid(1:cols, 1:rows);
frequency = 10; % فرکانس نویز
noise = 50 * sin(2 * pi * frequency * X / cols);

% اضافه کردن نویز به تصویر
noisy_img = double(img) + noise;

% اندازه تصویر
[M, N] = size(noisy_img );

% تبدیل به دامنه فرکانس
F = fft2(double(noisy_img ));
Fshift = fftshift(F);

% ایجاد فیلتر باند-ردکننده گاوسی
D0 = 30; % فرکانس قطع
[x, y] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
D = sqrt(x.^2 + y.^2);
H = 1 - exp(-(D.^2) / (2 * (D0^2)));

% اعمال فیلتر به دامنه فرکانس
G = H .* Fshift;

% تبدیل به دامنه فضایی
Gshift = ifftshift(G);
img_filtered = ifft2(Gshift);
img_filtered = real(img_filtered);

% نمایش تصویر اصلی و تصویر فیلتر شده
figure;
subplot(1, 2, 1);
imshow(uint8(noisy_img ));
title('تصویر اصلی');

subplot(1, 2, 2);
imshow(uint8(img_filtered));
title('تصویر فیلتر شده');