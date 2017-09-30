clc;
clear;
close all;
k=1;
X=zeros(100*100*20*4,10*10);
Y=zeros(100*100*20*4,1);
for c=1:20
    str=strcat('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\source_images\',int2str(c),'.jpg');
    test_image=(imread(str)); 
    test_image_segments=imseg(test_image,10,0);
    for i=1:size(test_image_segments,1)
        for j=1:size(test_image_segments,2)   
            
            image=double(cell2mat(test_image_segments(i,j)));
            
            std_dev=rand(1)*7;%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            blurred_image=((imfilter(image,kernel,'symmetric')));
            X(k,:)=blurred_image(:)';
            Y(k,1)=std_dev;            
            k=k+1;
            
            std_dev=rand(1)*7;%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            blurred_image=((imfilter(image,kernel,'symmetric')));
            X(k,:)=blurred_image(:)';
            Y(k,1)=std_dev;            
            k=k+1;
            
            std_dev=rand(1)*7;%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            blurred_image=((imfilter(image,kernel,'symmetric')));
            X(k,:)=blurred_image(:)';
            Y(k,1)=std_dev;            
            k=k+1;
            
            X(k,:)=image(:)';
            Y(k,1)=0;            
            k=k+1;
            
        end
    end
    disp(c);
end
index=randperm(100*100*4*20);
X=X(index,:);
Y=Y(index,1);
 