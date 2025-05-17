clear all
close all
clc 

% بارگذاری تصویر
img = imread('image/testnoise.PNG');

% تبدیل تصویر به مقیاس خاکستری
grayImg = rgb2gray(img);

img = im2double(grayImg);
%%            gaussian Noise

gnoise = randn(size(img)).*0.1;

gaussian_Noise_Image = img + gnoise;

% تعیین پارامترهای نویز
%meanNoise = 5; % میانگین نویز
%varNoise = 0.1; % واریانس نویز
%gaussianNoise = meanNoise + (varNoise) * randn(size(grayImg));% تولید نویز گوسی
%gaussian_Noise_Image = double(grayImg) + gaussianNoise;% افزودن نویز به تصویر
%gaussian_Noise_Image=imnoise(grayImg,'gaussian',0,0.1);
%%          salt and pepper noise
salt_pepper=imnoise(grayImg,'salt & pepper',0.1);
%%            Rayleigh Noise
sigma = 0.1; % انحراف معیار نویز
rayleighNoise = raylrnd(sigma, size(grayImg)); % تولید نویز ریلی
Rayleigh_noisy_image = img + rayleighNoise; % افزودن نویز به تصویر
%%          Erlang (Gamma) noise
shape_param = 2; % پارامتر شکل
scale_param = 0.5; % پارامتر مقیاس
noise_level = 0.1; % سطح نویز
noise = gamrnd(shape_param, scale_param, size(img));% تولید نویز ارلنگ گاما
Erlang_noisy_img = img + noise_level * noise;% افزودن نویز به تصویر
%%          Exponential noise
mean_noise = 0; % میانگین نویز
std_dev_noise = 0.1; % انحراف معیار نویز
enoise = std_dev_noise * randn(size(img)) + mean_noise;% تولید نویز نمایی
enoisy_img = img + enoise;% افزودن نویز به تصویر
%%            Uniform noise
% تعیین پارامترهای نویز
noiseLevel = 1; % سطح نویز
uniformNoise = noiseLevel * rand(size(img));% تولید نویز یکنواخت
uniform_noisy_Img = img + uniformNoise * 255;% افزودن نویز به تصویر
uniform_noisy_Img(uniform_noisy_Img > 255) = 255;% محدود کردن مقادیر پیکسل‌ها
uniform_noisy_Img(uniform_noisy_Img < 0) = 0;
uniform_noisy_Img = uint8(uniform_noisy_Img);

%%
figure;
subplot(2, 7 , 1);
imshow(grayImg);
title('تصویر اصلی');


subplot(2, 7, 2)
imshow(gaussian_Noise_Image , []);
title('تصویر با نویز گوسی');

subplot(2, 7, 3);
imshow((salt_pepper));
title('تصویر با نویز نمک و فلفل');

subplot(2, 7, 4);
imshow(Rayleigh_noisy_image);
title('تصویرب یا نویز ریلی');

subplot(2, 7, 5);
imshow(Erlang_noisy_img);
title('تصویر با نویز گاما');

subplot(2, 7, 6);
imshow(enoisy_img);
title('تصویر با نویز نمایی');

subplot(2, 7, 7);
imshow(uniform_noisy_Img , []);
title('تصویر با نویز نمایی');

subplot (2 , 7 ,8)
imhist(grayImg)

subplot (2 , 7 ,9)
imhist(gaussian_Noise_Image)

subplot (2 , 7 ,10)
imhist(salt_pepper)

subplot (2 , 7 ,11)
imhist(Rayleigh_noisy_image)

subplot (2 , 7 ,12)
imhist(Erlang_noisy_img)

subplot (2 , 7 ,13)
imhist(enoisy_img)

subplot (2 , 7 ,14)
imhist(uniform_noisy_Img)
