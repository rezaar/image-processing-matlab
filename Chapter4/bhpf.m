clc
clear all
close all

% خواندن تصویر
img = imread('image/test.PNG');
img_gray = rgb2gray(img);

% تبدیل تصویر به دامنه فرکانس
F = fft2(double(img_gray));
F_shifted = fftshift(F);

% ایجاد فیلتر بالاگذر باتروورث
[rows, cols] = size(img_gray);
D0 = 30; % برش فرکانس
n = 2; % مرتبه فیلتر
[x, y] = meshgrid(-cols/2:cols/2-1, -rows/2:rows/2-1);
D = sqrt(x.^2 + y.^2);
H = 1 ./ (1 + (D0 ./ D).^(2*n));

% اعمال فیلتر به تصویر
G = H .* F_shifted;

% تبدیل به دامنه فضایی
G_shifted = ifftshift(G);
img_filtered = ifft2(G_shifted);
img_filtered = abs(img_filtered);

% نمایش تصویر اصلی و تصویر فیلتر شده
figure;
subplot(1, 2, 1), imshow(img_gray), title('تصویر اصلی');
subplot(1, 2, 2), imshow(img_filtered, []), title('تصویر فیلتر شده');