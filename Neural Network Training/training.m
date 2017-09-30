load('data_image_section_10x10.mat');
net1=feedforwardnet([25 3 3]);
net2=trainbr(net1,X(1:400000,:)',Y(1:400000,:)','useGPU','no');