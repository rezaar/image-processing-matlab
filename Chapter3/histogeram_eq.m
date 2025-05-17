clc;
clear all;
close all;

a = imread ('pout.tif');
b = histeq (a);
subplot (221);
imshow (a);
title ('orginal image');
subplot (222);
imshow (b);
title ('Histogram equalization ');

subplot(223);
imhist(a);
title('هیستوگرام تصویر 1');

subplot(224);
imhist(b);
title('هیستوگرام تصویر 2');