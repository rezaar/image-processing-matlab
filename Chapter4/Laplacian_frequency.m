clc;
clear all;
close all;

% بارگذاری تصویر
img = imread('image/moon.PNG');
img_gray = rgb2gray(img);

% تبدیل تصویر به دامنه فرکانس
img_fft = fft2(double(img_gray));
img_fft_shifted = fftshift(img_fft);

% ایجاد فیلتر لاپلاسیان
[h, w] = size(img_gray);
[x, y] = meshgrid(-floor(w/2):floor((w-1)/2), -floor(h/2):floor((h-1)/2));
laplacian_filter = -4 * (pi^2) * (x.^2 + y.^2);

% اعمال فیلتر لاپلاسیان
filtered_fft = img_fft_shifted .* laplacian_filter;

% تبدیل به دامنه فضایی
filtered_img = ifft2(ifftshift(filtered_fft));
filtered_img = real(filtered_img);

% جمع کردن تصویر اصلی و تصویر فیلتر شده
sharpened_img = double(img_gray) + filtered_img;

% نمایش تصاویر
figure;
subplot(1, 3, 1), imshow(img_gray), title('تصویر اصلی');
subplot(1, 3, 2), imshow(filtered_img, []), title('تصویر فیلتر شده');
subplot(1, 3, 3), imshow(sharpened_img, []), title('تصویر تیز شده');
