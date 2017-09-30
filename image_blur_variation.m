
clc;
clear;
close all;
f=100;
vo=25;
F=1;
while(1)
    std_dev=input('Enter the Standard Deviation of the Gaussian Kernel');
    original_image=imread('checkerboard.jpg');
    kernel = fspecial('gaussian',[401 401], std_dev);
    blurred_image=imfilter(original_image,kernel,'symmetric');
    figure(1);
    imshow(blurred_image);
    

end

        
        

