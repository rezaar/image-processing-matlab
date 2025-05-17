clear all
close all
clc

s=imread ('image/salt.png');
s=rgb2gray(s);
s=im2double(s);

p=imread ('image/pepper.png');
p=rgb2gray(p);
p=im2double(p);

kr=3;
kc=3;
W=ones(kr,kc);
%ContraHarmonic Mean Filter 
Qp=1.5;

chmf1=imfilter(p.^(Qp+1),W,"replicate")./imfilter(p.^(Qp),W,"replicate");

Qs=-1.5;

chmf2=imfilter(s.^(Qs+1),W,"replicate")./imfilter(s.^(Qs),W,"replicate");

Qp=-1.5;

chmf3=imfilter(p.^(Qp+1),W,"replicate")./imfilter(p.^(Qp),W,"replicate");

Qs=1.5;

chmf4=imfilter(s.^(Qs+1),W,"replicate")./imfilter(s.^(Qs),W,"replicate");

subplot(221)
imshow(p)
title('pepper noise')

subplot(222)
imshow(s)
title('salt noise')

subplot(223)
imshow(chmf1)
title('ContraHarmonic Mean Filter for pepper noise')

subplot(224)
imshow(chmf2)
title('ContraHarmonic Mean Filter for salt noise')
