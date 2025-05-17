clear all
close all
clc

i=imread ('image/salt_pepper.png');
i=rgb2gray(i);
i=im2double(i);

kr=3;
kc=3;

median1=medfilt2(i,[kr kc]);
median2=medfilt2(median1,[kr kc]);
median3=medfilt2(median2,[kr kc]);

subplot(221)
imshow(i)
title('salt and pepper noise')

subplot(222)
imshow(median1)
title('first median filter')

subplot(223)
imshow(median2)
title('secend median filter')

subplot(224)
imshow(median3)
title('third median filter')