clc
clear all
close all

i = imread("logo.tif");

%bw_n = imcomplement(i);

se = strel('square' , 3);

ie = imerode(i , se);%فرسایش
id = imdilate(i , se);%گسترش
io = imopen(i , se);%بازکردن
ic = imclose(i , se);%بستن
it = bwmorph(i,"thin",Inf);%نازک سازی
ifl = bwmorph(i , "fill"); %پر کردن سوراخ ها
is = bwmorph(i , "skel",Inf);
ib = edge(i);%یافتن مرز شی
subplot(521)
imshow(i)
title('تصویر اصلی')

subplot(523)
imshow(ie)
title('فرسایش')

subplot(524)
imshow(id)
title('گسترش')

subplot(525)
imshow(io)
title('اوپنینگ')

subplot(526)
imshow(ic)
title('کلوزینگ')

subplot(527)
imshow(it)
title('نازک سازی')

subplot(528)
imshow(ifl)
title('پر کردن سوراخ ها')

subplot(529)
imshow(ib)
title('یافتن مرز شی')

subplot(5,2,10)
imshow(is)
title('اسکلت')