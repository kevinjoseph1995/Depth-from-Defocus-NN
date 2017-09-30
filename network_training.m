clear;
clc;
load('C:\Users\Kevin Joseph\Desktop\audio_training_data.mat');
random_index=randperm(1560);
X=X(:,random_index);
Y=Y(:,random_index);
clear random_index;
net=patternnet([128 128 128]);
net=train(net,X(:,1:1560),Y(:,1:1560));