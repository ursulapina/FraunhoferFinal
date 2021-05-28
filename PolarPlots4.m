clear all; close all; clc;
I0 = 1 ; 
lambda = 1;
d = [.5,1,1.5,2,2.5].*lambda; % Distance between points
th = linspace(-pi/2,pi/2);
N = 3;%Number of evenly spaced points
for i= 1:length(d)
alpha(i,:) = pi.*d(i)./lambda.*sin(th);
I(i,:) = I0./N.^2.*(sin(N.*alpha(i,:))./sin(alpha(i,:))).^2;
end

figure(1)

for i = 1:length(d)
    subplot(5,2,i*2-1)
    polarplot(th,I(i,:),'Color','k','LineWidth',1)
    title(['d =' num2str(d(i)) '\lambda'])
    axis off
end
    
for i = length(d)+1:length(d)*2
    subplot(5,2,(i-length(d))*2)
    polarplot(th,I(i-length(d),:),'Color','k','LineWidth',1)
    title(['d =' num2str(d(i-length(d))) '\lambda'])
    rlim([0 .2])
    axis off
end
set(gcf,'color','w');
set(gcf,'position',[500,0,600,1000]);

