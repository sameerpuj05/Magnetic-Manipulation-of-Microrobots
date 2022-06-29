clear ;
clc;
% Analysing field along a single wire...
% Constants 
I = 0.5;       %Current flowing in the wire
g = 200e-6;     %Coil spacing
m0 = 4*pi*1e-7;
c =  -400e-6:100e-6:400e-6;
[X,Y,Z] = meshgrid(c);



% Line along X - axis
% --------------------------------------------------------------Coil_1
x1_1 = -g;
x2_1 = g;
a_yp_1 = g;          %Distance of coil from (0,0)
coil_length_x_1 = x2_1 - x1_1;
k_p_1 = 1/(4*pi*((a_yp_1-Y).^2+Z.^2));
k_1xp_1 = (x2_1-X)./((x2_1-X).^2+(a_yp_1-Y).^2+Z.^2).^0.5;
k_2xp_1 = (x1_1-X)./((x1_1-X).^2+(a_yp_1-Y).^2+Z.^2).^0.5;

Hx_xp_1 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_1 = (-Z.*k_p_1.*(k_1xp_1 - k_2xp_1))*I;
Hz_xp_1 = (-(a_yp_1-Y).*k_p_1.*(k_1xp_1 - k_2xp_1))*I;

a_yn_1 = -g;
k_n_1 = 1/(4*pi*((a_yn_1-Y).^2+Z.^2));
k_1xn_1 = (x2_1-X)./((x2_1-X).^2+(a_yn_1-Y).^2+Z.^2).^0.5;
k_2xn_1 = (x1_1-X)./((x1_1-X).^2+(a_yn_1-Y).^2+Z.^2).^0.5;

Hx_xn_1 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_1 = (Z.*k_n_1.*(k_1xn_1 - k_2xn_1))*I;
Hz_xn_1 = ((a_yn_1-Y).*k_n_1.*(k_1xn_1 - k_2xn_1))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_1 = -g;
y2_1 = g;
a_xp_1 = g;          %Distance of coil from (0,0)
coil_length_y_1 = y2_1 - y1_1;

k_yp_1 = 1/(4*pi*((a_xp_1-X).^2+Z.^2));
k_1yp_1 = (y2_1-Y)./((y2_1-Y).^2+(a_xp_1-X).^2+Z.^2).^0.5;
k_2yp_1 = (y1_1-Y)./((y1_1-Y).^2+(a_xp_1-X).^2+Z.^2).^0.5;

Hx_yp_1 = -(Z.*k_yp_1.*(k_1yp_1 - k_2yp_1))*I;
Hy_yp_1 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_1 = (-(a_xp_1-X).*k_yp_1.*(k_1yp_1 - k_2yp_1))*I;

a_xn_1 = -g;
k_yn_1 = 1/(4*pi*((a_xn_1-X).^2+Z.^2));
k_1yn_1 = (y2_1-Y)./((y2_1-Y).^2+(a_xn_1-X).^2+Z.^2).^0.5;
k_2yn_1 = (y1_1-Y)./((y1_1-Y).^2+(a_xn_1-X).^2+Z.^2).^0.5;

Hx_yn_1 = (Z.*k_yn_1.*(k_1yn_1 - k_2yn_1))*I;
Hy_yn_1 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_1 = ((a_xn_1-X).*k_yn_1.*(k_1yn_1 - k_2yn_1))*I;


% Adding field of the coil
Hx_1 = Hx_xp_1 + Hx_xn_1 + Hx_yp_1 + Hx_yn_1;
Hy_1 = Hy_xp_1 + Hy_xn_1 + Hy_yp_1 + Hy_yn_1;
Hz_1 = Hz_xp_1 + Hz_xn_1 + Hz_yp_1 + Hz_yn_1;


% -------Plotting the fields--------
% d = -400e-6:400e-6:400e-6;
% [X1, Y1, Z1] = meshgrid(d);
figure
% streamline(X,Y,Z,Hx_1,Hy_1,Hz_1,X1,Y1,Z1)
quiver3(X,Y,Z,Hx_1,Hy_1,Hz_1)
hold on

plot(0,a_yp_1,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_1,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_1,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_1,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_1 x2_1],[a_yp_1 a_yp_1],'linewidth',3,'color','r');
line([x1_1 x2_1],[a_yn_1 a_yn_1],'linewidth',3,'color','r');
line([a_xn_1 a_xn_1],[y1_1 y2_1],'linewidth',3,'color','r');
line([a_xp_1 a_xp_1],[y1_1 y2_1],'linewidth',3,'color','r');
title('Field around the coil (I in CW)')
xlabel('X-axis','fontsize',14)
ylabel('Y-axis','fontsize',14)
zlabel('Z-axis','fontsize',14)
hold off


figure
dfh = Hz_1(:,:,1);
[X1,Y1] = meshgrid(c);
surf(X1,Y1,dfh)
hold on
line([x1_1 x2_1],[a_yp_1 a_yp_1],'linewidth',3,'color','r');
line([x1_1 x2_1],[a_yn_1 a_yn_1],'linewidth',3,'color','r');
line([a_xn_1 a_xn_1],[y1_1 y2_1],'linewidth',3,'color','r');
line([a_xp_1 a_xp_1],[y1_1 y2_1],'linewidth',3,'color','r');
G1=plot(0,a_yp_1,'>','markersize',10,"MarkerFaceColor",'g');
G2=plot(0,a_yn_1,'<','markersize',10,"MarkerFaceColor",'g');
G3=plot(a_xp_1,0,'<','markersize',10,"MarkerFaceColor",'g');
G4=plot(a_xn_1,0,'>','markersize',10,"MarkerFaceColor",'g');
title('Field')
xlabel('X-axis','fontsize',14)
ylabel('Y-axis','fontsize',14)
zlabel('Z-axis','fontsize',14)
hold off