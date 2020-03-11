clear
clc 
close all 

%a
t = -100 : 0.05 : 100.05;

N = length(t);

g = sinc(t); 

figure(1)
%grid on
subplot(1,2,1)
plot(t,g,'b');
%axis([xmin xmax ymin ymax]) 
axis([-100 100 -1 1]) 
title('Sinal g(t)')
ylabel('g(t)')
xlabel('t(s)')
%legend('Cosseno','Seno')


subplot(1,2,2)
plot(t,g,'b-o');
grid on
xlim([-3 3]) 
%xlim([xmin xman]) 
%axis([xmin xmax ymin ymax]) 
%axis([-3 3 -1 1]) 
title('Sinal g(t)')
ylabel('g(t)')
xlabel('t(s)')

%f)
G = fftshift(fft(g));
%g)
T=0.05;
fs=1/T;
f = -fs/2:fs/N:(fs/2-fs/N);
%h)
figure(2)
plot(f,abs(G)*T)
xlim([-2 2])
title('Sinal G(f)')
ylabel('G(f)')
xlabel('f(Hz)')

%i)

figure(3)
pwelch(g,[ ],[ ],N,fs)
title('Densidade Espectral Estimada')


%% Exercício 2
clear
clc 
close all 

%a
t = -100 : 0.05 : 100.05;

N = length(t);

g = 1*(abs(t)<1/2); 

figure(1)
%grid on
subplot(1,2,1)
plot(t,g,'b');
%axis([xmin xmax ymin ymax]) 
axis([-100 100 -1 1]) 
title('Sinal g(t)')
ylabel('g(t)')
xlabel('t(s)')
%legend('Cosseno','Seno')


subplot(1,2,2)
plot(t,g,'b-o');
grid on
xlim([-3 3]) 
%xlim([xmin xman]) 
%axis([xmin xmax ymin ymax]) 
%axis([-3 3 -1 1]) 
title('Sinal g(t)')
ylabel('g(t)')
xlabel('t(s)')

%f)
G = fftshift(fft(g));
%g)
T=0.05;
fs=1/T;
f = -fs/2:fs/N:(fs/2-fs/N);
%h)
figure(2)
plot(f,abs(G)*T)
xlim([-2 2])
title('Sinal G(f)')
ylabel('G(f)')
xlabel('f(Hz)')

%i)

figure(3)
pwelch(g,[ ],[ ],N,fs)
title('Densidade Espectral Estimada')

%% Exercício 3

clear
clc 
close all 

%a
t = -100 : 0.05 : 99.95;

N = length(t);

g = cos(2*pi*t + pi/4) + 2*sin(2*pi*2*t) + 3*cos(2*pi*3.5*t - pi/4);

figure(1)
%grid on
subplot(1,2,1)
plot(t,g,'b');
%axis([xmin xmax ymin ymax]) 
axis([-100 100 -1 1]) 
title('Sinal g(t)')
ylabel('g(t)')
xlabel('t(s)')
%legend('Cosseno','Seno')


subplot(1,2,2)
plot(t,g,'b-o');
grid on
xlim([-3 3]) 
%xlim([xmin xman]) 
%axis([xmin xmax ymin ymax]) 
%axis([-3 3 -1 1]) 
title('Sinal g(t)')
ylabel('g(t)')
xlabel('t(s)')

%f)
G = fftshift(fft(g))/N;
%g)
T=0.05;
fs=1/T;
f = -fs/2:fs/N:(fs/2-fs/N);
%h)
figure(2)
plot(f,abs(G))
xlim([-4 4])
title('Sinal G(f)')
ylabel('G(f)')
xlabel('f(Hz)')

%i)

figure(3)
pwelch(g,[ ],[ ],N,fs)
title('Densidade Espectral Estimada')




tol = 1e-6;
G(abs(G) < tol) = 0; %remove fases de G com m´odulo perto de 0
figure
stem(f,(angle(G))/pi) %plota a fase em fun¸c~ao de pi, ou seja, de −1 a 1 (de pi a -pi).
ylabel('fase (pi rad)')



