function [xpitch]=VoiceFeatures(data)
F=fft(data(:,1));
plot(real(F));
m=max(real(F));
xpitch=find(real(F)==m,1)

