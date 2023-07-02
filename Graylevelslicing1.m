originalImage = imread("negative.jpg"); 

subplot(1, 2, 1);
imshow(originalImage);
title("Original image");

gray_image = rgb2gray(originalImage);  
newImage = gray_image;
[rows cols] = size(gray_image);

for i=1:1:rows
    for j=1:1:cols
        if(gray_image(i,j)>=100 && gray_image(i,j)<=150)
            newImage(i,j) = 255;
        else
             newImage(i,j) = 0;
        end
    end
end
subplot(1, 2, 2),
imshow(newImage);
title("Gray Level Slicing Image")