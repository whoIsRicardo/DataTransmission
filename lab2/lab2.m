close all 
clear all 
clc 

load sound.mat

%sound(m,fs)

N = length(m);

T = 1 / fs;

t =(0:N-1)*T;

fc = 20*(10^3);

c = cos(2*pi*fc.*t);

s = m.*c; 

figure(1)
subplot(3,1,1)
plot(t,m)
title("m(t)");
xlim([0.94 0.95]);
subplot(3,1,2)
plot(t,c)
title("c(t)");
xlim([0.94 0.95]);

subplot(3,1,3)
plot(t,s,'b')
hold on 
plot(t,m,'k')
title("s(t) e m(t)"); 
xlabel("Tempo(s)")
xlim([0.94 0.95]);











