clear;
clc;
% -----------------------------------------------------------------%
% Note: Max length of coil = 4mm, Coil distance from center = 2mm;
% Force produced by coil > Frictional Force at a distance of 4mm from coil
% When the height of robot is 3mm and current is 0.5A
% -----------------------------------------------------------------%


% Analysing field along a single wire...
% Constants 
I = 0.5;       %Current flowing in the wire
g = 400e-6;     %Coil spacing
m0 = 4*pi*1e-7;
y = 0;
c = -15000e-6:500e-6:15000e-6;
k = 0.4e-3;
[X,Z] = meshgrid(c);
radius = 0.5e-3;%m
height = 1e-3;%m
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

% --------------------------------------------------------------Coil_1

% --------------------------------------------------------------
%.
% Line along y - axis
y1_1 = -0.6e-3;
y2_1 = 0.6e-3;
a_xp_1 = g;          %Distance of coil from (0,0)
coil_length_y_1 = y2_1 - y1_1;

k_yp_1 = 1./(4*pi*((a_xp_1-X).^2+Z.^2));
k_1yp_1 = (y2_1-y)./((y2_1-y).^2+(a_xp_1-X).^2+Z.^2).^0.5;
k_2yp_1 = (y1_1-y)./((y1_1-y).^2+(a_xp_1-X).^2+Z.^2).^0.5;

Hx_yp_1 = -(Z.*k_yp_1.*(k_1yp_1 - k_2yp_1))*I;
Hy_yp_1 = zeros(size(y,1), size(Z,1));
Hz_yp_1 = (-(a_xp_1-X).*k_yp_1.*(k_1yp_1 - k_2yp_1))*I;


% Adding field of the coil
% Hx_1 = Hx_xp_1 + Hx_xn_1 + Hx_yp_1 + Hx_yn_1;
% Hy_1 = Hy_xp_1 + Hy_xn_1 + Hy_yp_1 + Hy_yn_1;
% Hz_1 = Hz_xp_1 + Hz_xn_1 + Hz_yp_1 + Hz_yn_1;
%}

%.
% --------------------------------------------------------------Coil_2

% --------------------------------------------------------------
%. 
% Line along y - axis
y1_2 = y1_1 - k;
y2_2 = y2_1 + k;
a_xp_2 = 2 * g;          %Distance of coil from (0,0)
coil_length_y_2 = y2_2 - y1_2;

k_yp_2 = 1./(4*pi*((a_xp_2-X).^2+Z.^2));
k_1yp_2 = (y2_2-y)./((y2_2-y).^2+(a_xp_2-X).^2+Z.^2).^0.5;
k_2yp_2 = (y1_2-y)./((y1_2-y).^2+(a_xp_2-X).^2+Z.^2).^0.5;

Hx_yp_2 = -(Z.*k_yp_2.*(k_1yp_2 - k_2yp_2))*I;
Hy_yp_2 = zeros(size(y,1), size(Z,1));
Hz_yp_2 = (-(a_xp_2-X).*k_yp_2.*(k_1yp_2 - k_2yp_2))*I;


%Adding field of Coil_2
% Hx_2 = Hx_xp_2 + Hx_xn_2 + Hx_yp_2 + Hx_yn_2;
% Hy_2 = Hy_xp_2 + Hy_xn_2 + Hy_yp_2 + Hy_yn_2;
% Hz_2 = Hz_xp_2 + Hz_xn_2 + Hz_yp_2 + Hz_yn_2;

%}

%.

% --------------------------------------------------------------Coil_3

% --------------------------------------------------------------
%.
% Line along y - axis
y1_3 = y1_2 - k;
y2_3 = y2_2 + k;
a_xp_3 = 3 * g;          %Distance of coil from (0,0)
coil_length_y_3 = y2_3 - y1_3;

k_yp_3 = 1./(4*pi*((a_xp_3-X).^2+Z.^2));
k_1yp_3 = (y2_3-y)./((y2_3-y).^2+(a_xp_3-X).^2+Z.^2).^0.5;
k_2yp_3 = (y1_3-y)./((y1_3-y).^2+(a_xp_3-X).^2+Z.^2).^0.5;

Hx_yp_3 = -(Z.*k_yp_3.*(k_1yp_3 - k_2yp_3))*I;
Hy_yp_3 = zeros(size(y,1), size(Z,1));
Hz_yp_3 = (-(a_xp_3-X).*k_yp_3.*(k_1yp_3 - k_2yp_3))*I;


% %Adding field of Coil_3
% Hx_3 = Hx_xp_3 + Hx_xn_3 + Hx_yp_3 + Hx_yn_3;
% Hy_3 = Hy_xp_3 + Hy_xn_3 + Hy_yp_3 + Hy_yn_3;
% Hz_3 = Hz_xp_3 + Hz_xn_3 + Hz_yp_3 + Hz_yn_3;

%}

%

% --------------------------------------------------------------Coil_4

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_4 = y1_3 - k;
y2_4 = y2_3 + k;
a_xp_4 = 4 * g;          %Distance of coil from (0,0)
coil_length_y_4 = y2_4 - y1_4;

k_yp_4 = 1./(4*pi*((a_xp_4-X).^2+Z.^2));
k_1yp_4 = (y2_4-y)./((y2_4-y).^2+(a_xp_4-X).^2+Z.^2).^0.5;
k_2yp_4 = (y1_4-y)./((y1_4-y).^2+(a_xp_4-X).^2+Z.^2).^0.5;

Hx_yp_4 = -(Z.*k_yp_4.*(k_1yp_4 - k_2yp_4))*I;
Hy_yp_4 = zeros(size(y,1), size(Z,1));
Hz_yp_4 = (-(a_xp_4-X).*k_yp_4.*(k_1yp_4 - k_2yp_4))*I;


%Adding field of Coil_4
% Hx_4 = Hx_xp_4 + Hx_xn_4 + Hx_yp_4 + Hx_yn_4;
% Hy_4 = Hy_xp_4 + Hy_xn_4 + Hy_yp_4 + Hy_yn_4;
% Hz_4 = Hz_xp_4 + Hz_xn_4 + Hz_yp_4 + Hz_yn_4;

%}

%.

% --------------------------------------------------------------Coil_5

% --------------------------------------------------------------
%.
% Line along y - axis
y1_5 = y1_4 - k;
y2_5 = y2_4 + k;
a_xp_5 = 5 * g;          %Distance of coil from (0,0)
coil_length_y_5 = y2_5 - y1_5;

k_yp_5 = 1./(4*pi*((a_xp_5-X).^2+Z.^2));
k_1yp_5 = (y2_5-y)./((y2_5-y).^2+(a_xp_5-X).^2+Z.^2).^0.5;
k_2yp_5 = (y1_5-y)./((y1_5-y).^2+(a_xp_5-X).^2+Z.^2).^0.5;

Hx_yp_5 = -(Z.*k_yp_5.*(k_1yp_5 - k_2yp_5))*I;
Hy_yp_5 = zeros(size(y,1), size(Z,1));
Hz_yp_5 = (-(a_xp_5-X).*k_yp_5.*(k_1yp_5 - k_2yp_5))*I;


%Adding field of Coil_5
% Hx_5 = Hx_xp_5 + Hx_xn_5 + Hx_yp_5 + Hx_yn_5;
% Hy_5 = Hy_xp_5 + Hy_xn_5 + Hy_yp_5 + Hy_yn_5;
% Hz_5 = Hz_xp_5 + Hz_xn_5 + Hz_yp_5 + Hz_yn_5;

%}

%.

% --------------------------------------------------------------Coil_6

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_6 = y1_5 - k;
y2_6 = y2_5 + k;
a_xp_6 = 6 * g;          %Distance of coil from (0,0)
coil_length_y_6 = y2_6 - y1_6;

k_yp_6 = 1./(4*pi*((a_xp_6-X).^2+Z.^2));
k_1yp_6 = (y2_6-y)./((y2_6-y).^2+(a_xp_6-X).^2+Z.^2).^0.5;
k_2yp_6 = (y1_6-y)./((y1_6-y).^2+(a_xp_6-X).^2+Z.^2).^0.5;

Hx_yp_6 = -(Z.*k_yp_6.*(k_1yp_6 - k_2yp_6))*I;
Hy_yp_6 = zeros(size(y,1), size(Z,1));
Hz_yp_6 = (-(a_xp_6-X).*k_yp_6.*(k_1yp_6 - k_2yp_6))*I;


%Adding field of Coil_6
% Hx_6 = Hx_xp_6 + Hx_xn_6 + Hx_yp_6 + Hx_yn_6;
% Hy_6 = Hy_xp_6 + Hy_xn_6 + Hy_yp_6 + Hy_yn_6;
% Hz_6 = Hz_xp_6 + Hz_xn_6 + Hz_yp_6 + Hz_yn_6;

%}

%.

% --------------------------------------------------------------Coil_7

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_7 = y1_6 - k;
y2_7 = y2_6 + k;
a_xp_7 = 7 * g;          %Distance of coil from (0,0)
coil_length_y_7 = y2_7 - y1_7;

k_yp_7 = 1./(4*pi*((a_xp_7-X).^2+Z.^2));
k_1yp_7 = (y2_7-y)./((y2_7-y).^2+(a_xp_7-X).^2+Z.^2).^0.5;
k_2yp_7 = (y1_7-y)./((y1_7-y).^2+(a_xp_7-X).^2+Z.^2).^0.5;

Hx_yp_7 = -(Z.*k_yp_7.*(k_1yp_7 - k_2yp_7))*I;
Hy_yp_7 = zeros(size(y,1), size(Z,1));
Hz_yp_7 = (-(a_xp_7-X).*k_yp_7.*(k_1yp_7 - k_2yp_7))*I;


%Adding field of Coil_7
% Hx_7 = Hx_xp_7 + Hx_xn_7 + Hx_yp_7 + Hx_yn_7;
% Hy_7 = Hy_xp_7 + Hy_xn_7 + Hy_yp_7 + Hy_yn_7;
% Hz_7 = Hz_xp_7 + Hz_xn_7 + Hz_yp_7 + Hz_yn_7;

%}

%.

% --------------------------------------------------------------Coil_8

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_8 = y1_7 - k;
y2_8 = y2_7 + k;
a_xp_8 = 8 * g;          %Distance of coil from (0,0)
coil_length_y_8 = y2_8 - y1_8;

k_yp_8 = 1./(4*pi*((a_xp_8-X).^2+Z.^2));
k_1yp_8 = (y2_8-y)./((y2_8-y).^2+(a_xp_8-X).^2+Z.^2).^0.5;
k_2yp_8 = (y1_8-y)./((y1_8-y).^2+(a_xp_8-X).^2+Z.^2).^0.5;

Hx_yp_8 = -(Z.*k_yp_8.*(k_1yp_8 - k_2yp_8))*I;
Hy_yp_8 = zeros(size(y,1), size(Z,1));
Hz_yp_8 = (-(a_xp_8-X).*k_yp_8.*(k_1yp_8 - k_2yp_8))*I;


%Adding field of Coil_8
% Hx_8 = Hx_xp_8 + Hx_xn_8 + Hx_yp_8 + Hx_yn_8;
% Hy_8 = Hy_xp_8 + Hy_xn_8 + Hy_yp_8 + Hy_yn_8;
% Hz_8 = Hz_xp_8 + Hz_xn_8 + Hz_yp_8 + Hz_yn_8;

%}

%.

% --------------------------------------------------------------Coil_9

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_9 = y1_8 - k;
y2_9 = y2_8 + k;
a_xp_9 = 9 * g;          %Distance of coil from (0,0)
coil_length_y_9 = y2_9 - y1_9;

k_yp_9 = 1./(4*pi*((a_xp_9-X).^2+Z.^2));
k_1yp_9 = (y2_9-y)./((y2_9-y).^2+(a_xp_9-X).^2+Z.^2).^0.5;
k_2yp_9 = (y1_9-y)./((y1_9-y).^2+(a_xp_9-X).^2+Z.^2).^0.5;

Hx_yp_9 = -(Z.*k_yp_9.*(k_1yp_9 - k_2yp_9))*I;
Hy_yp_9 = zeros(size(y,1), size(Z,1));
Hz_yp_9 = (-(a_xp_9-X).*k_yp_9.*(k_1yp_9 - k_2yp_9))*I;


%Adding field of Coil_9
% Hx_9 = Hx_xp_9 + Hx_xn_9 + Hx_yp_9 + Hx_yn_9;
% Hy_9 = Hy_xp_9 + Hy_xn_9 + Hy_yp_9 + Hy_yn_9;
% Hz_9 = Hz_xp_9 + Hz_xn_9 + Hz_yp_9 + Hz_yn_9;

%}

%.

% --------------------------------------------------------------Coil_10

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_10 = y1_9 - k;
y2_10 = y2_9 + k;
a_xp_10 = 10 * g;          %Distance of coil from (0,0)
coil_length_y_10 = y2_10 - y1_10;

k_yp_10 = 1./(4*pi*((a_xp_10-X).^2+Z.^2));
k_1yp_10 = (y2_10-y)./((y2_10-y).^2+(a_xp_10-X).^2+Z.^2).^0.5;
k_2yp_10 = (y1_10-y)./((y1_10-y).^2+(a_xp_10-X).^2+Z.^2).^0.5;

Hx_yp_10 = -(Z.*k_yp_10.*(k_1yp_10 - k_2yp_10))*I;
Hy_yp_10 = zeros(size(y,1), size(Z,1));
Hz_yp_10 = (-(a_xp_10-X).*k_yp_10.*(k_1yp_10 - k_2yp_10))*I;


%Adding field of Coil_10
% Hx_10 = Hx_xp_10 + Hx_xn_10 + Hx_yp_10 + Hx_yn_10;
% Hy_10 = Hy_xp_10 + Hy_xn_10 + Hy_yp_10 + Hy_yn_10;
% Hz_10 = Hz_xp_10 + Hz_xn_10 + Hz_yp_10 + Hz_yn_10;

%}

% --------------------------------------------------------------Coil_1

% --------------------------------------------------------------
%.
% Line along y - axis
y1_11 = -0.8e-3;
y2_11 = 0.8e-3;
         %Distance of coil from (0,0)
coil_length_y__1 = y2_11 - y1_11;



a_xn__11 = -g;
k_yn__11 = 1./(4*pi*((a_xn__11-X).^2+Z.^2));
k_1yn__11 = (y2_11-y)./((y2_11-y).^2+(a_xn__11-X).^2+Z.^2).^0.5;
k_2yn__11 = (y1_11-y)./((y1_11-y).^2+(a_xn__11-X).^2+Z.^2).^0.5;

Hx__yn__11 = (Z.*k_yn__11.*(k_1yn__11 - k_2yn__11))*I;
Hy__yn__11 = zeros(size(y,1), size(Z,1));
Hz__yn__11 = ((a_xn__11-X).*k_yn__11.*(k_1yn__11 - k_2yn__11))*I;


% Adding field of the coil
% Hx__1 = Hx__xp__11 + Hx__xn__11 + Hx__yp__11 + Hx__yn__11;
% Hy__1 = Hy__xp__11 + Hy__xn__11 + Hy__yp__11 + Hy__yn__11;
% Hz_1 = Hz_xp__11 + Hz_xn__11 + Hz__yp__11 + Hz__yn__11;
%}

%.
% --------------------------------------------------------------Coil_2

% --------------------------------------------------------------
%. 
% Line along y - axis
y1_12 = y1_11 - k;
y2_12 = y2_11 + k;
% a_xp__12 = 2 * g;          %Distance of coil from (0,0)
coil_length_y__2 = y2_12 - y1_12;



a_xn__12 = -2 * g;
k_yn__12 = 1./(4*pi*((a_xn__12-X).^2+Z.^2));
k_1yn__12 = (y2_12-y)./((y2_12-y).^2+(a_xn__12-X).^2+Z.^2).^0.5;
k_2yn__12 = (y1_12-y)./((y1_12-y).^2+(a_xn__12-X).^2+Z.^2).^0.5;

Hx__yn__12 = (Z.*k_yn__12.*(k_1yn__12 - k_2yn__12))*I;
Hy__yn__12 = zeros(size(y,1), size(Z,1));
Hz__yn__12 = ((a_xn__12-X).*k_yn__12.*(k_1yn__12 - k_2yn__12))*I;
%Adding field of Coil_2
% Hx__2 = Hx__xp__12 + Hx__xn__12 + Hx__yp__12 + Hx__yn__12;
% Hy__2 = Hy__xp__12 + Hy__xn__12 + Hy__yp__12 + Hy__yn__12;
% Hz_2 = Hz_xp__12 + Hz_xn__12 + Hz__yp__12 + Hz__yn__12;

%}

%.

% --------------------------------------------------------------Coil_3

% --------------------------------------------------------------
%.
% Line along y - axis
y1_13 = y1_12 - k;
y2_13 = y2_12 + k;
% a_xp__13 = 3 * g;          %Distance of coil from (0,0)
coil_length_y__3 = y2_13 - y1_13;



a_xn__13 = -3 * g;
k_yn__13 = 1./(4*pi*((a_xn__13-X).^2+Z.^2));
k_1yn__13 = (y2_13-y)./((y2_13-y).^2+(a_xn__13-X).^2+Z.^2).^0.5;
k_2yn__13 = (y1_13-y)./((y1_13-y).^2+(a_xn__13-X).^2+Z.^2).^0.5;

Hx__yn__13 = (Z.*k_yn__13.*(k_1yn__13 - k_2yn__13))*I;
Hy__yn__13 = zeros(size(y,1), size(Z,1));
Hz__yn__13 = ((a_xn__13-X).*k_yn__13.*(k_1yn__13 - k_2yn__13))*I;
% %Adding field of Coil_3
% Hx__3 = Hx__xp__13 + Hx__xn__13 + Hx__yp__13 + Hx__yn__13;
% Hy__3 = Hy__xp__13 + Hy__xn__13 + Hy__yp__13 + Hy__yn__13;
% Hz_3 = Hz_xp__13 + Hz_xn__13 + Hz__yp__13 + Hz__yn__13;

%}

%

% --------------------------------------------------------------Coil_4

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_14 = y1_13 - k;
y2_14 = y2_13 + k;
% a_xp__14 = 4 * g;          %Distance of coil from (0,0)
coil_length_y__4 = y2_14 - y1_14;



a_xn__14 = -4 * g;
k_yn__14 = 1./(4*pi*((a_xn__14-X).^2+Z.^2));
k_1yn__14 = (y2_14-y)./((y2_14-y).^2+(a_xn__14-X).^2+Z.^2).^0.5;
k_2yn__14 = (y1_14-y)./((y1_14-y).^2+(a_xn__14-X).^2+Z.^2).^0.5;

Hx__yn__14 = (Z.*k_yn__14.*(k_1yn__14 - k_2yn__14))*I;
Hy__yn__14 = zeros(size(y,1), size(Z,1));
Hz__yn__14 = ((a_xn__14-X).*k_yn__14.*(k_1yn__14 - k_2yn__14))*I;
%Adding field of Coil_4
% Hx__4 = Hx__xp__14 + Hx__xn__14 + Hx__yp__14 + Hx__yn__14;
% Hy__4 = Hy__xp__14 + Hy__xn__14 + Hy__yp__14 + Hy__yn__14;
% Hz_4 = Hz_xp__14 + Hz_xn__14 + Hz__yp__14 + Hz__yn__14;

%}

%.

% --------------------------------------------------------------Coil_5

% --------------------------------------------------------------
%.
% Line along y - axis
y1_15 = y1_14 - k;
y2_15 = y2_14 + k;
% a_xp__15 = 5 * g;          %Distance of coil from (0,0)
coil_length_y__5 = y2_15 - y1_15;



a_xn__15 = -5 * g;
k_yn__15 = 1./(4*pi*((a_xn__15-X).^2+Z.^2));
k_1yn__15 = (y2_15-y)./((y2_15-y).^2+(a_xn__15-X).^2+Z.^2).^0.5;
k_2yn__15 = (y1_15-y)./((y1_15-y).^2+(a_xn__15-X).^2+Z.^2).^0.5;

Hx__yn__15 = (Z.*k_yn__15.*(k_1yn__15 - k_2yn__15))*I;
Hy__yn__15 = zeros(size(y,1), size(Z,1));
Hz__yn__15 = ((a_xn__15-X).*k_yn__15.*(k_1yn__15 - k_2yn__15))*I;
%Adding field of Coil_5
% Hx__5 = Hx__xp__15 + Hx__xn__15 + Hx__yp__15 + Hx__yn__15;
% Hy__5 = Hy__xp__15 + Hy__xn__15 + Hy__yp__15 + Hy__yn__15;
% Hz_5 = Hz_xp__15 + Hz_xn__15 + Hz__yp__15 + Hz__yn__15;

%}

%.

% --------------------------------------------------------------Coil_6

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_16 = y1_15 - k;
y2_16 = y2_15 + k;
% a_xp__16 = 6 * g;          %Distance of coil from (0,0)
coil_length_y__6 = y2_16 - y1_16;



a_xn__16 = -6 * g;
k_yn__16 = 1./(4*pi*((a_xn__16-X).^2+Z.^2));
k_1yn__16 = (y2_16-y)./((y2_16-y).^2+(a_xn__16-X).^2+Z.^2).^0.5;
k_2yn__16 = (y1_16-y)./((y1_16-y).^2+(a_xn__16-X).^2+Z.^2).^0.5;

Hx__yn__16 = (Z.*k_yn__16.*(k_1yn__16 - k_2yn__16))*I;
Hy__yn__16 = zeros(size(y,1), size(Z,1));
Hz__yn__16 = ((a_xn__16-X).*k_yn__16.*(k_1yn__16 - k_2yn__16))*I;
%Adding field of Coil_6
% Hx__6 = Hx__xp__16 + Hx__xn__16 + Hx__yp__16 + Hx__yn__16;
% Hy__6 = Hy__xp__16 + Hy__xn__16 + Hy__yp__16 + Hy__yn__16;
% Hz_6 = Hz_xp__16 + Hz_xn__16 + Hz__yp__16 + Hz__yn__16;

%}

%.

% --------------------------------------------------------------Coil_7

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_17 = y1_16 - k;
y2_17 = y2_16 + k;
% a_xp__17 = 7 * g;          %Distance of coil from (0,0)
coil_length_y__7 = y2_17 - y1_17;



a_xn__17 = -7 * g;
k_yn__17 = 1./(4*pi*((a_xn__17-X).^2+Z.^2));
k_1yn__17 = (y2_17-y)./((y2_17-y).^2+(a_xn__17-X).^2+Z.^2).^0.5;
k_2yn__17 = (y1_17-y)./((y1_17-y).^2+(a_xn__17-X).^2+Z.^2).^0.5;

Hx__yn__17 = (Z.*k_yn__17.*(k_1yn__17 - k_2yn__17))*I;
Hy__yn__17 = zeros(size(y,1), size(Z,1));
Hz__yn__17 = ((a_xn__17-X).*k_yn__17.*(k_1yn__17 - k_2yn__17))*I;
%Adding field of Coil_7
% Hx__7 = Hx__xp__17 + Hx__xn__17 + Hx__yp__17 + Hx__yn__17;
% Hy__7 = Hy__xp__17 + Hy__xn__17 + Hy__yp__17 + Hy__yn__17;
% Hz_7 = Hz_xp__17 + Hz_xn__17 + Hz__yp__17 + Hz__yn__17;

%}

%.

% --------------------------------------------------------------Coil_8

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_18 = y1_17 - k;
y2_18 = y2_17 + k;
% a_xp__18 = 8 * g;          %Distance of coil from (0,0)
coil_length_y__8 = y2_18 - y1_18;



a_xn__18 = -8 * g;
k_yn__18 = 1./(4*pi*((a_xn__18-X).^2+Z.^2));
k_1yn__18 = (y2_18-y)./((y2_18-y).^2+(a_xn__18-X).^2+Z.^2).^0.5;
k_2yn__18 = (y1_18-y)./((y1_18-y).^2+(a_xn__18-X).^2+Z.^2).^0.5;

Hx__yn__18 = (Z.*k_yn__18.*(k_1yn__18 - k_2yn__18))*I;
Hy__yn__18 = zeros(size(y,1), size(Z,1));
Hz__yn__18 = ((a_xn__18-X).*k_yn__18.*(k_1yn__18 - k_2yn__18))*I;
%Adding field of Coil_8
% Hx__8 = Hx__xp__18 + Hx__xn__18 + Hx__yp__18 + Hx__yn__18;
% Hy__8 = Hy__xp__18 + Hy__xn__18 + Hy__yp__18 + Hy__yn__18;
% Hz_8 = Hz_xp__18 + Hz_xn__18 + Hz__yp__18 + Hz__yn__18;

%}

%.

% --------------------------------------------------------------Coil_9

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_19 = y1_18 - k;
y2_19 = y2_18 + k;
% a_xp__19 = 9 * g;          %Distance of coil from (0,0)
coil_length_y__9 = y2_19 - y1_19;



a_xn__19 = -9 * g;
k_yn__19 = 1./(4*pi*((a_xn__19-X).^2+Z.^2));
k_1yn__19 = (y2_19-y)./((y2_19-y).^2+(a_xn__19-X).^2+Z.^2).^0.5;
k_2yn__19 = (y1_19-y)./((y1_19-y).^2+(a_xn__19-X).^2+Z.^2).^0.5;

Hx__yn__19 = (Z.*k_yn__19.*(k_1yn__19 - k_2yn__19))*I;
Hy__yn__19 = zeros(size(y,1), size(Z,1));
Hz__yn__19 = ((a_xn__19-X).*k_yn__19.*(k_1yn__19 - k_2yn__19))*I;
%Adding field of Coil_9
% Hx__9 = Hx__xp__19 + Hx__xn__19 + Hx__yp__19 + Hx__yn__19;
% Hy__9 = Hy__xp__19 + Hy__xn__19 + Hy__yp__19 + Hy__yn__19;
% Hz_9 = Hz_xp__19 + Hz_xn__19 + Hz__yp__19 + Hz__yn__19;

%}

%.

% --------------------------------------------------------------Coil_10

% --------------------------------------------------------------
%.
%  Line along y - axis
y1_110 = y1_19 - k;
y2_110 = y2_19 + k;
% a_xp__110 = 10 * g;          %Distance of coil from (0,0)
coil_length_y__10 = y2_110 - y1_110;


a_xn__110 = -10 * g;
k_yn__110 = 1./(4*pi*((a_xn__110-X).^2+Z.^2));
k_1yn__110 = (y2_110-y)./((y2_110-y).^2+(a_xn__110-X).^2+Z.^2).^0.5;
k_2yn__110 = (y1_110-y)./((y1_110-y).^2+(a_xn__110-X).^2+Z.^2).^0.5;

Hx__yn__110 = (Z.*k_yn__110.*(k_1yn__110 - k_2yn__110))*I;
Hy__yn__110 = zeros(size(y,1), size(Z,1));
Hz__yn__110 = ((a_xn__110-X).*k_yn__110.*(k_1yn__110 - k_2yn__110))*I;
%Adding field of Coil_10
% Hx__10 = Hx__xp__110 + Hx__xn__110 + Hx__yp__110 + Hx__yn__110;
% Hy__10 = Hy__xp__110 + Hy__xn__110 + Hy__yp__110 + Hy__yn__110;
% Hz_10 = Hz_xp__110 + Hz_xn__110 + Hz__yp__110 + Hz__yn__110;

%}
Hx__ = Hx__yn__11 + Hx__yn__12 +Hx__yn__13 +Hx__yn__14 +Hx__yn__15 +Hx__yn__16 +Hx__yn__17 +Hx__yn__18 +Hx__yn__19 +Hx__yn__110; 
Hz__ = Hz__yn__11 + Hz__yn__12 +Hz__yn__13 +Hz__yn__14 +Hz__yn__15 +Hz__yn__16 +Hz__yn__17 +Hz__yn__18 +Hz__yn__19 +Hz__yn__110; 



% ----Adding all coil fields----
Hx_1 = Hx_yp_1 + Hx_yp_2 + Hx_yp_3 + Hx_yp_4 + Hx_yp_5 + Hx_yp_6 + Hx_yp_7 + Hx_yp_8 + Hx_yp_9 + Hx_yp_10 ;
% Hy = Hy_xp_1 + Hy_xp_2 + Hy_xp_3 + Hy_xp_4 + Hy_xp_5 +  Hy_xp_6 + Hy_xp_7 +  Hy_xp_8 +  Hy_xp_9 +  Hy_xp_10 ;
Hz_1 = Hz_yp_1 + Hz_yp_2 + Hz_yp_3 + Hz_yp_4 + Hz_yp_5 + Hz_yp_6 + Hz_yp_7 + Hz_yp_8 + Hz_yp_9 + Hz_yp_10 ;

Hx = Hx__ + Hx_1;
Hz = Hz__ + Hz_1;

% Bx = (Hx)*m0;
By = (Hx)*m0;
Bz = (Hz)*m0;

% -------Plotting the fields--------

[df_y,df_z] = gradient(By,500e-6); %[dBx/dx, dBx/dz]
[df_yz,df_zz] = gradient(Bz,500e-6); %[dBz/dx, dBz/dz]

F_y = By .* df_y + Bz .* df_z;
F_z = By .* df_yz + Bz .* df_zz;

q = 29;
Z(q,:)
figure
plot(c,F_y(q,:), '--b') 
hold on
% axis([-2e-3 2e-3 -4e-4 14e-4])
plot(c,F_z(q,:), 'r') 
line([c(1) c(end)],[Force_cy Force_cy],'linewidth',3,'color','r')
line([a_xn__110 a_xp_10],[0 0],'linewidth',3,'color','b');
% line([x1_10 x2_10],[a_yn_10 a_yn_10],'linewidth',3,'color','r');
legend('F_x', 'F_z', 'Frictional Force', 'Max Coil distance')
xlabel("Distance from Center of wire(m)")
ylabel("Force generated by Field along X - axis (N)")
title("Variation in Force generated by Field along X - axis")
hold off