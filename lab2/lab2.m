% Ricardo dos Santos - 1380320
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
%% 1 - a)
figure(1)
%i)
subplot(3,1,1)
plot(t,m)
grid on
title("m(t)");
xlim([0.94 0.95]);
%ii)
subplot(3,1,2)
plot(t,c)
grid on
title("c(t)");
xlim([0.94 0.95]);
%iii)
subplot(3,1,3)
plot(t,s,'b')
hold on 
plot(t,m,'k')
grid on
title("s(t) e m(t)"); 
xlabel("Tempo(s)")
xlim([0.94 0.95]);

%% 1 - b)
M = abs(fftshift(fft(m)))/N;
C = abs(fftshift(fft(c)))/N;
S = abs(fftshift(fft(s)))/N;
%T=0.05;
%fs=1/T;
f = (-fs/2:fs/N:(fs/2-fs/N))./1000;
figure(2)
%i)|M(f)|
subplot(3,1,1)
plot(f,M)
xlim([-4 4])
%title('Sinal |M(f)|')
ylabel('M(f)')
%ii) |C(f)|
subplot(3,1,2)
plot(f,C)
ylabel('C(f)')
xlim([-80 80])
%iii) |S(f)|
subplot(3,1,3) 
plot(f,S)
xlim([-80 80])
ylabel('S(f)')
xlabel('f(Hz)')

%% 2 - a)
fc = 20* (10^3);
c = cos(2*pi*fc*t);
vt = s.*c;
figure(3) 
plot(t,vt)
title('v(t)')
xlabel('Tempo(s)')

%% 2 - b)
fcorte = 6000/(fs/2);
h = fir1(2000,fcorte);
[H, fh] = freqz(h,1,N/2+1,fs/1000) ;
H = abs(H);
vo = filter(h,1,vt);

%% 2 - c)
figure(4) 
%i)
subplot(4,1,1)
S = abs(fftshift(fft(s)))/N;
plot(f,S)
title('|S(f)|')
xlim([0 50])
%ii)
subplot(4,1,2)
Vf = abs(fftshift(fft(vt)))/N;
plot(f,Vf)
title('|V(f)|')
xlim([0 50])
%iii)
subplot(4,1,3)
Hf = abs(fftshift(fft(H)))/N;
plot(fh,Hf)
title('|H(f)|')
xlim([0 50])
%iv)
subplot(4,1,4)
V0f = fftshift(fft(vo))/N;
plot(f,V0f)
title('|Vo(f)|')
xlim([0 50])
%% 2 - d)
%É possível ver a aplitude nos gráficos com o apoio da ferramenta "Data Cursor"
%|M(f) no eixo Y é igual a 0.00579
%|Vo(f)| no eixo Y é igual a 0.002602
%Ou seja, aproximandamente metade da amplitude

%% 2 - e) É possível perceber a diferença de amplitude ao tocar os dois áudios ao mesmo tempo. 
sound(m,fs) 
sound(vo,fs)
%% 3 - a)
v = s.*cos(2*pi*fc*t + pi/3);
figure(5)
subplot(2,1,1)
plot(t,v)
title('Com phi = pi/3')
%% 3 - b)
v = s.*cos(2*pi*fc*t + pi/2);
figure(6)
subplot(2,1,2)
plot(t,v)
title('Com phi = pi/2')
xlabel('Tempo(s)')

%%  4 - 
fc = 20100;
v = s.*cos(2*pi*fc*t);
figure(7)
subplot(4,1,1)
plot(t,v)
title('fc = 20.1kHz')
fc = 21000;
v = s.*cos(2*pi*fc*t);
subplot(4,1,2)
plot(t,v)
title('fc = 21kHz')
fc = 22000;
v = s.*cos(2*pi*fc*t);
subplot(4,1,3)
plot(t,v)
title('fc = 22kHz')
fc = 25000;
v = s.*cos(2*pi*fc*t);
subplot(4,1,4)
plot(t,v)
title('fc = 25kHz')