clear all
close all
clc

% بارگذاری تصاویر
d = imread('image/powertest1.PNG');
l = imread('image/powertest2.PNG');

d = double(d); % تبدیل تصویر به نوع عددی
l = double(l); % تبدیل تصویر به نوع عددی 

gama=0.6 ;
d1=(d.^gama)*256; 

gama=0.4;
d2=(d.^gama)*256;

gama=0.3;
d3=(d.^gama)*256;

gama=3 ;
l1=(l.^gama)*256; 

gama=4;
l2=(l.^gama)*256;

gama=5;
l3=(l.^gama)*256;


subplot(241)
imshow(d/ max(d(:)))
title('orginal image')

subplot(242)
imshow(d1/ max(d1(:)))
title('\gamma = 0.6')

subplot(243)
imshow(d2/ max(d2(:)))
title('\gamma = 0.4')

subplot(244)
imshow(d3/ max(d3(:)))
title('\gamma = 0.3')

subplot(245)
imshow(l/ max(l(:)))    
title('orginal image')

subplot(246)
imshow(l1/ max(l1(:)))
title('\gamma = 0.6')

subplot(247)
imshow(l2/ max(l2(:)))
title('\gamma = 0.4')

subplot(248)
imshow(l3/ max(l3(:)))
title('\gamma = 0.3')
