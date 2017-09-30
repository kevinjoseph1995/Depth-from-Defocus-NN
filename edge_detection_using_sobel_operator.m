%edge detection
clc;
clear;
close all;
original_image=double(imread('checkerboard.jpg'))/255;
sobel_operator_x=[-1,0,1;-2,0,2;-1,0,1];
sobel_operator_y=-sobel_operator_x';

edge_image_x=imfilter(original_image,sobel_operator_x,'symmetric');
edge_image_y=imfilter(original_image,sobel_operator_y,'symmetric');

figure(1);
imshow(original_image);
figure(2);
imshow(edge_image_x);
figure(3);
imshow(edge_image_y);

edge_mag=sqrt(double((edge_image_x.^2)+(edge_image_y.^2)))/4*sqrt(2);
figure(4);
imshow(edge_mag);

% edge_angle=atan(edge_image_y./edge_image_x);
% figure(5);
% imshow(edge_angle);

% [gx gy] = imgradientxy(original_image, 'sobel'); % Note: gx, gy are not normalized
% [gmag gdir] = imgradient(gx, gy);
% figure(6);
% imshow(gmag / (4 * sqrt(2))); % mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
% figure(7);
% imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]



    