originalImage = imread("Low-contrast-image.png");  

GIm = rgb2gray(originalImage);
numofpixels=size(GIm,1)*size(GIm,2);
subplot(1, 2, 1),
imshow(GIm);
title("Original image");

HIm=uint8(zeros(size(GIm,1),size(GIm,2)));

freq=zeros(256,1);

probc=zeros(256,1);

output=zeros(256,1);


for i=1:size(GIm,1)

    for j=1:size(GIm,2)

        value=GIm(i,j);

        freq(value+1)=freq(value+1)+1;

    end

end


sum=0;
no_bins=255;


for i=1:size(freq)

   sum=sum+freq(i);

   probc(i)=sum/numofpixels;

   output(i)=round(probc(i)*no_bins);

end

for i=1:size(GIm,1)

    for j=1:size(GIm,2)

            HIm(i,j)=output(GIm(i,j)+1);

    end

end
subplot(1, 2, 2),
imshow(HIm);

title('Histogram equalization');