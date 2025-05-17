clear all
close all
clc

A=imread('image/1.png');
B=imread('image/2.png');
a=size(A)
b=size(B)

C=imsubtract(A,B);
D = histeq (C);
e=im2double(C);
E=log(1+e)*256;

F=(e.^0.5)*256;

G=imhistmatch (C,A);
subplot(331)
imshow(A)
title('Image A')

subplot(332)
imshow(B)
title('Image B')

subplot(333)
imshow(C)
title('A-B')

subplot(334)
imshow(D)
title('A-B histeq')

subplot(335)
imshow(E)
title('A-B log')

subplot(336)
imshow(F)
title('A-B powel low')

subplot(337)
imshow(G)
title('A-B histmatch')