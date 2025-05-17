clear all
close all
clc

s=imread ('image/salt.png');
s=im2double(s);

kr=3;
kc=3;
W=ones(kr,kc);

hmf=(kr*kc)./imfilter(1./(s+eps),W);

subplot(211)
imshow(s)
title('salt noise')

subplot(212)
imshow(hmf)
title('Harmonic mean filter')


