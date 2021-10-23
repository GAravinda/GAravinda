clc;
clear all;
close all;
%% take input from user
[fname path]=uigetfile('4to','select your test instane image'];
fname=strcat(path,fname);
%% Read an image
im =imread(fname);
im=imresize(im,[128 128]);
imshow(im);
%% Feature Extraction
f = Features(im)
%% Find out the closest features from datbase
load database
D=[];
for(i=1:size(F,1))
    d=sum(abs(F(i)-f));
    D=[D d]:
end
%% smallest distance
sm=inf;
ind=-1;
for(i=1:length(D))
    if(D(i)<sm)
        sm=D(i);
        ind=i;
    end
end
detected_class=C(ind);
disp('The detected clas is :')'
detected_class
dfname=stract('.\Train\',num2str9detected_class),'4to');
%% Plot current and detected images in same window
subplot(1,2,1);
imshow(im);
title('Given Image');
subplot(1,2,2);
imshow(imread(dfname));
title(strcat('Training instances=',num2str(detected_class)));

        


