clear all;
close all;
clc;

% بارگذاری تصاویر
image1 = imread('image/powertest1.PNG');
image2 = imread('image/powertest2.PNG');

% تبدیل تصاویر به نوع عددی
image1 = double(image1);
image2 = double(image2);

% تعریف مقادیر گاما
gamma_values1 = [0.6, 0.4, 0.3];
gamma_values2 = [3, 4, 5];

% ایجاد زیرنویس برای تصاویر
titles1 = {'تصویر اصلی', '\gamma = 0.6', '\gamma = 0.4', '\gamma = 0.3'};
titles2 = {'تصویر اصلی', '\gamma = 3', '\gamma = 4', '\gamma = 5'};

% پردازش تصویر اول
figure;
for i = 1:length(gamma_values1)
    processed_image = (image1 .^ gamma_values1(i)) * 256;
    subplot(2, 4, i + 1);
    imshow(processed_image / max(processed_image(:)));
    title(titles1{i + 1});
end
subplot(2, 4, 1);
imshow(image1 / max(image1(:)));
title(titles1{1});

% پردازش تصویر دوم
for i = 1:length(gamma_values2)
    processed_image = (image2 .^ gamma_values2(i)) * 256;
    subplot(2, 4, i + 5);
    imshow(processed_image / max(processed_image(:)));
    title(titles2{i + 1});
end
subplot(2, 4, 5);
imshow(image2 / max(image2(:)));
title(titles2{1});