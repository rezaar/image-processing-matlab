clear all
close all
clc


i = imread('lighthouse.png');

n=imnoise(i,'gaussian',0.1,0.5);
hsize = 50;
sigma = 5;
h=fspecial("gaussian",hsize,sigma);


o = imfilter(n, h ,0);

o1 = imfilter(n, h ,'circular');

o2 = imfilter(n, h ,'replicate');

o3 = imfilter(n, h ,'symmetric');

subplot(221)
imshow(o)
title('zero padding')

subplot(222)
imshow(o1)
title('warp padding')

subplot(223)
imshow(o2)
title('clamp padding')

subplot(224)
imshow(o3)
title('mirror padding')
