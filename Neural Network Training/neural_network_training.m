clc;
clear;
close all;
k=1;
X=zeros(20*20*62,11*11);
Y=zeros(20*20*62,1);
for c=1:62
    str=strcat('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\source_images\',int2str(c),'.jpg');
    test_image=rgb2gray(imread(str));      
    for i=1:50:size(test_image,1)
        
        for j=1:50:size(test_image,2)
           
            image=test_image(i:i+49,j:j+49);%image_section_extraction
            std_dev=11*rand(1);%random blur standard deviation
            kernel = fspecial('gaussian',[11 11], std_dev);
            blurred_image=((imfilter(image,kernel,'symmetric')));
            [~,approx_PSF]=deconvblind(blurred_image,ones(11,11));
            X(k,:)=approx_PSF(:)';
            Y(k,1)=std_dev;            
            k=k+1;
                      

        end
        
    end
    disp(c);
end
 index=randperm(20*20*62);
 X=X(index,:);
 Y=Y(index,1);