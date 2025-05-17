clear all
close all
clc

i=imread ('image/additive _Gaussian _noise.png');
i=rgb2gray(i);
i=im2double(i);

kr=3;
kc=3;

%Arithmetic Mean Filter
w=ones(kr,kc)/(kr*kc);
amf=imfilter(i,w);

w=ones(kr,kc);
amf1=imfilter(i,w)/(kr*kc);

%Geometric Mean Filter
W=ones(kr,kc);
gmf=exp(imfilter(log(i),W)).^(1/(kr*kc));

subplot(221)
imshow(i)
title('Image corrupted by additive Gaussian noise')

subplot(222)
imshow(amf)
title('Arithmetic Mean Filter')

subplot(223)
imshow(gmf)
title('Geometric Mean Filter')

subplot(224)
imshow(amf1)
title('Arithmetic Mean Filter')

