clc;
clear;
close all;

near_focussed=imread('new_temple_n.bmp');
far_focussed=imread('new_temple_f.bmp');

near_focussed_segments=imseg(near_focussed,10,0);
far_focussed_segments=imseg(far_focussed,10,0);
 
kernel_matrix_n=cell(size(near_focussed_segments));
kernel_matrix_f=cell(size(near_focussed_segments));
sigma_map_n=zeros(size(near_focussed_segments));
sigma_map_f=zeros(size(near_focussed_segments));
depth_map=zeros(size(near_focussed_segments));
INITPSF = ones([7 7]);
for i=1:size(near_focussed_segments,1)
    for j=1:size(near_focussed_segments,2)
        [~, PSF]=deconvblind(cell2mat(near_focussed_segments(i,j)), INITPSF,3);
        %kernel_matrix_n(i,j)={PSF};
        sigma_map_n(i,j)=1/2*pi*max(PSF(:));
        [~, PSF]=deconvblind(cell2mat(far_focussed_segments(i,j)), INITPSF,3);
        %kernel_matrix_f(i,j)={PSF};
        sigma_map_f(i,j)=1/2*pi*max(PSF(:));
        depth_map(i,j)=(sigma_map_f(i,j)-sigma_map_n(i,j))./(sigma_map_n(i,j)+sigma_map_f(i,j));
        
    end
    disp(i);
end
depth_map=imgaussfilt(depth_map,1);
%depth_map=medfilt2(depth_map);
surf(depth_map);

