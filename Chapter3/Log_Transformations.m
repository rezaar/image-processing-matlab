clear all
close all
clc

i = imread('image/logtest.png');
i = double(i); % تبدیل تصویر به نوع عددی

l = (1 * log(1 + i)) * 256; % استفاده از تصویر به جای e

subplot(121)
imshow(i / 255) % نمایش تصویر اصلی
title('Original Image')

subplot(122)
imshow(l / max(l(:))) % نرمال‌سازی تصویر لگاریتمی
title('Log Transformations')
