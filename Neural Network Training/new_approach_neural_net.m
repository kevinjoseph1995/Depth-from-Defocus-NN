clc;
clear;
close all;
load('network_high_freq_trained.mat');
net2=net2_1;
clear net2_1;
% near_focussed=imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\house_near.bmp');
% far_focussed=imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\house_far.bmp');
near_focussed=imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\new_sponge_n.bmp');
far_focussed=imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\new_sponge_f.bmp');
near_focussed_segments=imseg(near_focussed,10,0);
far_focussed_segments=imseg(far_focussed,10,0);
 
kernel_matrix_n=cell(size(near_focussed_segments));
kernel_matrix_f=cell(size(near_focussed_segments));
sigma_map_n=zeros(size(near_focussed_segments));
sigma_map_f=zeros(size(near_focussed_segments));
depth_map=zeros(size(near_focussed_segments));
INITPSF = ones([15 15]);
for i=1:size(near_focussed_segments,1)
    for j=1:size(near_focussed_segments,2)
        temp=double(cell2mat(near_focussed_segments(i,j)));
        %kernel_matrix_n(i,j)={PSF};
        sigma_map_n(i,j)=net2(temp(:));
        %kernel_matrix_f(i,j)={PSF};
        temp=double(cell2mat(far_focussed_segments(i,j)));
        sigma_map_f(i,j)=net2(temp(:));
        depth_map(i,j)=((sigma_map_n(i,j)-sigma_map_f(i,j))/(sigma_map_n(i,j)+sigma_map_f(i,j)));
        
    end
    disp(i);
end

original_depth_map=depth_map;
%*********************************************
depth_map=original_depth_map;
depth_map=medfilt2(depth_map);
kernel = fspecial('gaussian',[5 5], 0.5);
depth_map=((imfilter(depth_map,kernel,'symmetric')));
depth_map=medfilt2(depth_map);
% %depth_map(depth_map>0.2)=0.2;
% depth_map=medfilt2(depth_map);
% kernel = fspecial('gaussian',[3 3], 0.5);
% depth_map=((imfilter(depth_map,kernel,'symmetric')));
depth_map=medfilt2(depth_map);
depth_map_cropped=depth_map(5:size(depth_map,1)-4,5:size(depth_map,2)-4);
surf(depth_map_cropped);
figure ;
imagesc(depth_map_cropped);
hold on;
c = colorbar;
c.Label.String = 'Normalized Depth';
%*********************************************