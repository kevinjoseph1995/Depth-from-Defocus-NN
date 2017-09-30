
clc;
clear;
close all;
test_image=imread('blurred_image_sigma_five.jpg');
% padded_image = padarray(test_image,[15 15],'symmetric');
% imshow(padded_image);

figure;
imshow(test_image);
INITPSF =  fspecial('gaussian',31,6);
[J,PSF] = deconvreg(test_image, INITPSF) ;
figure;
imshow(J);

sobel_operator_x=[-1,0,1;-2,0,2;-1,0,1];
sobel_operator_y=-sobel_operator_x';
edge_image_x=imfilter(double(test_image)/255,sobel_operator_x,'symmetric');
edge_image_y=imfilter(double(test_image)/255,sobel_operator_y,'symmetric');
edge_mag=sqrt(double((edge_image_x.^2)+(edge_image_y.^2)))/4*sqrt(2);
% figure;
% imshow(edge_mag);

disp('Blurred Image');
disp(sum(sum(edge_mag)));

edge_image_x=imfilter(double(J)/255,sobel_operator_x,'symmetric');
edge_image_y=imfilter(double(J)/255,sobel_operator_y,'symmetric');
edge_mag=sqrt(double((edge_image_x.^2)+(edge_image_y.^2)))/4*sqrt(2);
figure;
imshow(edge_mag);



disp('Deblurred Image');
disp(sum(sum(edge_mag)));

