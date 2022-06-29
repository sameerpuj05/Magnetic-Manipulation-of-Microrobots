clear;
clc;
% Analysing field along a single wire...
% Constants 
I = -0.2;       %Current flowing in the wire
g = 200e-6;     %Coil spacing
m0 = 4*pi*1e-7;
c = -2000e-6:25e-6:2000e-6;
z = 150e-6; %0.15mm
y = 0;
radius = 2e-3;%m
height = 1e-3;%m
Magentization = 1.45; %T
vol_cy = pi*radius^2*height; %If Object is Cylinder, vol in m^3
vol_sp = (4/3)*(pi * radius^3); %If Object is Sphere, vol in m^3
density = 7300; %kg/m^3 or 7.3 gm/cc for NdFeB 
mass_cy = density * vol_cy; %kg
mass_sp = density * vol_sp; %kg
gravity = 9.8 ; %m/s^2
Coeff_of_Fric = 0.424;
Force_cy = Coeff_of_Fric * mass_cy * gravity; %N
Force_sp = Coeff_of_Fric * mass_sp * gravity; %N
k = 0.4e-3;
%--------%--------%--------%--------%--------%--------%--------%----------
% Line along Y - axis
%-%--------%--------%--------%--------%--------%--------%--------%--------
y1_1 = -0.6e-3;
y2_1 = 0.6e-3;
a_xp_1 = g;  
a_xn_1 = -g;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp_1-X).^2+Z.^2));
k_1yp = (y2_1-y)./((y2_1-y)^2+(a_xp_1-X).^2+Z.^2).^0.5;
k_2yp = (y1_1-y)./((y1_1-y)^2+(a_xp_1-X).^2+Z.^2).^0.5;

k_1yp_3 = (y2_1-y)./((y2_1-y)^2+(a_xp_1-X).^2+Z.^2).^1.5;
k_2yp_3 = (y1_1-y)./((y1_1-y)^2+(a_xp_1-X).^2+Z.^2).^1.5;

Bx_yp_1 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_1 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_1 = (-(a_xp_1-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_1 = 1./(4*pi*((a_xn_1-X).^2+Z.^2));
k_1yn_1 = (y2_1-y)./((y2_1-y)^2+(a_xn_1-X).^2+Z.^2).^0.5;
k_2yn_1 = (y1_1-y)./((y1_1-y)^2+(a_xn_1-X).^2+Z.^2).^0.5;

Bx_yn_1 = (Z.*k_yn_1.*(k_1yn_1 - k_2yn_1))*I*m0;
By_yn_1 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_1 = ((a_xn_1-X).*k_yn_1.*(k_1yn_1 - k_2yn_1))*I*m0;

[df_xx,df_xz] = gradient(Bx_yp_1,25e-6); %[dBx/dx, dBx/dz]

[df_xx_n,df_xz_n] = gradient(Bx_yn_1,25e-6); %[dBx/dx, dBx/dz]

%--------%--------%--------%--------%--------%--------%--------%----------
% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------

[Y,Z] = meshgrid(c);
x1_1 = -0.6e-3;
x2_1 = 0.6e-3;
a_yp_1 = g;          %Distance of coil from (0,0)
x = 0;
coil_length_x_1 = x2_1 - x1_1;
k_p_1 = 1./(4*pi*((a_yp_1-Y).^2+Z.^2));
k_1xp_1 = (x2_1-x)./((x2_1-x).^2+(a_yp_1-Y).^2+Z.^2).^0.5;
k_2xp_1 = (x1_1-x)./((x1_1-x).^2+(a_yp_1-Y).^2+Z.^2).^0.5;

Bx_xp_1 = m0*zeros(size(Y,1),size(Z,1));
By_xp_1 = (-Z.*k_p_1.*(k_1xp_1 - k_2xp_1))*I*m0;
Bz_xp_1 = (-(a_yp_1-Y).*k_p_1.*(k_1xp_1 - k_2xp_1))*I*m0;

a_yn_1 = -g;
k_n_1 = 1./(4*pi*((a_yn_1-Y).^2+Z.^2));
k_1xn_1 = (x2_1-x)./((x2_1-x).^2+(a_yn_1-Y).^2+Z.^2).^0.5;
k_2xn_1 = (x1_1-x)./((x1_1-x).^2+(a_yn_1-Y).^2+Z.^2).^0.5;

Bx_xn_1 = m0*zeros(size(Y,1),size(Z,1));
By_xn_1 = (Z.*k_n_1.*(k_1xn_1 - k_2xn_1))*I*m0;
Bz_xn_1 = ((a_yn_1-Y).*k_n_1.*(k_1xn_1 - k_2xn_1))*I*m0;

[dBy_1_dy,dBy_1_dz] = gradient(By_xp_1,25e-6);

[dBy_1_dyn,dBy_1_dzn] = gradient(By_xn_1,25e-6);

%--------%--------%--------%--------%--------%--------%--------%----------
% Coil 2
%-%--------%--------%--------%--------%--------%--------%--------%--------

y1_2 = y1_1 - k;
y2_2 = y2_1 + k;
a_xp_2 = 2 * g;          %Distance of coil from (0,0)
a_xn_2 = - 2*g;
coil_length_y_2 = y2_2 - y1_2;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp_2-X).^2+Z.^2));
k_1yp = (y2_2-y)./((y2_2-y)^2+(a_xp_2-X).^2+Z.^2).^0.5;
k_2yp = (y1_2-y)./((y1_2-y)^2+(a_xp_2-X).^2+Z.^2).^0.5;

% k_1yp_3 = (y2_2-y)./((y2_2-y)^2+(a_xp_2-X).^2+Z.^2).^1.5;
% k_2yp_3 = (y1_2-y)./((y1_2-y)^2+(a_xp_2-X).^2+Z.^2).^1.5;

Bx_yp_2 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_2 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_2 = (-(a_xp_2-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_2 = 1./(4*pi*((a_xn_2-X).^2+Z.^2));
k_1yn_2 = (y2_2-y)./((y2_2-y)^2+(a_xn_2-X).^2+Z.^2).^0.5;
k_2yn_2 = (y1_2-y)./((y1_2-y)^2+(a_xn_2-X).^2+Z.^2).^0.5;

Bx_yn_2 = (Z.*k_yn_2.*(k_1yn_2 - k_2yn_2))*I*m0;
By_yn_2 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_2 = ((a_xn_2-X).*k_yn_2.*(k_1yn_2 - k_2yn_2))*I*m0;

[df_xx_2,df_xz_2] = gradient(Bx_yp_2,25e-6); %[dBx/dx, dBx/dz]

[df_xx_2_n,df_xz_2_n] = gradient(Bx_yn_2,25e-6); %[dBx/dx, dBx/dz]


% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------
x1_2 = -0.6e-3 - k;
x2_2 = 0.6e-3 + k;
a_yp_2 = 2 * g;          %Distance of coil from (0,0)
x = 0;
coil_length_x_2 = x2_2 - x1_2;
k_p_2 = 1./(4*pi*((a_yp_2-Y).^2+Z.^2));
k_1xp_2 = (x2_2-x)./((x2_2-x).^2+(a_yp_2-Y).^2+Z.^2).^0.5;
k_2xp_2 = (x1_2-x)./((x1_2-x).^2+(a_yp_2-Y).^2+Z.^2).^0.5;

Bx_xp_2 = m0*zeros(size(Y,1),size(Z,1));
By_xp_2 = (-Z.*k_p_2.*(k_1xp_2 - k_2xp_2))*I*m0;
Bz_xp_2 = (-(a_yp_2-Y).*k_p_2.*(k_1xp_2 - k_2xp_2))*I*m0;

a_yn_2 = -2 * g;
k_n_2 = 1./(4*pi*((a_yn_2-Y).^2+Z.^2));
k_1xn_2 = (x2_2-x)./((x2_2-x).^2+(a_yn_2-Y).^2+Z.^2).^0.5;
k_2xn_2 = (x1_2-x)./((x1_2-x).^2+(a_yn_2-Y).^2+Z.^2).^0.5;

Bx_xn_2 = m0*zeros(size(Y,1),size(Z,1));
By_xn_2 = (Z.*k_n_2.*(k_1xn_2 - k_2xn_2))*I*m0;
Bz_xn_2 = ((a_yn_2-Y).*k_n_2.*(k_1xn_2 - k_2xn_2))*I*m0;

[dBy_1_dy_2,dBy_1_dz_2] = gradient(By_xp_2,25e-6);

[dBy_1_dy_2n,dBy_1_dz_2n] = gradient(By_xn_2,25e-6);

%--------%--------%--------%--------%--------%--------%--------%----------
% Coil 3
%-%--------%--------%--------%--------%--------%--------%--------%--------

y1_3 = y1_2 - k;
y2_3 = y2_2 + k;
a_xp_3 = 3 * g;          %Distance of coil from (0,0)
a_xn_3 = - 3*g;
coil_length_y_3 = y2_3 - y1_3;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp_3-X).^2+Z.^2));
k_1yp = (y2_3-y)./((y2_3-y)^2+(a_xp_3-X).^2+Z.^2).^0.5;
k_2yp = (y1_3-y)./((y1_3-y)^2+(a_xp_3-X).^2+Z.^2).^0.5;

k_1yp_3 = (y2_3-y)./((y2_3-y)^2+(a_xp_3-X).^2+Z.^2).^1.5;
k_2yp_3 = (y1_3-y)./((y1_3-y)^2+(a_xp_3-X).^2+Z.^2).^1.5;

Bx_yp_3 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_3 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_3 = (-(a_xp_3-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_3 = 1./(4*pi*((a_xn_3-X).^2+Z.^2));
k_1yn_3 = (y2_3-y)./((y2_3-y)^2+(a_xn_3-X).^2+Z.^2).^0.5;
k_2yn_3 = (y1_3-y)./((y1_3-y)^2+(a_xn_3-X).^2+Z.^2).^0.5;

Bx_yn_3 = (Z.*k_yn_3.*(k_1yn_3 - k_2yn_3))*I*m0;
By_yn_3 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_3 = ((a_xn_3-X).*k_yn_3.*(k_1yn_3 - k_2yn_3))*I*m0;

[df_xx_3,df_xz_3] = gradient(Bx_yp_3,25e-6); %[dBx/dx, dBx/dz]

[df_xx_3_n,df_xz_3_n] = gradient(Bx_yn_3,25e-6); %[dBx/dx, dBx/dz]


% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------
x1_3 = x1_2 - k;
x2_3 = x2_2 + k;
a_yp_3 = 3 * g;          %Distance of coil from (0,0)
x = 0;
coil_length_x_3 = x2_3 - x1_3;
k_p_3 = 1./(4*pi*((a_yp_3-Y).^2+Z.^2));
k_1xp_3 = (x2_3-x)./((x2_3-x).^2+(a_yp_3-Y).^2+Z.^2).^0.5;
k_2xp_3 = (x1_3-x)./((x1_3-x).^2+(a_yp_3-Y).^2+Z.^2).^0.5;

Bx_xp_3 = m0*zeros(size(Y,1),size(Z,1));
By_xp_3 = (-Z.*k_p_3.*(k_1xp_3 - k_2xp_3))*I*m0;
Bz_xp_3 = (-(a_yp_3-Y).*k_p_3.*(k_1xp_3 - k_2xp_3))*I*m0;

a_yn_3 = -3 * g;
k_n_3 = 1./(4*pi*((a_yn_3-Y).^2+Z.^2));
k_1xn_3 = (x2_3-x)./((x2_3-x).^2+(a_yn_3-Y).^2+Z.^2).^0.5;
k_2xn_3 = (x1_3-x)./((x1_3-x).^2+(a_yn_3-Y).^2+Z.^2).^0.5;

Bx_xn_3 = m0*zeros(size(Y,1),size(Z,1));
By_xn_3 = (Z.*k_n_3.*(k_1xn_3 - k_2xn_3))*I*m0;
Bz_xn_3 = ((a_yn_3-Y).*k_n_3.*(k_1xn_3 - k_2xn_3))*I*m0;

[dBy_1_dy_3,dBy_1_dz_3] = gradient(By_xp_3,25e-6);

[dBy_1_dy_3n,dBy_1_dz_3n] = gradient(By_xn_3,25e-6);

%--------%--------%--------%--------%--------%--------%--------%----------
% Coil 4
%-%--------%--------%--------%--------%--------%--------%--------%--------

y1_4 = y1_3 - k;
y2_4 = y2_3 + k;
a_xp_4 = 4 * g;          %Distance of coil from (0,0)
a_xn_4 = - 4*g;
coil_length_y_4 = y2_4 - y1_4;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp_4-X).^2+Z.^2));
k_1yp = (y2_4-y)./((y2_4-y)^2+(a_xp_4-X).^2+Z.^2).^0.5;
k_2yp = (y1_4-y)./((y1_4-y)^2+(a_xp_4-X).^2+Z.^2).^0.5;

k_1yp_4 = (y2_4-y)./((y2_4-y)^2+(a_xp_4-X).^2+Z.^2).^1.5;
k_2yp_4 = (y1_4-y)./((y1_4-y)^2+(a_xp_4-X).^2+Z.^2).^1.5;

Bx_yp_4 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_4 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_4 = (-(a_xp_4-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_4 = 1./(4*pi*((a_xn_4-X).^2+Z.^2));
k_1yn_4 = (y2_4-y)./((y2_4-y)^2+(a_xn_4-X).^2+Z.^2).^0.5;
k_2yn_4 = (y1_4-y)./((y1_4-y)^2+(a_xn_4-X).^2+Z.^2).^0.5;

Bx_yn_4 = (Z.*k_yn_4.*(k_1yn_4 - k_2yn_4))*I*m0;
By_yn_4 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_4 = ((a_xn_4-X).*k_yn_4.*(k_1yn_4 - k_2yn_4))*I*m0;

[df_xx_4,df_xz_4] = gradient(Bx_yp_4,25e-6); %[dBx/dx, dBx/dz]

[df_xx_4_n,df_xz_4_n] = gradient(Bx_yn_4,25e-6); %[dBx/dx, dBx/dz]


% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------
x1_4 = x1_3 - k;
x2_4 = x2_3 + k;
a_yp_4 = 4 * g;          %Distance of coil from (0,0)
x = 0;
coil_length_x_4 = x2_4 - x1_4;
k_p_4 = 1./(4*pi*((a_yp_4-Y).^2+Z.^2));
k_1xp_4 = (x2_4-x)./((x2_4-x).^2+(a_yp_4-Y).^2+Z.^2).^0.5;
k_2xp_4 = (x1_4-x)./((x1_4-x).^2+(a_yp_4-Y).^2+Z.^2).^0.5;

Bx_xp_4 = m0*zeros(size(Y,1),size(Z,1));
By_xp_4 = (-Z.*k_p_4.*(k_1xp_4 - k_2xp_4))*I*m0;
Bz_xp_4 = (-(a_yp_4-Y).*k_p_4.*(k_1xp_4 - k_2xp_4))*I*m0;

a_yn_4 = -4 * g;
k_n_4 = 1./(4*pi*((a_yn_4-Y).^2+Z.^2));
k_1xn_4 = (x2_4-x)./((x2_4-x).^2+(a_yn_4-Y).^2+Z.^2).^0.5;
k_2xn_4 = (x1_4-x)./((x1_4-x).^2+(a_yn_4-Y).^2+Z.^2).^0.5;

Bx_xn_4 = m0*zeros(size(Y,1),size(Z,1));
By_xn_4 = (Z.*k_n_4.*(k_1xn_4 - k_2xn_4))*I*m0;
Bz_xn_4 = ((a_yn_4-Y).*k_n_4.*(k_1xn_4 - k_2xn_4))*I*m0;

[dBy_1_dy_4,dBy_1_dz_4] = gradient(By_xp_4,25e-6);

[dBy_1_dy_4n,dBy_1_dz_4n] = gradient(By_xn_4,25e-6);



%--------%--------%--------%--------%--------%--------%--------%----------
% Coil 5
%-%--------%--------%--------%--------%--------%--------%--------%--------

y1_5 = y1_4 - k;
y2_5 = y2_4 + k;
a_xp_5 = 5 * g;          %Distance of coil from (0,0)
a_xn_5 = - 5*g;
coil_length_y_5 = y2_5 - y1_5;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp_5-X).^2+Z.^2));
k_1yp = (y2_5-y)./((y2_5-y)^2+(a_xp_5-X).^2+Z.^2).^0.5;
k_2yp = (y1_5-y)./((y1_5-y)^2+(a_xp_5-X).^2+Z.^2).^0.5;

k_1yp_5 = (y2_5-y)./((y2_5-y)^2+(a_xp_5-X).^2+Z.^2).^1.5;
k_2yp_5 = (y1_5-y)./((y1_5-y)^2+(a_xp_5-X).^2+Z.^2).^1.5;

Bx_yp_5 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_5 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_5 = (-(a_xp_5-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_5 = 1./(4*pi*((a_xn_5-X).^2+Z.^2));
k_1yn_5 = (y2_5-y)./((y2_5-y)^2+(a_xn_5-X).^2+Z.^2).^0.5;
k_2yn_5 = (y1_5-y)./((y1_5-y)^2+(a_xn_5-X).^2+Z.^2).^0.5;

Bx_yn_5 = (Z.*k_yn_5.*(k_1yn_5 - k_2yn_5))*I*m0;
By_yn_5 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_5 = ((a_xn_5-X).*k_yn_5.*(k_1yn_5 - k_2yn_5))*I*m0;

[df_xx_5,df_xz_5] = gradient(Bx_yp_5,25e-6); %[dBx/dx, dBx/dz]

[df_xx_5_n,df_xz_5_n] = gradient(Bx_yn_5,25e-6); %[dBx/dx, dBx/dz]


% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------
x1_5 = x1_4 - k;
x2_5 = x2_4 + k;
a_yp_5 = 5 * g;          %Distance of coil from (0,0)
a_yn_5 = -5 * g;
x = 0;
coil_length_x_5 = x2_5 - x1_5;
k_p_5 = 1./(4*pi*((a_yp_5-Y).^2+Z.^2));
k_1xp_5 = (x2_5-x)./((x2_5-x).^2+(a_yp_5-Y).^2+Z.^2).^0.5;
k_2xp_5 = (x1_5-x)./((x1_5-x).^2+(a_yp_5-Y).^2+Z.^2).^0.5;

Bx_xp_5 = m0*zeros(size(Y,1),size(Z,1));
By_xp_5 = (-Z.*k_p_5.*(k_1xp_5 - k_2xp_5))*I*m0;
Bz_xp_5 = (-(a_yp_5-Y).*k_p_5.*(k_1xp_5 - k_2xp_5))*I*m0;


k_n_5 = 1./(4*pi*((a_yn_5-Y).^2+Z.^2));
k_1xn_5 = (x2_5-x)./((x2_5-x).^2+(a_yn_5-Y).^2+Z.^2).^0.5;
k_2xn_5 = (x1_5-x)./((x1_5-x).^2+(a_yn_5-Y).^2+Z.^2).^0.5;

Bx_xn_5 = m0*zeros(size(Y,1),size(Z,1));
By_xn_5 = (Z.*k_n_5.*(k_1xn_5 - k_2xn_5))*I*m0;
Bz_xn_5 = ((a_yn_5-Y).*k_n_5.*(k_1xn_5 - k_2xn_5))*I*m0;

[dBy_1_dy_5,dBy_1_dz_5] = gradient(By_xp_5,25e-6);

[dBy_1_dy_5n,dBy_1_dz_5n] = gradient(By_xn_5,25e-6);

%--------%--------%--------%--------%--------%--------%--------%----------
% Force along X - axis
%-%--------%--------%--------%--------%--------%--------%--------%--------
F_xx_1 = vol_cy * Magentization* (df_xx + df_xx_n)/m0;
F_xx_2 = vol_cy * Magentization* (df_xx_2_n + df_xx_2)/m0;
F_xx_3 = vol_cy * Magentization* (df_xx_3 + df_xx_3_n)/m0;
F_xx_4 = vol_cy * Magentization* (df_xx_4 + df_xx_4_n)/m0;
F_xx_5 = vol_cy * Magentization* (df_xx_5 + df_xx_5_n)/m0;

F_xz_1 = vol_cy * Magentization* (df_xz + df_xz_n)/m0;
F_xz_2 = vol_cy * Magentization* (df_xz_2_n + df_xz_2)/m0;
F_xz_3 = vol_cy * Magentization* (df_xz_3 + df_xz_3_n)/m0;
F_xz_4 = vol_cy * Magentization* (df_xz_4 + df_xz_4_n)/m0;  
F_xz_5 = vol_cy * Magentization* (df_xz_5 + df_xz_5_n)/m0;  
%--------%--------%--------%--------%--------%--------%--------%----------
% Force along Y - axis
%-%--------%--------%--------%--------%--------%--------%--------%--------

F_yy_1 = vol_cy * Magentization* (dBy_1_dy + dBy_1_dyn)/m0;
F_yy_2 = vol_cy * Magentization* (dBy_1_dy_2 + dBy_1_dy_2n)/m0;
F_yy_3 = vol_cy * Magentization* (dBy_1_dy_3 + dBy_1_dy_3n)/m0;
F_yy_4 = vol_cy * Magentization* (dBy_1_dy_4 + dBy_1_dy_4n)/m0;
F_yy_5 = vol_cy * Magentization* (dBy_1_dy_5 + dBy_1_dy_5n)/m0; 

F_yz_1 = vol_cy * Magentization* (dBy_1_dz + dBy_1_dzn)/m0;
F_yz_2 = vol_cy * Magentization* (dBy_1_dz_2 + dBy_1_dz_2n)/m0;
F_yz_3 = vol_cy * Magentization* (dBy_1_dz_3 + dBy_1_dz_3n)/m0;
F_yz_4 = vol_cy * Magentization* (dBy_1_dz_4 + dBy_1_dz_4n)/m0;
F_yz_5 = vol_cy * Magentization* (dBy_1_dz_5 + dBy_1_dz_5n)/m0;

%--------%--------%--------%--------%--------%--------%--------%----------
% Plotting "Force generated by Field along X - axis (N)"
%-%--------%--------%--------%--------%--------%--------%--------%--------
p = 75;     %also works for a height of 1mm when we put p = 1
figure
plot(c*1000,F_xz_5(p,:)*1000,'r')
hold on
% plot(c,F_xx_1(p,:), '--b') 
% plot(c,F_xx_2(p,:),'--b', 'LineWidth',1)
% plot(c,F_xx_3(p,:),'--b', 'LineWidth',2)
% plot(c,F_xx_4(p,:),'--b', 'LineWidth',3)
% plot(c,F_xx_5(p,:),'--b', 'LineWidth',4)
% plot(c,F_xz_2(p,:),'g')
% plot(c,F_xz_3(p,:),'-k')
% plot(c,F_xz_4(p,:),'.-b')
% plot(c,F_xz_5(p,:),'m')
line([-2e-3*1000 2e-3*1000],[Force_cy*1000 Force_cy*1000],'linewidth',1,'color','b')
line([a_yn_1*1000 a_yn_1*1000],[-1 1],'linewidth',10,'color','g');
line([a_yp_1*1000,a_yp_1*1000],[-1 1],'linewidth',10,'color','g');
line([a_xn_2*1000 a_xn_2*1000],[-1 1],'linewidth',10,'color','g');
line([a_xp_2*1000,a_xp_2*1000],[-1 1],'linewidth',10,'color','g');
line([a_yn_3*1000 a_yn_3*1000],[-1 1],'linewidth',10,'color','g');
line([a_yp_3*1000,a_yp_3*1000],[-1 1],'linewidth',10,'color','g');
line([a_yn_4*1000 a_yn_4*1000],[-1 1],'linewidth',10,'color','g');
line([a_yp_4*1000,a_yp_4*1000],[-1 1],'linewidth',10,'color','g');
line([a_yn_5*1000 a_yn_5*1000],[-1 1],'linewidth',10,'color','g');
line([a_yp_5*1000,a_yp_5*1000],[-1 1],'linewidth',10,'color','g');
% legend('F_xz_1', 'F_xz_2', 'F_xz_3', 'F_xz_4', 'F_xz_5')
legend('F_xz', 'Frictional Force')
xlabel("Distance from Center of wire(mm)at Current = 0.2A")
ylabel("Force generated by Field along X - axis (mN)")
title("Variation in Force generated by Field along X - axis at height z = 150\mum")
hold off
%--------%--------%--------%--------%--------%--------%--------%----------
% Plotting "Force generated by Field along Y - axis (N)"
%-%--------%--------%--------%--------%--------%--------%--------%--------
% figure
% plot(c,F_yz_1(p,:),'r')
% hold on
% plot(c,F_yy_1(p,:), '--b') 
% plot(c,F_yy_2(p,:),'--b', 'LineWidth',1)
% plot(c,F_yy_3(p,:),'--b', 'LineWidth',2)
% plot(c,F_yy_4(p,:),'--b', 'LineWidth',3)
% plot(c,F_yy_5(p,:),'--b', 'LineWidth',4)
% plot(c,F_yz_2(p,:),'r', 'LineWidth',1)
% plot(c,F_yz_3(p,:),'r', 'LineWidth',2)
% plot(c,F_yz_4(p,:),'r', 'LineWidth',3)
% plot(c,F_yz_5(p,:),'r', 'LineWidth',4)
% line([a_xn_1 a_xn_1],[-1 1],'linewidth',10,'color','g');
% line([a_xp_1,a_xp_1],[-1 1],'linewidth',10,'color','g');
% line([a_xn_2 a_xn_2],[-1 1],'linewidth',10,'color','g');
% line([a_xp_2,a_xp_2],[-1 1],'linewidth',10,'color','g');
% line([a_yn_3 a_yn_3],[-1 1],'linewidth',10,'color','g');
% line([a_yp_3,a_yp_3],[-1 1],'linewidth',10,'color','g');
% line([a_yn_4 a_yn_4],[-1 1],'linewidth',10,'color','g');
% line([a_yp_4,a_yp_4],[-1 1],'linewidth',10,'color','g');
% line([a_yn_5 a_yn_5],[-1 1],'linewidth',10,'color','g');
% line([a_yp_5,a_yp_5],[-1 1],'linewidth',10,'color','g');
% line([-1 1],[Force_cy Force_cy],'linewidth',3,'color','r')
% legend('F_yz_1', 'F_yz_2', 'F_yz_3', 'F_yz_4', 'F_yz_5')
% legend('F_yy_1', 'F_yz_1', 'F_yy_2', 'F_yz_2')
% xlabel("Distance from Center of wire(m)")
% ylabel("Force generated by Field along X - axis (N)")
% title("Variation in Force generated by Field along Y - axis")
% hold off
