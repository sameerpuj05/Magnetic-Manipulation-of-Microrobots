clear;
clc;
% Analysing field along a single wire...
% Constants 
I = -0.3;       %Current flowing in the wire
% gy = 250e-6;     %Coil spacing
m0 = 4*pi*1e-7;
c = -8e-3:0.25e-3:8e-3;
c = c';
[X,Y,Z] = meshgrid(c');
radius = 2e-3;%m
height = 1e-3;%m
Magentization = 1.45; %T
vol_cy = pi*radius^2*height; %If Object is Cylinder, vol in m^3
density = 7300; %kg/m^3 or 7.3 gm/cc for NdFeB 
mass_cy = density * vol_cy; %kg
gravity = 9.8 ; %m/s^2
Coeff_of_Fric = 0.432;
Force_cy = Coeff_of_Fric * mass_cy * gravity; %N



%.
% --------------------------------------------------------------Coil_1 - Layer1
% --------------------------------------------------------------
n = 1;
gy = 520e-6;
gx = 675e-6;
gz = 0;
% Line along X - axis
[Hx_xp_1, Hy_xp_1, Hz_xp_1, Hx_xn_1, Hy_xn_1, Hz_xn_1] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_1, Hy_yp_1, Hz_yp_1, Hx_yn_1, Hy_yn_1, Hz_yn_1] = field_y(X, Y, Z, I,n,gy, m0, gz);

% % Adding field of the coil
[Hx_1, Hy_1, Hz_1] = field_sum(Hx_xp_1 , Hx_xn_1 , Hx_yp_1 , Hx_yn_1, Hy_xp_1 , Hy_xn_1 , Hy_yp_1 , Hy_yn_1, Hz_xp_1 , Hz_xn_1 , Hz_yp_1 , Hz_yn_1);

%
%  --------------------------------------------------------------Coil_2
% --------------------------------------------------------------
% Line along X - axis
n = 2;
gy = 460e-6;
gx = 1.075e-3;
[Hx_xp_2, Hy_xp_2, Hz_xp_2, Hx_xn_2, Hy_xn_2, Hz_xn_2] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_2, Hy_yp_2, Hz_yp_2, Hx_yn_2, Hy_yn_2, Hz_yn_2] = field_y(X, Y, Z, I,n,gy, m0, gz);
% % Adding field of the coil
[Hx_2, Hy_2, Hz_2] = field_sum(Hx_xp_2 , Hx_xn_2 , Hx_yp_2 , Hx_yn_2, Hy_xp_2 , Hy_xn_2 , Hy_yp_2 , Hy_yn_2, Hz_xp_2 , Hz_xn_2 , Hz_yp_2 , Hz_yn_2);

% --------------------------------------------------------------Coil_3
n = 3;
gy = 440e-6;
gx = 1.475e-3;
% Line along X - axis
[Hx_xp_3, Hy_xp_3, Hz_xp_3, Hx_xn_3, Hy_xn_3, Hz_xn_3] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_3, Hy_yp_3, Hz_yp_3, Hx_yn_3, Hy_yn_3, Hz_yn_3] = field_y(X, Y, Z, I,n,gy, m0, gz);
% % Adding field of the coil
[Hx_3, Hy_3, Hz_3] = field_sum(Hx_xp_3 , Hx_xn_3 , Hx_yp_3 , Hx_yn_3, Hy_xp_3 , Hy_xn_3 , Hy_yp_3 , Hy_yn_3, Hz_xp_3 , Hz_xn_3 , Hz_yp_3 , Hz_yn_3);

% --------------------------------------------------------------Coil_4
n = 4;
gy = 430e-6;
gx = 1.875e-3;
% Line along X - axis
[Hx_xp_4, Hy_xp_4, Hz_xp_4, Hx_xn_4, Hy_xn_4, Hz_xn_4] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_4, Hy_yp_4, Hz_yp_4, Hx_yn_4, Hy_yn_4, Hz_yn_4] = field_y(X, Y, Z, I,n,gy, m0, gz);
% % Adding field of the coil
[Hx_4, Hy_4, Hz_4] = field_sum(Hx_xp_4 , Hx_xn_4 , Hx_yp_4 , Hx_yn_4, Hy_xp_4 , Hy_xn_4 , Hy_yp_4 , Hy_yn_4, Hz_xp_4 , Hz_xn_4 , Hz_yp_4 , Hz_yn_4);

% --------------------------------------------------------------Coil_5
n = 5;
gy = 424e-6;
gx = 2.275e-3;   
% Line along X - axis
[Hx_xp_5, Hy_xp_5, Hz_xp_5, Hx_xn_5, Hy_xn_5, Hz_xn_5] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_5, Hy_yp_5, Hz_yp_5, Hx_yn_5, Hy_yn_5, Hz_yn_5] = field_y(X, Y, Z, I,n,gy, m0, gz);
% % Adding field of the coil
[Hx_5, Hy_5, Hz_5] = field_sum(Hx_xp_5 , Hx_xn_5 , Hx_yp_5 , Hx_yn_5, Hy_xp_5 , Hy_xn_5 , Hy_yp_5 , Hy_yn_5, Hz_xp_5 , Hz_xn_5 , Hz_yp_5 , Hz_yn_5);

% --------------------------------------------------------------Coil_6
n = 6;
gy = 420e-6;
gx = 2.675e-3; 
% Line along X - axis
[Hx_xp_6, Hy_xp_6, Hz_xp_6, Hx_xn_6, Hy_xn_6, Hz_xn_6] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_6, Hy_yp_6, Hz_yp_6, Hx_yn_6, Hy_yn_6, Hz_yn_6] = field_y(X, Y, Z, I,n,gy, m0, gz);
% % Adding field of the coil
[Hx_6, Hy_6, Hz_6] = field_sum(Hx_xp_6 , Hx_xn_6 , Hx_yp_6 , Hx_yn_6, Hy_xp_6 , Hy_xn_6 , Hy_yp_6 , Hy_yn_6, Hz_xp_6 , Hz_xn_6 , Hz_yp_6 , Hz_yn_6);

% --------------------------------------------------------------Coil_7
n = 7;
gy = 417.14e-6; 
gx = 3.075e-3; 
% Line along X - axis
[Hx_xp_7, Hy_xp_7, Hz_xp_7, Hx_xn_7, Hy_xn_7, Hz_xn_7] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_7, Hy_yp_7, Hz_yp_7, Hx_yn_7, Hy_yn_7, Hz_yn_7] = field_y(X, Y, Z, I,n,gy, m0, gz);
% % Adding field of the coil
[Hx_7, Hy_7, Hz_7] = field_sum(Hx_xp_7 , Hx_xn_7 , Hx_yp_7 , Hx_yn_7, Hy_xp_7 , Hy_xn_7 , Hy_yp_7 , Hy_yn_7, Hz_xp_7 , Hz_xn_7 , Hz_yp_7 , Hz_yn_7);

% --------------------------------------------------------------Coil_8
n = 8;
gy = 415e-6;
gx = 3.475e-3; 
% Line along X - axis
[Hx_xp_8, Hy_xp_8, Hz_xp_8, Hx_xn_8, Hy_xn_8, Hz_xn_8] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_8, Hy_yp_8, Hz_yp_8, Hx_yn_8, Hy_yn_8, Hz_yn_8] = field_y(X, Y, Z, I,n,gy, m0, gz);
% % Adding field of the coil
[Hx_8, Hy_8, Hz_8] = field_sum(Hx_xp_8 , Hx_xn_8 , Hx_yp_8 , Hx_yn_8, Hy_xp_8 , Hy_xn_8 , Hy_yp_8 , Hy_yn_8, Hz_xp_8 , Hz_xn_8 , Hz_yp_8 , Hz_yn_8);

% --------------------------------------------------------------Coil_9
n = 9;
gy = 413.33e-6;
gx = 3.875e-3; 
% Line along X - axis
[Hx_xp_9, Hy_xp_9, Hz_xp_9, Hx_xn_9, Hy_xn_9, Hz_xn_9] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_9, Hy_yp_9, Hz_yp_9, Hx_yn_9, Hy_yn_9, Hz_yn_9] = field_y(X, Y, Z, I,n,gy, m0, gz);
% % Adding field of the coil
[Hx_9, Hy_9, Hz_9] = field_sum(Hx_xp_9 , Hx_xn_9 , Hx_yp_9 , Hx_yn_9, Hy_xp_9 , Hy_xn_9 , Hy_yp_9 , Hy_yn_9, Hz_xp_9 , Hz_xn_9 , Hz_yp_9 , Hz_yn_9);


% --------------------------------------------------------------Coil_10
n = 10;
gy = 412e-6;
gx = 4.275e-3; 
% Line along X - axis
[Hx_xp_10, Hy_xp_10, Hz_xp_10, Hx_xn_10, Hy_xn_10, Hz_xn_10] = field_x(X, Y, Z, I,n,gx, m0, gz);
% --------------------------------------------------------------
% Line along Y - axis
[Hx_yp_10, Hy_yp_10, Hz_yp_10, Hx_yn_10, Hy_yn_10, Hz_yn_10] = field_y(X, Y, Z, I,n,gy, m0, gz);
% % Adding field of the coil
[Hx_10, Hy_10, Hz_10] = field_sum(Hx_xp_10 , Hx_xn_10 , Hx_yp_10 , Hx_yn_10, Hy_xp_10 , Hy_xn_10 , Hy_yp_10 , Hy_yn_10, Hz_xp_10 , Hz_xn_10 , Hz_yp_10 , Hz_yn_10);


%{
% --------------------------------------------------------------Coil_11
% n = 11;
% % Line along X - axis
% [Hx_xp_11, Hy_xp_11, Hz_xp_11, Hx_xn_11, Hy_xn_11, Hz_xn_11] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_11, Hy_yp_11, Hz_yp_11, Hx_yn_11, Hy_yn_11, Hz_yn_11] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_11, Hy_11, Hz_11] = field_sum(Hx_xp_11 , Hx_xn_11 , Hx_yp_11 , Hx_yn_11, Hy_xp_11 , Hy_xn_11 , Hy_yp_11 , Hy_yn_11, Hz_xp_11 , Hz_xn_11 , Hz_yp_11 , Hz_yn_11);
% 
% 
% % --------------------------------------------------------------Coil_12
% n = 12;
% % Line along X - axis
% [Hx_xp_12, Hy_xp_12, Hz_xp_12, Hx_xn_12, Hy_xn_12, Hz_xn_12] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_12, Hy_yp_12, Hz_yp_12, Hx_yn_12, Hy_yn_12, Hz_yn_12] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_12, Hy_12, Hz_12] = field_sum(Hx_xp_12 , Hx_xn_12 , Hx_yp_12 , Hx_yn_12, Hy_xp_12 , Hy_xn_12 , Hy_yp_12 , Hy_yn_12, Hz_xp_12 , Hz_xn_12 , Hz_yp_12 , Hz_yn_12);
% 
% 
% % --------------------------------------------------------------Coil_13
% n = 13;
% % Line along X - axis
% [Hx_xp_13, Hy_xp_13, Hz_xp_13, Hx_xn_13, Hy_xn_13, Hz_xn_13] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_13, Hy_yp_13, Hz_yp_13, Hx_yn_13, Hy_yn_13, Hz_yn_13] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_13, Hy_13, Hz_13] = field_sum(Hx_xp_13 , Hx_xn_13 , Hx_yp_13 , Hx_yn_13, Hy_xp_13 , Hy_xn_13 , Hy_yp_13 , Hy_yn_13, Hz_xp_13 , Hz_xn_13 , Hz_yp_13 , Hz_yn_13);
% 
% 
% % --------------------------------------------------------------Coil_14
% n = 14;
% % Line along X - axis
% [Hx_xp_14, Hy_xp_14, Hz_xp_14, Hx_xn_14, Hy_xn_14, Hz_xn_14] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_14, Hy_yp_14, Hz_yp_14, Hx_yn_14, Hy_yn_14, Hz_yn_14] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_14, Hy_14, Hz_14] = field_sum(Hx_xp_14 , Hx_xn_14 , Hx_yp_14 , Hx_yn_14, Hy_xp_14 , Hy_xn_14 , Hy_yp_14 , Hy_yn_14, Hz_xp_14 , Hz_xn_14 , Hz_yp_14 , Hz_yn_14);
% 
% 
% % --------------------------------------------------------------Coil_15
% n = 15;
% % Line along X - axis
% [Hx_xp_15, Hy_xp_15, Hz_xp_15, Hx_xn_15, Hy_xn_15, Hz_xn_15] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_15, Hy_yp_15, Hz_yp_15, Hx_yn_15, Hy_yn_15, Hz_yn_15] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_15, Hy_15, Hz_15] = field_sum(Hx_xp_15 , Hx_xn_15 , Hx_yp_15 , Hx_yn_15, Hy_xp_15 , Hy_xn_15 , Hy_yp_15 , Hy_yn_15, Hz_xp_15 , Hz_xn_15 , Hz_yp_15 , Hz_yn_15);
% 
% 
% % --------------------------------------------------------------Coil_16
% n = 16;
% % Line along X - axis
% [Hx_xp_16, Hy_xp_16, Hz_xp_16, Hx_xn_16, Hy_xn_16, Hz_xn_16] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_16, Hy_yp_16, Hz_yp_16, Hx_yn_16, Hy_yn_16, Hz_yn_16] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_16, Hy_16, Hz_16] = field_sum(Hx_xp_16 , Hx_xn_16 , Hx_yp_16 , Hx_yn_16, Hy_xp_16 , Hy_xn_16 , Hy_yp_16 , Hy_yn_16, Hz_xp_16 , Hz_xn_16 , Hz_yp_16 , Hz_yn_16);
% 
% 
% % --------------------------------------------------------------Coil_17
% n = 17;
% % Line along X - axis
% [Hx_xp_17, Hy_xp_17, Hz_xp_17, Hx_xn_17, Hy_xn_17, Hz_xn_17] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_17, Hy_yp_17, Hz_yp_17, Hx_yn_17, Hy_yn_17, Hz_yn_17] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_17, Hy_17, Hz_17] = field_sum(Hx_xp_17 , Hx_xn_17 , Hx_yp_17 , Hx_yn_17, Hy_xp_17 , Hy_xn_17 , Hy_yp_17 , Hy_yn_17, Hz_xp_17 , Hz_xn_17 , Hz_yp_17 , Hz_yn_17);
% 
% 
% % --------------------------------------------------------------Coil_18
% n = 18;
% % Line along X - axis
% [Hx_xp_18, Hy_xp_18, Hz_xp_18, Hx_xn_18, Hy_xn_18, Hz_xn_18] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_18, Hy_yp_18, Hz_yp_18, Hx_yn_18, Hy_yn_18, Hz_yn_18] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_18, Hy_18, Hz_18] = field_sum(Hx_xp_18 , Hx_xn_18 , Hx_yp_18 , Hx_yn_18, Hy_xp_18 , Hy_xn_18 , Hy_yp_18 , Hy_yn_18, Hz_xp_18 , Hz_xn_18 , Hz_yp_18 , Hz_yn_18);
% 
% 
% % --------------------------------------------------------------Coil_19
% n = 19;
% % Line along X - axis
% [Hx_xp_19, Hy_xp_19, Hz_xp_19, Hx_xn_19, Hy_xn_19, Hz_xn_19] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_19, Hy_yp_19, Hz_yp_19, Hx_yn_19, Hy_yn_19, Hz_yn_19] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_19, Hy_19, Hz_19] = field_sum(Hx_xp_19 , Hx_xn_19 , Hx_yp_19 , Hx_yn_19, Hy_xp_19 , Hy_xn_19 , Hy_yp_19 , Hy_yn_19, Hz_xp_19 , Hz_xn_19 , Hz_yp_19 , Hz_yn_19);
% 
% 
% % --------------------------------------------------------------Coil_20
% n = 20;
% % Line along X - axis
% [Hx_xp_20, Hy_xp_20, Hz_xp_20, Hx_xn_20, Hy_xn_20, Hz_xn_20] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_20, Hy_yp_20, Hz_yp_20, Hx_yn_20, Hy_yn_20, Hz_yn_20] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_20, Hy_20, Hz_20] = field_sum(Hx_xp_20 , Hx_xn_20 , Hx_yp_20 , Hx_yn_20, Hy_xp_20 , Hy_xn_20 , Hy_yp_20 , Hy_yn_20, Hz_xp_20 , Hz_xn_20 , Hz_yp_20 , Hz_yn_20);
% 
% 
% % --------------------------------------------------------------Coil_21
% n = 21;
% % Line along X - axis
% [Hx_xp_21, Hy_xp_21, Hz_xp_21, Hx_xn_21, Hy_xn_21, Hz_xn_21] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_21, Hy_yp_21, Hz_yp_21, Hx_yn_21, Hy_yn_21, Hz_yn_21] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_21, Hy_21, Hz_21] = field_sum(Hx_xp_21 , Hx_xn_21 , Hx_yp_21 , Hx_yn_21, Hy_xp_21 , Hy_xn_21 , Hy_yp_21 , Hy_yn_21, Hz_xp_21 , Hz_xn_21 , Hz_yp_21 , Hz_yn_21);
% 
% 
% % --------------------------------------------------------------Coil_22
% n = 22;
% % Line along X - axis
% [Hx_xp_22, Hy_xp_22, Hz_xp_22, Hx_xn_22, Hy_xn_22, Hz_xn_22] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_22, Hy_yp_22, Hz_yp_22, Hx_yn_22, Hy_yn_22, Hz_yn_22] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_22, Hy_22, Hz_22] = field_sum(Hx_xp_22 , Hx_xn_22 , Hx_yp_22 , Hx_yn_22, Hy_xp_22 , Hy_xn_22 , Hy_yp_22 , Hy_yn_22, Hz_xp_22 , Hz_xn_22 , Hz_yp_22 , Hz_yn_22);
% 
% 
% % --------------------------------------------------------------Coil_23
% n = 23;
% % Line along X - axis
% [Hx_xp_23, Hy_xp_23, Hz_xp_23, Hx_xn_23, Hy_xn_23, Hz_xn_23] = field_x(X, Y, Z, I,n,g, m0, gz);
% % --------------------------------------------------------------
% % Line along Y - axis
% [Hx_yp_23, Hy_yp_23, Hz_yp_23, Hx_yn_23, Hy_yn_23, Hz_yn_23] = field_y(X, Y, Z, I,n,g, m0, gz);
% % % Adding field of the coil
% [Hx_23, Hy_23, Hz_23] = field_sum(Hx_xp_23 , Hx_xn_23 , Hx_yp_23 , Hx_yn_23, Hy_xp_23 , Hy_xn_23 , Hy_yp_23 , Hy_yn_23, Hz_xp_23 , Hz_xn_23 , Hz_yp_23 , Hz_yn_23);
%}
%}
%
% ----Adding all coil fields----
Hx = Hx_1 + Hx_2 + Hx_3 + Hx_4 + Hx_5 + Hx_6 + Hx_7 + Hx_8 + Hx_9 + Hx_10; %+ Hx_11 + Hx_12 + Hx_13 + Hx_14 + Hx_15 + Hx_16 + Hx_17 + Hx_18 + Hx_19 + Hx_20 + Hx_21 + Hx_21 + Hx_22 + Hx_23;
Hy = Hy_1 + Hy_2 + Hy_3 + Hy_4 + Hy_5 + Hy_6 + Hy_7 + Hy_8 + Hy_9 + Hy_10; %+ Hy_11 + Hy_12 + Hy_13 + Hy_14 + Hy_15 + Hy_16 + Hy_17 + Hy_18 + Hy_19 + Hy_20 + Hy_21 + Hy_21 + Hy_22 + Hy_23;
Hz = Hz_1 + Hz_2 + Hz_3 + Hz_4 + Hz_5 + Hz_6 + Hz_7 + Hz_8 + Hz_9 + Hz_10; %+ Hz_11 + Hz_12 + Hz_13 + Hz_14 + Hz_15 + Hz_16 + Hz_17 + Hz_18 + Hz_19 + Hz_20 + Hz_21 + Hz_21 + Hz_22 + Hz_23;
% 

Hz_tot = Hz(:,:,36) + Hz(:,:,40); %Total field of Multilayered Coil
Hx_tot_1 = Hx(:,:,36) + Hx(:,:,40)+ Hx(:,:,41) + Hx(:,:,45); %Total field of Multilayered Coil

Hy_tot_1 = Hy(33,33,:) + Hy(:,33,40)+ Hy(:,33,41) + Hy(:,33,45); %Total field of Multilayered Coil

Hz_tot_1 = Hz(:,:,36) + Hz(:,:,40)+ Hz(:,:,41) + Hz(:,:,45); %Total field of Multilayered Coil
%}
% Hz(33,33,:)
bz = squeeze(Hz(33,33,:));
%
%  -------Plotting the fields--------
figure
plot(c*1000,bz*1000);
hold on
plot(c*1000,Hz_tot(:,33)*1000);
plot(c*1000,Hz_tot_1(:,33)*1000);
% plot(c*1000,Hz(33,:)*1000);
legend('single layer','double layer','four layer')
xlabel("Distance from Center of wire(mm) at Current = 0.3A")
ylabel("Field along X - axis (mT)")
title("Variation in Field(Bz) generated by coil along X - axis at Z = 0.75mm")
hold off
%}


% ----Gradient of the Coil----
[df_xx,df_xy,df_xz] = gradient(Hx,1e-3); %[dBx/dx, dBx/dy, dBx/dz]
[df_yx,df_yy,df_yz] = gradient(Hy,1e-3); %[dBy/dx, dBy/dy, dBy/dz]
[df_zx,df_zy,df_zz] = gradient(Hz,1e-3); %[dBz/dx, dBz/dy, dBz/dz]

% [dfxtot_x] = gradient(Hx_tot_1,1e-3);
% [dfytot_x] = gradient(Hy_tot_1,1e-3);
% [dfztot_x] = gradient(Hz_tot_1,1e-3);

%df_zx,df_zy,df_zz] = gradient(Hz,0.25e-3);
%{
figure
plot(c*1000,df_zz(33,33,:)*1000); %Gradient
hold on
plot(c*1000,dftot_x*1000); %Gradient
legend('four layer','single layer')
xlabel("Distance from Center of wire(mm) at Current = 0.3A")
ylabel("Gradient of Field along X - axis (mT/mm)")
title("Variation in Gradient of Field(dBz/dz) generated by coil along X - axis at Z = 0.75mm")
hold off
%}

% ----Force on bot due to coil----

F_xx = 0.1*Magentization*vol_cy * (squeeze(df_xx(33,33,:)))/m0 ;
F_xy = 0.1*Magentization*vol_cy * squeeze(df_xy(33,33,:))/m0 ;
F_xz = Magentization*vol_cy * squeeze(df_xz(33,33,:))/m0 ;
F_yx = 0.1*Magentization*vol_cy * squeeze(df_yx(33,33,:))/m0 ;
F_yy = 0.1*Magentization*vol_cy * squeeze(df_yy(33,33,:))/m0 ;
F_yz = Magentization*vol_cy * squeeze(df_yz(33,33,:))/m0 ;
F_zx = 0.1*Magentization*vol_cy * squeeze(df_zx(33,33,:))/m0 ;
F_zy = 0.1*Magentization*vol_cy * squeeze(df_zy(33,33,:))/m0 ;
F_zz = 0.1*Magentization*vol_cy * squeeze(df_zz(33,33,:))/m0 ;
Fx = F_xx + F_xy + F_xz;
Fy = F_yx + F_yy + F_yz;
Fz = F_zx + F_zy + F_zz;
% F_x = Magentization*vol_cy * (dfxtot_x)/m0;
% F_y = Magentization*vol_cy * (dfytot_x)/m0;
% F_z = Magentization*vol_cy * (dfztot_x)/m0;
figure
plot(c*1000,Fx*1000); %Gradient
hold on
plot(c*1000,Fy*1000); %Gradient
plot(c*1000,Fz*1000); %Gradient
legend('F_x','F_y','F_z')
xlabel("Distance from Center of wire(mm) at Current = 0.3A")
ylabel("Force acting on bot along X - axis (mN)")
title("Variation of Force generated by coil along X - axis at Z = 0.75mm")
hold off