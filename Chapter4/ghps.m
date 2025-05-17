clc
clear all
close all

% بارگذاری تصویر
img = imread('image/test.PNG');
img_gray = rgb2gray(img);

% تبدیل تصویر به حوزه فرکانس
F = fft2(double(img_gray));
F_shifted = fftshift(F);

% ایجاد فیلتر Gaussian high-pass
[M, N] = size(img_gray);
D0 = 30; % پارامتر فیلتر
[x, y] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
D = sqrt(x.^2 + y.^2);
H = 1 - exp(-(D.^2) / (2 * (D0^2)));

% اعمال فیلتر به تصویر
G = H .* F_shifted;

% تبدیل به حوزه فضایی
g_shifted = ifftshift(G);
img_filtered = ifft2(g_shifted);
img_filtered = uint8(real(img_filtered));

% نمایش تصویر اصلی و تصویر فیلتر شده
figure;
subplot(1, 2, 1), imshow(img_gray), title('تصویر اصلی');
subplot(1, 2, 2), imshow(img_filtered), title('تصویر فیلتر شده');