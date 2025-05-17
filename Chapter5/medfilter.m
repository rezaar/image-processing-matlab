clear all
close all
clc

i=imread ('image/pepper.png');
i=rgb2gray(i);
n=imnoise(i,'salt & pepper',0.1);

j=medfilt2(n,[3 3]);

subplot (221);
imshow(i);
title('orginal image');

subplot(222);
imshow(n);
title('noisy image');

subplot(223);
imshow(j);
title('after filter');