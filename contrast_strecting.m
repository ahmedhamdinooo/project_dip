
%Aim: to perform different point processing operations on the image
%this program was typed by Pratik Jain roll no. 23 
clc;
clear all;
close all;

r=imread('original_image.png');

[m,n]=size(r);


r1=min(min(r));
r2=max(max(r));

s1 = input('Enter s1 : ');
s2 = input('Enter s2 : ');


 % contrast strecting
a = s1/r1;
b = (s2-s1)/(r2-r1);
c = (255-s2)/(255-r2);
 
for i=1:m
    for j=1:n
        if r(i,j)< r1
            s(i,j)=a*r(i,j);
        elseif r(i,j)< r2
            s(i,j)=b*(r(i,j)-r1)+s1;
        else
            s(i,j)=c*(r(i,j)-r2)+s2;
        end
    end
end


figure;imshow(uint8(r));title('Original image');

figure;imshow(uint8(s));title('contrast strecting1');


% a = s1/r1;
% b = (s2-s1)/(r2-r1);
% c = (255-s2)/(255-r2);
%  
% for i=1:m
%     for j=1:n
%         if im(i,j)< r1
%             im(i,j)=a*im(i,j);
%         elseif im(i,j)< r2
%             im(i,j)=b*(im(i,j)-r1)+s1;
%         else
%             im(i,j)=c*(im(i,j)-r2)+s2;
%         end
%     end
% end