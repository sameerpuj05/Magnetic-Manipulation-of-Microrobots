clear all;
clc;
% -----------------------------------------------------------------%
% Note: Max length of coil = 4mm, Coil distance from center = 2mm;
% Force produced by coil > Frictional Force at a distance of 4mm from coil
% When the height of robot is 3mm and current is 0.5A
% -----------------------------------------------------------------%


% Analysing field along a single wire...
% Constants 
I = 0.5;       %Current flowing in the wire
g = 200e-6;     %Coil spacing
m0 = 4*pi*1e-7;
y = 0;
c = -15000e-6:500e-6:15000e-6;
[X,Z] = meshgrid(c);
radius = 0.5e-3;%m
height = 0.5e-3;%m
vol_cy = pi*radius^2*height; %If Object is Cylinder, vol in m^3
vol_sp = (4/3)*(pi * radius^3); %If Object is Sphere, vol in m^3
density = 7300; %kg/m^3 or 7.3 gm/cc for NdFeB 
mass_cy = density * vol_cy; %kg
mass_sp = density * vol_sp; %kg
gravity = 9.8 ; %m/s^2
Coeff_of_Fric = 1;
Force_cy = Coeff_of_Fric * mass_cy * gravity; %N
Force_sp = Coeff_of_Fric * mass_sp * gravity; %N

% c = -200e-6:100e-6:600e-6; - For 2 coils 
% c = -600e-6:100e-6:600e-6; - For 3 coils 
% c = -800e-6:150e-6:800e-6; - For 4 coils
% c = -1000e-6:250e-6:1000e-6; - For 5 coils
% c = -1200e-6:200e-6:1200e-6; or -1400e-6:140e-6:1400e-6 or -1400e-6:280e-6:1400e-6 For 6 coils
% c = -1400e-6:200e-6:1400e-6; or c = -1600e-6:320e-6:1600e-6; For 7 coils
% c = -1600e-6:320e-6:1600e-6; or -1800e-6:360e-6:1800e-6; For 8 coils
% c = -2000e-6:500e-6:2000e-6; For 9 coils
% c = -2000e-6:500e-6:2000e-6; or -2400e-6:500e-6:2400e-6;For 10 coils

%.
% Line along X - axis
% --------------------------------------------------------------Coil_1
x1_1 = -g;
x2_1 = g;
a_yp_1 = g;          %Distance of coil from (0,0)
coil_length_x_1 = x2_1 - x1_1;
k_p_1 = 1./(4*pi*((a_yp_1-y).^2+Z.^2));
k_1xp_1 = (x2_1-X)./((x2_1-X).^2+(a_yp_1-y).^2+Z.^2).^0.5;
k_2xp_1 = (x1_1-X)./((x1_1-X).^2+(a_yp_1-y).^2+Z.^2).^0.5;

Hx_xp_1 = zeros(size(y,1), size(Z,1));
Hy_xp_1 = (-Z.*k_p_1.*(k_1xp_1 - k_2xp_1))*I;
Hz_xp_1 = (-(a_yp_1-y).*k_p_1.*(k_1xp_1 - k_2xp_1))*I;

a_yn_1 = -g;
k_n_1 = 1./(4*pi*((a_yn_1-y).^2+Z.^2));
k_1xn_1 = (x2_1-X)./((x2_1-X).^2+(a_yn_1-y).^2+Z.^2).^0.5;
k_2xn_1 = (x1_1-X)./((x1_1-X).^2+(a_yn_1-y).^2+Z.^2).^0.5;

Hx_xn_1 = zeros(size(y,1), size(Z,1));
Hy_xn_1 = (Z.*k_n_1.*(k_1xn_1 - k_2xn_1))*I;
Hz_xn_1 = ((a_yn_1-y).*k_n_1.*(k_1xn_1 - k_2xn_1))*I;
%}
% --------------------------------------------------------------
%.
% Line along y - axis
y1_1 = -g;
y2_1 = g;
a_xp_1 = g;          %Distance of coil from (0,0)
coil_length_y_1 = y2_1 - y1_1;

k_yp_1 = 1./(4*pi*((a_xp_1-X).^2+Z.^2));
k_1yp_1 = (y2_1-y)./((y2_1-y).^2+(a_xp_1-X).^2+Z.^2).^0.5;
k_2yp_1 = (y1_1-y)./((y1_1-y).^2+(a_xp_1-X).^2+Z.^2).^0.5;

Hx_yp_1 = -(Z.*k_yp_1.*(k_1yp_1 - k_2yp_1))*I;
Hy_yp_1 = zeros(size(y,1), size(Z,1));
Hz_yp_1 = (-(a_xp_1-X).*k_yp_1.*(k_1yp_1 - k_2yp_1))*I;

a_xn_1 = -g;
k_yn_1 = 1./(4*pi*((a_xn_1-X).^2+Z.^2));
k_1yn_1 = (y2_1-y)./((y2_1-y).^2+(a_xn_1-X).^2+Z.^2).^0.5;
k_2yn_1 = (y1_1-y)./((y1_1-y).^2+(a_xn_1-X).^2+Z.^2).^0.5;

Hx_yn_1 = (Z.*k_yn_1.*(k_1yn_1 - k_2yn_1))*I;
Hy_yn_1 = zeros(size(y,1), size(Z,1));
Hz_yn_1 = ((a_xn_1-X).*k_yn_1.*(k_1yn_1 - k_2yn_1))*I;


% Adding field of the coil
% Hx_1 = Hx_xp_1 + Hx_xn_1 + Hx_yp_1 + Hx_yn_1;
% Hy_1 = Hy_xp_1 + Hy_xn_1 + Hy_yp_1 + Hy_yn_1;
% Hz_1 = Hz_xp_1 + Hz_xn_1 + Hz_yp_1 + Hz_yn_1;
%}

%.
% --------------------------------------------------------------Coil_2
x1_2 = -2 * g;
x2_2 = 2 * g;
a_yp_2 = 2 * g;          %Distance of coil from (0,0)
coil_length_x_2 = x2_2 - x1_2;
k_p_2 = 1./(4*pi*((a_yp_2-y).^2+Z.^2));
k_1xp_2 = (x2_2-X)./((x2_2-X).^2+(a_yp_2-y).^2+Z.^2).^0.5;
k_2xp_2 = (x1_2-X)./((x1_2-X).^2+(a_yp_2-y).^2+Z.^2).^0.5;

Hx_xp_2 = zeros(size(y,1), size(Z,1));
Hy_xp_2 = (-Z.*k_p_2.*(k_1xp_2 - k_2xp_2))*I;
Hz_xp_2 = (-(a_yp_2-y).*k_p_2.*(k_1xp_2 - k_2xp_2))*I;

a_yn_2 = -2 * g;
k_n_2 = 1./(4*pi*((a_yn_2-y).^2+Z.^2));
k_1xn_2 = (x2_2-X)./((x2_2-X).^2+(a_yn_2-y).^2+Z.^2).^0.5;
k_2xn_2 = (x1_2-X)./((x1_2-X).^2+(a_yn_2-y).^2+Z.^2).^0.5;

Hx_xn_2 = zeros(size(y,1), size(Z,1));
Hy_xn_2 = (Z.*k_n_2.*(k_1xn_2 - k_2xn_2))*I;
Hz_xn_2 = ((a_yn_2-y).*k_n_2.*(k_1xn_2 - k_2xn_2))*I;
%}
% --------------------------------------------------------------
%. 
% Line along y - axis
y1_2 = -2 * g;
y2_2 = 2 * g;
a_xp_2 = 2 * g;          %Distance of coil from (0,0)
coil_length_y_2 = y2_2 - y1_2;

k_yp_2 = 1./(4*pi*((a_xp_2-X).^2+Z.^2));
k_1yp_2 = (y2_2-y)./((y2_2-y).^2+(a_xp_2-X).^2+Z.^2).^0.5;
k_2yp_2 = (y1_2-y)./((y1_2-y).^2+(a_xp_2-X).^2+Z.^2).^0.5;

Hx_yp_2 = -(Z.*k_yp_2.*(k_1yp_2 - k_2yp_2))*I;
Hy_yp_2 = zeros(size(y,1), size(Z,1));
Hz_yp_2 = (-(a_xp_2-X).*k_yp_2.*(k_1yp_2 - k_2yp_2))*I;

a_xn_2 = -2 * g;
k_yn_2 = 1./(4*pi*((a_xn_2-X).^2+Z.^2));
k_1yn_2 = (y2_2-y)./((y2_2-y).^2+(a_xn_2-X).^2+Z.^2).^0.5;
k_2yn_2 = (y1_2-y)./((y1_2-y).^2+(a_xn_2-X).^2+Z.^2).^0.5;

Hx_yn_2 = (Z.*k_yn_2.*(k_1yn_2 - k_2yn_2))*I;
Hy_yn_2 = zeros(size(y,1), size(Z,1));
Hz_yn_2 = ((a_xn_2-X).*k_yn_2.*(k_1yn_2 - k_2yn_2))*I;
%Adding field of Coil_2
% Hx_2 = Hx_xp_2 + Hx_xn_2 + Hx_yp_2 + Hx_yn_2;
% Hy_2 = Hy_xp_2 + Hy_xn_2 + Hy_yp_2 + Hy_yn_2;
% Hz_2 = Hz_xp_2 + Hz_xn_2 + Hz_yp_2 + Hz_yn_2;

%}

%.
% Line along X - axis
% --------------------------------------------------------------Coil_3
x1_3 = -3 * g;
x2_3 = 3 * g;
a_yp_3 = 3 * g;          %Distance of coil from (0,0)
coil_length_x_3 = x2_3 - x1_3;
k_p_3 = 1./(4*pi*((a_yp_3-y).^2+Z.^2));
k_1xp_3 = (x2_3-X)./((x2_3-X).^2+(a_yp_3-y).^2+Z.^2).^0.5;
k_2xp_3 = (x1_3-X)./((x1_3-X).^2+(a_yp_3-y).^2+Z.^2).^0.5;

Hx_xp_3 = zeros(size(y,1), size(Z,1));
Hy_xp_3 = (-Z.*k_p_3.*(k_1xp_3 - k_2xp_3))*I;
Hz_xp_3 = (-(a_yp_3-y).*k_p_3.*(k_1xp_3 - k_2xp_3))*I;

a_yn_3 = -3 * g;
k_n_3 = 1./(4*pi*((a_yn_3-y).^2+Z.^2));
k_1xn_3 = (x2_3-X)./((x2_3-X).^2+(a_yn_3-y).^2+Z.^2).^0.5;
k_2xn_3 = (x1_3-X)./((x1_3-X).^2+(a_yn_3-y).^2+Z.^2).^0.5;

Hx_xn_3 = zeros(size(y,1), size(Z,1));
Hy_xn_3 = (Z.*k_n_3.*(k_1xn_3 - k_2xn_3))*I;
Hz_xn_3 = ((a_yn_3-y).*k_n_3.*(k_1xn_3 - k_2xn_3))*I;
%}
% --------------------------------------------------------------
%.
% Line along y - axis
y1_3 = -3 * g;
y2_3 = 3 * g;
a_xp_3 = 3 * g;          %Distance of coil from (0,0)
coil_length_y_3 = y2_3 - y1_3;

k_yp_3 = 1./(4*pi*((a_xp_3-X).^2+Z.^2));
k_1yp_3 = (y2_3-y)./((y2_3-y).^2+(a_xp_3-X).^2+Z.^2).^0.5;
k_2yp_3 = (y1_3-y)./((y1_3-y).^2+(a_xp_3-X).^2+Z.^2).^0.5;

Hx_yp_3 = -(Z.*k_yp_3.*(k_1yp_3 - k_2yp_3))*I;
Hy_yp_3 = zeros(size(y,1), size(Z,1));
Hz_yp_3 = (-(a_xp_3-X).*k_yp_3.*(k_1yp_3 - k_2yp_3))*I;

a_xn_3 = -3 * g;
k_yn_3 = 1./(4*pi*((a_xn_3-X).^2+Z.^2));
k_1yn_3 = (y2_3-y)./((y2_3-y).^2+(a_xn_3-X).^2+Z.^2).^0.5;
k_2yn_3 = (y1_3-y)./((y1_3-y).^2+(a_xn_3-X).^2+Z.^2).^0.5;

Hx_yn_3 = (Z.*k_yn_3.*(k_1yn_3 - k_2yn_3))*I;
Hy_yn_3 = zeros(size(y,1), size(Z,1));
Hz_yn_3 = ((a_xn_3-X).*k_yn_3.*(k_1yn_3 - k_2yn_3))*I;
% %Adding field of Coil_3
% Hx_3 = Hx_xp_3 + Hx_xn_3 + Hx_yp_3 + Hx_yn_3;
% Hy_3 = Hy_xp_3 + Hy_xn_3 + Hy_yp_3 + Hy_yn_3;
% Hz_3 = Hz_xp_3 + Hz_xn_3 + Hz_yp_3 + Hz_yn_3;

%}

%
% Line along X - axis
% --------------------------------------------------------------Coil_4
x1_4 = -4 * g;
x2_4 = 4 * g;
a_yp_4 = 4 * g;          %Distance of coil from (0,0)
coil_length_x_4 = x2_4 - x1_4;
k_p_4 = 1./(4*pi*((a_yp_4-y).^2+Z.^2));
k_1xp_4 = (x2_4-X)./((x2_4-X).^2+(a_yp_4-y).^2+Z.^2).^0.5;
k_2xp_4 = (x1_4-X)./((x1_4-X).^2+(a_yp_4-y).^2+Z.^2).^0.5;

Hx_xp_4 = zeros(size(y,1), size(Z,1));
Hy_xp_4 = (-Z.*k_p_4.*(k_1xp_4 - k_2xp_4))*I;
Hz_xp_4 = (-(a_yp_4-y).*k_p_4.*(k_1xp_4 - k_2xp_4))*I;

a_yn_4 = -4 * g;
k_n_4 = 1./(4*pi*((a_yn_4-y).^2+Z.^2));
k_1xn_4 = (x2_4-X)./((x2_4-X).^2+(a_yn_4-y).^2+Z.^2).^0.5;
k_2xn_4 = (x1_4-X)./((x1_4-X).^2+(a_yn_4-y).^2+Z.^2).^0.5;

% Hx_xn_4 = zeros(size(y,1), size(Z,1));
% Hy_xn_4 = (Z.*k_n_4.*(k_1xn_4 - k_2xn_4))*I;
% Hz_xn_4 = ((a_yn_4-y).*k_n_4.*(k_1xn_4 - k_2xn_4))*I;

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_4 = -4 * g;
y2_4 = 4 * g;
a_xp_4 = 4 * g;          %Distance of coil from (0,0)
coil_length_y_4 = y2_4 - y1_4;

k_yp_4 = 1./(4*pi*((a_xp_4-X).^2+Z.^2));
k_1yp_4 = (y2_4-y)./((y2_4-y).^2+(a_xp_4-X).^2+Z.^2).^0.5;
k_2yp_4 = (y1_4-y)./((y1_4-y).^2+(a_xp_4-X).^2+Z.^2).^0.5;

Hx_yp_4 = -(Z.*k_yp_4.*(k_1yp_4 - k_2yp_4))*I;
Hy_yp_4 = zeros(size(y,1), size(Z,1));
Hz_yp_4 = (-(a_xp_4-X).*k_yp_4.*(k_1yp_4 - k_2yp_4))*I;

a_xn_4 = -4 * g;
k_yn_4 = 1./(4*pi*((a_xn_4-X).^2+Z.^2));
k_1yn_4 = (y2_4-y)./((y2_4-y).^2+(a_xn_4-X).^2+Z.^2).^0.5;
k_2yn_4 = (y1_4-y)./((y1_4-y).^2+(a_xn_4-X).^2+Z.^2).^0.5;

Hx_yn_4 = (Z.*k_yn_4.*(k_1yn_4 - k_2yn_4))*I;
Hy_yn_4 = zeros(size(y,1), size(Z,1));
Hz_yn_4 = ((a_xn_4-X).*k_yn_4.*(k_1yn_4 - k_2yn_4))*I;
%Adding field of Coil_4
% Hx_4 = Hx_xp_4 + Hx_xn_4 + Hx_yp_4 + Hx_yn_4;
% Hy_4 = Hy_xp_4 + Hy_xn_4 + Hy_yp_4 + Hy_yn_4;
% Hz_4 = Hz_xp_4 + Hz_xn_4 + Hz_yp_4 + Hz_yn_4;

%}

%.
% Line along X - axis
% --------------------------------------------------------------Coil_5
x1_5 = -5 * g;
x2_5 = 5 * g;
a_yp_5 = 5 * g;          %Distance of coil from (0,0)
coil_length_x_5 = x2_5 - x1_5;
k_p_5 = 1./(4*pi*((a_yp_5-y).^2+Z.^2));
k_1xp_5 = (x2_5-X)./((x2_5-X).^2+(a_yp_5-y).^2+Z.^2).^0.5;
k_2xp_5 = (x1_5-X)./((x1_5-X).^2+(a_yp_5-y).^2+Z.^2).^0.5;

Hx_xp_5 = zeros(size(y,1), size(Z,1));
Hy_xp_5 = (-Z.*k_p_5.*(k_1xp_5 - k_2xp_5))*I;
Hz_xp_5 = (-(a_yp_5-y).*k_p_5.*(k_1xp_5 - k_2xp_5))*I;

a_yn_5 = -5 * g;
k_n_5 = 1./(4*pi*((a_yn_5-y).^2+Z.^2));
k_1xn_5 = (x2_5-X)./((x2_5-X).^2+(a_yn_5-y).^2+Z.^2).^0.5;
k_2xn_5 = (x1_5-X)./((x1_5-X).^2+(a_yn_5-y).^2+Z.^2).^0.5;

Hx_xn_5 = zeros(size(y,1), size(Z,1));
Hy_xn_5 = (Z.*k_n_5.*(k_1xn_5 - k_2xn_5))*I;
Hz_xn_5 = ((a_yn_5-y).*k_n_5.*(k_1xn_5 - k_2xn_5))*I;
%}
% --------------------------------------------------------------
%.
% Line along y - axis
y1_5 = -5 * g;
y2_5 = 5 * g;
a_xp_5 = 5 * g;          %Distance of coil from (0,0)
coil_length_y_5 = y2_5 - y1_5;

k_yp_5 = 1./(4*pi*((a_xp_5-X).^2+Z.^2));
k_1yp_5 = (y2_5-y)./((y2_5-y).^2+(a_xp_5-X).^2+Z.^2).^0.5;
k_2yp_5 = (y1_5-y)./((y1_5-y).^2+(a_xp_5-X).^2+Z.^2).^0.5;

Hx_yp_5 = -(Z.*k_yp_5.*(k_1yp_5 - k_2yp_5))*I;
Hy_yp_5 = zeros(size(y,1), size(Z,1));
Hz_yp_5 = (-(a_xp_5-X).*k_yp_5.*(k_1yp_5 - k_2yp_5))*I;

a_xn_5 = -5 * g;
k_yn_5 = 1./(4*pi*((a_xn_5-X).^2+Z.^2));
k_1yn_5 = (y2_5-y)./((y2_5-y).^2+(a_xn_5-X).^2+Z.^2).^0.5;
k_2yn_5 = (y1_5-y)./((y1_5-y).^2+(a_xn_5-X).^2+Z.^2).^0.5;

Hx_yn_5 = (Z.*k_yn_5.*(k_1yn_5 - k_2yn_5))*I;
Hy_yn_5 = zeros(size(y,1), size(Z,1));
Hz_yn_5 = ((a_xn_5-X).*k_yn_5.*(k_1yn_5 - k_2yn_5))*I;
%Adding field of Coil_5
% Hx_5 = Hx_xp_5 + Hx_xn_5 + Hx_yp_5 + Hx_yn_5;
% Hy_5 = Hy_xp_5 + Hy_xn_5 + Hy_yp_5 + Hy_yn_5;
% Hz_5 = Hz_xp_5 + Hz_xn_5 + Hz_yp_5 + Hz_yn_5;

%}

%.
% Line along X - axis
% --------------------------------------------------------------Coil_6
x1_6 = -6 * g;
x2_6 = 6 * g;
a_yp_6 = 6 * g;          %Distance of coil from (0,0)
coil_length_x_6 = x2_6 - x1_6;
k_p_6 = 1./(4*pi*((a_yp_6-y).^2+Z.^2));
k_1xp_6 = (x2_6-X)./((x2_6-X).^2+(a_yp_6-y).^2+Z.^2).^0.5;
k_2xp_6 = (x1_6-X)./((x1_6-X).^2+(a_yp_6-y).^2+Z.^2).^0.5;

Hx_xp_6 = zeros(size(y,1), size(Z,1));
Hy_xp_6 = (-Z.*k_p_6.*(k_1xp_6 - k_2xp_6))*I;
Hz_xp_6 = (-(a_yp_6-y).*k_p_6.*(k_1xp_6 - k_2xp_6))*I;

a_yn_6 = -6 * g;
k_n_6 = 1./(4*pi*((a_yn_6-y).^2+Z.^2));
k_1xn_6 = (x2_6-X)./((x2_6-X).^2+(a_yn_6-y).^2+Z.^2).^0.5;
k_2xn_6 = (x1_6-X)./((x1_6-X).^2+(a_yn_6-y).^2+Z.^2).^0.5;

Hx_xn_6 = zeros(size(y,1), size(Z,1));
Hy_xn_6 = (Z.*k_n_6.*(k_1xn_6 - k_2xn_6))*I;
Hz_xn_6 = ((a_yn_6-y).*k_n_6.*(k_1xn_6 - k_2xn_6))*I;
%}
% --------------------------------------------------------------
%.
%  Line along y - axis
y1_6 = -6 * g;
y2_6 = 6 * g;
a_xp_6 = 6 * g;          %Distance of coil from (0,0)
coil_length_y_6 = y2_6 - y1_6;

k_yp_6 = 1./(4*pi*((a_xp_6-X).^2+Z.^2));
k_1yp_6 = (y2_6-y)./((y2_6-y).^2+(a_xp_6-X).^2+Z.^2).^0.5;
k_2yp_6 = (y1_6-y)./((y1_6-y).^2+(a_xp_6-X).^2+Z.^2).^0.5;

Hx_yp_6 = -(Z.*k_yp_6.*(k_1yp_6 - k_2yp_6))*I;
Hy_yp_6 = zeros(size(y,1), size(Z,1));
Hz_yp_6 = (-(a_xp_6-X).*k_yp_6.*(k_1yp_6 - k_2yp_6))*I;

a_xn_6 = -6 * g;
k_yn_6 = 1./(4*pi*((a_xn_6-X).^2+Z.^2));
k_1yn_6 = (y2_6-y)./((y2_6-y).^2+(a_xn_6-X).^2+Z.^2).^0.5;
k_2yn_6 = (y1_6-y)./((y1_6-y).^2+(a_xn_6-X).^2+Z.^2).^0.5;

Hx_yn_6 = (Z.*k_yn_6.*(k_1yn_6 - k_2yn_6))*I;
Hy_yn_6 = zeros(size(y,1), size(Z,1));
Hz_yn_6 = ((a_xn_6-X).*k_yn_6.*(k_1yn_6 - k_2yn_6))*I;
%Adding field of Coil_6
% Hx_6 = Hx_xp_6 + Hx_xn_6 + Hx_yp_6 + Hx_yn_6;
% Hy_6 = Hy_xp_6 + Hy_xn_6 + Hy_yp_6 + Hy_yn_6;
% Hz_6 = Hz_xp_6 + Hz_xn_6 + Hz_yp_6 + Hz_yn_6;

%}

%.
% Line along X - axis
% --------------------------------------------------------------Coil_7
x1_7 = -7 * g;
x2_7 = 7 * g;
a_yp_7 = 7 * g;          %Distance of coil from (0,0)
coil_length_x_7 = x2_7 - x1_7;
k_p_7 = 1./(4*pi*((a_yp_7-y).^2+Z.^2));
k_1xp_7 = (x2_7-X)./((x2_7-X).^2+(a_yp_7-y).^2+Z.^2).^0.5;
k_2xp_7 = (x1_7-X)./((x1_7-X).^2+(a_yp_7-y).^2+Z.^2).^0.5;

Hx_xp_7 = zeros(size(y,1), size(Z,1));
Hy_xp_7 = (-Z.*k_p_7.*(k_1xp_7 - k_2xp_7))*I;
Hz_xp_7 = (-(a_yp_7-y).*k_p_7.*(k_1xp_7 - k_2xp_7))*I;

a_yn_7 = -7 * g;
k_n_7 = 1./(4*pi*((a_yn_7-y).^2+Z.^2));
k_1xn_7 = (x2_7-X)./((x2_7-X).^2+(a_yn_7-y).^2+Z.^2).^0.5;
k_2xn_7 = (x1_7-X)./((x1_7-X).^2+(a_yn_7-y).^2+Z.^2).^0.5;

Hx_xn_7 = zeros(size(y,1), size(Z,1));
Hy_xn_7 = (Z.*k_n_7.*(k_1xn_7 - k_2xn_7))*I;
Hz_xn_7 = ((a_yn_7-y).*k_n_7.*(k_1xn_7 - k_2xn_7))*I;
%}
% --------------------------------------------------------------
%.
%  Line along y - axis
y1_7 = -7 * g;
y2_7 = 7 * g;
a_xp_7 = 7 * g;          %Distance of coil from (0,0)
coil_length_y_7 = y2_7 - y1_7;

k_yp_7 = 1./(4*pi*((a_xp_7-X).^2+Z.^2));
k_1yp_7 = (y2_7-y)./((y2_7-y).^2+(a_xp_7-X).^2+Z.^2).^0.5;
k_2yp_7 = (y1_7-y)./((y1_7-y).^2+(a_xp_7-X).^2+Z.^2).^0.5;

Hx_yp_7 = -(Z.*k_yp_7.*(k_1yp_7 - k_2yp_7))*I;
Hy_yp_7 = zeros(size(y,1), size(Z,1));
Hz_yp_7 = (-(a_xp_7-X).*k_yp_7.*(k_1yp_7 - k_2yp_7))*I;

a_xn_7 = -7 * g;
k_yn_7 = 1./(4*pi*((a_xn_7-X).^2+Z.^2));
k_1yn_7 = (y2_7-y)./((y2_7-y).^2+(a_xn_7-X).^2+Z.^2).^0.5;
k_2yn_7 = (y1_7-y)./((y1_7-y).^2+(a_xn_7-X).^2+Z.^2).^0.5;

Hx_yn_7 = (Z.*k_yn_7.*(k_1yn_7 - k_2yn_7))*I;
Hy_yn_7 = zeros(size(y,1), size(Z,1));
Hz_yn_7 = ((a_xn_7-X).*k_yn_7.*(k_1yn_7 - k_2yn_7))*I;
%Adding field of Coil_7
% Hx_7 = Hx_xp_7 + Hx_xn_7 + Hx_yp_7 + Hx_yn_7;
% Hy_7 = Hy_xp_7 + Hy_xn_7 + Hy_yp_7 + Hy_yn_7;
% Hz_7 = Hz_xp_7 + Hz_xn_7 + Hz_yp_7 + Hz_yn_7;

%}

%.
% Line along X - axis
% --------------------------------------------------------------Coil_8
x1_8 = -8 * g;
x2_8 = 8 * g;
a_yp_8 = 8 * g;          %Distance of coil from (0,0)
coil_length_x_8 = x2_8 - x1_8;
k_p_8 = 1./(4*pi*((a_yp_8-y).^2+Z.^2));
k_1xp_8 = (x2_8-X)./((x2_8-X).^2+(a_yp_8-y).^2+Z.^2).^0.5;
k_2xp_8 = (x1_8-X)./((x1_8-X).^2+(a_yp_8-y).^2+Z.^2).^0.5;

Hx_xp_8 = zeros(size(y,1), size(Z,1));
Hy_xp_8 = (-Z.*k_p_8.*(k_1xp_8 - k_2xp_8))*I;
Hz_xp_8 = (-(a_yp_8-y).*k_p_8.*(k_1xp_8 - k_2xp_8))*I;

a_yn_8 = -8 * g;
k_n_8 = 1./(4*pi*((a_yn_8-y).^2+Z.^2));
k_1xn_8 = (x2_8-X)./((x2_8-X).^2+(a_yn_8-y).^2+Z.^2).^0.5;
k_2xn_8 = (x1_8-X)./((x1_8-X).^2+(a_yn_8-y).^2+Z.^2).^0.5;

Hx_xn_8 = zeros(size(y,1), size(Z,1));
Hy_xn_8 = (Z.*k_n_8.*(k_1xn_8 - k_2xn_8))*I;
Hz_xn_8 = ((a_yn_8-y).*k_n_8.*(k_1xn_8 - k_2xn_8))*I;
%}
% --------------------------------------------------------------
%.
%  Line along y - axis
y1_8 = -8 * g;
y2_8 = 8 * g;
a_xp_8 = 8 * g;          %Distance of coil from (0,0)
coil_length_y_8 = y2_8 - y1_8;

k_yp_8 = 1./(4*pi*((a_xp_8-X).^2+Z.^2));
k_1yp_8 = (y2_8-y)./((y2_8-y).^2+(a_xp_8-X).^2+Z.^2).^0.5;
k_2yp_8 = (y1_8-y)./((y1_8-y).^2+(a_xp_8-X).^2+Z.^2).^0.5;

Hx_yp_8 = -(Z.*k_yp_8.*(k_1yp_8 - k_2yp_8))*I;
Hy_yp_8 = zeros(size(y,1), size(Z,1));
Hz_yp_8 = (-(a_xp_8-X).*k_yp_8.*(k_1yp_8 - k_2yp_8))*I;

a_xn_8 = -8 * g;
k_yn_8 = 1./(4*pi*((a_xn_8-X).^2+Z.^2));
k_1yn_8 = (y2_8-y)./((y2_8-y).^2+(a_xn_8-X).^2+Z.^2).^0.5;
k_2yn_8 = (y1_8-y)./((y1_8-y).^2+(a_xn_8-X).^2+Z.^2).^0.5;

Hx_yn_8 = (Z.*k_yn_8.*(k_1yn_8 - k_2yn_8))*I;
Hy_yn_8 = zeros(size(y,1), size(Z,1));
Hz_yn_8 = ((a_xn_8-X).*k_yn_8.*(k_1yn_8 - k_2yn_8))*I;
%Adding field of Coil_8
% Hx_8 = Hx_xp_8 + Hx_xn_8 + Hx_yp_8 + Hx_yn_8;
% Hy_8 = Hy_xp_8 + Hy_xn_8 + Hy_yp_8 + Hy_yn_8;
% Hz_8 = Hz_xp_8 + Hz_xn_8 + Hz_yp_8 + Hz_yn_8;

%}

%.
% Line along X - axis
% --------------------------------------------------------------Coil_9
x1_9 = -9 * g;
x2_9 = 9 * g;
a_yp_9 = 9 * g;          %Distance of coil from (0,0)
coil_length_x_9 = x2_9 - x1_9;
k_p_9 = 1./(4*pi*((a_yp_9-y).^2+Z.^2));
k_1xp_9 = (x2_9-X)./((x2_9-X).^2+(a_yp_9-y).^2+Z.^2).^0.5;
k_2xp_9 = (x1_9-X)./((x1_9-X).^2+(a_yp_9-y).^2+Z.^2).^0.5;

Hx_xp_9 = zeros(size(y,1), size(Z,1));
Hy_xp_9 = (-Z.*k_p_9.*(k_1xp_9 - k_2xp_9))*I;
Hz_xp_9 = (-(a_yp_9-y).*k_p_9.*(k_1xp_9 - k_2xp_9))*I;

a_yn_9 = -9 * g;
k_n_9 = 1./(4*pi*((a_yn_9-y).^2+Z.^2));
k_1xn_9 = (x2_9-X)./((x2_9-X).^2+(a_yn_9-y).^2+Z.^2).^0.5;
k_2xn_9 = (x1_9-X)./((x1_9-X).^2+(a_yn_9-y).^2+Z.^2).^0.5;

Hx_xn_9 = zeros(size(y,1), size(Z,1));
Hy_xn_9 = (Z.*k_n_9.*(k_1xn_9 - k_2xn_9))*I;
Hz_xn_9 = ((a_yn_9-y).*k_n_9.*(k_1xn_9 - k_2xn_9))*I;
%}
% --------------------------------------------------------------
%.
%  Line along y - axis
y1_9 = -9 * g;
y2_9 = 9 * g;
a_xp_9 = 9 * g;          %Distance of coil from (0,0)
coil_length_y_9 = y2_9 - y1_9;

k_yp_9 = 1./(4*pi*((a_xp_9-X).^2+Z.^2));
k_1yp_9 = (y2_9-y)./((y2_9-y).^2+(a_xp_9-X).^2+Z.^2).^0.5;
k_2yp_9 = (y1_9-y)./((y1_9-y).^2+(a_xp_9-X).^2+Z.^2).^0.5;

Hx_yp_9 = -(Z.*k_yp_9.*(k_1yp_9 - k_2yp_9))*I;
Hy_yp_9 = zeros(size(y,1), size(Z,1));
Hz_yp_9 = (-(a_xp_9-X).*k_yp_9.*(k_1yp_9 - k_2yp_9))*I;

a_xn_9 = -9 * g;
k_yn_9 = 1./(4*pi*((a_xn_9-X).^2+Z.^2));
k_1yn_9 = (y2_9-y)./((y2_9-y).^2+(a_xn_9-X).^2+Z.^2).^0.5;
k_2yn_9 = (y1_9-y)./((y1_9-y).^2+(a_xn_9-X).^2+Z.^2).^0.5;

Hx_yn_9 = (Z.*k_yn_9.*(k_1yn_9 - k_2yn_9))*I;
Hy_yn_9 = zeros(size(y,1), size(Z,1));
Hz_yn_9 = ((a_xn_9-X).*k_yn_9.*(k_1yn_9 - k_2yn_9))*I;
%Adding field of Coil_9
% Hx_9 = Hx_xp_9 + Hx_xn_9 + Hx_yp_9 + Hx_yn_9;
% Hy_9 = Hy_xp_9 + Hy_xn_9 + Hy_yp_9 + Hy_yn_9;
% Hz_9 = Hz_xp_9 + Hz_xn_9 + Hz_yp_9 + Hz_yn_9;

%}

%.
% Line along X - axis
% --------------------------------------------------------------Coil_10
x1_10 = -10 * g;
x2_10 = 10 * g;
a_yp_10 = 10 * g;          %Distance of coil from (0,0)
coil_length_x_10 = x2_10 - x1_10;
k_p_10 = 1./(4*pi*((a_yp_10-y).^2+Z.^2));
k_1xp_10 = (x2_10-X)./((x2_10-X).^2+(a_yp_10-y).^2+Z.^2).^0.5;
k_2xp_10 = (x1_10-X)./((x1_10-X).^2+(a_yp_10-y).^2+Z.^2).^0.5;

Hx_xp_10 = zeros(size(y,1), size(Z,1));
Hy_xp_10 = (-Z.*k_p_10.*(k_1xp_10 - k_2xp_10))*I;
Hz_xp_10 = (-(a_yp_10-y).*k_p_10.*(k_1xp_10 - k_2xp_10))*I;

a_yn_10 = -10 * g;
k_n_10 = 1./(4*pi*((a_yn_10-y).^2+Z.^2));
k_1xn_10 = (x2_10-X)./((x2_10-X).^2+(a_yn_10-y).^2+Z.^2).^0.5;
k_2xn_10 = (x1_10-X)./((x1_10-X).^2+(a_yn_10-y).^2+Z.^2).^0.5;

Hx_xn_10 = zeros(size(y,1), size(Z,1));
Hy_xn_10 = (Z.*k_n_10.*(k_1xn_10 - k_2xn_10))*I;
Hz_xn_10 = ((a_yn_10-y).*k_n_10.*(k_1xn_10 - k_2xn_10))*I;
%}
% --------------------------------------------------------------
%.
%  Line along y - axis
y1_10 = -10 * g;
y2_10 = 10 * g;
a_xp_10 = 10 * g;          %Distance of coil from (0,0)
coil_length_y_10 = y2_10 - y1_10;

k_yp_10 = 1./(4*pi*((a_xp_10-X).^2+Z.^2));
k_1yp_10 = (y2_10-y)./((y2_10-y).^2+(a_xp_10-X).^2+Z.^2).^0.5;
k_2yp_10 = (y1_10-y)./((y1_10-y).^2+(a_xp_10-X).^2+Z.^2).^0.5;

Hx_yp_10 = -(Z.*k_yp_10.*(k_1yp_10 - k_2yp_10))*I;
Hy_yp_10 = zeros(size(y,1), size(Z,1));
Hz_yp_10 = (-(a_xp_10-X).*k_yp_10.*(k_1yp_10 - k_2yp_10))*I;

a_xn_10 = -10 * g;
k_yn_10 = 1./(4*pi*((a_xn_10-X).^2+Z.^2));
k_1yn_10 = (y2_10-y)./((y2_10-y).^2+(a_xn_10-X).^2+Z.^2).^0.5;
k_2yn_10 = (y1_10-y)./((y1_10-y).^2+(a_xn_10-X).^2+Z.^2).^0.5;

Hx_yn_10 = (Z.*k_yn_10.*(k_1yn_10 - k_2yn_10))*I;
Hy_yn_10 = zeros(size(y,1), size(Z,1));
Hz_yn_10 = ((a_xn_10-X).*k_yn_10.*(k_1yn_10 - k_2yn_10))*I;
%Adding field of Coil_10
% Hx_10 = Hx_xp_10 + Hx_xn_10 + Hx_yp_10 + Hx_yn_10;
% Hy_10 = Hy_xp_10 + Hy_xn_10 + Hy_yp_10 + Hy_yn_10;
% Hz_10 = Hz_xp_10 + Hz_xn_10 + Hz_yp_10 + Hz_yn_10;

%}

% ----Adding all coil fields----
Hx = Hx_yp_1 + Hx_yp_2 + Hx_yp_3 + Hx_yp_4 + Hx_yp_5 + Hx_yp_6 + Hx_yp_7 + Hx_yp_8 + Hx_yp_9 + Hx_yp_10 + Hx_yn_1 + Hx_yn_2 + Hx_yn_3 + Hx_yn_4 + Hx_yn_5 + Hx_yn_6 + Hx_yn_7 + Hx_yn_8 + Hx_yn_9 + Hx_yn_10;
% Hy = Hy_xp_1 + Hy_xp_2 + Hy_xp_3 + Hy_xp_4 + Hy_xp_5 +  Hy_xp_6 +  Hy_xp_7 +  Hy_xp_8 +  Hy_xp_9 +  Hy_xp_10 +  Hy_xn_1 +  Hy_xn_2 +  Hy_xn_3 +  Hy_xn_4 +  Hy_xn_5 +  Hy_xn_6 +  Hy_xn_7 +  Hy_xn_8 +  Hy_xn_9 +  Hy_xn_10;
Hz = Hz_yp_1 + Hz_yp_2 + Hz_yp_3 + Hz_yp_4 + Hz_yp_5 + Hz_yp_6 + Hz_yp_7 + Hz_yp_8 + Hz_yp_9 + Hz_yp_10 + Hz_yn_1 + Hz_yn_2 + Hz_yn_3 + Hz_yn_4 + Hz_yn_5 + Hz_yn_6 + Hz_yn_7 + Hz_yn_8 + Hz_yn_9 + Hz_yn_10;

% Bx = (Hx)*m0;
By = (Hx)*m0;
Bz = (Hz)*m0;

% -------Plotting the fields--------

[df_y,df_z] = gradient(By,500e-6); %[dBx/dx, dBx/dz]
[df_yz,df_zz] = gradient(Bz,500e-6); %[dBz/dx, dBz/dz]

F_y = By .* df_y + Bz .* df_z;
F_z = By .* df_yz + Bz .* df_zz;

q = 26;
Z(q,:)
figure
plot(c,F_y(q,:), '--b') 
hold on
% axis([-2e-3 2e-3 -4e-4 14e-4])
plot(c,F_z(q,:), 'r') 
line([c(1) c(end)],[Force_cy Force_cy],'linewidth',3,'color','r')
line([0 y2_10],[0 0],'linewidth',3,'color','b');
% line([x1_10 x2_10],[a_yn_10 a_yn_10],'linewidth',3,'color','r');
legend('F_x', 'F_z', 'Frictional Force', 'Max Coil length')
xlabel("Distance from Center of wire(m)")
ylabel("Force generated by Field along X - axis (N)")
title("Variation in Force generated by Field along X - axis")
hold off