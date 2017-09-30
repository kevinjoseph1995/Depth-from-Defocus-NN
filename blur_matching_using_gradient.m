clc;
clear;
close all;
test_image=imread('blurred_image_sigma_14.jpg');
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
    [gx gy] = imgradientxy(J, 'sobel'); % Note: gx, gy are not normalized
    [gmag gdir] = imgradient(gx, gy);
    figure(6);
    imshow(gmag / (4 * sqrt(2)));
    k=sum(sum(gmag));% mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
    edge_mag=gmag;
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