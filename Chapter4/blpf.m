clc
clear all
close all

% بارگذاری تصویر
img = imread('image/test.PNG');
img_gray = rgb2gray(img);

% تعریف پارامترهای فیلتر
D0 = 30; % فرکانس قطع
[n, m] = size(img_gray);
[U, V] = meshgrid(-m/2:m/2-1, -n/2:n/2-1);
D = sqrt(U.^2 + V.^2);

% محاسبه فیلتر باترورث
n_order = 2; % مرتبه فیلتر
H = 1 ./ (1 + (D ./ D0).^(2*n_order));

% تبدیل تصویر به دامنه فرکانس
F = fftshift(fft2(img_gray));

% اعمال فیلتر
G = H .* F;

% تبدیل به دامنه فضایی
img_filtered = ifft2(ifftshift(G));
img_filtered = real(img_filtered);

% نمایش تصویر اصلی و تصویر فیلتر شده
figure;
subplot(1, 2, 1), imshow(img_gray), title('تصویر اصلی');
subplot(1, 2, 2), imshow(img_filtered, []), title('تصویر فیلتر شده');