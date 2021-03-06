clc
close all
%%Exercicio 1
x = linspace(0,2*pi,30);
y0 = sin(x);
x0 = cos(x); 
plot(x,y0,'r*-');
hold on 
plot(x,x0,'go-');


%%Exercicio 2
x = linspace(0,(5*pi)./2,500);
y1 = cos(x);
y2 = sin(x);
y3 = 2.*sin(x).*cos(x);
y4 = sin(x) ./ exp(x); 

figure
subplot(2,2,1)
plot(x,y2,'b-');
%axis([xmin xmax ymin ymax]) 
axis([0 8 -1 1]) 
%title('Seno e cosseno')
ylabel('sin(x)')
%xlabel('Tempo (s)')
%legend('Cosseno','Seno')


%hold on
subplot(2,2,2)
plot(x,y1,'b-');
axis([0 8 -1 1])
%title('Seno e cosseno')
ylabel('cos(x)')
%xlabel('Tempo (s)')
%legend('Cosseno','Seno')

subplot(2,2,3)
plot(x,y3,'b-');
axis([0 8 -1 1])
%title('Seno e cosseno')
ylabel('2sin(x).cos(x)')
%xlabel('Tempo (s)')
%legend('Cosseno','Seno')

subplot(2,2,4)
plot(x,y4,'b-');
%axis([0 8 -0.2 0.4])
%title('Seno e cosseno')
ylabel('sin(x)/exp(x)')
%xlabel('Tempo (s)')
%legend('Cosseno','Seno')
