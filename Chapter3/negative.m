    % بارگذاری تصویر
    img = imread('image/testneg.PNG');
    
    % تبدیل تصویر به مقیاس خاکستری (در صورت نیاز)
    %if size(img, 3) == 3
     %   img = rgb2gray(img);
    %end
    
    % تولید تصویر منفی
    negative_img = 255 -1- img;
    
    % نمایش تصویر اصلی و تصویر منفی
    figure;
    subplot(1, 2, 1);
    imshow(img);
    title('تصویر اصلی');
    
    subplot(1, 2, 2);
    imshow(negative_img);
    title('تصویر منفی');

% ذخیره تصویر منفی
%imwrite(negative_img, 'negative_image.jpg');
