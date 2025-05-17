clc;
clear all;
close all;

r = imread ('cameraman.tif');
m = imread ('tire.tif');
b = imhistmatch (r,m);

subplot (2,3,1);
imshow (r);
title ('orginal image');
subplot (2,3,2);
imshow (m);
title('reference image');
subplot (2,3,3);
imshow (b);
title ('histogeram matched');
subplot (2,3,4);
imhist (r)
subplot (2,3,5);
imhist (m);
subplot (2,3,6);
imhist (b);
