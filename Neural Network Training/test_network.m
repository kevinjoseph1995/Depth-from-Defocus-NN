clc;
clear;
close all;

str=strcat('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\test_images\test_image.jpg');
test_image=rgb2gray(imread(str));
disp('Correct Sigma:');
std_dev=7*rand(1); 
disp(std_dev);
disp('Predictions:');

for j=1:50:size(test_image,2)       

    image=test_image(1:50,j:j+49);%image_section_extraction
    kernel = fspecial('gaussian',[7 7], std_dev);
    blurred_image=((imfilter(image,kernel,'symmetric')));
    [~,approx_PSF]=deconvblind(blurred_image,ones(7,7));
    disp(myNeuralNetworkFunction(approx_PSF(:)));

               

end




