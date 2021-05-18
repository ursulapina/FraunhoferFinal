clear all; close all; clc;
I0 = 1 ; 
lambda = 1;
d = 1.5.*lambda; % Distance between points
th = linspace(-pi/2,pi/2);
N = [1,2,3,4,5];%Number of evenly spaced points
alpha = pi.*d./lambda.*sin(th);
for i= 1:length(N)
I(i,:) = I0./N(i).^2.*(sin(N(i).*alpha)./sin(alpha)).^2;
end

figure(1)
for i = 1:length(N)
    subplot(5,2,i*2-1)
    polarplot(th,I(i,:),'Color','k','LineWidth',1)
    axis off
end
for i = length(N)+1:length(N)*2
    subplot(5,2,(i-length(N))*2)
    polarplot(th,I(i-length(N),:),'Color','k','LineWidth',1)
    rlim([0 .1])
    axis off
end
set(gcf,'color','w');