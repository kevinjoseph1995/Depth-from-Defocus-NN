clc;
clear;
close all;

image=imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_image_2.bmp');
sigma=0.1:0.1:4.9;
k=1;
for i=21:20:1000
       
            std_dev=sigma(1,k);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            image(i:i+19,:)=imfilter(image(i:i+19,:),kernel,'symmetric');  
            k=k+1;   
    
end
imshow(image);
image_segments=imseg(image,10,0);
k=1;
c=0;
X=zeros([10000 100]);
Y=zeros([10000 1]);
for i=1:size(image_segments,1)
        for j=1:size(image_segments,2)               
            
                segment=double(cell2mat(image_segments(i,j))); 
                X(k,:)=segment(:)';            
                if i==1||i==2
                    Y(k,1)=0; 
                else
                    Y(k,1)=sigma(1,c);
                end
                k=k+1;
        end
        if mod(i,2)==0
            c=c+1;
        end
        
end

net1=feedforwardnet([200 3 3]);
net2=trainscg(net1,X',Y','useGPU','yes');
net2=trainscg(net2,X',Y','useGPU','yes');
net2=trainscg(net2,X',Y','useGPU','yes');
prediction=net2(X');

sigma_map_f=zeros(size(image_segments));
true_sigma_map_f=zeros(size(image_segments));
k=1;
for i=1:size(image_segments,1)
        for j=1:size(image_segments,2)            
            
              sigma_map_f(i,j)=prediction(1,k);
              true_sigma_map_f(i,j)=Y(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_f=imfilter(sigma_map_f,kernel,'symmetric');  
figure;
surf(sigma_map_f);
figure;
surf(true_sigma_map_f);


image_rotated=rot90(image);
image_rotated=rot90(image_rotated);
image_rotated_segments=imseg(image_rotated,10,0);
sigma_new=flip(sigma);
k=1;
c=0;
X_1=zeros([10000 100]);
Y_1=zeros([10000 1]);
for i=1:size(image_rotated_segments,1)
        for j=1:size(image_rotated_segments,2)               
            
                segment=double(cell2mat(image_rotated_segments(i,j))); 
                X_1(k,:)=segment(:)';            
                if i==1||i==2
                    Y_1(k,1)=0; 
                else
                    Y_1(k,1)=sigma_new(1,c);
                end
                k=k+1;
        end
        if mod(i,2)==0
            c=c+1;
        end
        
end

prediction=net2(X_1');
sigma_map_n=zeros(size(image_segments));
true_sigma_map_n=zeros(size(image_segments));
k=1;
for i=1:size(image_segments,1)
        for j=1:size(image_segments,2)            
            
              sigma_map_n(i,j)=prediction(1,k);
              true_sigma_map_n(i,j)=Y_1(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_n=imfilter(sigma_map_n,kernel,'symmetric');  
figure;
surf(sigma_map_n);
figure;
surf(true_sigma_map_n);

depth_map=50*(sigma_map_n-sigma_map_f)./(sigma_map_n+sigma_map_f);
true_depth_map=50*(true_sigma_map_n-true_sigma_map_f)./(true_sigma_map_n+true_sigma_map_f);
figure;
surf(true_depth_map);
kernel = fspecial('gaussian',[21 21], 21);
depth_map=imfilter(depth_map,kernel,'symmetric');  
hold on;
surf(depth_map);
% error_map=(depth_map-true_depth_map);
% figure;
% surf(error_map);
