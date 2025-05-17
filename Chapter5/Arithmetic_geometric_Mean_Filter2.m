% بارگذاری تصویر
img = imread('image/additive _Gaussian _noise.png');
img = rgb2gray(img);
img = double(img);

% اندازه فیلتر
filterSize = 3;
halfSize = floor(filterSize / 2);

% فیلتر میانگین حسابی
meanFilter = zeros(size(img));
for i = 1 + halfSize:size(img, 1) - halfSize
    for j = 1 + halfSize:size(img, 2) - halfSize
        region = img(i-halfSize:i+halfSize, j-halfSize:j+halfSize);
        meanFilter(i, j) = mean(region(:));
    end
end

% فیلتر میانگین هندسی
geoMeanFilter = zeros(size(img));
for i = 1 + halfSize:size(img, 1) - halfSize
    for j = 1 + halfSize:size(img, 2) - halfSize
        region = img(i-halfSize:i+halfSize, j-halfSize:j+halfSize);
        geoMeanFilter(i, j) = exp(mean(log(region(:) + eps))); % eps برای جلوگیری از لگاریتم صفر
    end
end

% نمایش نتایج
figure;
subplot(1, 3, 1), imshow(uint8(img)), title('تصویر اصلی');
subplot(1, 3, 2), imshow(uint8(meanFilter)), title('فیلتر میانگین حسابی');
subplot(1, 3, 3), imshow(uint8(geoMeanFilter)), title('فیلتر میانگین هندسی');