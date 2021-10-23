clear all;
close all;
clc;
%% create a recorder Object
recorder = audiorecorder(16000,8,2);
%% Recorde voice
disp('record');
drawnow();
pause(1);
recordblocking(recorder,5);
play(recorder);
data=getaudiodata(recorder);
plot(data);
figure;
%% Feature extraction
f=VoiceFeatures(data);
%% classify
load database
D=[];
for(i=1:size(F,1))
    d=sum(abs(F(i)-f));
    D=[D d];
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
disp('The detected clas is :');
detected_class

