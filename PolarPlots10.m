clear all; close all; clc;
I0 = 1 ; 
lambda = 1;
a = [2.75,3,3.25,3.5,3.75].*lambda ; % Ancho de la abertura
th = linspace(-pi/2,pi/2);
for i= 1:length(a)
    B(i,:) = pi*a(i)/lambda.*sin(th);
    I(i,:) = I0.*(sin(B(i,:))./B(i,:)).^2 ; 
end

figure(1)
for i = 1:length(a)
    subplot(5,2,i*2-1)
    polarplot(th,I(i,:),'Color','k','LineWidth',1)
     title(['a =' num2str(a(i)) '\lambda'])
    axis off
end
for i = length(a)+1:length(a)*2
    subplot(5,2,(i-length(a))*2)
    polarplot(th,I(i-length(a),:),'Color','k','LineWidth',1)
     title(['a =' num2str(a(i-length(a))) '\lambda'])
    rlim([0 .05])
    axis off
end
set(gcf,'color','w');
set(gcf,'position',[500,0,600,1000]);