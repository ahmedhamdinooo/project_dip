image1=imread("Copy_of_hannnnn.jpg");
image2 = imread("Copy_2_of_hannnnn.jpg");

subtracted_image = image1-image2;

subplot(1,3,1), imshow(image1); title('First Image');
subplot(1,3,2), imshow(image2); title('Second Image');
subplot(1,3,3), imshow(subtracted_image); title('Subtracted Image');