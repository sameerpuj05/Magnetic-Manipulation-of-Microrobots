clear;
clc;
% Analysing field along a single wire...
% Constants 
I = -1;       %Current flowing in the wire
g = 200e-6;     %Coil spacing
m0 = 4*pi*1e-7;
c = -10e-3:25e-6:10e-3;
z = 150e-6;
y = 0;
radius = 3e-3;%m
height = 1e-3;%m
Magentization = 1.45; %T
vol_cy = pi*radius^2*height; %If Object is Cylinder, vol in m^3
vol_sp = (4/3)*(pi * radius^3); %If Object is Sphere, vol in m^3
density = 7300; %kg/m^3 or 7.3 gm/cc for NdFeB 
mass_cy = density * vol_cy; %kg
mass_sp = density * vol_sp; %kg
gravity = 9.8 ; %m/s^2
Coeff_of_Fric = 1;
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

Bx_yp_1 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_1 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_1 = (-(a_xp_1-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_1 = 1./(4*pi*((a_xn_1-X).^2+Z.^2));
k_1yn_1 = (y2_1-y)./((y2_1-y)^2+(a_xn_1-X).^2+Z.^2).^0.5;
k_2yn_1 = (y1_1-y)./((y1_1-y)^2+(a_xn_1-X).^2+Z.^2).^0.5;

Bx_yn_1 = (Z.*k_yn_1.*(k_1yn_1 - k_2yn_1))*I*m0;
By_yn_1 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_1 = ((a_xn_1-X).*k_yn_1.*(k_1yn_1 - k_2yn_1))*I*m0;

[df_xx_1,df_xz_1] = gradient(Bx_yp_1,25e-6); %[dBx/dx, dBx/dz]

[df_xx_1_n,df_xz_1_n] = gradient(Bx_yn_1,25e-6); %[dBx/dx, dBx/dz]

%--------%--------%--------%--------%--------%--------%--------%----------
% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------

[Y,Z] = meshgrid(c);
x1_2 = -0.6e-3;
x2_2 = 0.6e-3;
a_yp_1 = g;          %Distance of coil from (0,0)
x = 0;
coil_length_x_1 = x2_2 - x1_2;
k_p_1 = 1./(4*pi*((a_yp_1-Y).^2+Z.^2));
k_1xp_1 = (x2_2-x)./((x2_2-x).^2+(a_yp_1-Y).^2+Z.^2).^0.5;
k_2xp_1 = (x1_2-x)./((x1_2-x).^2+(a_yp_1-Y).^2+Z.^2).^0.5;

Bx_xp_1 = m0*zeros(size(Y,1),size(Z,1));
By_xp_1 = (-Z.*k_p_1.*(k_1xp_1 - k_2xp_1))*I*m0;
Bz_xp_1 = (-(a_yp_1-Y).*k_p_1.*(k_1xp_1 - k_2xp_1))*I*m0;

a_yn_1 = -g;
k_n_1 = 1./(4*pi*((a_yn_1-Y).^2+Z.^2));
k_1xn_1 = (x2_2-x)./((x2_2-x).^2+(a_yn_1-Y).^2+Z.^2).^0.5;
k_2xn_1 = (x1_2-x)./((x1_2-x).^2+(a_yn_1-Y).^2+Z.^2).^0.5;

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
% Coil 6
%-%--------%--------%--------%--------%--------%--------%--------%--------

y1_6 = y1_5 - k;
y2_6 = y2_5 + k;
a_xp_6 = 6 * g;          %Distance of coil from (0,0)
a_xn_6 = - 6 * g;
coil_length_y_6 = y2_6 - y1_6;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp_6-X).^2+Z.^2));
k_1yp = (y2_6-y)./((y2_6-y)^2+(a_xp_6-X).^2+Z.^2).^0.5;
k_2yp = (y1_6-y)./((y1_6-y)^2+(a_xp_6-X).^2+Z.^2).^0.5;

k_1yp_6 = (y2_6-y)./((y2_6-y)^2+(a_xp_6-X).^2+Z.^2).^1.5;
k_2yp_6 = (y1_6-y)./((y1_6-y)^2+(a_xp_6-X).^2+Z.^2).^1.5;

Bx_yp_6 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_6 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_6 = (-(a_xp_6-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_6 = 1./(4*pi*((a_xn_6-X).^2+Z.^2));
k_1yn_6 = (y2_6-y)./((y2_6-y)^2+(a_xn_6-X).^2+Z.^2).^0.5;
k_2yn_6 = (y1_6-y)./((y1_6-y)^2+(a_xn_6-X).^2+Z.^2).^0.5;

Bx_yn_6 = (Z.*k_yn_6.*(k_1yn_6 - k_2yn_6))*I*m0;
By_yn_6 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_6 = ((a_xn_6-X).*k_yn_6.*(k_1yn_6 - k_2yn_6))*I*m0;

[df_xx_6,df_xz_6] = gradient(Bx_yp_6,25e-6); %[dBx/dx, dBx/dz]

[df_xx_6_n,df_xz_6_n] = gradient(Bx_yn_6,25e-6); %[dBx/dx, dBx/dz]


% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------
x1_6 = x1_5 - k;
x2_6 = x2_5 + k;
a_yp_6 = 6 * g;          %Distance of coil from (0,0)
a_yn_6 = -6 * g;
x = 0;
coil_length_x_6 = x2_6 - x1_6;
k_p_6 = 1./(4*pi*((a_yp_6-Y).^2+Z.^2));
k_1xp_6 = (x2_6-x)./((x2_6-x).^2+(a_yp_6-Y).^2+Z.^2).^0.5;
k_2xp_6 = (x1_6-x)./((x1_6-x).^2+(a_yp_6-Y).^2+Z.^2).^0.5;

Bx_xp_6 = m0*zeros(size(Y,1),size(Z,1));
By_xp_6 = (-Z.*k_p_6.*(k_1xp_6 - k_2xp_6))*I*m0;
Bz_xp_6 = (-(a_yp_6-Y).*k_p_6.*(k_1xp_6 - k_2xp_6))*I*m0;


k_n_6 = 1./(4*pi*((a_yn_6-Y).^2+Z.^2));
k_1xn_6 = (x2_6-x)./((x2_6-x).^2+(a_yn_6-Y).^2+Z.^2).^0.5;
k_2xn_6 = (x1_6-x)./((x1_6-x).^2+(a_yn_6-Y).^2+Z.^2).^0.5;

Bx_xn_6 = m0*zeros(size(Y,1),size(Z,1));
By_xn_6 = (Z.*k_n_6.*(k_1xn_6 - k_2xn_6))*I*m0;
Bz_xn_6 = ((a_yn_6-Y).*k_n_6.*(k_1xn_6 - k_2xn_6))*I*m0;

[dBy_1_dy_6,dBy_1_dz_6] = gradient(By_xp_6,25e-6);

[dBy_1_dy_6n,dBy_1_dz_6n] = gradient(By_xn_6,25e-6);




%--------%--------%--------%--------%--------%--------%--------%----------
% Coil 7
%-%--------%--------%--------%--------%--------%--------%--------%--------

y1_7 = y1_6 - k;
y2_7 = y2_6 + k;
a_xp_7 = 7 * g;          %Distance of coil from (0,0)
a_xn_7 = - 7 * g;
coil_length_y_7 = y2_7 - y1_7;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp_7-X).^2+Z.^2));
k_1yp = (y2_7-y)./((y2_7-y)^2+(a_xp_7-X).^2+Z.^2).^0.5;
k_2yp = (y1_7-y)./((y1_7-y)^2+(a_xp_7-X).^2+Z.^2).^0.5;

k_1yp_7 = (y2_7-y)./((y2_7-y)^2+(a_xp_7-X).^2+Z.^2).^1.5;
k_2yp_7 = (y1_7-y)./((y1_7-y)^2+(a_xp_7-X).^2+Z.^2).^1.5;

Bx_yp_7 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_7 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_7 = (-(a_xp_7-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_7 = 1./(4*pi*((a_xn_7-X).^2+Z.^2));
k_1yn_7 = (y2_7-y)./((y2_7-y)^2+(a_xn_7-X).^2+Z.^2).^0.5;
k_2yn_7 = (y1_7-y)./((y1_7-y)^2+(a_xn_7-X).^2+Z.^2).^0.5;

Bx_yn_7 = (Z.*k_yn_7.*(k_1yn_7 - k_2yn_7))*I*m0;
By_yn_7 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_7 = ((a_xn_7-X).*k_yn_7.*(k_1yn_7 - k_2yn_7))*I*m0;

[df_xx_7,df_xz_7] = gradient(Bx_yp_7,25e-6); %[dBx/dx, dBx/dz]

[df_xx_7_n,df_xz_7_n] = gradient(Bx_yn_7,25e-6); %[dBx/dx, dBx/dz]


% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------
x1_7 = x1_6 - k;
x2_7 = x2_6 + k;
a_yp_7 = 7 * g;          %Distance of coil from (0,0)
a_yn_7 = -7 * g;
x = 0;
coil_length_x_7 = x2_7 - x1_7;
k_p_7 = 1./(4*pi*((a_yp_7-Y).^2+Z.^2));
k_1xp_7 = (x2_7-x)./((x2_7-x).^2+(a_yp_7-Y).^2+Z.^2).^0.5;
k_2xp_7 = (x1_7-x)./((x1_7-x).^2+(a_yp_7-Y).^2+Z.^2).^0.5;

Bx_xp_7 = m0*zeros(size(Y,1),size(Z,1));
By_xp_7 = (-Z.*k_p_7.*(k_1xp_7 - k_2xp_7))*I*m0;
Bz_xp_7 = (-(a_yp_7-Y).*k_p_7.*(k_1xp_7 - k_2xp_7))*I*m0;


k_n_7 = 1./(4*pi*((a_yn_7-Y).^2+Z.^2));
k_1xn_7 = (x2_7-x)./((x2_7-x).^2+(a_yn_7-Y).^2+Z.^2).^0.5;
k_2xn_7 = (x1_7-x)./((x1_7-x).^2+(a_yn_7-Y).^2+Z.^2).^0.5;

Bx_xn_7 = m0*zeros(size(Y,1),size(Z,1));
By_xn_7 = (Z.*k_n_7.*(k_1xn_7 - k_2xn_7))*I*m0;
Bz_xn_7 = ((a_yn_7-Y).*k_n_7.*(k_1xn_7 - k_2xn_7))*I*m0;

[dBy_1_dy_7,dBy_1_dz_7] = gradient(By_xp_7,25e-6);

[dBy_1_dy_7n,dBy_1_dz_7n] = gradient(By_xn_7,25e-6);



%--------%--------%--------%--------%--------%--------%--------%----------
% Coil 8
%-%--------%--------%--------%--------%--------%--------%--------%--------

y1_8 = y1_7 - k;
y2_8 = y2_7 + k;
a_xp_8 = 8 * g;          %Distance of coil from (0,0)
a_xn_8 = - 8 * g;
coil_length_y_8 = y2_8 - y1_8;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp_8-X).^2+Z.^2));
k_1yp = (y2_8-y)./((y2_8-y)^2+(a_xp_8-X).^2+Z.^2).^0.5;
k_2yp = (y1_8-y)./((y1_8-y)^2+(a_xp_8-X).^2+Z.^2).^0.5;

k_1yp_8 = (y2_8-y)./((y2_8-y)^2+(a_xp_8-X).^2+Z.^2).^1.5;
k_2yp_8 = (y1_8-y)./((y1_8-y)^2+(a_xp_8-X).^2+Z.^2).^1.5;

Bx_yp_8 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_8 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_8 = (-(a_xp_8-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_8 = 1./(4*pi*((a_xn_8-X).^2+Z.^2));
k_1yn_8 = (y2_8-y)./((y2_8-y)^2+(a_xn_8-X).^2+Z.^2).^0.5;
k_2yn_8 = (y1_8-y)./((y1_8-y)^2+(a_xn_8-X).^2+Z.^2).^0.5;

Bx_yn_8 = (Z.*k_yn_8.*(k_1yn_8 - k_2yn_8))*I*m0;
By_yn_8 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_8 = ((a_xn_8-X).*k_yn_8.*(k_1yn_8 - k_2yn_8))*I*m0;

[df_xx_8,df_xz_8] = gradient(Bx_yp_8,25e-6); %[dBx/dx, dBx/dz]

[df_xx_8_n,df_xz_8_n] = gradient(Bx_yn_8,25e-6); %[dBx/dx, dBx/dz]


% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------
x1_8 = x1_7 - k;
x2_8 = x2_7 + k;
a_yp_8 = 8 * g;          %Distance of coil from (0,0)
a_yn_8 = -8 * g;
x = 0;
coil_length_x_8 = x2_8 - x1_8;
k_p_8 = 1./(4*pi*((a_yp_8-Y).^2+Z.^2));
k_1xp_8 = (x2_8-x)./((x2_8-x).^2+(a_yp_8-Y).^2+Z.^2).^0.5;
k_2xp_8 = (x1_8-x)./((x1_8-x).^2+(a_yp_8-Y).^2+Z.^2).^0.5;

Bx_xp_8 = m0*zeros(size(Y,1),size(Z,1));
By_xp_8 = (-Z.*k_p_8.*(k_1xp_8 - k_2xp_8))*I*m0;
Bz_xp_8 = (-(a_yp_8-Y).*k_p_8.*(k_1xp_8 - k_2xp_8))*I*m0;


k_n_8 = 1./(4*pi*((a_yn_8-Y).^2+Z.^2));
k_1xn_8 = (x2_8-x)./((x2_8-x).^2+(a_yn_8-Y).^2+Z.^2).^0.5;
k_2xn_8 = (x1_8-x)./((x1_8-x).^2+(a_yn_8-Y).^2+Z.^2).^0.5;

Bx_xn_8 = m0*zeros(size(Y,1),size(Z,1));
By_xn_8 = (Z.*k_n_8.*(k_1xn_8 - k_2xn_8))*I*m0;
Bz_xn_8 = ((a_yn_8-Y).*k_n_8.*(k_1xn_8 - k_2xn_8))*I*m0;

[dBy_1_dy_8,dBy_1_dz_8] = gradient(By_xp_8,25e-6);

[dBy_1_dy_8n,dBy_1_dz_8n] = gradient(By_xn_8,25e-6);

%--------%--------%--------%--------%--------%--------%--------%----------
% Coil 9
%-%--------%--------%--------%--------%--------%--------%--------%--------

y1_9 = y1_8 - k;
y2_9 = y2_8 + k;
a_xp_9 = 9 * g;          %Distance of coil from (0,0)
a_xn_9 = - 9 * g;
coil_length_y_9 = y2_9 - y1_9;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp_9-X).^2+Z.^2));
k_1yp = (y2_9-y)./((y2_9-y)^2+(a_xp_9-X).^2+Z.^2).^0.5;
k_2yp = (y1_9-y)./((y1_9-y)^2+(a_xp_9-X).^2+Z.^2).^0.5;

k_1yp_9 = (y2_9-y)./((y2_9-y)^2+(a_xp_9-X).^2+Z.^2).^1.5;
k_2yp_9 = (y1_9-y)./((y1_9-y)^2+(a_xp_9-X).^2+Z.^2).^1.5;

Bx_yp_9 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp_9 = m0*zeros(size(X,1),size(Z,1));
Bz_yp_9 = (-(a_xp_9-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn_9 = 1./(4*pi*((a_xn_9-X).^2+Z.^2));
k_1yn_9 = (y2_9-y)./((y2_9-y)^2+(a_xn_9-X).^2+Z.^2).^0.5;
k_2yn_9 = (y1_9-y)./((y1_9-y)^2+(a_xn_9-X).^2+Z.^2).^0.5;

Bx_yn_9 = (Z.*k_yn_9.*(k_1yn_9 - k_2yn_9))*I*m0;
By_yn_9 = m0*zeros(size(X,1),size(Z,1));
Bz_yn_9 = ((a_xn_9-X).*k_yn_9.*(k_1yn_9 - k_2yn_9))*I*m0;

[df_xx_9,df_xz_9] = gradient(Bx_yp_9,25e-6); %[dBx/dx, dBx/dz]

[df_xx_9_n,df_xz_9_n] = gradient(Bx_yn_9,25e-6); %[dBx/dx, dBx/dz]


% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------
x1_9 = x1_8 - k;
x2_9 = x2_8 + k;
a_yp_9 = 9 * g;          %Distance of coil from (0,0)
a_yn_9 = -9 * g;
x = 0;
coil_length_x_9 = x2_9 - x1_9;
k_p_9 = 1./(4*pi*((a_yp_9-Y).^2+Z.^2));
k_1xp_9 = (x2_9-x)./((x2_9-x).^2+(a_yp_9-Y).^2+Z.^2).^0.5;
k_2xp_9 = (x1_9-x)./((x1_9-x).^2+(a_yp_9-Y).^2+Z.^2).^0.5;

Bx_xp_9 = m0*zeros(size(Y,1),size(Z,1));
By_xp_9 = (-Z.*k_p_9.*(k_1xp_9 - k_2xp_9))*I*m0;
Bz_xp_9 = (-(a_yp_9-Y).*k_p_9.*(k_1xp_9 - k_2xp_9))*I*m0;


k_n_9 = 1./(4*pi*((a_yn_9-Y).^2+Z.^2));
k_1xn_9 = (x2_9-x)./((x2_9-x).^2+(a_yn_9-Y).^2+Z.^2).^0.5;
k_2xn_9 = (x1_9-x)./((x1_9-x).^2+(a_yn_9-Y).^2+Z.^2).^0.5;

Bx_xn_9 = m0*zeros(size(Y,1),size(Z,1));
By_xn_9 = (Z.*k_n_9.*(k_1xn_9 - k_2xn_9))*I*m0;
Bz_xn_9 = ((a_yn_9-Y).*k_n_9.*(k_1xn_9 - k_2xn_9))*I*m0;

[dBy_1_dy_9,dBy_1_dz_9] = gradient(By_xp_9,25e-6);

[dBy_1_dy_9n,dBy_1_dz_9n] = gradient(By_xn_9,25e-6);


%--------%--------%--------%--------%--------%--------%--------%----------
% Coil 10
%-%--------%--------%--------%--------%--------%--------%--------%--------

y1__10 = y1_9 - k;
y2__10 = y2_9 + k;
a_xp__10 = 10 * g;          %Distance of coil from (0,0)
a_xn__10 = - 10 * g;
coil_length_y__10 = y2__10 - y1__10;
[X,Z] = meshgrid(c);


k_yp = 1./(4*pi*((a_xp__10-X).^2+Z.^2));
k_1yp = (y2__10-y)./((y2__10-y)^2+(a_xp__10-X).^2+Z.^2).^0.5;
k_2yp = (y1__10-y)./((y1__10-y)^2+(a_xp__10-X).^2+Z.^2).^0.5;

k_1yp__10 = (y2__10-y)./((y2__10-y)^2+(a_xp__10-X).^2+Z.^2).^1.5;
k_2yp__10 = (y1__10-y)./((y1__10-y)^2+(a_xp__10-X).^2+Z.^2).^1.5;

Bx_yp__10 = -(Z.*k_yp.*(k_1yp - k_2yp))*I*m0;
By_yp__10 = m0*zeros(size(X,1),size(Z,1));
Bz_yp__10 = (-(a_xp__10-X).*k_yp.*(k_1yp - k_2yp))*I*m0;

k_yn__10 = 1./(4*pi*((a_xn__10-X).^2+Z.^2));
k_1yn__10 = (y2__10-y)./((y2__10-y)^2+(a_xn__10-X).^2+Z.^2).^0.5;
k_2yn__10 = (y1__10-y)./((y1__10-y)^2+(a_xn__10-X).^2+Z.^2).^0.5;

Bx_yn__10 = (Z.*k_yn__10.*(k_1yn__10 - k_2yn__10))*I*m0;
By_yn__10 = m0*zeros(size(X,1),size(Z,1));
Bz_yn__10 = ((a_xn__10-X).*k_yn__10.*(k_1yn__10 - k_2yn__10))*I*m0;

[df_xx__10,df_xz__10] = gradient(Bx_yp__10,25e-6); %[dBx/dx, dBx/dz]

[df_xx__10_n,df_xz__10_n] = gradient(Bx_yn__10,25e-6); %[dBx/dx, dBx/dz]


% Line along X - axis
%-%--------%--------%--------%--------%a--------%--------%--------%--------
x1__10 = x1_9 - k;
x2__10 = x2_9 + k;
a_yp__10 = 10 * g;          %Distance of coil from (0,0)
a_yn__10 = -10 * g;
x = 0;
coil_length_x__10 = x2__10 - x1__10;
k_p__10 = 1./(4*pi*((a_yp__10-Y).^2+Z.^2));
k_1xp__10 = (x2__10-x)./((x2__10-x).^2+(a_yp__10-Y).^2+Z.^2).^0.5;
k_2xp__10 = (x1__10-x)./((x1__10-x).^2+(a_yp__10-Y).^2+Z.^2).^0.5;

Bx_xp__10 = m0*zeros(size(Y,1),size(Z,1));
By_xp__10 = (-Z.*k_p__10.*(k_1xp__10 - k_2xp__10))*I*m0;
Bz_xp__10 = (-(a_yp__10-Y).*k_p__10.*(k_1xp__10 - k_2xp__10))*I*m0;


k_n__10 = 1./(4*pi*((a_yn__10-Y).^2+Z.^2));
k_1xn__10 = (x2__10-x)./((x2__10-x).^2+(a_yn__10-Y).^2+Z.^2).^0.5;
k_2xn__10 = (x1__10-x)./((x1__10-x).^2+(a_yn__10-Y).^2+Z.^2).^0.5;

Bx_xn__10 = m0*zeros(size(Y,1),size(Z,1));
By_xn__10 = (Z.*k_n__10.*(k_1xn__10 - k_2xn__10))*I*m0;
Bz_xn__10 = ((a_yn__10-Y).*k_n__10.*(k_1xn__10 - k_2xn__10))*I*m0;

[dBy_1_dy__10,dBy_1_dz__10] = gradient(By_xp__10,25e-6);

[dBy_1_dy__10n,dBy_1_dz__10n] = gradient(By_xn__10,25e-6);


%--------%--------%--------%--------%--------%--------%--------%----------
% Force along X - axis
%-%--------%--------%--------%--------%--------%--------%--------%--------

F_xx = vol_cy * Magentization* (df_xx_1 + df_xx_1_n + df_xx_2_n + df_xx_2 + df_xx_3 + df_xx_3_n + df_xx_4 + df_xx_4_n + df_xx_5 + df_xx_5_n + df_xx_6 + df_xx_6_n + df_xx_7 + df_xx_7_n + df_xx_8 + df_xx_8_n + df_xx_9 + df_xx_9_n + df_xx__10 + df_xx__10_n)/m0;
F_xz = vol_cy * Magentization* (df_xz_1 + df_xz_1_n + df_xz_2_n + df_xz_2 + df_xz_3 + df_xz_3_n + df_xz_4 + df_xz_4_n + df_xz_5 + df_xz_5_n + df_xz_6 + df_xz_6_n + df_xz_7 + df_xz_7_n + df_xz_8 + df_xz_8_n + df_xz_9 + df_xz_9_n + df_xz__10 + df_xz__10_n)/m0;
%--------%--------%--------%--------%--------%--------%--------%----------
% Force along Y - axis
%-%--------%--------%--------%--------%--------%--------%--------%--------

F_yy = vol_cy * Magentization* (dBy_1_dy + dBy_1_dyn + dBy_1_dy_2 + dBy_1_dy_2n + dBy_1_dy_3 + dBy_1_dy_3n + dBy_1_dy_4 + dBy_1_dy_4n + dBy_1_dy_5 + dBy_1_dy_5n + dBy_1_dy_6 + dBy_1_dy_6n + dBy_1_dy_7 + dBy_1_dy_7n + dBy_1_dy_8 + dBy_1_dy_8n + dBy_1_dy_9 + dBy_1_dy_9n + dBy_1_dy__10 + dBy_1_dy__10n)/m0;
F_yz = vol_cy * Magentization* (dBy_1_dz + dBy_1_dzn + dBy_1_dz_2 + dBy_1_dz_2n + dBy_1_dz_3 + dBy_1_dz_3n + dBy_1_dz_4 + dBy_1_dz_4n + dBy_1_dz_5 + dBy_1_dz_5n + dBy_1_dz_6 + dBy_1_dz_6n + dBy_1_dz_7 + dBy_1_dz_7n + dBy_1_dz_8 + dBy_1_dz_8n + dBy_1_dz_9 + dBy_1_dz_9n + dBy_1_dz__10 + dBy_1_dz__10n)/m0;


p = 35;
figure
plot(c,F_xx(p,:), '--b') 
hold on
% axis([-2e-3 2e-3 -4e-4 14e-4])
plot(c,F_xz(p,:),'r')
% plot(c,F_zx(35,:), 'g') 
% plot(c,F_zz(35,:),'-.k')
line([-10e-3 10e-3],[Force_cy Force_cy],'linewidth',3,'color','r')
% line([a_yn_1 a_yn_1],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp_1,a_yp_1],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yn_2 a_yn_2],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp_2,a_yp_2],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yn_3 a_yn_3],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp_3,a_yp_3],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yn_4 a_yn_4],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp_4,a_yp_4],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yn_5 a_yn_5],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp_5,a_yp_5],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yn_6 a_yn_6],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp_6,a_yp_6],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yn_7 a_yn_7],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp_7,a_yp_7],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yn_8 a_yn_8],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp_8,a_yp_8],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yn_9 a_yn_9],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp_9,a_yp_9],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yn__10 a_yn__10],[-1e-5 1e-5],'linewidth',10,'color','g');
% line([a_yp__10,a_yp__10],[-1e-5 1e-5],'linewidth',10,'color','g');
legend('F_xx', 'F_xz')
xlabel("Distance from Center of wire(m)")
ylabel("Force generated by Field along X - axis (N)")
title("Variation in Force generated by Field along X - axis")
hold off


figure
plot(c,F_yy(p,:), '--b') 
hold on
% axis([-2e-3 2e-3 -4e-4 14e-4])
plot(c,F_yz(p,:),'r')
line([a_xn_1 a_xn_1],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp_1,a_xp_1],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xn_2 a_xn_2],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp_2,a_xp_2],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xn_3 a_xn_3],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp_3,a_xp_3],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xn_4 a_xn_4],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp_4,a_xp_4],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xn_5 a_xn_5],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp_5,a_xp_5],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xn_6 a_xn_6],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp_6,a_xp_6],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xn_7 a_xn_7],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp_7,a_xp_7],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xn_8 a_xn_8],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp_8,a_xp_8],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xn_9 a_xn_9],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp_9,a_xp_9],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xn__10 a_xn__10],[-1e-5 1e-5],'linewidth',10,'color','g');
line([a_xp__10,a_xp__10],[-1e-5 1e-5],'linewidth',10,'color','g');
line([-10e-3 10e-3],[Force_cy Force_cy],'linewidth',3,'color','r')
legend('F_yy', 'F_yz')
xlabel("Distance from Center of wire(m)")
ylabel("Force generated by Field along X - axis (N)")
title("Variation in Force generated by Field along Y - axis")
hold off
