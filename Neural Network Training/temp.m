clear;
close all;
clc;
X=zeros([190000 100]);
Y=zeros([190000 1]);
k=1;
for count=1:19
    
        str=strcat('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\Neural Network Training\high_texture_images\high_texture_image_',int2str(count),'.bmp');
        image=((imread(str)));
        sigma=0.1:0.1:4.9;
        j=1;
        for i=21:20:1000

                    std_dev=sigma(1,j);%random blur standard deviation
                    kernel = fspecial('gaussian',[7 7], std_dev);
                    image(i:i+19,:)=imfilter(image(i:i+19,:),kernel,'symmetric');  
                    j=j+1;   

        end
        figure;
        imshow(image,[]);
        image_edges = edge(image,'canny');
        figure;
        imshow(image_edges,[]);
        image_segments=imseg(image,10,0);
        c=0;
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
end
net1=feedforwardnet([100 50 2]);
net2=trainscg(net1,X',Y','useGPU','no');
net2=trainscg(net2,X',Y','useGPU','no');
