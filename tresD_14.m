clear all; close all; clc; 

I0 = 1 ; 
lambda = 1;
N = 3; %Numero de slits
y0 = 1;
n = 100;
a = 1; % Ancho de la abertura
y = linspace(0,y0,n) ;
d =  linspace(1,10,n).*a;


[D,Y] = meshgrid(d,y);
alpha = pi.*D.*Y./(a.*y0);
B = pi.*Y./y0;
I = I0./N^2.*(sin(B)./B).^2.*(sin(N.*alpha)./sin(alpha)).^2 ; 
mesh(D,Y,I)
colormap(bone)
% shading interp %Quitar lineas
xlabel('Slit Spacing, d')
ylabel('Distance From Central Maximum, y')
zlabel('Intensity I')
set(gca,'ydir','reverse')
xticks([1 5 10])
xticklabels({'a','5a','10a'})
yticks([0 .5 1])
yticklabels({'0','0.5 y_0','y_0'})
zticks([1])
zticklabels({'I_0'})
zlim([0 1])
%Handel of the y label
yh = get(gca,'YLabel'); % Handle of the y label
set(yh, 'Units', 'Normalized')
pos = get(yh, 'Position');
set(yh,'Position',pos.*[.8,-.5,3],'Rotation',-25)
v = [-3 -2 8];
[caz,cel] = view(v)