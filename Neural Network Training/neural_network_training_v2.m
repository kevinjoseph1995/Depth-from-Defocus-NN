clc;
clear;
close all;
k=1;
X=zeros(50*50*50,20*20);
Y=zeros(50*50*50,1);
for c=1:148
    str=strcat('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\source_images\',int2str(c),'.jpg');
   test_image=(imread(str));      
    for i=1:20:size(test_image,1)
        
        for j=1:20:size(test_image,2)
           
            image=test_image(i:i+19,j:j+19);%image_section_extraction
            std_dev=randi([1 10],1,1);%random blur standard deviation
            kernel = fspecial('gaussian',[11 11], std_dev);
            blurred_image=((imfilter(image,kernel,'symmetric')));
            X(k,:)=blurred_image(:)';
            Y(k,1)=std_dev;            
            k=k+1;
                      

        end
        
    end
    disp(c);
end
 index=randperm(50*50*50);
 X=X(index,:);
 Y=Y(index,1);