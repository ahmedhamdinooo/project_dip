% img = imread('dog.jpeg');
% k = 4;
% while (k >= 2&&k<=4)
%  target_levels = 2^k;
%  target_compr_factor = 256 / target_levels;
%  reduced_image = uint8(floor(double(img)/256 * target_levels) * target_compr_factor);
% %  subplot(2,2,k);
% figure
%  imshow(reduced_image, [0 255]);
%  if (k==2)
%       title(['Grey-level resolution 2^',num2str(k)]);
%  else
%       title(['Grey-level resolution 2^',num2str(k)]);
%  end
%  k = k - 1;
% end




% img = imread('dog.jpeg');
% k = 2;
% 
% while (k > 0)
%  target_levels = 2^k;
%  target_compr_factor = 256 / target_levels;
%  reduced_image = uint8(floor(double(img)/256 * target_levels) * target_compr_factor);
%  
%   k = k - 1;
% 
% end
% figure
% imshow(reduced_image);





img = imread('dog.jpeg');
k = 8;
figure
while (k > 0)
 target_levels = 2^k;
 target_compr_factor = 256 / target_levels;
 reduced_image = uint8(floor(double(img)/256 * target_levels) * target_compr_factor);
 subplot(3, 3, k); 
 imshow(reduced_image, [0 255]);
 if (k==1)
      title('Black & White');
 else
      title(['Grey-level resolution 2^',num2str(k)]);
 end
 k = k - 1;
end













