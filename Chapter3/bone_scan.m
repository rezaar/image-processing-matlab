clear all
close all
clc

i = im2double(imread('image/bone_scan.png'));
%i = rgb2gray(i);

lap = [-1 -1 -1; -1 8 -1; -1 -1 -1];
l = imfilter(i , lap);
minR = min(l(:));
maxR = max(l(:));
l = (l - minR) / (maxR - minR);

sh = imadd (i , l);

H = [-1 -2 -1; 0 0 0; 1 2 1];
sobel = imfilter(i ,H);

H1 = fspecial('average',5);
averaging = imfilter (sobel , H1);

m = immultiply (sh,averaging);

sh2= imadd (i , m);

s=(1*(sh.^0.5))*256;
s1=uint8(s);

subplot(241)
imshow(i)
title('original image')

subplot(242)
imshow(l)
title('Laplacian of the original image')

subplot(243)
imshow(sh)
title('Sharpened image')

subplot(244)
imshow(sobel)
title('sobel image')

subplot(245)
imshow(averaging)
title('Sobel image with averaging ')

subplot(246)
imshow(m)
title('Laplacian and smoothedgradient')

subplot(247)
imshow(sh2)
title('Sharpened image 2')

subplot(248)
imshow(s1)
title('powel low')