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
%% a)
figure(1)
subplot(3,1,1)
plot(t,m)
grid on
title("m(t)");
xlim([0.94 0.95]);
subplot(3,1,2)
plot(t,c)
grid on
title("c(t)");
xlim([0.94 0.95]);

subplot(3,1,3)
plot(t,s,'b')
hold on 
plot(t,m,'k')
grid on
title("s(t) e m(t)"); 
xlabel("Tempo(s)")
xlim([0.94 0.95]);

%% b)
M = abs(fftshift(fft(m)))/N;
C = abs(fftshift(fft(c)))/N;
S = abs(fftshift(fft(s)))/N;
%T=0.05;
%fs=1/T;
f = (-fs/2:fs/N:(fs/2-fs/N))./1000;



figure(2)
%|M(f)|
subplot(3,1,1)
plot(f,M)
xlim([-4 4])
%title('Sinal |M(f)|')
ylabel('M(f)')

subplot(3,1,2)
plot(f,C)
ylabel('C(f)')
xlim([-80 80])

subplot(3,1,3) 
plot(f,S)
xlim([-80 80])
ylabel('S(f)')
xlabel('f(Hz)')

%%




