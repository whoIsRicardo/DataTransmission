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
%sound(m1,fs) 
%sound(m2,fs)
%sound(vo1,fs)
sound(vo2,fs)


%% 3 -------------------------------------------------------------------------

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

%Aqui ocorrem as mudanças de fase
c1 = 2*cos(2*pi*fc.*t + pi/4);
c2 = 2*sin(2*pi*fc.*t + pi/4); 


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
title('M1(f)')

%i)|M2(f)|
subplot(2,2,2)
plot(f,M2)
xlim([-30 30])
%title('Sinal |M(f)|')
title('M2(f)')

%i)|S1(f)|
subplot(2,2,3)
plot(f,S1)
xlim([-30 30])
%title('Sinal |M(f)|')
title('S1(f)')

%i)|S2(f)|
subplot(2,2,4)
plot(f,S2)
xlim([-30 30])
title('S2(f)')

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
xlabel('T(s)'); 


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
title('|V1(f)|'); 

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
%sound(m1,fs) 
%sound(m2,fs)
%sound(vo1,fs)
sound(vo2,fs)

% Os áudios estão encavalados , vo1 e vo2. 
% Ocorre porque houve perdade de sincronismo de fase 
% Sim, este evento está relacionado à equação (1), pois a fase foi alterada
% nesta questão. 








