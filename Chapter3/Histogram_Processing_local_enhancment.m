% بارگذاری تصویر
img = imread('image/his.PNG'); % بارگذاری تصویر
img_gray = rgb2gray(img); % تبدیل تصویر به خاکستری
img_double = im2double(img_gray); % تبدیل تصویر خاکستری به نوع دوگانه

% اندازه تصویر
[rows, cols] = size(img_double); % دریافت ابعاد تصویر
output_img = zeros(rows, cols); % ایجاد تصویر خروجی با ابعاد مشابه

histeq_i = histeq(img_gray); % انجام هیستوگرام معمولی بر روی تصویر خاکستری

% اندازه ناحیه
neighborhood_size = 7; % تعیین اندازه ناحیه محلی
half_size = floor(neighborhood_size / 2); % محاسبه نیمه اندازه ناحیه

% پردازش هر پیکسل
for i = 1:rows
    for j = 1:cols
        % تعیین ناحیه
        row_start = max(1, i - half_size); % شروع ناحیه
        row_end = min(rows, i + half_size); % پایان ناحیه
        col_start = max(1, j - half_size); % شروع ناحیه
        col_end = min(cols, j + half_size); % پایان ناحیه
        
        % استخراج ناحیه
        local_region = img_double(row_start:row_end, col_start:col_end); % استخراج ناحیه محلی
        
        % محاسبه هیستوگرام
        [counts, ~] = imhist(local_region); % محاسبه هیستوگرام ناحیه
        cdf = cumsum(counts) / numel(local_region); % محاسبه تابع توزیع تجمعی
        
        % بهبود محلی
        output_img(i, j) = cdf(round(img_double(i, j) * 255) + 1); % بهبود پیکسل محلی
    end
end

% نمایش تصویر خروجی
figure;
subplot(1, 3, 1), imshow(img_gray), title('تصویر خاکستری'); % نمایش تصویر خاکستری
subplot(1, 3, 2), imshow(histeq_i), title('هیستوگرام معمولی'); % نمایش هیستوگرام معمولی
subplot(1, 3, 3), imshow(output_img), title('تصویر بهبود یافته'); % نمایش تصویر بهبود یافته
