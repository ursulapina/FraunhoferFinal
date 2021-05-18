clear all; close all; clc;
I0 = 1 ; 
lambda = 1;
phi = [0,1/6,2/6,3/6,4/6].*pi;%relative phase shift
d = .5.*lambda; % Distance between points
th = linspace(-pi/2,pi/2);
N = 6;%Number of evenly spaced points
for i= 1:length(phi)
alpha(i,:) = pi.*d./lambda.*sin(th)-phi(i)/2; %taking in account the phase shift
I(i,:) = I0./N.^2.*(sin(N.*alpha(i,:))./sin(alpha(i,:))).^2;
end

figure(1)
for i = 1:length(phi)
    subplot(5,2,i*2-1)
    polarplot(th,I(i,:),'Color','k','LineWidth',1)
    axis off
end
for i = length(phi)+1:length(phi)*2
    subplot(5,2,(i-length(phi))*2)
    polarplot(th,I(i-length(phi),:),'Color','k','LineWidth',1)
    rlim([0 .1])
    axis off
end
set(gcf,'color','w');