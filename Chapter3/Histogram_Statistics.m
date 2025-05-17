% بارگذاری تصویر
img = imread('image/sem.jpg');

% بررسی نوع تصویر و تبدیل به خاکستری
if size(img, 3) == 3
    grayImg = rgb2gray(img);
else
    grayImg = im2gray(img);
end

% محاسبه هیستوگرام
[counts, binLocations] = imhist(grayImg);

% محاسبه میانگین و واریانس
meanValue = mean(grayImg(:));
varianceValue = var(double(grayImg(:)));

% بهبود تصویر با استفاده از هیستوگرام
enhancedImg = histeq(grayImg);

% نمایش نتایج
figure;
subplot(1, 3, 1), imshow(grayImg), title('تصویر اصلی');
subplot(1, 3, 2), bar(binLocations, counts), title('هیستوگرام');
subplot(1, 3, 3), imshow(enhancedImg), title('تصویر بهبود یافته');

% نمایش میانگین و واریانس
disp(['میانگین: ', num2str(meanValue)]);
disp(['واریانس: ', num2str(varianceValue)]);
