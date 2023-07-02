figure;
c=1;
originalImage=imread('negative.jpg');

gray_image = rgb2gray(originalImage);

double_value = im2double(gray_image);

out1= c*(double_value.^1); 
out2= c*(double_value.^0.5); 
out3= c*(double_value.^1.5); 

subplot(221),imshow(gray_image), title('original image')
subplot(222),imshow((out1),[]), title('Corrected image(power=1)')
subplot(223),imshow((out2),[]), title('Corrected image(power=0.5)')
subplot(224),imshow((out3),[]), title('Corrected image(power=1.5)')

