clc
clear all
close all

% بارگذاری تصویر
img = imread('image/test.png');
img_gray = rgb2gray(img);

% تبدیل تصویر به دامنه فرکانس
F = fft2(double(img_gray));
F_shifted = fftshift(F);

% ایجاد فیلتر پایین‌گذر گاوسی
[M, N] = size(img_gray);
D0 = 50; % شعاع فیلتر
[x, y] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
D = sqrt(x.^2 + y.^2);
H = exp(-(D.^2) / (2 * D0^2));

% اعمال فیلتر به تصویر
G = H .* F_shifted;
G_ishifted = ifftshift(G);
img_filtered = ifft2(G_ishifted);

% نمایش تصویر اصلی و تصویر فیلتر شده
figure;
subplot(1, 2, 1), imshow(img_gray), title('تصویر اصلی');
subplot(1, 2, 2), imshow(abs(img_filtered), []), title('تصویر فیلتر شده با فیلتر پایین‌گذر گاوسی');
