clear all
close all
clc

i=imread ('saturn.png');
i=rgb2gray(i);

sp=imnoise(i,'salt & pepper',0.1);
g=imnoise(i,'gaussian',0.1,0.5);
s=imnoise(i,"speckle",0.5);
p=imnoise(i,"poisson");

v=rand(size(i))*0.1;
l=imnoise(i,'localvar',v);

subplot(231)
imshow(i)
title('orginal image')

subplot(232)
imshow(sp)
title('add salt & pepper noise')

subplot(233)
imshow(g)
title('add qaussian noise')

subplot(234)
imshow(s)
title('add speckle noise')

subplot(235)
imshow(p)
title('add poisson noise')

subplot(236)
imshow(l)
title('add localvar noise')
