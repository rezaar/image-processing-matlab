I = imread("image/notch.png");
F = fftshift(fft2(I));
[M , N] = size(F);
H = ones(M , N);
u = linspace(-M/2 , M/2-1 , M);
v = linspace(-N/2 , N/2-1 , N);
[U ,V] = meshgrid(u , v);

D0 = 0; %شعاع دایره فیلتر ناچ
u0 = 0; v0 = 0; %مرکز دایره فیلتر ناچ

H = ones(size(F));
H(sqrt((U-u0).^2+(V-v0).^2) <= D0) = 0;

G = H.*F;

g = ifft2(ifftshift(G));

subplot (1,2,1);
imshow (I);
title ('orginal image');
subplot (1,2,2);
imshow (uint8(abs(g)));
title('notch fillter');