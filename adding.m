originalImage = imread("negative.jpg");   
subplot(3,1, 1);
  

imshow(originalImage);
title("Original image");
gray_image = rgb2gray(originalImage); 
AddImage = gray_image+120;

subplot(3,1,2);
imshow(AddImage);
title("Image after the add process")







