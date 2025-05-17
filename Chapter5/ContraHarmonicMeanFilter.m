function output = ContraHarmonicMeanFilter(input, Q)
    input = rgb2gray(input);
    input = double(input); % تبدیل به نوع اعشاری
    [rows, cols] = size(input);
    output = zeros(rows, cols);
    padInput = padarray(input, [1 1], 'symmetric');

    for i = 2:rows+1
        for j = 2:cols+1
            window = padInput(i-1:i+1, j-1:j+1);
            numerator = sum(sum(window.^Q));
            denominator = sum(sum(window));
            output(i-1, j-1) = numerator / denominator;
        end
    end
end