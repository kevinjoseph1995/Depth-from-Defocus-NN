clc;
clear;
close all;
k=1;
X=zeros(10*10*10,10*10);
Y=zeros(10*10*10,1);
for c=1:10
    str=strcat('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\source_images\',int2str(c),'.jpg');
    test_image=rgb2gray(imread(str));      
    for i=1:10:size(test_image,1)
        
        for j=1:10:size(test_image,2)
           
            image=test_image(i:i+9,j:j+9);%image_section_extraction
            std_dev=10*rand(1);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            blurred_image=((imfilter(image,kernel,'symmetric')));
            fft_im=abs(fft2(blurred_image));
            X(k,:)=fft_im(:)';
            Y(k,1)=std_dev;            
            k=k+1;
                      

        end
        
    end
    disp(c);
end
 index=randperm(10*10*10);
 X=X(index,:);
 Y=Y(index,1);