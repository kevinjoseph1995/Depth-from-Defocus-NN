clc;
clear;
close all;

image1=double(rgb2gray(imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\high_texture_image_1.jpg')));
sigma=0.1:0.1:4.9;
j=1;
for i=21:20:1000
       
            std_dev=sigma(1,j);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            image1(i:i+19,:)=imfilter(image1(i:i+19,:),kernel,'symmetric');  
            j=j+1;   
    
end
figure;
imshow(image1,[]);
image_segments_1=imseg(image1,10,0);
k=1;
c=0;
X=zeros([80000 100]);
Y=zeros([80000 1]);
for i=1:size(image_segments_1,1)
        for j=1:size(image_segments_1,2)               
            
                segment=double(cell2mat(image_segments_1(i,j))); 
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

image2=double(rgb2gray(imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\high_texture_image_2.jpg')));
sigma=0.1:0.1:4.9;
j=1;
for i=21:20:1000
       
            std_dev=sigma(1,j);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            image2(i:i+19,:)=imfilter(image2(i:i+19,:),kernel,'symmetric');  
            j=j+1;   
    
end
figure;
imshow(image2,[]);
image_segments_2=imseg(image2,10,0);

c=0;

for i=1:size(image_segments_2,1)
        for j=1:size(image_segments_2,2)               
            
                segment=double(cell2mat(image_segments_2(i,j))); 
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

image3=double(rgb2gray(imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\high_texture_image_3.jpg')));
sigma=0.1:0.1:4.9;
j=1;
for i=21:20:1000
       
            std_dev=sigma(1,j);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            image3(i:i+19,:)=imfilter(image3(i:i+19,:),kernel,'symmetric');  
            j=j+1;   
    
end
figure;
imshow(image3,[]);
image_segments_3=imseg(image3,10,0);

c=0;

for i=1:size(image_segments_3,1)
        for j=1:size(image_segments_3,2)               
            
                segment=double(cell2mat(image_segments_3(i,j))); 
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

image4=double(rgb2gray(imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\high_texture_image_4.jpg')));
sigma=0.1:0.1:4.9;
j=1;
for i=21:20:1000
       
            std_dev=sigma(1,j);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            image4(i:i+19,:)=imfilter(image4(i:i+19,:),kernel,'symmetric');  
            j=j+1;   
    
end
figure;
imshow(image4,[]);
image_segments_4=imseg(image4,10,0);

c=0;

for i=1:size(image_segments_4,1)
        for j=1:size(image_segments_4,2)               
            
                segment=double(cell2mat(image_segments_4(i,j))); 
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

image5=((imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\high_texture_image_5.jpg')));
sigma=0.1:0.1:4.9;
j=1;
for i=21:20:1000
       
            std_dev=sigma(1,j);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            image5(i:i+19,:)=imfilter(image5(i:i+19,:),kernel,'symmetric');  
            j=j+1;   
    
end
figure;
imshow(image5,[]);
image_segments_5=imseg(image5,10,0);

c=0;

for i=1:size(image_segments_5,1)
        for j=1:size(image_segments_5,2)               
            
                segment=double(cell2mat(image_segments_5(i,j))); 
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

image6=((imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\high_texture_image_6.jpg')));
sigma=0.1:0.1:4.9;
j=1;
for i=21:20:1000
       
            std_dev=sigma(1,j);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            image6(i:i+19,:)=imfilter(image6(i:i+19,:),kernel,'symmetric');  
            j=j+1;   
    
end
figure;
imshow(image6,[]);
image_segments_6=imseg(image6,10,0);

c=0;

for i=1:size(image_segments_6,1)
        for j=1:size(image_segments_6,2)               
            
                segment=double(cell2mat(image_segments_6(i,j))); 
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

image7=((imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\high_texture_image_7.jpg')));
sigma=0.1:0.1:4.9;
j=1;
for i=21:20:1000
       
            std_dev=sigma(1,j);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            image7(i:i+19,:)=imfilter(image7(i:i+19,:),kernel,'symmetric');  
            j=j+1;   
    
end
figure;
imshow(image7,[]);
image_segments_7=imseg(image2,10,0);

c=0;

for i=1:size(image_segments_7,1)
        for j=1:size(image_segments_7,2)               
            
                segment=double(cell2mat(image_segments_7(i,j))); 
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

image8=((imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\high_texture_image_8.jpg')));
sigma=0.1:0.1:4.9;
j=1;
for i=21:20:1000
       
            std_dev=sigma(1,j);%random blur standard deviation
            kernel = fspecial('gaussian',[7 7], std_dev);
            image8(i:i+19,:)=imfilter(image8(i:i+19,:),kernel,'symmetric');  
            j=j+1;   
    
end
figure;
imshow(image8,[]);
image_segments_8=imseg(image8,10,0);

c=0;

for i=1:size(image_segments_8,1)
        for j=1:size(image_segments_8,2)               
            
                segment=double(cell2mat(image_segments_8(i,j))); 
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

net1=feedforwardnet([100 3 3]);
net2=trainscg(net1,X',Y','useGPU','yes');
net2=trainscg(net2,X',Y','useGPU','yes');
net2=trainscg(net2,X',Y','useGPU','yes');


%Image 1 Depth map
prediction=net2(X(1:10000,:)');
sigma_map_f=zeros(size(image_segments_1));
true_sigma_map_f=zeros(size(image_segments_1));
k=1;
for i=1:size(image_segments_1,1)
        for j=1:size(image_segments_1,2)            
            
              sigma_map_f(i,j)=prediction(1,k);
              true_sigma_map_f(i,j)=Y(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_f=imfilter(sigma_map_f,kernel,'symmetric');  
% figure;
% surf(sigma_map_f);
% figure;
% surf(true_sigma_map_f);

sigma_map_n=rot90(sigma_map_f);
sigma_map_n=rot90(sigma_map_n);

true_sigma_map_n=rot90(true_sigma_map_f);
true_sigma_map_n=rot90(true_sigma_map_n);

kernel = fspecial('gaussian',[7 7], 1);
sigma_map_n=imfilter(sigma_map_n,kernel,'symmetric');  
% figure;
% surf(sigma_map_n);
% figure;
% surf(true_sigma_map_n);

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

%******************************************************************************************************
%Image 2 Depth Map
prediction=net2(X(10001:20000,:)');
sigma_map_f=zeros(size(image_segments_1));
true_sigma_map_f=zeros(size(image_segments_1));
k=1;
for i=1:size(image_segments_1,1)
        for j=1:size(image_segments_1,2)            
            
              sigma_map_f(i,j)=prediction(1,k);
              true_sigma_map_f(i,j)=Y(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_f=imfilter(sigma_map_f,kernel,'symmetric');  
% figure;
% surf(sigma_map_f);
% figure;
% surf(true_sigma_map_f);

sigma_map_n=rot90(sigma_map_f);
sigma_map_n=rot90(sigma_map_n);

true_sigma_map_n=rot90(true_sigma_map_f);
true_sigma_map_n=rot90(true_sigma_map_n); 

kernel = fspecial('gaussian',[7 7], 1);
sigma_map_n=imfilter(sigma_map_n,kernel,'symmetric');  
% figure;
% surf(sigma_map_n);
% figure;
% surf(true_sigma_map_n);

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


%******************************************************************************************************
%Image 3 Depth Map
prediction=net2(X(20001:30000,:)');
sigma_map_f=zeros(size(image_segments_1));
true_sigma_map_f=zeros(size(image_segments_1));
k=1;
for i=1:size(image_segments_1,1)
        for j=1:size(image_segments_1,2)            
            
              sigma_map_f(i,j)=prediction(1,k);
              true_sigma_map_f(i,j)=Y(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_f=imfilter(sigma_map_f,kernel,'symmetric');  
% figure;
% surf(sigma_map_f);
% figure;
% surf(true_sigma_map_f);

sigma_map_n=rot90(sigma_map_f);
sigma_map_n=rot90(sigma_map_n);

true_sigma_map_n=rot90(true_sigma_map_f);
true_sigma_map_n=rot90(true_sigma_map_n);

kernel = fspecial('gaussian',[7 7], 1);
sigma_map_n=imfilter(sigma_map_n,kernel,'symmetric');  
% figure;
% surf(sigma_map_n);
% figure;
% surf(true_sigma_map_n);

depth_map=50*(sigma_map_n-sigma_map_f)./(sigma_map_n+sigma_map_f);
true_depth_map=50*(true_sigma_map_n-true_sigma_map_f)./(true_sigma_map_n+true_sigma_map_f);
figure;
surf(true_depth_map);
kernel = fspecial('gaussian',[21 21], 21);
depth_map=imfilter(depth_map,kernel,'symmetric');  
hold on;
surf(depth_map);

%Image 4 Depth map*********************************************************
prediction=net2(X(30001:40000,:)');
sigma_map_f=zeros(size(image_segments_1));
true_sigma_map_f=zeros(size(image_segments_1));
k=1;
for i=1:size(image_segments_1,1)
        for j=1:size(image_segments_1,2)            
            
              sigma_map_f(i,j)=prediction(1,k);
              true_sigma_map_f(i,j)=Y(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_f=imfilter(sigma_map_f,kernel,'symmetric');  
% figure;
% surf(sigma_map_f);
% figure;
% surf(true_sigma_map_f);

sigma_map_n=rot90(sigma_map_f);
sigma_map_n=rot90(sigma_map_n);

true_sigma_map_n=rot90(true_sigma_map_f);
true_sigma_map_n=rot90(true_sigma_map_n);

kernel = fspecial('gaussian',[7 7], 1);
sigma_map_n=imfilter(sigma_map_n,kernel,'symmetric');  
% figure;
% surf(sigma_map_n);
% figure;
% surf(true_sigma_map_n);

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


%Image 5 Depth map*********************************************************
prediction=net2(X(40001:50000,:)');
sigma_map_f=zeros(size(image_segments_1));
true_sigma_map_f=zeros(size(image_segments_1));
k=1;
for i=1:size(image_segments_1,1)
        for j=1:size(image_segments_1,2)            
            
              sigma_map_f(i,j)=prediction(1,k);
              true_sigma_map_f(i,j)=Y(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_f=imfilter(sigma_map_f,kernel,'symmetric');  
% figure;
% surf(sigma_map_f);
% figure;
% surf(true_sigma_map_f);

sigma_map_n=rot90(sigma_map_f);
sigma_map_n=rot90(sigma_map_n);

true_sigma_map_n=rot90(true_sigma_map_f);
true_sigma_map_n=rot90(true_sigma_map_n);

kernel = fspecial('gaussian',[7 7], 1);
sigma_map_n=imfilter(sigma_map_n,kernel,'symmetric');  
% figure;
% surf(sigma_map_n);
% figure;
% surf(true_sigma_map_n);

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


%Image 6 Depth map*********************************************************
prediction=net2(X(50001:60000,:)');
sigma_map_f=zeros(size(image_segments_1));
true_sigma_map_f=zeros(size(image_segments_1));
k=1;
for i=1:size(image_segments_1,1)
        for j=1:size(image_segments_1,2)            
            
              sigma_map_f(i,j)=prediction(1,k);
              true_sigma_map_f(i,j)=Y(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_f=imfilter(sigma_map_f,kernel,'symmetric');  
% figure;
% surf(sigma_map_f);
% figure;
% surf(true_sigma_map_f);

sigma_map_n=rot90(sigma_map_f);
sigma_map_n=rot90(sigma_map_n);

true_sigma_map_n=rot90(true_sigma_map_f);
true_sigma_map_n=rot90(true_sigma_map_n);

kernel = fspecial('gaussian',[7 7], 1);
sigma_map_n=imfilter(sigma_map_n,kernel,'symmetric');  
% figure;
% surf(sigma_map_n);
% figure;
% surf(true_sigma_map_n);

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
%Image 7 Depth map*********************************************************
prediction=net2(X(60001:70000,:)');
sigma_map_f=zeros(size(image_segments_1));
true_sigma_map_f=zeros(size(image_segments_1));
k=1;
for i=1:size(image_segments_1,1)
        for j=1:size(image_segments_1,2)            
            
              sigma_map_f(i,j)=prediction(1,k);
              true_sigma_map_f(i,j)=Y(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_f=imfilter(sigma_map_f,kernel,'symmetric');  
% figure;
% surf(sigma_map_f);
% figure;
% surf(true_sigma_map_f);

sigma_map_n=rot90(sigma_map_f);
sigma_map_n=rot90(sigma_map_n);

true_sigma_map_n=rot90(true_sigma_map_f);
true_sigma_map_n=rot90(true_sigma_map_n);

kernel = fspecial('gaussian',[7 7], 1);
sigma_map_n=imfilter(sigma_map_n,kernel,'symmetric');  
% figure;
% surf(sigma_map_n);
% figure;
% surf(true_sigma_map_n);

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

%Image 8 Depth map*********************************************************
prediction=net2(X(70001:80000,:)');
sigma_map_f=zeros(size(image_segments_1));
true_sigma_map_f=zeros(size(image_segments_1));
k=1;
for i=1:size(image_segments_1,1)
        for j=1:size(image_segments_1,2)            
            
              sigma_map_f(i,j)=prediction(1,k);
              true_sigma_map_f(i,j)=Y(k,1);
              k=k+1;
        end        
        
end
kernel = fspecial('gaussian',[7 7], 1);
sigma_map_f=imfilter(sigma_map_f,kernel,'symmetric');  
% figure;
% surf(sigma_map_f);
% figure;
% surf(true_sigma_map_f);

sigma_map_n=rot90(sigma_map_f);
sigma_map_n=rot90(sigma_map_n);

true_sigma_map_n=rot90(true_sigma_map_f);
true_sigma_map_n=rot90(true_sigma_map_n);

kernel = fspecial('gaussian',[7 7], 1);
sigma_map_n=imfilter(sigma_map_n,kernel,'symmetric');  
% figure;
% surf(sigma_map_n);
% figure;
% surf(true_sigma_map_n);

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

hold off
figure;
imshow(image1,[]);
figure;
imshow(image2,[]);
figure;
imshow(image3,[]);
figure;
imshow(image4,[]);
figure;
imshow(image5,[]);
figure;
imshow(image6,[]);
figure;
imshow(image7,[]);
figure;
imshow(image8,[]);