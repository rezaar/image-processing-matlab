clc
clear all
close all

% بارگذاری تصویر
img = imread('image/bb.PNG');
img = rgb2gray(img);

% ایجاد نویز پریودیک
[rows, cols] = size(img);
[X, Y] = meshgrid(1:cols, 1:rows);
frequency = 10; % فرکانس نویز
noise = 50 * sin(2 * pi * frequency * X / cols);

% اضافه کردن نویز به تصویر
noisy_img = double(img) + noise;

% نمایش تصویر اصلی و تصویر با نویز
figure;
subplot(1, 2, 1);
imshow(img);
title('تصویر اصلی');

subplot(1, 2, 2);
imshow(uint8(noisy_img));
title('تصویر با نویز پریودیک');