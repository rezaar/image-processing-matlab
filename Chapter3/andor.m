clc
clear all
close all

% بارگذاری تصاویر خاکستری
img = imread('image/andor.png');
and_mask = imread('image/andmask.png');
or_mask = imread('image/ormask.png');

% تبدیل تصاویر به خاکستری
grayImg = rgb2gray(img);
grayand = rgb2gray(and_mask);
grayor = rgb2gray(or_mask);

% تغییر اندازه ماسک‌ها به اندازه تصویر اصلی
grayand = imresize(grayand, size(grayImg));
grayor = imresize(grayor, size(grayImg));

% اعمال عملگر AND
andResult = bitand(grayImg, grayand);

% اعمال عملگر OR
orResult = bitor(grayImg, grayor );

% نمایش نتایج
figure;
subplot(2,3,1), imshow(grayImg), title('تصویر اصلی');
subplot(2,3,2), imshow(grayand), title('ماسک AND');
subplot(2,3,3), imshow(andResult), title('نتیجه AND');
subplot(2,3,4), imshow(grayImg), title('تصویر اصلی');
subplot(2,3,5), imshow(grayor), title('ماسک or');
subplot(2,3,6), imshow(orResult), title('نتیجه or');

