clc;
clear;
close all;

%test_image=imread('scene2.jpg');
test_image=imread('new_temple_n.bmp');
%test_image=rgb2gray(test_image);
%imshow(test_image);
%figure;
%imshow(test_image);
sigma_map_matrix=zeros(size(test_image)/25);
image_subsection=struct('splice',[]);
l=1;
disp('Splicing Image');
for i=1:25:size(test_image,1)
    m=1;
    for j=1:25:size(test_image,2)
        image_subsection(l,m).splice=test_image(i:i+24,j:j+24);
        m=m+1;
              
    end
    l=l+1;
end
disp('Sigma Calculation');
for i=1:size(sigma_map_matrix,1)
    for j=1:size(sigma_map_matrix,2)
        
        INITPSF=ones(11,11);              
        [J,PSF] = deconvblind(image_subsection(i,j).splice, INITPSF,1);
        sigma_map_matrix(i,j)=myNeuralNetworkFunction(PSF(:));
    end
end


disp('Depth Map Computation');
depthmap=ones(size(test_image,1),size(test_image,2));
l=1;
for i=1:25:size(test_image,1)
    m=1;
    for j=1:25:size(test_image,2)
        depthmap(i:i+24,j:j+24)=sigma_map_matrix(l,m);
        m=m+1;
              
    end
    l=l+1;
end

kernel = fspecial('gaussian',[11 11], 1);
sigma_map_matrix=((imfilter(sigma_map_matrix,kernel,'symmetric')));

sigma_map_matrix=sigma_map_matrix(2:size(sigma_map_matrix,1),2:size(sigma_map_matrix,2));
figure;surf(sigma_map_matrix);
depthmap=mat2gray(depthmap);
figure;
imshow(depthmap);


