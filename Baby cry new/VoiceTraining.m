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
%% Save users data
uno = input('enter user number :');
2try
    load database
    F=[F;f];
    C=[C;uno];
    save database
catch
    F=f;
    C=uno;
    save database F C
end
msgbox('Your voice registerd');
