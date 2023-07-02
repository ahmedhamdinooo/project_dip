I = imread('threshold.png');
I=rgb2gray(I);
threshold=20;

[m,n]=size(I);

Ithres=zeros(m,n);

for i=1:m
    for j=1:n
        if(I(i,j)>threshold)
            Ithres(i,j)=1;
        else
            Ithres(i,j)=0;
        end
    end
end


subplot(1,2,1);
imshow(I);
title('original');

subplot(1,2,2);
imshow(Ithres);
title('thresholding');

