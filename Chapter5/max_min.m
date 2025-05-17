clear all
close all
clc

s=imread ('image/salt.png');
s=rgb2gray(s);

p=imread ('image/pepper.png');
p=rgb2gray(p);

i=imread ('image/salt_pepper.png');
i=rgb2gray(i);

w = ones(3 , 3);
min = ordfilt2(s,1,w);
max = ordfilt2(p,9,w);
Midpoint = ordfilt2(i,5,w);

subplot(231)
imshow(s)
title('salt noise')

subplot(232)
imshow(p)
title('pepper noise')

subplot(233)
imshow(i)
title('salt and pepper noise')

subplot(234)
imshow(min)
title('min filter')

subplot(235)
imshow(max)
title('max filter')

subplot(236)
imshow(Midpoint)
title('minpoint filter')