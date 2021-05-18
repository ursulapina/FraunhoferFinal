clear all; close all; clc;
I0 = 1 ; 
lambda = 1;
a = [1.5,1.75,2,2.25,2.5].*lambda ; % Ancho de la abertura
th = linspace(-pi/2,pi/2);
for i= 1:length(a)
    B(i,:) = pi*a(i)/lambda.*sin(th);
    I(i,:) = I0.*(sin(B(i,:))./B(i,:)).^2 ; 
end

figure(1)
for i = 1:length(a)
    subplot(5,2,i*2-1)
    polarplot(th,I(i,:),'Color','k','LineWidth',1)
    axis off
end
for i = length(a)+1:length(a)*2
    subplot(5,2,(i-length(a))*2)
    polarplot(th,I(i-length(a),:),'Color','k','LineWidth',1)
    rlim([0 .1])
    axis off
end
set(gcf,'color','w');