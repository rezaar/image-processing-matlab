function blurred_image = degradation_function(original_image, a, b, T)
% DEGRADATION_FUNCTION تخریب تابع را برای یک تصویر اعمال می کند.
%
% ورودی ها:
%   original_image: تصویر اصلی
%   a, b, T: پارامترهای تابع تخریب
%
% خروجی ها:
%   blurred_image: تصویر تار شده

% تبدیل فوریه دو بعدی تصویر اصلی
F = fftshift(fft2(original_image));

% ایجاد ماتریس مش برای محاسبه تابع تخریب در کل فضای فرکانسی
[M, N] = size(F);
[U, V] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);

% محاسبه تابع تخریب
H = T ./ (pi*(a*U + b*V)) .* sin(pi*(a*U + b*V)) .* exp(-1i*pi*(a*U+b*V));

% ضرب در تابع تخریب
G = H .* F;

% تبدیل فوریه معکوس
blurred_image = ifft2(ifftshift(G));
blurred_image = abs(blurred_image);

end