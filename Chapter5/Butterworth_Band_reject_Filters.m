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

% تبدیل تصویر به دامنه فرکانس
F = fft2(double(noisy_img));
F_shifted = fftshift(F);

% ایجاد فیلتر باند-رد باتروورث
[rows, cols] = size(noisy_img);
crow = round(rows/2);
ccol = round(cols/2);
D0 = 40; % فرکانس قطع
n = 5; % مرتبه فیلتر
[x, y] = meshgrid(1:cols, 1:rows);
D = sqrt((x - ccol).^2 + (y - crow).^2);
H = 1 ./ (1 + (D0 ./ D).^(2*n));

% اعمال فیلتر به دامنه فرکانس
F_filtered = F_shifted .* H;

% تبدیل به دامنه فضایی
img_filtered = ifft2(ifftshift(F_filtered));
img_filtered = real(img_filtered);

% نمایش تصویر اصلی و تصویر فیلتر شده
figure;
subplot(1, 2, 1);
imshow(uint8(noisy_img));
title('تصویر اصلی');

subplot(1, 2, 2);
imshow(img_filtered, []);
title('تصویر فیلتر شده');