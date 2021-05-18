clear all; close all; clc;
I0 = 1 ; 
lambda = 1;
d = [.5,.6,.7,.8,.9].*lambda; % Distance between points
th = linspace(-pi/2,pi/2);
N = 2;%Number of evenly spaced points
for i= 1:length(d)
alpha(i,:) = pi.*d(i)./lambda.*sin(th);
I(i,:) = I0./N.^2.*(sin(N.*alpha(i,:))./sin(alpha(i,:))).^2;
end

figure(1)
for i = 1:length(d)
    subplot(5,2,i*2-1)
    polarplot(th,I(i,:),'Color','k','LineWidth',1)
    axis off
end
for i = length(d)+1:length(d)*2
    subplot(5,2,(i-length(d))*2)
    polarplot(th,I(i-length(d),:),'Color','k','LineWidth',1)
    rlim([0 .2])
    axis off
end
set(gcf,'color','w');