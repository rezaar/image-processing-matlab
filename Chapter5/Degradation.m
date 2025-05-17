clear all
close all
clc

% خواندن تصویر اصلی
original_image = imread('image/dipbook.png');

% تنظیم پارامترهای تابع تخریب
a = 0.1;
b = 0.1;
T = 1;

% اعمال تابع تخریب
blurred_image = degradation_function(original_image, a, b, T);

% نمایش تصویر تار شده
imshow(blurred_image);
