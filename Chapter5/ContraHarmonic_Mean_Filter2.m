inputImage = imread('image/pepper.png' );
Q = 1.5; % مقدار Q
filteredImage = ContraHarmonicMeanFilter(inputImage, Q);

subplot(121)
imshow(inputImage)
title('salt and pepper noise')

subplot(122)
imshow(filteredImage,[])
title('first median filter')