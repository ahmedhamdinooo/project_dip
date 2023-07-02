originalImage = imread("dog.jpeg");  
gray_image = rgb2gray(originalImage);  
subplot(1, 2, 1),

imshow(gray_image);
title("Original image");

[rows,cols]=size(gray_image);
counts=zeros(1,256);
for i=1:rows
 for j=1:cols
    grayLevel=gray_image(i,j);
    counts(grayLevel+1)=counts(grayLevel+1)+1;
end
end

subplot(1, 2, 2),
grayLevels = 0 : 255;
bar(grayLevels, counts, 'BarWidth', 1, 'FaceColor', 'b');
xlabel('Gray Level', 'FontSize', 20);
ylabel('Pixel Count', 'FontSize', 20);
title('Histogram', 'FontSize', 20);