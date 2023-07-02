originalImage = imread('dog.jpeg');
old_image=rgb2gray(originalImage);

imshow(old_image);
title('original Image');

sample_factor=10;

[r,c]=size(old_image);
new_image=old_image(1:sample_factor:r,1:sample_factor:c);

figure
imshow(new_image);
title('subsampling Image');