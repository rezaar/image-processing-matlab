clear;
clc;

% بارگذاری تصویر
img = imread('image/bittest.PNG');
img_gray = rgb2gray(img);

% تبدیل تصویر به باینری
img_bin = dec2bin(img_gray);

% تعداد بیت‌ها
num_bits = size(img_bin, 2);

% برش بیت‌سطح
for i = 1:num_bits
    bit_plane = img_bin(:, i) - '0'; % تبدیل به عدد
    bit_plane = reshape(bit_plane, size(img_gray)); % تغییر شکل به تصویر
    figure, imshow(bit_plane);
    title(['بیت‌سطح ', num2str(i)]);
end