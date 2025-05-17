clc
clear all
close all

% بارگذاری تصویر
img = imread('image/test.PNG');
img_gray = rgb2gray(img);

% تبدیل تصویر به دامنه فرکانس
img_freq = fft2(double(img_gray));
img_freq_shifted = fftshift(img_freq);

% تعریف فیلتر High-Boost
alpha = 1.5; % ضریب تقویت
H = fspecial('gaussian', 5, 1); % فیلتر گوسی
H_freq = fft2(H, size(img_gray, 1), size(img_gray, 2));
H_freq_shifted = fftshift(H_freq);

% فیلتر کردن تصویر
img_filtered_freq = (1 + alpha) * img_freq_shifted - alpha * H_freq_shifted .* img_freq_shifted;

% تبدیل به دامنه فضایی
img_filtered = ifft2(ifftshift(img_filtered_freq));
img_filtered = uint8(real(img_filtered));

% نمایش تصویر اصلی و تصویر فیلتر شده
figure;
subplot(1, 2, 1), imshow(img_gray), title('تصویر اصلی');
subplot(1, 2, 2), imshow(img_filtered), title('تصویر فیلتر شده با High-Boost');