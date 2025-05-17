clear all
close all
clc

i=imread ('image/salt_pepper.png');
i=rgb2gray(i);
i=im2double(i);

kr = 3;
kc = 3;
d = 1;
w=ones(kr,kc);
atmf=(imfilter(i,w))/(kr*kc-d);

subplot(211)
imshow(i)
title('noisy image')

subplot(212)
imshow(atmf)
title('alpha trimmed mean filter')