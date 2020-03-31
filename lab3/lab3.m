% Ricardo dos Santos - 1380320
close all 
clear all 
clc 
load sound2.mat
%sound(m1,fs);
%sound(m2,fs);

N = length(m1);
T = 1 / fs;
t =(0:N-1)*T;
fc = 20*(10^3);

c1 = cos(2*pi*fc.*t);
c2 = sin(2*pi*fc.*t); 


s1 = m1.*c1; 
s2 = m2.*c2; 

%% 1 - a)
figure(1)
% m1
subplot(4,1,1)
plot(t,m1)
grid on
title("m1(t)");
xlim([0.80 0.81]);

% m2
subplot(4,1,2)
plot(t,m2)
grid on
title("m2(t)");
xlim([0.80 0.81]);

% s1
subplot(4,1,3)
plot(t,s1,'b')
grid on
title('s1(t)')
xlim([0.8 0.81])

subplot(4,1,4)
plot(t,s2,'k')
grid on
title("s2(t)"); 
xlim([0.80 0.81]);
xlabel('T(s)')



%% 1 - b)
M1 = abs(fftshift(fft(m1)))/N;
M2 = abs(fftshift(fft(m2)))/N;
S1 = abs(fftshift(fft(s1)))/N;
S2 = abs(fftshift(fft(s2)))/N; 
f = (-fs/2:fs/N:(fs/2-fs/N))./1000;
figure(2)
%i)|M1(f)|
subplot(2,2,1)
plot(f,M1)
xlim([-30 30])
%title('Sinal |M(f)|')
ylabel('M1(f)')

%i)|M2(f)|
subplot(2,2,2)
plot(f,M2)
xlim([-30 30])
%title('Sinal |M(f)|')
ylabel('M2(f)')

%i)|S1(f)|
subplot(2,2,3)
plot(f,S1)
xlim([-30 30])
%title('Sinal |M(f)|')
ylabel('S1(f)')

%i)|S2(f)|
subplot(2,2,4)
plot(f,S2)
xlim([-30 30])
ylabel('S2(f)')

%% 2 - a)

s = s1 + s2;

v1 = s.*2.*cos(2*pi*fc.*t);
v2 = s.*2.*sin(2*pi*fc.*t);

figure(3);
subplot(2,1,1);
plot(t,v1);
%xlim([-30 30]);
title('v1(t)'); 

subplot(2,1,2);
plot(t,v2); 
%xlim([-30 30]);
title('v2(t)'); 


%% 2 - b) 

fcorte = 6000/(fs/2);
h = fir1(2000,fcorte);
[H, fh] = freqz(h,1,N/2+1,fs/1000) ;
H = abs(H);
vo1 = filter(h,1,v1);
vo2 = filter(h,1,v2);

%% 2 - c)

S = abs(fftshift(fft(s)))/N;

V1 = abs(fftshift(fft(v1)))/N;
V2 = abs(fftshift(fft(v2)))/N;
Vo1 = abs(fftshift(fft(vo1)))/N;
Vo2 = abs(fftshift(fft(vo2)))/N;


figure(4)

subplot(5,1,1)
plot(f,S); 
xlim([0 50]);
title('|S(f)|');

subplot(5,1,2)
plot(f,V1); 
xlim([0 50]);
title('|V1(f)'); 

subplot(5,1,3)
plot(f,V2); 
xlim([0 50]);
title('|V2(f)|');

subplot(5,1,4)
plot(f,Vo1); 
xlim([0 50]);
title('|Vo1(f)|');


subplot(5,1,5)
plot(f,Vo2); 
xlim([0 50]);
title('|Vo2(f)|'); 

%% 2 - d)

% Com uma análise gráfica, aparentemente ficaram iguais, respectivamente. 



% %ii) |C(f)|
% subplot(3,1,2)
% plot(f,C1)
% ylabel('C(f)')
% xlim([-80 80])
% %iii) |S(f)|
% subplot(3,1,3) 
% plot(f,S1)
% xlim([-80 80])
% ylabel('S(f)')
% xlabel('f(Hz)')
% 
% %% 2 - a)
% fc = 20* (10^3);
% c1 = cos(2*pi*fc*t);
% vt1 = s1.*c1;
% figure(3) 
% plot(t,vt1)
% title('v(t)')
% xlabel('Tempo(s)')
% 
% %% 2 - b)
% fcorte = 6000/(fs/2);
% h = fir1(2000,fcorte);
% [H, fh] = freqz(h,1,N/2+1,fs/1000) ;
% H = abs(H);
% vo1 = filter(h,1,vt1);
% 
% %% 2 - c)
% figure(4) 
% %i)
% subplot(4,1,1)
% S1 = abs(fftshift(fft(s1)))/N;
% plot(f,S1)
% title('|S(f)|')
% xlim([0 50])
% %ii)
% subplot(4,1,2)
% Vf1 = abs(fftshift(fft(vt1)))/N;
% plot(f,Vf1)
% title('|V(f)|')
% xlim([0 50])
% %iii)
% subplot(4,1,3)
% Hf1 = abs(fftshift(fft(H)))/N;
% plot(fh,Hf1)
% title('|H(f)|')
% xlim([0 50])
% %iv)
% subplot(4,1,4)
% V0f1 = fftshift(fft(vo1))/N;
% plot(f,V0f1)
% title('|Vo(f)|')
% xlim([0 50])
% %% 2 - d)
% %É possível ver a aplitude nos gráficos com o apoio da ferramenta "Data Cursor"
% %|M(f) no eixo Y é igual a 0.00579
% %|Vo(f)| no eixo Y é igual a 0.002602
% %Ou seja, aproximandamente metade da amplitude
% 
% %% 2 - e) É possível perceber a diferença de amplitude ao tocar os dois áudios ao mesmo tempo. 
% sound(m1,fs) 
% sound(vo1,fs)
% %% 3 - a)
% v1 = s1.*cos(2*pi*fc*t + pi/3);
% figure(5)
% subplot(2,1,1)
% plot(t,v1)
% title('Com phi = pi/3')
% %% 3 - b)
% v1 = s1.*cos(2*pi*fc*t + pi/2);
% figure(6)
% subplot(2,1,2)
% plot(t,v1)
% title('Com phi = pi/2')
% xlabel('Tempo(s)')

%%  4 - 
% fc = 20100;
% v1 = s1.*cos(2*pi*fc*t);
% figure(7)
% subplot(4,1,1)
% plot(t,v1)
% title('fc = 20.1kHz')
% fc = 21000;
% v1 = s1.*cos(2*pi*fc*t);
% subplot(4,1,2)
% plot(t,v1)
% title('fc = 21kHz')
% fc = 22000;
% v1 = s1.*cos(2*pi*fc*t);
% subplot(4,1,3)
% plot(t,v1)
% title('fc = 22kHz')
% fc = 25000;
% v1 = s1.*cos(2*pi*fc*t);
% subplot(4,1,4)
% plot(t,v1)
% title('fc = 25kHz')