clc;
clear;
close all;
test_image=imread('blurred_image_sigma_4.jpg');
figure;
imshow(test_image);

sobel_operator_x=[-1,0,1;-2,0,2;-1,0,1];
sobel_operator_y=-sobel_operator_x';
sigma=0.1:0.5:15;
val=zeros(1,size(sigma,2));
hn=val(1);
hs=1;
for i=1:size(sigma,2)
    INITPSF =  fspecial('gaussian',7,sigma(i));
    [J,PSF] = deconvreg(test_image, INITPSF) ;
    edge_mag = edge(J,'sobel');
    figure;
    imshow(edge_mag);
    disp(sigma(i));
    k=sum(sum(edge_mag));
    if(k>hn)
        hn=k;
        hs=i;
        x=edge_mag;
    
    end
    disp(k);
    val(i)=k;
end
figure;
imshow(x);
figure;
plot(sigma,val);
disp(sigma(hs));