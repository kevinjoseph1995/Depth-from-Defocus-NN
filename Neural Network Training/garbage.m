clc

close all



for count=7:7
    
        str=strcat('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\test_image_7.jpg');
       image=(rgb2gray(imread(str)));
        
       % temp=imresize(image,[1000 1000]);
        str=strcat('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\test_image_7.bmp');
        imwrite(image,str,'bmp')    
end