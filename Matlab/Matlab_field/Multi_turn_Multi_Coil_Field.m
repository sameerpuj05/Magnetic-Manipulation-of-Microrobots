clear;
clc;
% Analysing field along a single wire...
% Constants 
I = 50;       %Current flowing in the wire
g = 200e-6;     %Coil spacing
m0 = 4*pi*10e-7;
b = -7200e-6:500e-6:7200e-6;
[X,Y,Z] = meshgrid(b);

% c = -600e-6:100e-6:600e-6; - For 2 coils 
% c = -600e-6:100e-6:600e-6; - For 3 coils 
% c = -800e-6:150e-6:800e-6; - For 4 coils
% c = -1000e-6:250e-6:1000e-6; - For 5 coils
% c = -1200e-6:200e-6:1200e-6; or -1400e-6:140e-6:1400e-6 or -1400e-6:280e-6:1400e-6 For 6 coils
% c = -1400e-6:200e-6:1400e-6; or c = -1600e-6:320e-6:1600e-6; For 7 coils
% c = -1600e-6:320e-6:1600e-6; or -1800e-6:360e-6:1800e-6; For 8 coils
% c = -2000e-6:500e-6:2000e-6; For 9 coils
% c = -2000e-6:500e-6:2000e-6; or -2400e-6:500e-6:2400e-6;For 10 coils

%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 2nd 10 turn coil field data
%-%--------%--------%--------%--------%--------%--------%--------%--------


% Line along X - axis
% --------------------------------------------------------------Coil_1
x1_1_2 = -g + 22 * g;
x2_1_2 = g + 22 * g;
a_yp_1_2 = g ;          %Distance of coil from (0,0)
coil_length_x_1_2 = x2_1_2 - x1_1_2;
k_p_1_2 = 1/(4*pi*((a_yp_1_2-Y).^2+Z.^2));
k_1xp_1_2 = (x2_1_2-X)./((x2_1_2-X).^2+(a_yp_1_2-Y).^2+Z.^2).^0.5;
k_2xp_1_2 = (x1_1_2-X)./((x1_1_2-X).^2+(a_yp_1_2-Y).^2+Z.^2).^0.5;

Hx_xp_1_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_1_2 = (-Z.*k_p_1_2.*(k_1xp_1_2 - k_2xp_1_2))*I;
Hz_xp_1_2 = (-(a_yp_1_2-Y).*k_p_1_2.*(k_1xp_1_2 - k_2xp_1_2))*I;

a_yn_1_2 = -g;
k_n_1_2 = 1/(4*pi*((a_yn_1_2-Y).^2+Z.^2));
k_1xn_1_2 = (x2_1_2-X)./((x2_1_2-X).^2+(a_yn_1_2-Y).^2+Z.^2).^0.5;
k_2xn_1_2 = (x1_1_2-X)./((x1_1_2-X).^2+(a_yn_1_2-Y).^2+Z.^2).^0.5;

Hx_xn_1_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_1_2 = (Z.*k_n_1_2.*(k_1xn_1_2 - k_2xn_1_2))*I;
Hz_xn_1_2 = ((a_yn_1_2-Y).*k_n_1_2.*(k_1xn_1_2 - k_2xn_1_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_1_2 = -g;
y2_1_2 = g;
a_xp_1_2 = g + 22 * g;          %Distance of coil from (0,0)
coil_length_y_1_2 = y2_1_2 - y1_1_2;

k_yp_1_2 = 1/(4*pi*((a_xp_1_2-X).^2+Z.^2));
k_1yp_1_2 = (y2_1_2-Y)./((y2_1_2-Y).^2+(a_xp_1_2-X).^2+Z.^2).^0.5;
k_2yp_1_2 = (y1_1_2-Y)./((y1_1_2-Y).^2+(a_xp_1_2-X).^2+Z.^2).^0.5;

Hx_yp_1_2 = -(Z.*k_yp_1_2.*(k_1yp_1_2 - k_2yp_1_2))*I;
Hy_yp_1_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_1_2 = (-(a_xp_1_2-X).*k_yp_1_2.*(k_1yp_1_2 - k_2yp_1_2))*I;

a_xn_1_2 = -g + 22 * g;
k_yn_1_2 = 1/(4*pi*((a_xn_1_2-X).^2+Z.^2));
k_1yn_1_2 = (y2_1_2-Y)./((y2_1_2-Y).^2+(a_xn_1_2-X).^2+Z.^2).^0.5;
k_2yn_1_2 = (y1_1_2-Y)./((y1_1_2-Y).^2+(a_xn_1_2-X).^2+Z.^2).^0.5;

Hx_yn_1_2 = (Z.*k_yn_1_2.*(k_1yn_1_2 - k_2yn_1_2))*I;
Hy_yn_1_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_1_2 = ((a_xn_1_2-X).*k_yn_1_2.*(k_1yn_1_2 - k_2yn_1_2))*I;


% Adding field of the coil
Hx_1_2 = Hx_xp_1_2 + Hx_xn_1_2 + Hx_yp_1_2 + Hx_yn_1_2;
Hy_1_2 = Hy_xp_1_2 + Hy_xn_1_2 + Hy_yp_1_2 + Hy_yn_1_2;
Hz_1_2 = Hz_xp_1_2 + Hz_xn_1_2 + Hz_yp_1_2 + Hz_yn_1_2;



% --------------------------------------------------------------Coil_2
x1_2_2 = -2 * g + 22 * g;
x2_2_2 = 2 * g + 22 * g;
a_yp_2_2 = 2 * g;          %Distance of coil from (0,0)
coil_length_x_2_2 = x2_2_2 - x1_2_2;
k_p_2_2 = 1/(4*pi*((a_yp_2_2-Y).^2+Z.^2));
k_1xp_2_2 = (x2_2_2-X)./((x2_2_2-X).^2+(a_yp_2_2-Y).^2+Z.^2).^0.5;
k_2xp_2_2 = (x1_2_2-X)./((x1_2_2-X).^2+(a_yp_2_2-Y).^2+Z.^2).^0.5;

Hx_xp_2_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_2_2 = (-Z.*k_p_2_2.*(k_1xp_2_2 - k_2xp_2_2))*I;
Hz_xp_2_2 = (-(a_yp_2_2-Y).*k_p_2_2.*(k_1xp_2_2 - k_2xp_2_2))*I;

a_yn_2_2 = -2 * g;
k_n_2_2 = 1/(4*pi*((a_yn_2_2-Y).^2+Z.^2));
k_1xn_2_2 = (x2_2_2-X)./((x2_2_2-X).^2+(a_yn_2_2-Y).^2+Z.^2).^0.5;
k_2xn_2_2 = (x1_2_2-X)./((x1_2_2-X).^2+(a_yn_2_2-Y).^2+Z.^2).^0.5;

Hx_xn_2_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_2_2 = (Z.*k_n_2_2.*(k_1xn_2_2 - k_2xn_2_2))*I;
Hz_xn_2_2 = ((a_yn_2_2-Y).*k_n_2_2.*(k_1xn_2_2 - k_2xn_2_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_2_2 = -2 * g;
y2_2_2 = 2 * g;
a_xp_2_2 = 2 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_y_2_2 = y2_2_2 - y1_2_2;

k_yp_2_2 = 1/(4*pi*((a_xp_2_2-X).^2+Z.^2));
k_1yp_2_2 = (y2_2_2-Y)./((y2_2_2-Y).^2+(a_xp_2_2-X).^2+Z.^2).^0.5;
k_2yp_2_2 = (y1_2_2-Y)./((y1_2_2-Y).^2+(a_xp_2_2-X).^2+Z.^2).^0.5;

Hx_yp_2_2 = -(Z.*k_yp_2_2.*(k_1yp_2_2 - k_2yp_2_2))*I;
Hy_yp_2_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_2_2 = (-(a_xp_2_2-X).*k_yp_2_2.*(k_1yp_2_2 - k_2yp_2_2))*I;

a_xn_2_2 = -2 * g + 22 * g;
k_yn_2_2 = 1/(4*pi*((a_xn_2_2-X).^2+Z.^2));
k_1yn_2_2 = (y2_2_2-Y)./((y2_2_2-Y).^2+(a_xn_2_2-X).^2+Z.^2).^0.5;
k_2yn_2_2 = (y1_2_2-Y)./((y1_2_2-Y).^2+(a_xn_2_2-X).^2+Z.^2).^0.5;

Hx_yn_2_2 = (Z.*k_yn_2_2.*(k_1yn_2_2 - k_2yn_2_2))*I;
Hy_yn_2_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_2_2 = ((a_xn_2_2-X).*k_yn_2_2.*(k_1yn_2_2 - k_2yn_2_2))*I;
%Adding field of Coil_2
Hx_2_2 = Hx_xp_2_2 + Hx_xn_2_2 + Hx_yp_2_2 + Hx_yn_2_2;
Hy_2_2 = Hy_xp_2_2 + Hy_xn_2_2 + Hy_yp_2_2 + Hy_yn_2_2;
Hz_2_2 = Hz_xp_2_2 + Hz_xn_2_2 + Hz_yp_2_2 + Hz_yn_2_2;


% Line along X - axis
% --------------------------------------------------------------Coil_3
x1_3_2 = -3 * g + 22 * g;
x2_3_2 = 3 * g + 22 * g;
a_yp_3_2 = 3 * g;          %Distance of coil from (0,0)
coil_length_x_3_2 = x2_3_2 - x1_3_2;
k_p_3_2 = 1/(4*pi*((a_yp_3_2-Y).^2+Z.^2));
k_1xp_3_2 = (x2_3_2-X)./((x2_3_2-X).^2+(a_yp_3_2-Y).^2+Z.^2).^0.5;
k_2xp_3_2 = (x1_3_2-X)./((x1_3_2-X).^2+(a_yp_3_2-Y).^2+Z.^2).^0.5;

Hx_xp_3_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_3_2 = (-Z.*k_p_3_2.*(k_1xp_3_2 - k_2xp_3_2))*I;
Hz_xp_3_2 = (-(a_yp_3_2-Y).*k_p_3_2.*(k_1xp_3_2 - k_2xp_3_2))*I;

a_yn_3_2 = -3 * g;
k_n_3_2 = 1/(4*pi*((a_yn_3_2-Y).^2+Z.^2));
k_1xn_3_2 = (x2_3_2-X)./((x2_3_2-X).^2+(a_yn_3_2-Y).^2+Z.^2).^0.5;
k_2xn_3_2 = (x1_3_2-X)./((x1_3_2-X).^2+(a_yn_3_2-Y).^2+Z.^2).^0.5;

Hx_xn_3_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_3_2 = (Z.*k_n_3_2.*(k_1xn_3_2 - k_2xn_3_2))*I;
Hz_xn_3_2 = ((a_yn_3_2-Y).*k_n_3_2.*(k_1xn_3_2 - k_2xn_3_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_3_2 = -3 * g;
y2_3_2 = 3 * g;
a_xp_3_2 = 3 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_y_3_2 = y2_3_2 - y1_3_2;

k_yp_3_2 = 1/(4*pi*((a_xp_3_2-X).^2+Z.^2));
k_1yp_3_2 = (y2_3_2-Y)./((y2_3_2-Y).^2+(a_xp_3_2-X).^2+Z.^2).^0.5;
k_2yp_3_2 = (y1_3_2-Y)./((y1_3_2-Y).^2+(a_xp_3_2-X).^2+Z.^2).^0.5;

Hx_yp_3_2 = -(Z.*k_yp_3_2.*(k_1yp_3_2 - k_2yp_3_2))*I;
Hy_yp_3_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_3_2 = (-(a_xp_3_2-X).*k_yp_3_2.*(k_1yp_3_2 - k_2yp_3_2))*I;

a_xn_3_2 = -3 * g + 22 * g;
k_yn_3_2 = 1/(4*pi*((a_xn_3_2-X).^2+Z.^2));
k_1yn_3_2 = (y2_3_2-Y)./((y2_3_2-Y).^2+(a_xn_3_2-X).^2+Z.^2).^0.5;
k_2yn_3_2 = (y1_3_2-Y)./((y1_3_2-Y).^2+(a_xn_3_2-X).^2+Z.^2).^0.5;

Hx_yn_3_2 = (Z.*k_yn_3_2.*(k_1yn_3_2 - k_2yn_3_2))*I;
Hy_yn_3_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_3_2 = ((a_xn_3_2-X).*k_yn_3_2.*(k_1yn_3_2 - k_2yn_3_2))*I;
%Adding field of Coil_3
Hx_3_2 = Hx_xp_3_2 + Hx_xn_3_2 + Hx_yp_3_2 + Hx_yn_3_2;
Hy_3_2 = Hy_xp_3_2 + Hy_xn_3_2 + Hy_yp_3_2 + Hy_yn_3_2;
Hz_3_2 = Hz_xp_3_2 + Hz_xn_3_2 + Hz_yp_3_2 + Hz_yn_3_2;


% Line along X - axis
% --------------------------------------------------------------Coil_4
x1_4_2 = -4 * g + 22 * g;
x2_4_2 = 4 * g + 22 * g;
a_yp_4_2 = 4 * g;          %Distance of coil from (0,0)
coil_length_x_4_2 = x2_4_2 - x1_4_2;
k_p_4_2 = 1/(4*pi*((a_yp_4_2-Y).^2+Z.^2));
k_1xp_4_2 = (x2_4_2-X)./((x2_4_2-X).^2+(a_yp_4_2-Y).^2+Z.^2).^0.5;
k_2xp_4_2 = (x1_4_2-X)./((x1_4_2-X).^2+(a_yp_4_2-Y).^2+Z.^2).^0.5;

Hx_xp_4_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_4_2 = (-Z.*k_p_4_2.*(k_1xp_4_2 - k_2xp_4_2))*I;
Hz_xp_4_2 = (-(a_yp_4_2-Y).*k_p_4_2.*(k_1xp_4_2 - k_2xp_4_2))*I;

a_yn_4_2 = -4 * g;
k_n_4_2 = 1/(4*pi*((a_yn_4_2-Y).^2+Z.^2));
k_1xn_4_2 = (x2_4_2-X)./((x2_4_2-X).^2+(a_yn_4_2-Y).^2+Z.^2).^0.5;
k_2xn_4_2 = (x1_4_2-X)./((x1_4_2-X).^2+(a_yn_4_2-Y).^2+Z.^2).^0.5;

Hx_xn_4_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_4_2 = (Z.*k_n_4_2.*(k_1xn_4_2 - k_2xn_4_2))*I;
Hz_xn_4_2 = ((a_yn_4_2-Y).*k_n_4_2.*(k_1xn_4_2 - k_2xn_4_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_4_2 = -4 * g;
y2_4_2 = 4 * g;
a_xp_4_2 = 4 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_y_4_2 = y2_4_2 - y1_4_2;

k_yp_4_2 = 1/(4*pi*((a_xp_4_2-X).^2+Z.^2));
k_1yp_4_2 = (y2_4_2-Y)./((y2_4_2-Y).^2+(a_xp_4_2-X).^2+Z.^2).^0.5;
k_2yp_4_2 = (y1_4_2-Y)./((y1_4_2-Y).^2+(a_xp_4_2-X).^2+Z.^2).^0.5;

Hx_yp_4_2 = -(Z.*k_yp_4_2.*(k_1yp_4_2 - k_2yp_4_2))*I;
Hy_yp_4_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_4_2 = (-(a_xp_4_2-X).*k_yp_4_2.*(k_1yp_4_2 - k_2yp_4_2))*I;

a_xn_4_2 = -4 * g + 22 * g;
k_yn_4_2 = 1/(4*pi*((a_xn_4_2-X).^2+Z.^2));
k_1yn_4_2 = (y2_4_2-Y)./((y2_4_2-Y).^2+(a_xn_4_2-X).^2+Z.^2).^0.5;
k_2yn_4_2 = (y1_4_2-Y)./((y1_4_2-Y).^2+(a_xn_4_2-X).^2+Z.^2).^0.5;

Hx_yn_4_2 = (Z.*k_yn_4_2.*(k_1yn_4_2 - k_2yn_4_2))*I;
Hy_yn_4_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_4_2 = ((a_xn_4_2-X).*k_yn_4_2.*(k_1yn_4_2 - k_2yn_4_2))*I;
%Adding field of Coil_4
Hx_4_2 = Hx_xp_4_2 + Hx_xn_4_2 + Hx_yp_4_2 + Hx_yn_4_2;
Hy_4_2 = Hy_xp_4_2 + Hy_xn_4_2 + Hy_yp_4_2 + Hy_yn_4_2;
Hz_4_2 = Hz_xp_4_2 + Hz_xn_4_2 + Hz_yp_4_2 + Hz_yn_4_2;


% Line along X - axis
% --------------------------------------------------------------Coil_5
x1_5_2 = -5 * g + 22 * g;
x2_5_2 = 5 * g + 22 * g;
a_yp_5_2 = 5 * g;          %Distance of coil from (0,0)
coil_length_x_5_2 = x2_5_2 - x1_5_2;
k_p_5_2 = 1/(4*pi*((a_yp_5_2-Y).^2+Z.^2));
k_1xp_5_2 = (x2_5_2-X)./((x2_5_2-X).^2+(a_yp_5_2-Y).^2+Z.^2).^0.5;
k_2xp_5_2 = (x1_5_2-X)./((x1_5_2-X).^2+(a_yp_5_2-Y).^2+Z.^2).^0.5;

Hx_xp_5_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_5_2 = (-Z.*k_p_5_2.*(k_1xp_5_2 - k_2xp_5_2))*I;
Hz_xp_5_2 = (-(a_yp_5_2-Y).*k_p_5_2.*(k_1xp_5_2 - k_2xp_5_2))*I;

a_yn_5_2 = -5 * g;
k_n_5_2 = 1/(4*pi*((a_yn_5_2-Y).^2+Z.^2));
k_1xn_5_2 = (x2_5_2-X)./((x2_5_2-X).^2+(a_yn_5_2-Y).^2+Z.^2).^0.5;
k_2xn_5_2 = (x1_5_2-X)./((x1_5_2-X).^2+(a_yn_5_2-Y).^2+Z.^2).^0.5;

Hx_xn_5_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_5_2 = (Z.*k_n_5_2.*(k_1xn_5_2 - k_2xn_5_2))*I;
Hz_xn_5_2 = ((a_yn_5_2-Y).*k_n_5_2.*(k_1xn_5_2 - k_2xn_5_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_5_2 = -5 * g;
y2_5_2 = 5 * g;
a_xp_5_2 = 5 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_y_5_2 = y2_5_2 - y1_5_2;

k_yp_5_2 = 1/(4*pi*((a_xp_5_2-X).^2+Z.^2));
k_1yp_5_2 = (y2_5_2-Y)./((y2_5_2-Y).^2+(a_xp_5_2-X).^2+Z.^2).^0.5;
k_2yp_5_2 = (y1_5_2-Y)./((y1_5_2-Y).^2+(a_xp_5_2-X).^2+Z.^2).^0.5;

Hx_yp_5_2 = -(Z.*k_yp_5_2.*(k_1yp_5_2 - k_2yp_5_2))*I;
Hy_yp_5_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_5_2 = (-(a_xp_5_2-X).*k_yp_5_2.*(k_1yp_5_2 - k_2yp_5_2))*I;

a_xn_5_2 = -5 * g + 22 * g;
k_yn_5_2 = 1/(4*pi*((a_xn_5_2-X).^2+Z.^2));
k_1yn_5_2 = (y2_5_2-Y)./((y2_5_2-Y).^2+(a_xn_5_2-X).^2+Z.^2).^0.5;
k_2yn_5_2 = (y1_5_2-Y)./((y1_5_2-Y).^2+(a_xn_5_2-X).^2+Z.^2).^0.5;

Hx_yn_5_2 = (Z.*k_yn_5_2.*(k_1yn_5_2 - k_2yn_5_2))*I;
Hy_yn_5_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_5_2 = ((a_xn_5_2-X).*k_yn_5_2.*(k_1yn_5_2 - k_2yn_5_2))*I;
%Adding field of Coil_5
Hx_5_2 = Hx_xp_5_2 + Hx_xn_5_2 + Hx_yp_5_2 + Hx_yn_5_2;
Hy_5_2 = Hy_xp_5_2 + Hy_xn_5_2 + Hy_yp_5_2 + Hy_yn_5_2;
Hz_5_2 = Hz_xp_5_2 + Hz_xn_5_2 + Hz_yp_5_2 + Hz_yn_5_2;


% Line along X - axis
% --------------------------------------------------------------Coil_6
x1_6_2 = -6 * g + 22 * g;
x2_6_2 = 6 * g + 22 * g;
a_yp_6_2 = 6 * g;          %Distance of coil from (0,0)
coil_length_x_6_2 = x2_6_2 - x1_6_2;
k_p_6_2 = 1/(4*pi*((a_yp_6_2-Y).^2+Z.^2));
k_1xp_6_2 = (x2_6_2-X)./((x2_6_2-X).^2+(a_yp_6_2-Y).^2+Z.^2).^0.5;
k_2xp_6_2 = (x1_6_2-X)./((x1_6_2-X).^2+(a_yp_6_2-Y).^2+Z.^2).^0.5;

Hx_xp_6_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_6_2 = (-Z.*k_p_6_2.*(k_1xp_6_2 - k_2xp_6_2))*I;
Hz_xp_6_2 = (-(a_yp_6_2-Y).*k_p_6_2.*(k_1xp_6_2 - k_2xp_6_2))*I;

a_yn_6_2 = -6 * g;
k_n_6_2 = 1/(4*pi*((a_yn_6_2-Y).^2+Z.^2));
k_1xn_6_2 = (x2_6_2-X)./((x2_6_2-X).^2+(a_yn_6_2-Y).^2+Z.^2).^0.5;
k_2xn_6_2 = (x1_6_2-X)./((x1_6_2-X).^2+(a_yn_6_2-Y).^2+Z.^2).^0.5;

Hx_xn_6_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_6_2 = (Z.*k_n_6_2.*(k_1xn_6_2 - k_2xn_6_2))*I;
Hz_xn_6_2 = ((a_yn_6_2-Y).*k_n_6_2.*(k_1xn_6_2 - k_2xn_6_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_6_2 = -6 * g;
y2_6_2 = 6 * g;
a_xp_6_2 = 6 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_y_6_2 = y2_6_2 - y1_6_2;

k_yp_6_2 = 1/(4*pi*((a_xp_6_2-X).^2+Z.^2));
k_1yp_6_2 = (y2_6_2-Y)./((y2_6_2-Y).^2+(a_xp_6_2-X).^2+Z.^2).^0.5;
k_2yp_6_2 = (y1_6_2-Y)./((y1_6_2-Y).^2+(a_xp_6_2-X).^2+Z.^2).^0.5;

Hx_yp_6_2 = -(Z.*k_yp_6_2.*(k_1yp_6_2 - k_2yp_6_2))*I;
Hy_yp_6_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_6_2 = (-(a_xp_6_2-X).*k_yp_6_2.*(k_1yp_6_2 - k_2yp_6_2))*I;

a_xn_6_2 = -6 * g + 22 * g;
k_yn_6_2 = 1/(4*pi*((a_xn_6_2-X).^2+Z.^2));
k_1yn_6_2 = (y2_6_2-Y)./((y2_6_2-Y).^2+(a_xn_6_2-X).^2+Z.^2).^0.5;
k_2yn_6_2 = (y1_6_2-Y)./((y1_6_2-Y).^2+(a_xn_6_2-X).^2+Z.^2).^0.5;

Hx_yn_6_2 = (Z.*k_yn_6_2.*(k_1yn_6_2 - k_2yn_6_2))*I;
Hy_yn_6_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_6_2 = ((a_xn_6_2-X).*k_yn_6_2.*(k_1yn_6_2 - k_2yn_6_2))*I;
%Adding field of Coil_6
Hx_6_2 = Hx_xp_6_2 + Hx_xn_6_2 + Hx_yp_6_2 + Hx_yn_6_2;
Hy_6_2 = Hy_xp_6_2 + Hy_xn_6_2 + Hy_yp_6_2 + Hy_yn_6_2;
Hz_6_2 = Hz_xp_6_2 + Hz_xn_6_2 + Hz_yp_6_2 + Hz_yn_6_2;


% Line along X - axis
% --------------------------------------------------------------Coil_7
x1_7_2 = -7 * g + 22 * g;
x2_7_2 = 7 * g + 22 * g;
a_yp_7_2 = 7 * g;          %Distance of coil from (0,0)
coil_length_x_7_2 = x2_7_2 - x1_7_2;
k_p_7_2 = 1/(4*pi*((a_yp_7_2-Y).^2+Z.^2));
k_1xp_7_2 = (x2_7_2-X)./((x2_7_2-X).^2+(a_yp_7_2-Y).^2+Z.^2).^0.5;
k_2xp_7_2 = (x1_7_2-X)./((x1_7_2-X).^2+(a_yp_7_2-Y).^2+Z.^2).^0.5;

Hx_xp_7_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_7_2 = (-Z.*k_p_7_2.*(k_1xp_7_2 - k_2xp_7_2))*I;
Hz_xp_7_2 = (-(a_yp_7_2-Y).*k_p_7_2.*(k_1xp_7_2 - k_2xp_7_2))*I;

a_yn_7_2 = -7 * g;
k_n_7_2 = 1/(4*pi*((a_yn_7_2-Y).^2+Z.^2));
k_1xn_7_2 = (x2_7_2-X)./((x2_7_2-X).^2+(a_yn_7_2-Y).^2+Z.^2).^0.5;
k_2xn_7_2 = (x1_7_2-X)./((x1_7_2-X).^2+(a_yn_7_2-Y).^2+Z.^2).^0.5;

Hx_xn_7_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_7_2 = (Z.*k_n_7_2.*(k_1xn_7_2 - k_2xn_7_2))*I;
Hz_xn_7_2 = ((a_yn_7_2-Y).*k_n_7_2.*(k_1xn_7_2 - k_2xn_7_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_7_2 = -7 * g;
y2_7_2 = 7 * g;
a_xp_7_2 = 7 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_y_7_2 = y2_7_2 - y1_7_2;

k_yp_7_2 = 1/(4*pi*((a_xp_7_2-X).^2+Z.^2));
k_1yp_7_2 = (y2_7_2-Y)./((y2_7_2-Y).^2+(a_xp_7_2-X).^2+Z.^2).^0.5;
k_2yp_7_2 = (y1_7_2-Y)./((y1_7_2-Y).^2+(a_xp_7_2-X).^2+Z.^2).^0.5;

Hx_yp_7_2 = -(Z.*k_yp_7_2.*(k_1yp_7_2 - k_2yp_7_2))*I;
Hy_yp_7_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_7_2 = (-(a_xp_7_2-X).*k_yp_7_2.*(k_1yp_7_2 - k_2yp_7_2))*I;

a_xn_7_2 = -7 * g + 22 * g;
k_yn_7_2 = 1/(4*pi*((a_xn_7_2-X).^2+Z.^2));
k_1yn_7_2 = (y2_7_2-Y)./((y2_7_2-Y).^2+(a_xn_7_2-X).^2+Z.^2).^0.5;
k_2yn_7_2 = (y1_7_2-Y)./((y1_7_2-Y).^2+(a_xn_7_2-X).^2+Z.^2).^0.5;

Hx_yn_7_2 = (Z.*k_yn_7_2.*(k_1yn_7_2 - k_2yn_7_2))*I;
Hy_yn_7_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_7_2 = ((a_xn_7_2-X).*k_yn_7_2.*(k_1yn_7_2 - k_2yn_7_2))*I;
%Adding field of Coil_7
Hx_7_2 = Hx_xp_7_2 + Hx_xn_7_2 + Hx_yp_7_2 + Hx_yn_7_2;
Hy_7_2 = Hy_xp_7_2 + Hy_xn_7_2 + Hy_yp_7_2 + Hy_yn_7_2;
Hz_7_2 = Hz_xp_7_2 + Hz_xn_7_2 + Hz_yp_7_2 + Hz_yn_7_2;


% Line along X - axis
% --------------------------------------------------------------Coil_8
x1_8_2 = -8 * g + 22 * g;
x2_8_2 = 8 * g + 22 * g;
a_yp_8_2 = 8 * g;          %Distance of coil from (0,0)
coil_length_x_8_2 = x2_8_2 - x1_8_2;
k_p_8_2 = 1/(4*pi*((a_yp_8_2-Y).^2+Z.^2));
k_1xp_8_2 = (x2_8_2-X)./((x2_8_2-X).^2+(a_yp_8_2-Y).^2+Z.^2).^0.5;
k_2xp_8_2 = (x1_8_2-X)./((x1_8_2-X).^2+(a_yp_8_2-Y).^2+Z.^2).^0.5;

Hx_xp_8_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_8_2 = (-Z.*k_p_8_2.*(k_1xp_8_2 - k_2xp_8_2))*I;
Hz_xp_8_2 = (-(a_yp_8_2-Y).*k_p_8_2.*(k_1xp_8_2 - k_2xp_8_2))*I;

a_yn_8_2 = -8 * g;
k_n_8_2 = 1/(4*pi*((a_yn_8_2-Y).^2+Z.^2));
k_1xn_8_2 = (x2_8_2-X)./((x2_8_2-X).^2+(a_yn_8_2-Y).^2+Z.^2).^0.5;
k_2xn_8_2 = (x1_8_2-X)./((x1_8_2-X).^2+(a_yn_8_2-Y).^2+Z.^2).^0.5;

Hx_xn_8_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_8_2 = (Z.*k_n_8_2.*(k_1xn_8_2 - k_2xn_8_2))*I;
Hz_xn_8_2 = ((a_yn_8_2-Y).*k_n_8_2.*(k_1xn_8_2 - k_2xn_8_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_8_2 = -8 * g;
y2_8_2 = 8 * g;
a_xp_8_2 = 8 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_y_8_2 = y2_8_2 - y1_8_2;

k_yp_8_2 = 1/(4*pi*((a_xp_8_2-X).^2+Z.^2));
k_1yp_8_2 = (y2_8_2-Y)./((y2_8_2-Y).^2+(a_xp_8_2-X).^2+Z.^2).^0.5;
k_2yp_8_2 = (y1_8_2-Y)./((y1_8_2-Y).^2+(a_xp_8_2-X).^2+Z.^2).^0.5;

Hx_yp_8_2 = -(Z.*k_yp_8_2.*(k_1yp_8_2 - k_2yp_8_2))*I;
Hy_yp_8_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_8_2 = (-(a_xp_8_2-X).*k_yp_8_2.*(k_1yp_8_2 - k_2yp_8_2))*I;

a_xn_8_2 = -8 * g + 22 * g;
k_yn_8_2 = 1/(4*pi*((a_xn_8_2-X).^2+Z.^2));
k_1yn_8_2 = (y2_8_2-Y)./((y2_8_2-Y).^2+(a_xn_8_2-X).^2+Z.^2).^0.5;
k_2yn_8_2 = (y1_8_2-Y)./((y1_8_2-Y).^2+(a_xn_8_2-X).^2+Z.^2).^0.5;

Hx_yn_8_2 = (Z.*k_yn_8_2.*(k_1yn_8_2 - k_2yn_8_2))*I;
Hy_yn_8_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_8_2 = ((a_xn_8_2-X).*k_yn_8_2.*(k_1yn_8_2 - k_2yn_8_2))*I;
%Adding field of Coil_8
Hx_8_2 = Hx_xp_8_2 + Hx_xn_8_2 + Hx_yp_8_2 + Hx_yn_8_2;
Hy_8_2 = Hy_xp_8_2 + Hy_xn_8_2 + Hy_yp_8_2 + Hy_yn_8_2;
Hz_8_2 = Hz_xp_8_2 + Hz_xn_8_2 + Hz_yp_8_2 + Hz_yn_8_2;



% Line along X - axis
% --------------------------------------------------------------Coil_9
x1_9_2 = -9 * g + 22 * g;
x2_9_2 = 9 * g + 22 * g;
a_yp_9_2 = 9 * g;          %Distance of coil from (0,0)
coil_length_x_9_2 = x2_9_2 - x1_9_2;
k_p_9_2 = 1/(4*pi*((a_yp_9_2-Y).^2+Z.^2));
k_1xp_9_2 = (x2_9_2-X)./((x2_9_2-X).^2+(a_yp_9_2-Y).^2+Z.^2).^0.5;
k_2xp_9_2 = (x1_9_2-X)./((x1_9_2-X).^2+(a_yp_9_2-Y).^2+Z.^2).^0.5;

Hx_xp_9_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_9_2 = (-Z.*k_p_9_2.*(k_1xp_9_2 - k_2xp_9_2))*I;
Hz_xp_9_2 = (-(a_yp_9_2-Y).*k_p_9_2.*(k_1xp_9_2 - k_2xp_9_2))*I;

a_yn_9_2 = -9 * g;
k_n_9_2 = 1/(4*pi*((a_yn_9_2-Y).^2+Z.^2));
k_1xn_9_2 = (x2_9_2-X)./((x2_9_2-X).^2+(a_yn_9_2-Y).^2+Z.^2).^0.5;
k_2xn_9_2 = (x1_9_2-X)./((x1_9_2-X).^2+(a_yn_9_2-Y).^2+Z.^2).^0.5;

Hx_xn_9_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_9_2 = (Z.*k_n_9_2.*(k_1xn_9_2 - k_2xn_9_2))*I;
Hz_xn_9_2 = ((a_yn_9_2-Y).*k_n_9_2.*(k_1xn_9_2 - k_2xn_9_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_9_2 = -9 * g;
y2_9_2 = 9 * g;
a_xp_9_2 = 9 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_y_9_2 = y2_9_2 - y1_9_2;

k_yp_9_2 = 1/(4*pi*((a_xp_9_2-X).^2+Z.^2));
k_1yp_9_2 = (y2_9_2-Y)./((y2_9_2-Y).^2+(a_xp_9_2-X).^2+Z.^2).^0.5;
k_2yp_9_2 = (y1_9_2-Y)./((y1_9_2-Y).^2+(a_xp_9_2-X).^2+Z.^2).^0.5;

Hx_yp_9_2 = -(Z.*k_yp_9_2.*(k_1yp_9_2 - k_2yp_9_2))*I;
Hy_yp_9_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_9_2 = (-(a_xp_9_2-X).*k_yp_9_2.*(k_1yp_9_2 - k_2yp_9_2))*I;

a_xn_9_2 = -9 * g + 22 * g;
k_yn_9_2 = 1/(4*pi*((a_xn_9_2-X).^2+Z.^2));
k_1yn_9_2 = (y2_9_2-Y)./((y2_9_2-Y).^2+(a_xn_9_2-X).^2+Z.^2).^0.5;
k_2yn_9_2 = (y1_9_2-Y)./((y1_9_2-Y).^2+(a_xn_9_2-X).^2+Z.^2).^0.5;

Hx_yn_9_2 = (Z.*k_yn_9_2.*(k_1yn_9_2 - k_2yn_9_2))*I;
Hy_yn_9_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_9_2 = ((a_xn_9_2-X).*k_yn_9_2.*(k_1yn_9_2 - k_2yn_9_2))*I;
%Adding field of Coil_9
Hx_9_2 = Hx_xp_9_2 + Hx_xn_9_2 + Hx_yp_9_2 + Hx_yn_9_2;
Hy_9_2 = Hy_xp_9_2 + Hy_xn_9_2 + Hy_yp_9_2 + Hy_yn_9_2;
Hz_9_2 = Hz_xp_9_2 + Hz_xn_9_2 + Hz_yp_9_2 + Hz_yn_9_2;


% Line along X - axis
% --------------------------------------------------------------Coil_10
x1__10_2 = -10 * g + 22 * g;
x2__10_2 = 10 * g + 22 * g;
a_yp__10_2 = 10 * g;          %Distance of coil from (0,0)
coil_length_x__10_2 = x2__10_2 - x1__10_2;
k_p__10_2 = 1/(4*pi*((a_yp__10_2-Y).^2+Z.^2));
k_1xp__10_2 = (x2__10_2-X)./((x2__10_2-X).^2+(a_yp__10_2-Y).^2+Z.^2).^0.5;
k_2xp__10_2 = (x1__10_2-X)./((x1__10_2-X).^2+(a_yp__10_2-Y).^2+Z.^2).^0.5;

Hx_xp__10_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp__10_2 = (-Z.*k_p__10_2.*(k_1xp__10_2 - k_2xp__10_2))*I;
Hz_xp__10_2 = (-(a_yp__10_2-Y).*k_p__10_2.*(k_1xp__10_2 - k_2xp__10_2))*I;

a_yn__10_2 = -10 * g;
k_n__10_2 = 1/(4*pi*((a_yn__10_2-Y).^2+Z.^2));
k_1xn__10_2 = (x2__10_2-X)./((x2__10_2-X).^2+(a_yn__10_2-Y).^2+Z.^2).^0.5;
k_2xn__10_2 = (x1__10_2-X)./((x1__10_2-X).^2+(a_yn__10_2-Y).^2+Z.^2).^0.5;

Hx_xn__10_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn__10_2 = (Z.*k_n__10_2.*(k_1xn__10_2 - k_2xn__10_2))*I;
Hz_xn__10_2 = ((a_yn__10_2-Y).*k_n__10_2.*(k_1xn__10_2 - k_2xn__10_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1__10_2 = -10 * g;
y2__10_2 = 10 * g;
a_xp__10_2 = 10 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_y__10_2 = y2__10_2 - y1__10_2;

k_yp__10_2 = 1/(4*pi*((a_xp__10_2-X).^2+Z.^2));
k_1yp__10_2 = (y2__10_2-Y)./((y2__10_2-Y).^2+(a_xp__10_2-X).^2+Z.^2).^0.5;
k_2yp__10_2 = (y1__10_2-Y)./((y1__10_2-Y).^2+(a_xp__10_2-X).^2+Z.^2).^0.5;

Hx_yp__10_2 = -(Z.*k_yp__10_2.*(k_1yp__10_2 - k_2yp__10_2))*I;
Hy_yp__10_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp__10_2 = (-(a_xp__10_2-X).*k_yp__10_2.*(k_1yp__10_2 - k_2yp__10_2))*I;

a_xn__10_2 = -10 * g + 22 * g;
k_yn__10_2 = 1/(4*pi*((a_xn__10_2-X).^2+Z.^2));
k_1yn__10_2 = (y2__10_2-Y)./((y2__10_2-Y).^2+(a_xn__10_2-X).^2+Z.^2).^0.5;
k_2yn__10_2 = (y1__10_2-Y)./((y1__10_2-Y).^2+(a_xn__10_2-X).^2+Z.^2).^0.5;

Hx_yn__10_2 = (Z.*k_yn__10_2.*(k_1yn__10_2 - k_2yn__10_2))*I;
Hy_yn__10_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn__10_2 = ((a_xn__10_2-X).*k_yn__10_2.*(k_1yn__10_2 - k_2yn__10_2))*I;
%Adding field of Coil_10
Hx__10_2 = Hx_xp__10_2 + Hx_xn__10_2 + Hx_yp__10_2 + Hx_yn__10_2;
Hy__10_2 = Hy_xp__10_2 + Hy_xn__10_2 + Hy_yp__10_2 + Hy_yn__10_2;
Hz__10_2 = Hz_xp__10_2 + Hz_xn__10_2 + Hz_yp__10_2 + Hz_yn__10_2;




% ----Adding all coil fields----
HX_2 = Hx_1_2 + Hx_2_2 + Hx_3_2 + Hx_4_2 + Hx_5_2 + Hx_6_2 + Hx_7_2 + Hx_8_2 + Hx_9_2 + Hx__10_2;
HY_2 = Hy_1_2 + Hy_2_2 + Hy_3_2 + Hy_4_2 + Hy_5_2 + Hy_6_2 + Hy_7_2 + Hy_8_2 + Hy_9_2 + Hy__10_2;
HZ_2 = Hz_1_2 + Hz_2_2 + Hz_3_2 + Hz_4_2 + Hz_5_2 + Hz_6_2 + Hz_7_2 + Hz_8_2 + Hz_9_2 + Hz__10_2;

%}

%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 1st 10 turn coil field data
%-%--------%--------%--------%--------%--------%--------%--------%--------

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



% --------------------------------------------------------------Coil_2
x1_2 = -2 * g;
x2_2 = 2 * g;
a_yp_2 = 2 * g;          %Distance of coil from (0,0)
coil_length_x_2 = x2_2 - x1_2;
k_p_2 = 1/(4*pi*((a_yp_2-Y).^2+Z.^2));
k_1xp_2 = (x2_2-X)./((x2_2-X).^2+(a_yp_2-Y).^2+Z.^2).^0.5;
k_2xp_2 = (x1_2-X)./((x1_2-X).^2+(a_yp_2-Y).^2+Z.^2).^0.5;

Hx_xp_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_2 = (-Z.*k_p_2.*(k_1xp_2 - k_2xp_2))*I;
Hz_xp_2 = (-(a_yp_2-Y).*k_p_2.*(k_1xp_2 - k_2xp_2))*I;

a_yn_2 = -2 * g;
k_n_2 = 1/(4*pi*((a_yn_2-Y).^2+Z.^2));
k_1xn_2 = (x2_2-X)./((x2_2-X).^2+(a_yn_2-Y).^2+Z.^2).^0.5;
k_2xn_2 = (x1_2-X)./((x1_2-X).^2+(a_yn_2-Y).^2+Z.^2).^0.5;

Hx_xn_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_2 = (Z.*k_n_2.*(k_1xn_2 - k_2xn_2))*I;
Hz_xn_2 = ((a_yn_2-Y).*k_n_2.*(k_1xn_2 - k_2xn_2))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_2 = -2 * g;
y2_2 = 2 * g;
a_xp_2 = 2 * g;          %Distance of coil from (0,0)
coil_length_y_2 = y2_2 - y1_2;

k_yp_2 = 1/(4*pi*((a_xp_2-X).^2+Z.^2));
k_1yp_2 = (y2_2-Y)./((y2_2-Y).^2+(a_xp_2-X).^2+Z.^2).^0.5;
k_2yp_2 = (y1_2-Y)./((y1_2-Y).^2+(a_xp_2-X).^2+Z.^2).^0.5;

Hx_yp_2 = -(Z.*k_yp_2.*(k_1yp_2 - k_2yp_2))*I;
Hy_yp_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_2 = (-(a_xp_2-X).*k_yp_2.*(k_1yp_2 - k_2yp_2))*I;

a_xn_2 = -2 * g;
k_yn_2 = 1/(4*pi*((a_xn_2-X).^2+Z.^2));
k_1yn_2 = (y2_2-Y)./((y2_2-Y).^2+(a_xn_2-X).^2+Z.^2).^0.5;
k_2yn_2 = (y1_2-Y)./((y1_2-Y).^2+(a_xn_2-X).^2+Z.^2).^0.5;

Hx_yn_2 = (Z.*k_yn_2.*(k_1yn_2 - k_2yn_2))*I;
Hy_yn_2 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_2 = ((a_xn_2-X).*k_yn_2.*(k_1yn_2 - k_2yn_2))*I;
%Adding field of Coil_2
Hx_2 = Hx_xp_2 + Hx_xn_2 + Hx_yp_2 + Hx_yn_2;
Hy_2 = Hy_xp_2 + Hy_xn_2 + Hy_yp_2 + Hy_yn_2;
Hz_2 = Hz_xp_2 + Hz_xn_2 + Hz_yp_2 + Hz_yn_2;




% Line along X - axis
% --------------------------------------------------------------Coil_3
x1_3 = -3 * g;
x2_3 = 3 * g;
a_yp_3 = 3 * g;          %Distance of coil from (0,0)
coil_length_x_3 = x2_3 - x1_3;
k_p_3 = 1/(4*pi*((a_yp_3-Y).^2+Z.^2));
k_1xp_3 = (x2_3-X)./((x2_3-X).^2+(a_yp_3-Y).^2+Z.^2).^0.5;
k_2xp_3 = (x1_3-X)./((x1_3-X).^2+(a_yp_3-Y).^2+Z.^2).^0.5;

Hx_xp_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_3 = (-Z.*k_p_3.*(k_1xp_3 - k_2xp_3))*I;
Hz_xp_3 = (-(a_yp_3-Y).*k_p_3.*(k_1xp_3 - k_2xp_3))*I;

a_yn_3 = -3 * g;
k_n_3 = 1/(4*pi*((a_yn_3-Y).^2+Z.^2));
k_1xn_3 = (x2_3-X)./((x2_3-X).^2+(a_yn_3-Y).^2+Z.^2).^0.5;
k_2xn_3 = (x1_3-X)./((x1_3-X).^2+(a_yn_3-Y).^2+Z.^2).^0.5;

Hx_xn_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_3 = (Z.*k_n_3.*(k_1xn_3 - k_2xn_3))*I;
Hz_xn_3 = ((a_yn_3-Y).*k_n_3.*(k_1xn_3 - k_2xn_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_3 = -3 * g;
y2_3 = 3 * g;
a_xp_3 = 3 * g;          %Distance of coil from (0,0)
coil_length_y_3 = y2_3 - y1_3;

k_yp_3 = 1/(4*pi*((a_xp_3-X).^2+Z.^2));
k_1yp_3 = (y2_3-Y)./((y2_3-Y).^2+(a_xp_3-X).^2+Z.^2).^0.5;
k_2yp_3 = (y1_3-Y)./((y1_3-Y).^2+(a_xp_3-X).^2+Z.^2).^0.5;

Hx_yp_3 = -(Z.*k_yp_3.*(k_1yp_3 - k_2yp_3))*I;
Hy_yp_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_3 = (-(a_xp_3-X).*k_yp_3.*(k_1yp_3 - k_2yp_3))*I;

a_xn_3 = -3 * g;
k_yn_3 = 1/(4*pi*((a_xn_3-X).^2+Z.^2));
k_1yn_3 = (y2_3-Y)./((y2_3-Y).^2+(a_xn_3-X).^2+Z.^2).^0.5;
k_2yn_3 = (y1_3-Y)./((y1_3-Y).^2+(a_xn_3-X).^2+Z.^2).^0.5;

Hx_yn_3 = (Z.*k_yn_3.*(k_1yn_3 - k_2yn_3))*I;
Hy_yn_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_3 = ((a_xn_3-X).*k_yn_3.*(k_1yn_3 - k_2yn_3))*I;
%Adding field of Coil_3
Hx_3 = Hx_xp_3 + Hx_xn_3 + Hx_yp_3 + Hx_yn_3;
Hy_3 = Hy_xp_3 + Hy_xn_3 + Hy_yp_3 + Hy_yn_3;
Hz_3 = Hz_xp_3 + Hz_xn_3 + Hz_yp_3 + Hz_yn_3;



% Line along X - axis
% --------------------------------------------------------------Coil_4
x1_4 = -4 * g;
x2_4 = 4 * g;
a_yp_4 = 4 * g;          %Distance of coil from (0,0)
coil_length_x_4 = x2_4 - x1_4;
k_p_4 = 1/(4*pi*((a_yp_4-Y).^2+Z.^2));
k_1xp_4 = (x2_4-X)./((x2_4-X).^2+(a_yp_4-Y).^2+Z.^2).^0.5;
k_2xp_4 = (x1_4-X)./((x1_4-X).^2+(a_yp_4-Y).^2+Z.^2).^0.5;

Hx_xp_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_4 = (-Z.*k_p_4.*(k_1xp_4 - k_2xp_4))*I;
Hz_xp_4 = (-(a_yp_4-Y).*k_p_4.*(k_1xp_4 - k_2xp_4))*I;

a_yn_4 = -4 * g;
k_n_4 = 1/(4*pi*((a_yn_4-Y).^2+Z.^2));
k_1xn_4 = (x2_4-X)./((x2_4-X).^2+(a_yn_4-Y).^2+Z.^2).^0.5;
k_2xn_4 = (x1_4-X)./((x1_4-X).^2+(a_yn_4-Y).^2+Z.^2).^0.5;

Hx_xn_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_4 = (Z.*k_n_4.*(k_1xn_4 - k_2xn_4))*I;
Hz_xn_4 = ((a_yn_4-Y).*k_n_4.*(k_1xn_4 - k_2xn_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_4 = -4 * g;
y2_4 = 4 * g;
a_xp_4 = 4 * g;          %Distance of coil from (0,0)
coil_length_y_4 = y2_4 - y1_4;

k_yp_4 = 1/(4*pi*((a_xp_4-X).^2+Z.^2));
k_1yp_4 = (y2_4-Y)./((y2_4-Y).^2+(a_xp_4-X).^2+Z.^2).^0.5;
k_2yp_4 = (y1_4-Y)./((y1_4-Y).^2+(a_xp_4-X).^2+Z.^2).^0.5;

Hx_yp_4 = -(Z.*k_yp_4.*(k_1yp_4 - k_2yp_4))*I;
Hy_yp_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_4 = (-(a_xp_4-X).*k_yp_4.*(k_1yp_4 - k_2yp_4))*I;

a_xn_4 = -4 * g;
k_yn_4 = 1/(4*pi*((a_xn_4-X).^2+Z.^2));
k_1yn_4 = (y2_4-Y)./((y2_4-Y).^2+(a_xn_4-X).^2+Z.^2).^0.5;
k_2yn_4 = (y1_4-Y)./((y1_4-Y).^2+(a_xn_4-X).^2+Z.^2).^0.5;

Hx_yn_4 = (Z.*k_yn_4.*(k_1yn_4 - k_2yn_4))*I;
Hy_yn_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_4 = ((a_xn_4-X).*k_yn_4.*(k_1yn_4 - k_2yn_4))*I;
%Adding field of Coil_4
Hx_4 = Hx_xp_4 + Hx_xn_4 + Hx_yp_4 + Hx_yn_4;
Hy_4 = Hy_xp_4 + Hy_xn_4 + Hy_yp_4 + Hy_yn_4;
Hz_4 = Hz_xp_4 + Hz_xn_4 + Hz_yp_4 + Hz_yn_4;



% Line along X - axis
% --------------------------------------------------------------Coil_5
x1_5 = -5 * g;
x2_5 = 5 * g;
a_yp_5 = 5 * g;          %Distance of coil from (0,0)
coil_length_x_5 = x2_5 - x1_5;
k_p_5 = 1/(4*pi*((a_yp_5-Y).^2+Z.^2));
k_1xp_5 = (x2_5-X)./((x2_5-X).^2+(a_yp_5-Y).^2+Z.^2).^0.5;
k_2xp_5 = (x1_5-X)./((x1_5-X).^2+(a_yp_5-Y).^2+Z.^2).^0.5;

Hx_xp_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_5 = (-Z.*k_p_5.*(k_1xp_5 - k_2xp_5))*I;
Hz_xp_5 = (-(a_yp_5-Y).*k_p_5.*(k_1xp_5 - k_2xp_5))*I;

a_yn_5 = -5 * g;
k_n_5 = 1/(4*pi*((a_yn_5-Y).^2+Z.^2));
k_1xn_5 = (x2_5-X)./((x2_5-X).^2+(a_yn_5-Y).^2+Z.^2).^0.5;
k_2xn_5 = (x1_5-X)./((x1_5-X).^2+(a_yn_5-Y).^2+Z.^2).^0.5;

Hx_xn_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_5 = (Z.*k_n_5.*(k_1xn_5 - k_2xn_5))*I;
Hz_xn_5 = ((a_yn_5-Y).*k_n_5.*(k_1xn_5 - k_2xn_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_5 = -5 * g;
y2_5 = 5 * g;
a_xp_5 = 5 * g;          %Distance of coil from (0,0)
coil_length_y_5 = y2_5 - y1_5;

k_yp_5 = 1/(4*pi*((a_xp_5-X).^2+Z.^2));
k_1yp_5 = (y2_5-Y)./((y2_5-Y).^2+(a_xp_5-X).^2+Z.^2).^0.5;
k_2yp_5 = (y1_5-Y)./((y1_5-Y).^2+(a_xp_5-X).^2+Z.^2).^0.5;

Hx_yp_5 = -(Z.*k_yp_5.*(k_1yp_5 - k_2yp_5))*I;
Hy_yp_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_5 = (-(a_xp_5-X).*k_yp_5.*(k_1yp_5 - k_2yp_5))*I;

a_xn_5 = -5 * g;
k_yn_5 = 1/(4*pi*((a_xn_5-X).^2+Z.^2));
k_1yn_5 = (y2_5-Y)./((y2_5-Y).^2+(a_xn_5-X).^2+Z.^2).^0.5;
k_2yn_5 = (y1_5-Y)./((y1_5-Y).^2+(a_xn_5-X).^2+Z.^2).^0.5;

Hx_yn_5 = (Z.*k_yn_5.*(k_1yn_5 - k_2yn_5))*I;
Hy_yn_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_5 = ((a_xn_5-X).*k_yn_5.*(k_1yn_5 - k_2yn_5))*I;
%Adding field of Coil_5
Hx_5 = Hx_xp_5 + Hx_xn_5 + Hx_yp_5 + Hx_yn_5;
Hy_5 = Hy_xp_5 + Hy_xn_5 + Hy_yp_5 + Hy_yn_5;
Hz_5 = Hz_xp_5 + Hz_xn_5 + Hz_yp_5 + Hz_yn_5;



% Line along X - axis
% --------------------------------------------------------------Coil_6
x1_6 = -6 * g;
x2_6 = 6 * g;
a_yp_6 = 6 * g;          %Distance of coil from (0,0)
coil_length_x_6 = x2_6 - x1_6;
k_p_6 = 1/(4*pi*((a_yp_6-Y).^2+Z.^2));
k_1xp_6 = (x2_6-X)./((x2_6-X).^2+(a_yp_6-Y).^2+Z.^2).^0.5;
k_2xp_6 = (x1_6-X)./((x1_6-X).^2+(a_yp_6-Y).^2+Z.^2).^0.5;

Hx_xp_6 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_6 = (-Z.*k_p_6.*(k_1xp_6 - k_2xp_6))*I;
Hz_xp_6 = (-(a_yp_6-Y).*k_p_6.*(k_1xp_6 - k_2xp_6))*I;

a_yn_6 = -6 * g;
k_n_6 = 1/(4*pi*((a_yn_6-Y).^2+Z.^2));
k_1xn_6 = (x2_6-X)./((x2_6-X).^2+(a_yn_6-Y).^2+Z.^2).^0.5;
k_2xn_6 = (x1_6-X)./((x1_6-X).^2+(a_yn_6-Y).^2+Z.^2).^0.5;

Hx_xn_6 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_6 = (Z.*k_n_6.*(k_1xn_6 - k_2xn_6))*I;
Hz_xn_6 = ((a_yn_6-Y).*k_n_6.*(k_1xn_6 - k_2xn_6))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_6 = -6 * g;
y2_6 = 6 * g;
a_xp_6 = 6 * g;          %Distance of coil from (0,0)
coil_length_y_6 = y2_6 - y1_6;

k_yp_6 = 1/(4*pi*((a_xp_6-X).^2+Z.^2));
k_1yp_6 = (y2_6-Y)./((y2_6-Y).^2+(a_xp_6-X).^2+Z.^2).^0.5;
k_2yp_6 = (y1_6-Y)./((y1_6-Y).^2+(a_xp_6-X).^2+Z.^2).^0.5;

Hx_yp_6 = -(Z.*k_yp_6.*(k_1yp_6 - k_2yp_6))*I;
Hy_yp_6 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_6 = (-(a_xp_6-X).*k_yp_6.*(k_1yp_6 - k_2yp_6))*I;

a_xn_6 = -6 * g;
k_yn_6 = 1/(4*pi*((a_xn_6-X).^2+Z.^2));
k_1yn_6 = (y2_6-Y)./((y2_6-Y).^2+(a_xn_6-X).^2+Z.^2).^0.5;
k_2yn_6 = (y1_6-Y)./((y1_6-Y).^2+(a_xn_6-X).^2+Z.^2).^0.5;

Hx_yn_6 = (Z.*k_yn_6.*(k_1yn_6 - k_2yn_6))*I;
Hy_yn_6 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_6 = ((a_xn_6-X).*k_yn_6.*(k_1yn_6 - k_2yn_6))*I;
%Adding field of Coil_6
Hx_6 = Hx_xp_6 + Hx_xn_6 + Hx_yp_6 + Hx_yn_6;
Hy_6 = Hy_xp_6 + Hy_xn_6 + Hy_yp_6 + Hy_yn_6;
Hz_6 = Hz_xp_6 + Hz_xn_6 + Hz_yp_6 + Hz_yn_6;




% Line along X - axis
% --------------------------------------------------------------Coil_7
x1_7 = -7 * g;
x2_7 = 7 * g;
a_yp_7 = 7 * g;          %Distance of coil from (0,0)
coil_length_x_7 = x2_7 - x1_7;
k_p_7 = 1/(4*pi*((a_yp_7-Y).^2+Z.^2));
k_1xp_7 = (x2_7-X)./((x2_7-X).^2+(a_yp_7-Y).^2+Z.^2).^0.5;
k_2xp_7 = (x1_7-X)./((x1_7-X).^2+(a_yp_7-Y).^2+Z.^2).^0.5;

Hx_xp_7 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_7 = (-Z.*k_p_7.*(k_1xp_7 - k_2xp_7))*I;
Hz_xp_7 = (-(a_yp_7-Y).*k_p_7.*(k_1xp_7 - k_2xp_7))*I;

a_yn_7 = -7 * g;
k_n_7 = 1/(4*pi*((a_yn_7-Y).^2+Z.^2));
k_1xn_7 = (x2_7-X)./((x2_7-X).^2+(a_yn_7-Y).^2+Z.^2).^0.5;
k_2xn_7 = (x1_7-X)./((x1_7-X).^2+(a_yn_7-Y).^2+Z.^2).^0.5;

Hx_xn_7 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_7 = (Z.*k_n_7.*(k_1xn_7 - k_2xn_7))*I;
Hz_xn_7 = ((a_yn_7-Y).*k_n_7.*(k_1xn_7 - k_2xn_7))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_7 = -7 * g;
y2_7 = 7 * g;
a_xp_7 = 7 * g;          %Distance of coil from (0,0)
coil_length_y_7 = y2_7 - y1_7;

k_yp_7 = 1/(4*pi*((a_xp_7-X).^2+Z.^2));
k_1yp_7 = (y2_7-Y)./((y2_7-Y).^2+(a_xp_7-X).^2+Z.^2).^0.5;
k_2yp_7 = (y1_7-Y)./((y1_7-Y).^2+(a_xp_7-X).^2+Z.^2).^0.5;

Hx_yp_7 = -(Z.*k_yp_7.*(k_1yp_7 - k_2yp_7))*I;
Hy_yp_7 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_7 = (-(a_xp_7-X).*k_yp_7.*(k_1yp_7 - k_2yp_7))*I;

a_xn_7 = -7 * g;
k_yn_7 = 1/(4*pi*((a_xn_7-X).^2+Z.^2));
k_1yn_7 = (y2_7-Y)./((y2_7-Y).^2+(a_xn_7-X).^2+Z.^2).^0.5;
k_2yn_7 = (y1_7-Y)./((y1_7-Y).^2+(a_xn_7-X).^2+Z.^2).^0.5;

Hx_yn_7 = (Z.*k_yn_7.*(k_1yn_7 - k_2yn_7))*I;
Hy_yn_7 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_7 = ((a_xn_7-X).*k_yn_7.*(k_1yn_7 - k_2yn_7))*I;
%Adding field of Coil_7
Hx_7 = Hx_xp_7 + Hx_xn_7 + Hx_yp_7 + Hx_yn_7;
Hy_7 = Hy_xp_7 + Hy_xn_7 + Hy_yp_7 + Hy_yn_7;
Hz_7 = Hz_xp_7 + Hz_xn_7 + Hz_yp_7 + Hz_yn_7;




% Line along X - axis
% --------------------------------------------------------------Coil_8
x1_8 = -8 * g;
x2_8 = 8 * g;
a_yp_8 = 8 * g;          %Distance of coil from (0,0)
coil_length_x_8 = x2_8 - x1_8;
k_p_8 = 1/(4*pi*((a_yp_8-Y).^2+Z.^2));
k_1xp_8 = (x2_8-X)./((x2_8-X).^2+(a_yp_8-Y).^2+Z.^2).^0.5;
k_2xp_8 = (x1_8-X)./((x1_8-X).^2+(a_yp_8-Y).^2+Z.^2).^0.5;

Hx_xp_8 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_8 = (-Z.*k_p_8.*(k_1xp_8 - k_2xp_8))*I;
Hz_xp_8 = (-(a_yp_8-Y).*k_p_8.*(k_1xp_8 - k_2xp_8))*I;

a_yn_8 = -8 * g;
k_n_8 = 1/(4*pi*((a_yn_8-Y).^2+Z.^2));
k_1xn_8 = (x2_8-X)./((x2_8-X).^2+(a_yn_8-Y).^2+Z.^2).^0.5;
k_2xn_8 = (x1_8-X)./((x1_8-X).^2+(a_yn_8-Y).^2+Z.^2).^0.5;

Hx_xn_8 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_8 = (Z.*k_n_8.*(k_1xn_8 - k_2xn_8))*I;
Hz_xn_8 = ((a_yn_8-Y).*k_n_8.*(k_1xn_8 - k_2xn_8))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_8 = -8 * g;
y2_8 = 8 * g;
a_xp_8 = 8 * g;          %Distance of coil from (0,0)
coil_length_y_8 = y2_8 - y1_8;

k_yp_8 = 1/(4*pi*((a_xp_8-X).^2+Z.^2));
k_1yp_8 = (y2_8-Y)./((y2_8-Y).^2+(a_xp_8-X).^2+Z.^2).^0.5;
k_2yp_8 = (y1_8-Y)./((y1_8-Y).^2+(a_xp_8-X).^2+Z.^2).^0.5;

Hx_yp_8 = -(Z.*k_yp_8.*(k_1yp_8 - k_2yp_8))*I;
Hy_yp_8 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_8 = (-(a_xp_8-X).*k_yp_8.*(k_1yp_8 - k_2yp_8))*I;

a_xn_8 = -8 * g;
k_yn_8 = 1/(4*pi*((a_xn_8-X).^2+Z.^2));
k_1yn_8 = (y2_8-Y)./((y2_8-Y).^2+(a_xn_8-X).^2+Z.^2).^0.5;
k_2yn_8 = (y1_8-Y)./((y1_8-Y).^2+(a_xn_8-X).^2+Z.^2).^0.5;

Hx_yn_8 = (Z.*k_yn_8.*(k_1yn_8 - k_2yn_8))*I;
Hy_yn_8 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_8 = ((a_xn_8-X).*k_yn_8.*(k_1yn_8 - k_2yn_8))*I;
%Adding field of Coil_8
Hx_8 = Hx_xp_8 + Hx_xn_8 + Hx_yp_8 + Hx_yn_8;
Hy_8 = Hy_xp_8 + Hy_xn_8 + Hy_yp_8 + Hy_yn_8;
Hz_8 = Hz_xp_8 + Hz_xn_8 + Hz_yp_8 + Hz_yn_8;



% Line along X - axis
% --------------------------------------------------------------Coil_9
x1_9 = -9 * g;
x2_9 = 9 * g;
a_yp_9 = 9 * g;          %Distance of coil from (0,0)
coil_length_x_9 = x2_9 - x1_9;
k_p_9 = 1/(4*pi*((a_yp_9-Y).^2+Z.^2));
k_1xp_9 = (x2_9-X)./((x2_9-X).^2+(a_yp_9-Y).^2+Z.^2).^0.5;
k_2xp_9 = (x1_9-X)./((x1_9-X).^2+(a_yp_9-Y).^2+Z.^2).^0.5;

Hx_xp_9 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_9 = (-Z.*k_p_9.*(k_1xp_9 - k_2xp_9))*I;
Hz_xp_9 = (-(a_yp_9-Y).*k_p_9.*(k_1xp_9 - k_2xp_9))*I;

a_yn_9 = -9 * g;
k_n_9 = 1/(4*pi*((a_yn_9-Y).^2+Z.^2));
k_1xn_9 = (x2_9-X)./((x2_9-X).^2+(a_yn_9-Y).^2+Z.^2).^0.5;
k_2xn_9 = (x1_9-X)./((x1_9-X).^2+(a_yn_9-Y).^2+Z.^2).^0.5;

Hx_xn_9 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_9 = (Z.*k_n_9.*(k_1xn_9 - k_2xn_9))*I;
Hz_xn_9 = ((a_yn_9-Y).*k_n_9.*(k_1xn_9 - k_2xn_9))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_9 = -9 * g;
y2_9 = 9 * g;
a_xp_9 = 9 * g;          %Distance of coil from (0,0)
coil_length_y_9 = y2_9 - y1_9;

k_yp_9 = 1/(4*pi*((a_xp_9-X).^2+Z.^2));
k_1yp_9 = (y2_9-Y)./((y2_9-Y).^2+(a_xp_9-X).^2+Z.^2).^0.5;
k_2yp_9 = (y1_9-Y)./((y1_9-Y).^2+(a_xp_9-X).^2+Z.^2).^0.5;

Hx_yp_9 = -(Z.*k_yp_9.*(k_1yp_9 - k_2yp_9))*I;
Hy_yp_9 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_9 = (-(a_xp_9-X).*k_yp_9.*(k_1yp_9 - k_2yp_9))*I;

a_xn_9 = -9 * g;
k_yn_9 = 1/(4*pi*((a_xn_9-X).^2+Z.^2));
k_1yn_9 = (y2_9-Y)./((y2_9-Y).^2+(a_xn_9-X).^2+Z.^2).^0.5;
k_2yn_9 = (y1_9-Y)./((y1_9-Y).^2+(a_xn_9-X).^2+Z.^2).^0.5;

Hx_yn_9 = (Z.*k_yn_9.*(k_1yn_9 - k_2yn_9))*I;
Hy_yn_9 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_9 = ((a_xn_9-X).*k_yn_9.*(k_1yn_9 - k_2yn_9))*I;
%Adding field of Coil_9
Hx_9 = Hx_xp_9 + Hx_xn_9 + Hx_yp_9 + Hx_yn_9;
Hy_9 = Hy_xp_9 + Hy_xn_9 + Hy_yp_9 + Hy_yn_9;
Hz_9 = Hz_xp_9 + Hz_xn_9 + Hz_yp_9 + Hz_yn_9;




% Line along X - axis
% --------------------------------------------------------------Coil_10
x1_10 = -10 * g;
x2_10 = 10 * g;
a_yp_10 = 10 * g;          %Distance of coil from (0,0)
coil_length_x_10 = x2_10 - x1_10;
k_p_10 = 1/(4*pi*((a_yp_10-Y).^2+Z.^2));
k_1xp_10 = (x2_10-X)./((x2_10-X).^2+(a_yp_10-Y).^2+Z.^2).^0.5;
k_2xp_10 = (x1_10-X)./((x1_10-X).^2+(a_yp_10-Y).^2+Z.^2).^0.5;

Hx_xp_10 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_10 = (-Z.*k_p_10.*(k_1xp_10 - k_2xp_10))*I;
Hz_xp_10 = (-(a_yp_10-Y).*k_p_10.*(k_1xp_10 - k_2xp_10))*I;

a_yn_10 = -10 * g;
k_n_10 = 1/(4*pi*((a_yn_10-Y).^2+Z.^2));
k_1xn_10 = (x2_10-X)./((x2_10-X).^2+(a_yn_10-Y).^2+Z.^2).^0.5;
k_2xn_10 = (x1_10-X)./((x1_10-X).^2+(a_yn_10-Y).^2+Z.^2).^0.5;

Hx_xn_10 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_10 = (Z.*k_n_10.*(k_1xn_10 - k_2xn_10))*I;
Hz_xn_10 = ((a_yn_10-Y).*k_n_10.*(k_1xn_10 - k_2xn_10))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_10 = -10 * g;
y2_10 = 10 * g;
a_xp_10 = 10 * g;          %Distance of coil from (0,0)
coil_length_y_10 = y2_10 - y1_10;

k_yp_10 = 1/(4*pi*((a_xp_10-X).^2+Z.^2));
k_1yp_10 = (y2_10-Y)./((y2_10-Y).^2+(a_xp_10-X).^2+Z.^2).^0.5;
k_2yp_10 = (y1_10-Y)./((y1_10-Y).^2+(a_xp_10-X).^2+Z.^2).^0.5;

Hx_yp_10 = -(Z.*k_yp_10.*(k_1yp_10 - k_2yp_10))*I;
Hy_yp_10 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_10 = (-(a_xp_10-X).*k_yp_10.*(k_1yp_10 - k_2yp_10))*I;

a_xn_10 = -10 * g;
k_yn_10 = 1/(4*pi*((a_xn_10-X).^2+Z.^2));
k_1yn_10 = (y2_10-Y)./((y2_10-Y).^2+(a_xn_10-X).^2+Z.^2).^0.5;
k_2yn_10 = (y1_10-Y)./((y1_10-Y).^2+(a_xn_10-X).^2+Z.^2).^0.5;

Hx_yn_10 = (Z.*k_yn_10.*(k_1yn_10 - k_2yn_10))*I;
Hy_yn_10 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_10 = ((a_xn_10-X).*k_yn_10.*(k_1yn_10 - k_2yn_10))*I;
%Adding field of Coil_10
Hx_10 = Hx_xp_10 + Hx_xn_10 + Hx_yp_10 + Hx_yn_10;
Hy_10 = Hy_xp_10 + Hy_xn_10 + Hy_yp_10 + Hy_yn_10;
Hz_10 = Hz_xp_10 + Hz_xn_10 + Hz_yp_10 + Hz_yn_10;



% ----Adding all coil fields for Coil_1----
Hx = Hx_1 + Hx_2 + Hx_3 + Hx_4 + Hx_5 + Hx_6 + Hx_7 + Hx_8 + Hx_9 + Hx_10;
Hy = Hy_1 + Hy_2 + Hy_3 + Hy_4 + Hy_5 + Hy_6 + Hy_7 + Hy_8 + Hy_9 + Hy_10;
Hz = Hz_1 + Hz_2 + Hz_3 + Hz_4 + Hz_5 + Hz_6 + Hz_7 + Hz_8 + Hz_9 + Hz_10;
%}

%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 3rd 10 turn coil field data
%-%--------%--------%--------%--------%--------%--------%--------%--------

% Line along X - axis
% --------------------------------------------------------------Coil_1
x1_1_3 = -g - 22 * g;
x2_1_3 = g - 22 * g;
a_yp_1_3 = g ;          %Distance of coil from (0,0)
coil_length_x_1_3 = x2_1_3 - x1_1_3;
k_p_1_3 = 1/(4*pi*((a_yp_1_3-Y).^2+Z.^2));
k_1xp_1_3 = (x2_1_3-X)./((x2_1_3-X).^2+(a_yp_1_3-Y).^2+Z.^2).^0.5;
k_2xp_1_3 = (x1_1_3-X)./((x1_1_3-X).^2+(a_yp_1_3-Y).^2+Z.^2).^0.5;

Hx_xp_1_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_1_3 = (-Z.*k_p_1_3.*(k_1xp_1_3 - k_2xp_1_3))*I;
Hz_xp_1_3 = (-(a_yp_1_3-Y).*k_p_1_3.*(k_1xp_1_3 - k_2xp_1_3))*I;

a_yn_1_3 = -g;
k_n_1_3 = 1/(4*pi*((a_yn_1_3-Y).^2+Z.^2));
k_1xn_1_3 = (x2_1_3-X)./((x2_1_3-X).^2+(a_yn_1_3-Y).^2+Z.^2).^0.5;
k_2xn_1_3 = (x1_1_3-X)./((x1_1_3-X).^2+(a_yn_1_3-Y).^2+Z.^2).^0.5;

Hx_xn_1_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_1_3 = (Z.*k_n_1_3.*(k_1xn_1_3 - k_2xn_1_3))*I;
Hz_xn_1_3 = ((a_yn_1_3-Y).*k_n_1_3.*(k_1xn_1_3 - k_2xn_1_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_1_3 = -g;
y2_1_3 = g;
a_xp_1_3 = g - 22 * g;          %Distance of coil from (0,0)
coil_length_y_1_3 = y2_1_3 - y1_1_3;

k_yp_1_3 = 1/(4*pi*((a_xp_1_3-X).^2+Z.^2));
k_1yp_1_3 = (y2_1_3-Y)./((y2_1_3-Y).^2+(a_xp_1_3-X).^2+Z.^2).^0.5;
k_2yp_1_3 = (y1_1_3-Y)./((y1_1_3-Y).^2+(a_xp_1_3-X).^2+Z.^2).^0.5;

Hx_yp_1_3 = -(Z.*k_yp_1_3.*(k_1yp_1_3 - k_2yp_1_3))*I;
Hy_yp_1_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_1_3 = (-(a_xp_1_3-X).*k_yp_1_3.*(k_1yp_1_3 - k_2yp_1_3))*I;

a_xn_1_3 = -g - 22 * g;
k_yn_1_3 = 1/(4*pi*((a_xn_1_3-X).^2+Z.^2));
k_1yn_1_3 = (y2_1_3-Y)./((y2_1_3-Y).^2+(a_xn_1_3-X).^2+Z.^2).^0.5;
k_2yn_1_3 = (y1_1_3-Y)./((y1_1_3-Y).^2+(a_xn_1_3-X).^2+Z.^2).^0.5;

Hx_yn_1_3 = (Z.*k_yn_1_3.*(k_1yn_1_3 - k_2yn_1_3))*I;
Hy_yn_1_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_1_3 = ((a_xn_1_3-X).*k_yn_1_3.*(k_1yn_1_3 - k_2yn_1_3))*I;


% Adding field of the coil
Hx_1_3 = Hx_xp_1_3 + Hx_xn_1_3 + Hx_yp_1_3 + Hx_yn_1_3;
Hy_1_3 = Hy_xp_1_3 + Hy_xn_1_3 + Hy_yp_1_3 + Hy_yn_1_3;
Hz_1_3 = Hz_xp_1_3 + Hz_xn_1_3 + Hz_yp_1_3 + Hz_yn_1_3;



% --------------------------------------------------------------Coil_2
x1_2_3 = -2 * g - 22 * g;
x2_2_3 = 2 * g - 22 * g;
a_yp_2_3 = 2 * g;          %Distance of coil from (0,0)
coil_length_x_2_3 = x2_2_3 - x1_2_3;
k_p_2_3 = 1/(4*pi*((a_yp_2_3-Y).^2+Z.^2));
k_1xp_2_3 = (x2_2_3-X)./((x2_2_3-X).^2+(a_yp_2_3-Y).^2+Z.^2).^0.5;
k_2xp_2_3 = (x1_2_3-X)./((x1_2_3-X).^2+(a_yp_2_3-Y).^2+Z.^2).^0.5;

Hx_xp_2_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_2_3 = (-Z.*k_p_2_3.*(k_1xp_2_3 - k_2xp_2_3))*I;
Hz_xp_2_3 = (-(a_yp_2_3-Y).*k_p_2_3.*(k_1xp_2_3 - k_2xp_2_3))*I;

a_yn_2_3 = -2 * g;
k_n_2_3 = 1/(4*pi*((a_yn_2_3-Y).^2+Z.^2));
k_1xn_2_3 = (x2_2_3-X)./((x2_2_3-X).^2+(a_yn_2_3-Y).^2+Z.^2).^0.5;
k_2xn_2_3 = (x1_2_3-X)./((x1_2_3-X).^2+(a_yn_2_3-Y).^2+Z.^2).^0.5;

Hx_xn_2_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_2_3 = (Z.*k_n_2_3.*(k_1xn_2_3 - k_2xn_2_3))*I;
Hz_xn_2_3 = ((a_yn_2_3-Y).*k_n_2_3.*(k_1xn_2_3 - k_2xn_2_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_2_3 = -2 * g;
y2_2_3 = 2 * g;
a_xp_2_3 = 2 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_y_2_3 = y2_2_3 - y1_2_3;

k_yp_2_3 = 1/(4*pi*((a_xp_2_3-X).^2+Z.^2));
k_1yp_2_3 = (y2_2_3-Y)./((y2_2_3-Y).^2+(a_xp_2_3-X).^2+Z.^2).^0.5;
k_2yp_2_3 = (y1_2_3-Y)./((y1_2_3-Y).^2+(a_xp_2_3-X).^2+Z.^2).^0.5;

Hx_yp_2_3 = -(Z.*k_yp_2_3.*(k_1yp_2_3 - k_2yp_2_3))*I;
Hy_yp_2_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_2_3 = (-(a_xp_2_3-X).*k_yp_2_3.*(k_1yp_2_3 - k_2yp_2_3))*I;

a_xn_2_3 = -2 * g - 22 * g;
k_yn_2_3 = 1/(4*pi*((a_xn_2_3-X).^2+Z.^2));
k_1yn_2_3 = (y2_2_3-Y)./((y2_2_3-Y).^2+(a_xn_2_3-X).^2+Z.^2).^0.5;
k_2yn_2_3 = (y1_2_3-Y)./((y1_2_3-Y).^2+(a_xn_2_3-X).^2+Z.^2).^0.5;

Hx_yn_2_3 = (Z.*k_yn_2_3.*(k_1yn_2_3 - k_2yn_2_3))*I;
Hy_yn_2_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_2_3 = ((a_xn_2_3-X).*k_yn_2_3.*(k_1yn_2_3 - k_2yn_2_3))*I;
%Adding field of Coil_2
Hx_2_3 = Hx_xp_2_3 + Hx_xn_2_3 + Hx_yp_2_3 + Hx_yn_2_3;
Hy_2_3 = Hy_xp_2_3 + Hy_xn_2_3 + Hy_yp_2_3 + Hy_yn_2_3;
Hz_2_3 = Hz_xp_2_3 + Hz_xn_2_3 + Hz_yp_2_3 + Hz_yn_2_3;


% Line along X - axis
% --------------------------------------------------------------Coil_3
x1_3_3 = -3 * g - 22 * g;
x2_3_3 = 3 * g - 22 * g;
a_yp_3_3 = 3 * g;          %Distance of coil from (0,0)
coil_length_x_3_3 = x2_3_3 - x1_3_3;
k_p_3_3 = 1/(4*pi*((a_yp_3_3-Y).^2+Z.^2));
k_1xp_3_3 = (x2_3_3-X)./((x2_3_3-X).^2+(a_yp_3_3-Y).^2+Z.^2).^0.5;
k_2xp_3_3 = (x1_3_3-X)./((x1_3_3-X).^2+(a_yp_3_3-Y).^2+Z.^2).^0.5;

Hx_xp_3_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_3_3 = (-Z.*k_p_3_3.*(k_1xp_3_3 - k_2xp_3_3))*I;
Hz_xp_3_3 = (-(a_yp_3_3-Y).*k_p_3_3.*(k_1xp_3_3 - k_2xp_3_3))*I;

a_yn_3_3 = -3 * g;
k_n_3_3 = 1/(4*pi*((a_yn_3_3-Y).^2+Z.^2));
k_1xn_3_3 = (x2_3_3-X)./((x2_3_3-X).^2+(a_yn_3_3-Y).^2+Z.^2).^0.5;
k_2xn_3_3 = (x1_3_3-X)./((x1_3_3-X).^2+(a_yn_3_3-Y).^2+Z.^2).^0.5;

Hx_xn_3_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_3_3 = (Z.*k_n_3_3.*(k_1xn_3_3 - k_2xn_3_3))*I;
Hz_xn_3_3 = ((a_yn_3_3-Y).*k_n_3_3.*(k_1xn_3_3 - k_2xn_3_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_3_3 = -3 * g;
y2_3_3 = 3 * g;
a_xp_3_3 = 3 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_y_3_3 = y2_3_3 - y1_3_3;

k_yp_3_3 = 1/(4*pi*((a_xp_3_3-X).^2+Z.^2));
k_1yp_3_3 = (y2_3_3-Y)./((y2_3_3-Y).^2+(a_xp_3_3-X).^2+Z.^2).^0.5;
k_2yp_3_3 = (y1_3_3-Y)./((y1_3_3-Y).^2+(a_xp_3_3-X).^2+Z.^2).^0.5;

Hx_yp_3_3 = -(Z.*k_yp_3_3.*(k_1yp_3_3 - k_2yp_3_3))*I;
Hy_yp_3_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_3_3 = (-(a_xp_3_3-X).*k_yp_3_3.*(k_1yp_3_3 - k_2yp_3_3))*I;

a_xn_3_3 = -3 * g - 22 * g;
k_yn_3_3 = 1/(4*pi*((a_xn_3_3-X).^2+Z.^2));
k_1yn_3_3 = (y2_3_3-Y)./((y2_3_3-Y).^2+(a_xn_3_3-X).^2+Z.^2).^0.5;
k_2yn_3_3 = (y1_3_3-Y)./((y1_3_3-Y).^2+(a_xn_3_3-X).^2+Z.^2).^0.5;

Hx_yn_3_3 = (Z.*k_yn_3_3.*(k_1yn_3_3 - k_2yn_3_3))*I;
Hy_yn_3_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_3_3 = ((a_xn_3_3-X).*k_yn_3_3.*(k_1yn_3_3 - k_2yn_3_3))*I;
%Adding field of Coil_3
Hx_3_3 = Hx_xp_3_3 + Hx_xn_3_3 + Hx_yp_3_3 + Hx_yn_3_3;
Hy_3_3 = Hy_xp_3_3 + Hy_xn_3_3 + Hy_yp_3_3 + Hy_yn_3_3;
Hz_3_3 = Hz_xp_3_3 + Hz_xn_3_3 + Hz_yp_3_3 + Hz_yn_3_3;


% Line along X - axis
% --------------------------------------------------------------Coil_4
x1_4_3 = -4 * g - 22 * g;
x2_4_3 = 4 * g - 22 * g;
a_yp_4_3 = 4 * g;          %Distance of coil from (0,0)
coil_length_x_4_3 = x2_4_3 - x1_4_3;
k_p_4_3 = 1/(4*pi*((a_yp_4_3-Y).^2+Z.^2));
k_1xp_4_3 = (x2_4_3-X)./((x2_4_3-X).^2+(a_yp_4_3-Y).^2+Z.^2).^0.5;
k_2xp_4_3 = (x1_4_3-X)./((x1_4_3-X).^2+(a_yp_4_3-Y).^2+Z.^2).^0.5;

Hx_xp_4_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_4_3 = (-Z.*k_p_4_3.*(k_1xp_4_3 - k_2xp_4_3))*I;
Hz_xp_4_3 = (-(a_yp_4_3-Y).*k_p_4_3.*(k_1xp_4_3 - k_2xp_4_3))*I;

a_yn_4_3 = -4 * g;
k_n_4_3 = 1/(4*pi*((a_yn_4_3-Y).^2+Z.^2));
k_1xn_4_3 = (x2_4_3-X)./((x2_4_3-X).^2+(a_yn_4_3-Y).^2+Z.^2).^0.5;
k_2xn_4_3 = (x1_4_3-X)./((x1_4_3-X).^2+(a_yn_4_3-Y).^2+Z.^2).^0.5;

Hx_xn_4_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_4_3 = (Z.*k_n_4_3.*(k_1xn_4_3 - k_2xn_4_3))*I;
Hz_xn_4_3 = ((a_yn_4_3-Y).*k_n_4_3.*(k_1xn_4_3 - k_2xn_4_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_4_3 = -4 * g;
y2_4_3 = 4 * g;
a_xp_4_3 = 4 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_y_4_3 = y2_4_3 - y1_4_3;

k_yp_4_3 = 1/(4*pi*((a_xp_4_3-X).^2+Z.^2));
k_1yp_4_3 = (y2_4_3-Y)./((y2_4_3-Y).^2+(a_xp_4_3-X).^2+Z.^2).^0.5;
k_2yp_4_3 = (y1_4_3-Y)./((y1_4_3-Y).^2+(a_xp_4_3-X).^2+Z.^2).^0.5;

Hx_yp_4_3 = -(Z.*k_yp_4_3.*(k_1yp_4_3 - k_2yp_4_3))*I;
Hy_yp_4_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_4_3 = (-(a_xp_4_3-X).*k_yp_4_3.*(k_1yp_4_3 - k_2yp_4_3))*I;

a_xn_4_3 = -4 * g - 22 * g;
k_yn_4_3 = 1/(4*pi*((a_xn_4_3-X).^2+Z.^2));
k_1yn_4_3 = (y2_4_3-Y)./((y2_4_3-Y).^2+(a_xn_4_3-X).^2+Z.^2).^0.5;
k_2yn_4_3 = (y1_4_3-Y)./((y1_4_3-Y).^2+(a_xn_4_3-X).^2+Z.^2).^0.5;

Hx_yn_4_3 = (Z.*k_yn_4_3.*(k_1yn_4_3 - k_2yn_4_3))*I;
Hy_yn_4_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_4_3 = ((a_xn_4_3-X).*k_yn_4_3.*(k_1yn_4_3 - k_2yn_4_3))*I;
%Adding field of Coil_4
Hx_4_3 = Hx_xp_4_3 + Hx_xn_4_3 + Hx_yp_4_3 + Hx_yn_4_3;
Hy_4_3 = Hy_xp_4_3 + Hy_xn_4_3 + Hy_yp_4_3 + Hy_yn_4_3;
Hz_4_3 = Hz_xp_4_3 + Hz_xn_4_3 + Hz_yp_4_3 + Hz_yn_4_3;


% Line along X - axis
% --------------------------------------------------------------Coil_5
x1_5_3 = -5 * g - 22 * g;
x2_5_3 = 5 * g - 22 * g;
a_yp_5_3 = 5 * g;          %Distance of coil from (0,0)
coil_length_x_5_3 = x2_5_3 - x1_5_3;
k_p_5_3 = 1/(4*pi*((a_yp_5_3-Y).^2+Z.^2));
k_1xp_5_3 = (x2_5_3-X)./((x2_5_3-X).^2+(a_yp_5_3-Y).^2+Z.^2).^0.5;
k_2xp_5_3 = (x1_5_3-X)./((x1_5_3-X).^2+(a_yp_5_3-Y).^2+Z.^2).^0.5;

Hx_xp_5_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_5_3 = (-Z.*k_p_5_3.*(k_1xp_5_3 - k_2xp_5_3))*I;
Hz_xp_5_3 = (-(a_yp_5_3-Y).*k_p_5_3.*(k_1xp_5_3 - k_2xp_5_3))*I;

a_yn_5_3 = -5 * g;
k_n_5_3 = 1/(4*pi*((a_yn_5_3-Y).^2+Z.^2));
k_1xn_5_3 = (x2_5_3-X)./((x2_5_3-X).^2+(a_yn_5_3-Y).^2+Z.^2).^0.5;
k_2xn_5_3 = (x1_5_3-X)./((x1_5_3-X).^2+(a_yn_5_3-Y).^2+Z.^2).^0.5;

Hx_xn_5_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_5_3 = (Z.*k_n_5_3.*(k_1xn_5_3 - k_2xn_5_3))*I;
Hz_xn_5_3 = ((a_yn_5_3-Y).*k_n_5_3.*(k_1xn_5_3 - k_2xn_5_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_5_3 = -5 * g;
y2_5_3 = 5 * g;
a_xp_5_3 = 5 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_y_5_3 = y2_5_3 - y1_5_3;

k_yp_5_3 = 1/(4*pi*((a_xp_5_3-X).^2+Z.^2));
k_1yp_5_3 = (y2_5_3-Y)./((y2_5_3-Y).^2+(a_xp_5_3-X).^2+Z.^2).^0.5;
k_2yp_5_3 = (y1_5_3-Y)./((y1_5_3-Y).^2+(a_xp_5_3-X).^2+Z.^2).^0.5;

Hx_yp_5_3 = -(Z.*k_yp_5_3.*(k_1yp_5_3 - k_2yp_5_3))*I;
Hy_yp_5_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_5_3 = (-(a_xp_5_3-X).*k_yp_5_3.*(k_1yp_5_3 - k_2yp_5_3))*I;

a_xn_5_3 = -5 * g - 22 * g;
k_yn_5_3 = 1/(4*pi*((a_xn_5_3-X).^2+Z.^2));
k_1yn_5_3 = (y2_5_3-Y)./((y2_5_3-Y).^2+(a_xn_5_3-X).^2+Z.^2).^0.5;
k_2yn_5_3 = (y1_5_3-Y)./((y1_5_3-Y).^2+(a_xn_5_3-X).^2+Z.^2).^0.5;

Hx_yn_5_3 = (Z.*k_yn_5_3.*(k_1yn_5_3 - k_2yn_5_3))*I;
Hy_yn_5_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_5_3 = ((a_xn_5_3-X).*k_yn_5_3.*(k_1yn_5_3 - k_2yn_5_3))*I;
%Adding field of Coil_5
Hx_5_3 = Hx_xp_5_3 + Hx_xn_5_3 + Hx_yp_5_3 + Hx_yn_5_3;
Hy_5_3 = Hy_xp_5_3 + Hy_xn_5_3 + Hy_yp_5_3 + Hy_yn_5_3;
Hz_5_3 = Hz_xp_5_3 + Hz_xn_5_3 + Hz_yp_5_3 + Hz_yn_5_3;


% Line along X - axis
% --------------------------------------------------------------Coil_6
x1_6_3 = -6 * g - 22 * g;
x2_6_3 = 6 * g - 22 * g;
a_yp_6_3 = 6 * g;          %Distance of coil from (0,0)
coil_length_x_6_3 = x2_6_3 - x1_6_3;
k_p_6_3 = 1/(4*pi*((a_yp_6_3-Y).^2+Z.^2));
k_1xp_6_3 = (x2_6_3-X)./((x2_6_3-X).^2+(a_yp_6_3-Y).^2+Z.^2).^0.5;
k_2xp_6_3 = (x1_6_3-X)./((x1_6_3-X).^2+(a_yp_6_3-Y).^2+Z.^2).^0.5;

Hx_xp_6_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_6_3 = (-Z.*k_p_6_3.*(k_1xp_6_3 - k_2xp_6_3))*I;
Hz_xp_6_3 = (-(a_yp_6_3-Y).*k_p_6_3.*(k_1xp_6_3 - k_2xp_6_3))*I;

a_yn_6_3 = -6 * g;
k_n_6_3 = 1/(4*pi*((a_yn_6_3-Y).^2+Z.^2));
k_1xn_6_3 = (x2_6_3-X)./((x2_6_3-X).^2+(a_yn_6_3-Y).^2+Z.^2).^0.5;
k_2xn_6_3 = (x1_6_3-X)./((x1_6_3-X).^2+(a_yn_6_3-Y).^2+Z.^2).^0.5;

Hx_xn_6_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_6_3 = (Z.*k_n_6_3.*(k_1xn_6_3 - k_2xn_6_3))*I;
Hz_xn_6_3 = ((a_yn_6_3-Y).*k_n_6_3.*(k_1xn_6_3 - k_2xn_6_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_6_3 = -6 * g;
y2_6_3 = 6 * g;
a_xp_6_3 = 6 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_y_6_3 = y2_6_3 - y1_6_3;

k_yp_6_3 = 1/(4*pi*((a_xp_6_3-X).^2+Z.^2));
k_1yp_6_3 = (y2_6_3-Y)./((y2_6_3-Y).^2+(a_xp_6_3-X).^2+Z.^2).^0.5;
k_2yp_6_3 = (y1_6_3-Y)./((y1_6_3-Y).^2+(a_xp_6_3-X).^2+Z.^2).^0.5;

Hx_yp_6_3 = -(Z.*k_yp_6_3.*(k_1yp_6_3 - k_2yp_6_3))*I;
Hy_yp_6_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_6_3 = (-(a_xp_6_3-X).*k_yp_6_3.*(k_1yp_6_3 - k_2yp_6_3))*I;

a_xn_6_3 = -6 * g - 22 * g;
k_yn_6_3 = 1/(4*pi*((a_xn_6_3-X).^2+Z.^2));
k_1yn_6_3 = (y2_6_3-Y)./((y2_6_3-Y).^2+(a_xn_6_3-X).^2+Z.^2).^0.5;
k_2yn_6_3 = (y1_6_3-Y)./((y1_6_3-Y).^2+(a_xn_6_3-X).^2+Z.^2).^0.5;

Hx_yn_6_3 = (Z.*k_yn_6_3.*(k_1yn_6_3 - k_2yn_6_3))*I;
Hy_yn_6_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_6_3 = ((a_xn_6_3-X).*k_yn_6_3.*(k_1yn_6_3 - k_2yn_6_3))*I;
%Adding field of Coil_6
Hx_6_3 = Hx_xp_6_3 + Hx_xn_6_3 + Hx_yp_6_3 + Hx_yn_6_3;
Hy_6_3 = Hy_xp_6_3 + Hy_xn_6_3 + Hy_yp_6_3 + Hy_yn_6_3;
Hz_6_3 = Hz_xp_6_3 + Hz_xn_6_3 + Hz_yp_6_3 + Hz_yn_6_3;


% Line along X - axis
% --------------------------------------------------------------Coil_7
x1_7_3 = -7 * g - 22 * g;
x2_7_3 = 7 * g - 22 * g;
a_yp_7_3 = 7 * g;          %Distance of coil from (0,0)
coil_length_x_7_3 = x2_7_3 - x1_7_3;
k_p_7_3 = 1/(4*pi*((a_yp_7_3-Y).^2+Z.^2));
k_1xp_7_3 = (x2_7_3-X)./((x2_7_3-X).^2+(a_yp_7_3-Y).^2+Z.^2).^0.5;
k_2xp_7_3 = (x1_7_3-X)./((x1_7_3-X).^2+(a_yp_7_3-Y).^2+Z.^2).^0.5;

Hx_xp_7_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_7_3 = (-Z.*k_p_7_3.*(k_1xp_7_3 - k_2xp_7_3))*I;
Hz_xp_7_3 = (-(a_yp_7_3-Y).*k_p_7_3.*(k_1xp_7_3 - k_2xp_7_3))*I;

a_yn_7_3 = -7 * g;
k_n_7_3 = 1/(4*pi*((a_yn_7_3-Y).^2+Z.^2));
k_1xn_7_3 = (x2_7_3-X)./((x2_7_3-X).^2+(a_yn_7_3-Y).^2+Z.^2).^0.5;
k_2xn_7_3 = (x1_7_3-X)./((x1_7_3-X).^2+(a_yn_7_3-Y).^2+Z.^2).^0.5;

Hx_xn_7_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_7_3 = (Z.*k_n_7_3.*(k_1xn_7_3 - k_2xn_7_3))*I;
Hz_xn_7_3 = ((a_yn_7_3-Y).*k_n_7_3.*(k_1xn_7_3 - k_2xn_7_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_7_3 = -7 * g;
y2_7_3 = 7 * g;
a_xp_7_3 = 7 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_y_7_3 = y2_7_3 - y1_7_3;

k_yp_7_3 = 1/(4*pi*((a_xp_7_3-X).^2+Z.^2));
k_1yp_7_3 = (y2_7_3-Y)./((y2_7_3-Y).^2+(a_xp_7_3-X).^2+Z.^2).^0.5;
k_2yp_7_3 = (y1_7_3-Y)./((y1_7_3-Y).^2+(a_xp_7_3-X).^2+Z.^2).^0.5;

Hx_yp_7_3 = -(Z.*k_yp_7_3.*(k_1yp_7_3 - k_2yp_7_3))*I;
Hy_yp_7_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_7_3 = (-(a_xp_7_3-X).*k_yp_7_3.*(k_1yp_7_3 - k_2yp_7_3))*I;

a_xn_7_3 = -7 * g - 22 * g;
k_yn_7_3 = 1/(4*pi*((a_xn_7_3-X).^2+Z.^2));
k_1yn_7_3 = (y2_7_3-Y)./((y2_7_3-Y).^2+(a_xn_7_3-X).^2+Z.^2).^0.5;
k_2yn_7_3 = (y1_7_3-Y)./((y1_7_3-Y).^2+(a_xn_7_3-X).^2+Z.^2).^0.5;

Hx_yn_7_3 = (Z.*k_yn_7_3.*(k_1yn_7_3 - k_2yn_7_3))*I;
Hy_yn_7_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_7_3 = ((a_xn_7_3-X).*k_yn_7_3.*(k_1yn_7_3 - k_2yn_7_3))*I;
%Adding field of Coil_7
Hx_7_3 = Hx_xp_7_3 + Hx_xn_7_3 + Hx_yp_7_3 + Hx_yn_7_3;
Hy_7_3 = Hy_xp_7_3 + Hy_xn_7_3 + Hy_yp_7_3 + Hy_yn_7_3;
Hz_7_3 = Hz_xp_7_3 + Hz_xn_7_3 + Hz_yp_7_3 + Hz_yn_7_3;


% Line along X - axis
% --------------------------------------------------------------Coil_8
x1_8_3 = -8 * g - 22 * g;
x2_8_3 = 8 * g - 22 * g;
a_yp_8_3 = 8 * g;          %Distance of coil from (0,0)
coil_length_x_8_3 = x2_8_3 - x1_8_3;
k_p_8_3 = 1/(4*pi*((a_yp_8_3-Y).^2+Z.^2));
k_1xp_8_3 = (x2_8_3-X)./((x2_8_3-X).^2+(a_yp_8_3-Y).^2+Z.^2).^0.5;
k_2xp_8_3 = (x1_8_3-X)./((x1_8_3-X).^2+(a_yp_8_3-Y).^2+Z.^2).^0.5;

Hx_xp_8_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_8_3 = (-Z.*k_p_8_3.*(k_1xp_8_3 - k_2xp_8_3))*I;
Hz_xp_8_3 = (-(a_yp_8_3-Y).*k_p_8_3.*(k_1xp_8_3 - k_2xp_8_3))*I;

a_yn_8_3 = -8 * g;
k_n_8_3 = 1/(4*pi*((a_yn_8_3-Y).^2+Z.^2));
k_1xn_8_3 = (x2_8_3-X)./((x2_8_3-X).^2+(a_yn_8_3-Y).^2+Z.^2).^0.5;
k_2xn_8_3 = (x1_8_3-X)./((x1_8_3-X).^2+(a_yn_8_3-Y).^2+Z.^2).^0.5;

Hx_xn_8_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_8_3 = (Z.*k_n_8_3.*(k_1xn_8_3 - k_2xn_8_3))*I;
Hz_xn_8_3 = ((a_yn_8_3-Y).*k_n_8_3.*(k_1xn_8_3 - k_2xn_8_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_8_3 = -8 * g;
y2_8_3 = 8 * g;
a_xp_8_3 = 8 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_y_8_3 = y2_8_3 - y1_8_3;

k_yp_8_3 = 1/(4*pi*((a_xp_8_3-X).^2+Z.^2));
k_1yp_8_3 = (y2_8_3-Y)./((y2_8_3-Y).^2+(a_xp_8_3-X).^2+Z.^2).^0.5;
k_2yp_8_3 = (y1_8_3-Y)./((y1_8_3-Y).^2+(a_xp_8_3-X).^2+Z.^2).^0.5;

Hx_yp_8_3 = -(Z.*k_yp_8_3.*(k_1yp_8_3 - k_2yp_8_3))*I;
Hy_yp_8_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_8_3 = (-(a_xp_8_3-X).*k_yp_8_3.*(k_1yp_8_3 - k_2yp_8_3))*I;

a_xn_8_3 = -8 * g - 22 * g;
k_yn_8_3 = 1/(4*pi*((a_xn_8_3-X).^2+Z.^2));
k_1yn_8_3 = (y2_8_3-Y)./((y2_8_3-Y).^2+(a_xn_8_3-X).^2+Z.^2).^0.5;
k_2yn_8_3 = (y1_8_3-Y)./((y1_8_3-Y).^2+(a_xn_8_3-X).^2+Z.^2).^0.5;

Hx_yn_8_3 = (Z.*k_yn_8_3.*(k_1yn_8_3 - k_2yn_8_3))*I;
Hy_yn_8_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_8_3 = ((a_xn_8_3-X).*k_yn_8_3.*(k_1yn_8_3 - k_2yn_8_3))*I;
%Adding field of Coil_8
Hx_8_3 = Hx_xp_8_3 + Hx_xn_8_3 + Hx_yp_8_3 + Hx_yn_8_3;
Hy_8_3 = Hy_xp_8_3 + Hy_xn_8_3 + Hy_yp_8_3 + Hy_yn_8_3;
Hz_8_3 = Hz_xp_8_3 + Hz_xn_8_3 + Hz_yp_8_3 + Hz_yn_8_3;



% Line along X - axis
% --------------------------------------------------------------Coil_9
x1_9_3 = -9 * g - 22 * g;
x2_9_3 = 9 * g - 22 * g;
a_yp_9_3 = 9 * g;          %Distance of coil from (0,0)
coil_length_x_9_3 = x2_9_3 - x1_9_3;
k_p_9_3 = 1/(4*pi*((a_yp_9_3-Y).^2+Z.^2));
k_1xp_9_3 = (x2_9_3-X)./((x2_9_3-X).^2+(a_yp_9_3-Y).^2+Z.^2).^0.5;
k_2xp_9_3 = (x1_9_3-X)./((x1_9_3-X).^2+(a_yp_9_3-Y).^2+Z.^2).^0.5;

Hx_xp_9_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_9_3 = (-Z.*k_p_9_3.*(k_1xp_9_3 - k_2xp_9_3))*I;
Hz_xp_9_3 = (-(a_yp_9_3-Y).*k_p_9_3.*(k_1xp_9_3 - k_2xp_9_3))*I;

a_yn_9_3 = -9 * g;
k_n_9_3 = 1/(4*pi*((a_yn_9_3-Y).^2+Z.^2));
k_1xn_9_3 = (x2_9_3-X)./((x2_9_3-X).^2+(a_yn_9_3-Y).^2+Z.^2).^0.5;
k_2xn_9_3 = (x1_9_3-X)./((x1_9_3-X).^2+(a_yn_9_3-Y).^2+Z.^2).^0.5;

Hx_xn_9_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_9_3 = (Z.*k_n_9_3.*(k_1xn_9_3 - k_2xn_9_3))*I;
Hz_xn_9_3 = ((a_yn_9_3-Y).*k_n_9_3.*(k_1xn_9_3 - k_2xn_9_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_9_3 = -9 * g;
y2_9_3 = 9 * g;
a_xp_9_3 = 9 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_y_9_3 = y2_9_3 - y1_9_3;

k_yp_9_3 = 1/(4*pi*((a_xp_9_3-X).^2+Z.^2));
k_1yp_9_3 = (y2_9_3-Y)./((y2_9_3-Y).^2+(a_xp_9_3-X).^2+Z.^2).^0.5;
k_2yp_9_3 = (y1_9_3-Y)./((y1_9_3-Y).^2+(a_xp_9_3-X).^2+Z.^2).^0.5;

Hx_yp_9_3 = -(Z.*k_yp_9_3.*(k_1yp_9_3 - k_2yp_9_3))*I;
Hy_yp_9_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_9_3 = (-(a_xp_9_3-X).*k_yp_9_3.*(k_1yp_9_3 - k_2yp_9_3))*I;

a_xn_9_3 = -9 * g - 22 * g;
k_yn_9_3 = 1/(4*pi*((a_xn_9_3-X).^2+Z.^2));
k_1yn_9_3 = (y2_9_3-Y)./((y2_9_3-Y).^2+(a_xn_9_3-X).^2+Z.^2).^0.5;
k_2yn_9_3 = (y1_9_3-Y)./((y1_9_3-Y).^2+(a_xn_9_3-X).^2+Z.^2).^0.5;

Hx_yn_9_3 = (Z.*k_yn_9_3.*(k_1yn_9_3 - k_2yn_9_3))*I;
Hy_yn_9_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_9_3 = ((a_xn_9_3-X).*k_yn_9_3.*(k_1yn_9_3 - k_2yn_9_3))*I;
%Adding field of Coil_9
Hx_9_3 = Hx_xp_9_3 + Hx_xn_9_3 + Hx_yp_9_3 + Hx_yn_9_3;
Hy_9_3 = Hy_xp_9_3 + Hy_xn_9_3 + Hy_yp_9_3 + Hy_yn_9_3;
Hz_9_3 = Hz_xp_9_3 + Hz_xn_9_3 + Hz_yp_9_3 + Hz_yn_9_3;


% Line along X - axis
% --------------------------------------------------------------Coil_10
x1__10_3 = -10 * g - 22 * g;
x2__10_3 = 10 * g - 22 * g;
a_yp__10_3 = 10 * g;          %Distance of coil from (0,0)
coil_length_x__10_3 = x2__10_3 - x1__10_3;
k_p__10_3 = 1/(4*pi*((a_yp__10_3-Y).^2+Z.^2));
k_1xp__10_3 = (x2__10_3-X)./((x2__10_3-X).^2+(a_yp__10_3-Y).^2+Z.^2).^0.5;
k_2xp__10_3 = (x1__10_3-X)./((x1__10_3-X).^2+(a_yp__10_3-Y).^2+Z.^2).^0.5;

Hx_xp__10_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp__10_3 = (-Z.*k_p__10_3.*(k_1xp__10_3 - k_2xp__10_3))*I;
Hz_xp__10_3 = (-(a_yp__10_3-Y).*k_p__10_3.*(k_1xp__10_3 - k_2xp__10_3))*I;

a_yn__10_3 = -10 * g;
k_n__10_3 = 1/(4*pi*((a_yn__10_3-Y).^2+Z.^2));
k_1xn__10_3 = (x2__10_3-X)./((x2__10_3-X).^2+(a_yn__10_3-Y).^2+Z.^2).^0.5;
k_2xn__10_3 = (x1__10_3-X)./((x1__10_3-X).^2+(a_yn__10_3-Y).^2+Z.^2).^0.5;

Hx_xn__10_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn__10_3 = (Z.*k_n__10_3.*(k_1xn__10_3 - k_2xn__10_3))*I;
Hz_xn__10_3 = ((a_yn__10_3-Y).*k_n__10_3.*(k_1xn__10_3 - k_2xn__10_3))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1__10_3 = -10 * g;
y2__10_3 = 10 * g;
a_xp__10_3 = 10 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_y__10_3 = y2__10_3 - y1__10_3;

k_yp__10_3 = 1/(4*pi*((a_xp__10_3-X).^2+Z.^2));
k_1yp__10_3 = (y2__10_3-Y)./((y2__10_3-Y).^2+(a_xp__10_3-X).^2+Z.^2).^0.5;
k_2yp__10_3 = (y1__10_3-Y)./((y1__10_3-Y).^2+(a_xp__10_3-X).^2+Z.^2).^0.5;

Hx_yp__10_3 = -(Z.*k_yp__10_3.*(k_1yp__10_3 - k_2yp__10_3))*I;
Hy_yp__10_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp__10_3 = (-(a_xp__10_3-X).*k_yp__10_3.*(k_1yp__10_3 - k_2yp__10_3))*I;

a_xn__10_3 = -10 * g - 22 * g;
k_yn__10_3 = 1/(4*pi*((a_xn__10_3-X).^2+Z.^2));
k_1yn__10_3 = (y2__10_3-Y)./((y2__10_3-Y).^2+(a_xn__10_3-X).^2+Z.^2).^0.5;
k_2yn__10_3 = (y1__10_3-Y)./((y1__10_3-Y).^2+(a_xn__10_3-X).^2+Z.^2).^0.5;

Hx_yn__10_3 = (Z.*k_yn__10_3.*(k_1yn__10_3 - k_2yn__10_3))*I;
Hy_yn__10_3 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn__10_3 = ((a_xn__10_3-X).*k_yn__10_3.*(k_1yn__10_3 - k_2yn__10_3))*I;
%Adding field of Coil_10
Hx__10_3 = Hx_xp__10_3 + Hx_xn__10_3 + Hx_yp__10_3 + Hx_yn__10_3;
Hy__10_3 = Hy_xp__10_3 + Hy_xn__10_3 + Hy_yp__10_3 + Hy_yn__10_3;
Hz__10_3 = Hz_xp__10_3 + Hz_xn__10_3 + Hz_yp__10_3 + Hz_yn__10_3;

% ----Adding all coil fields----
HX_3 = Hx_1_3 + Hx_2_3 + Hx_3_3 + Hx_4_3 + Hx_5_3 + Hx_6_3 + Hx_7_3 + Hx_8_3 + Hx_9_3 + Hx__10_3;
HY_3 = Hy_1_3 + Hy_2_3 + Hy_3_3 + Hy_4_3 + Hy_5_3 + Hy_6_3 + Hy_7_3 + Hy_8_3 + Hy_9_3 + Hy__10_3;
HZ_3 = Hz_1_3 + Hz_2_3 + Hz_3_3 + Hz_4_3 + Hz_5_3 + Hz_6_3 + Hz_7_3 + Hz_8_3 + Hz_9_3 + Hz__10_3;

%}

%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 4th 10 turn coil field data
%-%--------%--------%--------%--------%--------%--------%--------%--------
%
% Line along X - axis
% --------------------------------------------------------------Coil_1
x1_1_4 = -g;
x2_1_4 = g;
a_yp_1_4 = g - 22 * g;          %Distance of coil from (0,0)
coil_length_x_1_4 = x2_1_4 - x1_1_4;
k_p_1_4 = 1/(4*pi*((a_yp_1_4-Y).^2+Z.^2));
k_1xp_1_4 = (x2_1_4-X)./((x2_1_4-X).^2+(a_yp_1_4-Y).^2+Z.^2).^0.5;
k_2xp_1_4 = (x1_1_4-X)./((x1_1_4-X).^2+(a_yp_1_4-Y).^2+Z.^2).^0.5;

Hx_xp_1_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_1_4 = (-Z.*k_p_1_4.*(k_1xp_1_4 - k_2xp_1_4))*I;
Hz_xp_1_4 = (-(a_yp_1_4-Y).*k_p_1_4.*(k_1xp_1_4 - k_2xp_1_4))*I;

a_yn_1_4 = -g - 22 * g;
k_n_1_4 = 1/(4*pi*((a_yn_1_4-Y).^2+Z.^2));
k_1xn_1_4 = (x2_1_4-X)./((x2_1_4-X).^2+(a_yn_1_4-Y).^2+Z.^2).^0.5;
k_2xn_1_4 = (x1_1_4-X)./((x1_1_4-X).^2+(a_yn_1_4-Y).^2+Z.^2).^0.5;

Hx_xn_1_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_1_4 = (Z.*k_n_1_4.*(k_1xn_1_4 - k_2xn_1_4))*I;
Hz_xn_1_4 = ((a_yn_1_4-Y).*k_n_1_4.*(k_1xn_1_4 - k_2xn_1_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_1_4 = -g - 22 * g;
y2_1_4 = g- 22 * g;
a_xp_1_4 = g;          %Distance of coil from (0,0)
coil_length_y_1_4 = y2_1_4 - y1_1_4;

k_yp_1_4 = 1/(4*pi*((a_xp_1_4-X).^2+Z.^2));
k_1yp_1_4 = (y2_1_4-Y)./((y2_1_4-Y).^2+(a_xp_1_4-X).^2+Z.^2).^0.5;
k_2yp_1_4 = (y1_1_4-Y)./((y1_1_4-Y).^2+(a_xp_1_4-X).^2+Z.^2).^0.5;

Hx_yp_1_4 = -(Z.*k_yp_1_4.*(k_1yp_1_4 - k_2yp_1_4))*I;
Hy_yp_1_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_1_4 = (-(a_xp_1_4-X).*k_yp_1_4.*(k_1yp_1_4 - k_2yp_1_4))*I;

a_xn_1_4 = -g;
k_yn_1_4 = 1/(4*pi*((a_xn_1_4-X).^2+Z.^2));
k_1yn_1_4 = (y2_1_4-Y)./((y2_1_4-Y).^2+(a_xn_1_4-X).^2+Z.^2).^0.5;
k_2yn_1_4 = (y1_1_4-Y)./((y1_1_4-Y).^2+(a_xn_1_4-X).^2+Z.^2).^0.5;

Hx_yn_1_4 = (Z.*k_yn_1_4.*(k_1yn_1_4 - k_2yn_1_4))*I;
Hy_yn_1_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_1_4 = ((a_xn_1_4-X).*k_yn_1_4.*(k_1yn_1_4 - k_2yn_1_4))*I;


% Adding field of the coil
Hx_1_4 = Hx_xp_1_4 + Hx_xn_1_4 + Hx_yp_1_4 + Hx_yn_1_4;
Hy_1_4 = Hy_xp_1_4 + Hy_xn_1_4 + Hy_yp_1_4 + Hy_yn_1_4;
Hz_1_4 = Hz_xp_1_4 + Hz_xn_1_4 + Hz_yp_1_4 + Hz_yn_1_4;



% --------------------------------------------------------------Coil_2
x1_2_4 = -2 * g;
x2_2_4 = 2 * g;
a_yp_2_4 = 2 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_x_2_4 = x2_2_4 - x1_2_4;
k_p_2_4 = 1/(4*pi*((a_yp_2_4-Y).^2+Z.^2));
k_1xp_2_4 = (x2_2_4-X)./((x2_2_4-X).^2+(a_yp_2_4-Y).^2+Z.^2).^0.5;
k_2xp_2_4 = (x1_2_4-X)./((x1_2_4-X).^2+(a_yp_2_4-Y).^2+Z.^2).^0.5;

Hx_xp_2_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_2_4 = (-Z.*k_p_2_4.*(k_1xp_2_4 - k_2xp_2_4))*I;
Hz_xp_2_4 = (-(a_yp_2_4-Y).*k_p_2_4.*(k_1xp_2_4 - k_2xp_2_4))*I;

a_yn_2_4 = -2 * g - 22 * g;
k_n_2_4 = 1/(4*pi*((a_yn_2_4-Y).^2+Z.^2));
k_1xn_2_4 = (x2_2_4-X)./((x2_2_4-X).^2+(a_yn_2_4-Y).^2+Z.^2).^0.5;
k_2xn_2_4 = (x1_2_4-X)./((x1_2_4-X).^2+(a_yn_2_4-Y).^2+Z.^2).^0.5;

Hx_xn_2_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_2_4 = (Z.*k_n_2_4.*(k_1xn_2_4 - k_2xn_2_4))*I;
Hz_xn_2_4 = ((a_yn_2_4-Y).*k_n_2_4.*(k_1xn_2_4 - k_2xn_2_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_2_4 = -2 * g - 22 * g;
y2_2_4 = 2 * g - 22 * g;
a_xp_2_4 = 2 * g;          %Distance of coil from (0,0)
coil_length_y_2_4 = y2_2_4 - y1_2_4;

k_yp_2_4 = 1/(4*pi*((a_xp_2_4-X).^2+Z.^2));
k_1yp_2_4 = (y2_2_4-Y)./((y2_2_4-Y).^2+(a_xp_2_4-X).^2+Z.^2).^0.5;
k_2yp_2_4 = (y1_2_4-Y)./((y1_2_4-Y).^2+(a_xp_2_4-X).^2+Z.^2).^0.5;

Hx_yp_2_4 = -(Z.*k_yp_2_4.*(k_1yp_2_4 - k_2yp_2_4))*I;
Hy_yp_2_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_2_4 = (-(a_xp_2_4-X).*k_yp_2_4.*(k_1yp_2_4 - k_2yp_2_4))*I;

a_xn_2_4 = -2 * g;
k_yn_2_4 = 1/(4*pi*((a_xn_2_4-X).^2+Z.^2));
k_1yn_2_4 = (y2_2_4-Y)./((y2_2_4-Y).^2+(a_xn_2_4-X).^2+Z.^2).^0.5;
k_2yn_2_4 = (y1_2_4-Y)./((y1_2_4-Y).^2+(a_xn_2_4-X).^2+Z.^2).^0.5;

Hx_yn_2_4 = (Z.*k_yn_2_4.*(k_1yn_2_4 - k_2yn_2_4))*I;
Hy_yn_2_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_2_4 = ((a_xn_2_4-X).*k_yn_2_4.*(k_1yn_2_4 - k_2yn_2_4))*I;
%Adding field of Coil_2
Hx_2_4 = Hx_xp_2_4 + Hx_xn_2_4 + Hx_yp_2_4 + Hx_yn_2_4;
Hy_2_4 = Hy_xp_2_4 + Hy_xn_2_4 + Hy_yp_2_4 + Hy_yn_2_4;
Hz_2_4 = Hz_xp_2_4 + Hz_xn_2_4 + Hz_yp_2_4 + Hz_yn_2_4;


% Line along X - axis
% --------------------------------------------------------------Coil_3
x1_3_4 = -3 * g;
x2_3_4 = 3 * g;
a_yp_3_4 = 3 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_x_3_4 = x2_3_4 - x1_3_4;
k_p_3_4 = 1/(4*pi*((a_yp_3_4-Y).^2+Z.^2));
k_1xp_3_4 = (x2_3_4-X)./((x2_3_4-X).^2+(a_yp_3_4-Y).^2+Z.^2).^0.5;
k_2xp_3_4 = (x1_3_4-X)./((x1_3_4-X).^2+(a_yp_3_4-Y).^2+Z.^2).^0.5;

Hx_xp_3_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_3_4 = (-Z.*k_p_3_4.*(k_1xp_3_4 - k_2xp_3_4))*I;
Hz_xp_3_4 = (-(a_yp_3_4-Y).*k_p_3_4.*(k_1xp_3_4 - k_2xp_3_4))*I;

a_yn_3_4 = -3 * g - 22 * g;
k_n_3_4 = 1/(4*pi*((a_yn_3_4-Y).^2+Z.^2));
k_1xn_3_4 = (x2_3_4-X)./((x2_3_4-X).^2+(a_yn_3_4-Y).^2+Z.^2).^0.5;
k_2xn_3_4 = (x1_3_4-X)./((x1_3_4-X).^2+(a_yn_3_4-Y).^2+Z.^2).^0.5;

Hx_xn_3_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_3_4 = (Z.*k_n_3_4.*(k_1xn_3_4 - k_2xn_3_4))*I;
Hz_xn_3_4 = ((a_yn_3_4-Y).*k_n_3_4.*(k_1xn_3_4 - k_2xn_3_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_3_4 = -3 * g - 22 * g;
y2_3_4 = 3 * g - 22 * g;
a_xp_3_4 = 3 * g;          %Distance of coil from (0,0)
coil_length_y_3_4 = y2_3_4 - y1_3_4;

k_yp_3_4 = 1/(4*pi*((a_xp_3_4-X).^2+Z.^2));
k_1yp_3_4 = (y2_3_4-Y)./((y2_3_4-Y).^2+(a_xp_3_4-X).^2+Z.^2).^0.5;
k_2yp_3_4 = (y1_3_4-Y)./((y1_3_4-Y).^2+(a_xp_3_4-X).^2+Z.^2).^0.5;

Hx_yp_3_4 = -(Z.*k_yp_3_4.*(k_1yp_3_4 - k_2yp_3_4))*I;
Hy_yp_3_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_3_4 = (-(a_xp_3_4-X).*k_yp_3_4.*(k_1yp_3_4 - k_2yp_3_4))*I;

a_xn_3_4 = -3 * g;
k_yn_3_4 = 1/(4*pi*((a_xn_3_4-X).^2+Z.^2));
k_1yn_3_4 = (y2_3_4-Y)./((y2_3_4-Y).^2+(a_xn_3_4-X).^2+Z.^2).^0.5;
k_2yn_3_4 = (y1_3_4-Y)./((y1_3_4-Y).^2+(a_xn_3_4-X).^2+Z.^2).^0.5;

Hx_yn_3_4 = (Z.*k_yn_3_4.*(k_1yn_3_4 - k_2yn_3_4))*I;
Hy_yn_3_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_3_4 = ((a_xn_3_4-X).*k_yn_3_4.*(k_1yn_3_4 - k_2yn_3_4))*I;
%Adding field of Coil_3
Hx_3_4 = Hx_xp_3_4 + Hx_xn_3_4 + Hx_yp_3_4 + Hx_yn_3_4;
Hy_3_4 = Hy_xp_3_4 + Hy_xn_3_4 + Hy_yp_3_4 + Hy_yn_3_4;
Hz_3_4 = Hz_xp_3_4 + Hz_xn_3_4 + Hz_yp_3_4 + Hz_yn_3_4;


% Line along X - axis
% --------------------------------------------------------------Coil_4
x1_4_4 = -4 * g;
x2_4_4 = 4 * g;
a_yp_4_4 = 4 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_x_4_4 = x2_4_4 - x1_4_4;
k_p_4_4 = 1/(4*pi*((a_yp_4_4-Y).^2+Z.^2));
k_1xp_4_4 = (x2_4_4-X)./((x2_4_4-X).^2+(a_yp_4_4-Y).^2+Z.^2).^0.5;
k_2xp_4_4 = (x1_4_4-X)./((x1_4_4-X).^2+(a_yp_4_4-Y).^2+Z.^2).^0.5;

Hx_xp_4_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_4_4 = (-Z.*k_p_4_4.*(k_1xp_4_4 - k_2xp_4_4))*I;
Hz_xp_4_4 = (-(a_yp_4_4-Y).*k_p_4_4.*(k_1xp_4_4 - k_2xp_4_4))*I;

a_yn_4_4 = -4 * g - 22 * g;
k_n_4_4 = 1/(4*pi*((a_yn_4_4-Y).^2+Z.^2));
k_1xn_4_4 = (x2_4_4-X)./((x2_4_4-X).^2+(a_yn_4_4-Y).^2+Z.^2).^0.5;
k_2xn_4_4 = (x1_4_4-X)./((x1_4_4-X).^2+(a_yn_4_4-Y).^2+Z.^2).^0.5;

Hx_xn_4_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_4_4 = (Z.*k_n_4_4.*(k_1xn_4_4 - k_2xn_4_4))*I;
Hz_xn_4_4 = ((a_yn_4_4-Y).*k_n_4_4.*(k_1xn_4_4 - k_2xn_4_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_4_4 = -4 * g - 22 * g;
y2_4_4 = 4 * g - 22 * g;
a_xp_4_4 = 4 * g;          %Distance of coil from (0,0)
coil_length_y_4_4 = y2_4_4 - y1_4_4;

k_yp_4_4 = 1/(4*pi*((a_xp_4_4-X).^2+Z.^2));
k_1yp_4_4 = (y2_4_4-Y)./((y2_4_4-Y).^2+(a_xp_4_4-X).^2+Z.^2).^0.5;
k_2yp_4_4 = (y1_4_4-Y)./((y1_4_4-Y).^2+(a_xp_4_4-X).^2+Z.^2).^0.5;

Hx_yp_4_4 = -(Z.*k_yp_4_4.*(k_1yp_4_4 - k_2yp_4_4))*I;
Hy_yp_4_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_4_4 = (-(a_xp_4_4-X).*k_yp_4_4.*(k_1yp_4_4 - k_2yp_4_4))*I;

a_xn_4_4 = -4 * g;
k_yn_4_4 = 1/(4*pi*((a_xn_4_4-X).^2+Z.^2));
k_1yn_4_4 = (y2_4_4-Y)./((y2_4_4-Y).^2+(a_xn_4_4-X).^2+Z.^2).^0.5;
k_2yn_4_4 = (y1_4_4-Y)./((y1_4_4-Y).^2+(a_xn_4_4-X).^2+Z.^2).^0.5;

Hx_yn_4_4 = (Z.*k_yn_4_4.*(k_1yn_4_4 - k_2yn_4_4))*I;
Hy_yn_4_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_4_4 = ((a_xn_4_4-X).*k_yn_4_4.*(k_1yn_4_4 - k_2yn_4_4))*I;
%Adding field of Coil_4
Hx_4_4 = Hx_xp_4_4 + Hx_xn_4_4 + Hx_yp_4_4 + Hx_yn_4_4;
Hy_4_4 = Hy_xp_4_4 + Hy_xn_4_4 + Hy_yp_4_4 + Hy_yn_4_4;
Hz_4_4 = Hz_xp_4_4 + Hz_xn_4_4 + Hz_yp_4_4 + Hz_yn_4_4;


% Line along X - axis
% --------------------------------------------------------------Coil_5
x1_5_4 = -5 * g;
x2_5_4 = 5 * g;
a_yp_5_4 = 5 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_x_5_4 = x2_5_4 - x1_5_4;
k_p_5_4 = 1/(4*pi*((a_yp_5_4-Y).^2+Z.^2));
k_1xp_5_4 = (x2_5_4-X)./((x2_5_4-X).^2+(a_yp_5_4-Y).^2+Z.^2).^0.5;
k_2xp_5_4 = (x1_5_4-X)./((x1_5_4-X).^2+(a_yp_5_4-Y).^2+Z.^2).^0.5;

Hx_xp_5_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_5_4 = (-Z.*k_p_5_4.*(k_1xp_5_4 - k_2xp_5_4))*I;
Hz_xp_5_4 = (-(a_yp_5_4-Y).*k_p_5_4.*(k_1xp_5_4 - k_2xp_5_4))*I;

a_yn_5_4 = -5 * g - 22 * g;
k_n_5_4 = 1/(4*pi*((a_yn_5_4-Y).^2+Z.^2));
k_1xn_5_4 = (x2_5_4-X)./((x2_5_4-X).^2+(a_yn_5_4-Y).^2+Z.^2).^0.5;
k_2xn_5_4 = (x1_5_4-X)./((x1_5_4-X).^2+(a_yn_5_4-Y).^2+Z.^2).^0.5;

Hx_xn_5_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_5_4 = (Z.*k_n_5_4.*(k_1xn_5_4 - k_2xn_5_4))*I;
Hz_xn_5_4 = ((a_yn_5_4-Y).*k_n_5_4.*(k_1xn_5_4 - k_2xn_5_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_5_4 = -5 * g - 22 * g;
y2_5_4 = 5 * g - 22 * g;
a_xp_5_4 = 5 * g;          %Distance of coil from (0,0)
coil_length_y_5_4 = y2_5_4 - y1_5_4;

k_yp_5_4 = 1/(4*pi*((a_xp_5_4-X).^2+Z.^2));
k_1yp_5_4 = (y2_5_4-Y)./((y2_5_4-Y).^2+(a_xp_5_4-X).^2+Z.^2).^0.5;
k_2yp_5_4 = (y1_5_4-Y)./((y1_5_4-Y).^2+(a_xp_5_4-X).^2+Z.^2).^0.5;

Hx_yp_5_4 = -(Z.*k_yp_5_4.*(k_1yp_5_4 - k_2yp_5_4))*I;
Hy_yp_5_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_5_4 = (-(a_xp_5_4-X).*k_yp_5_4.*(k_1yp_5_4 - k_2yp_5_4))*I;

a_xn_5_4 = -5 * g;
k_yn_5_4 = 1/(4*pi*((a_xn_5_4-X).^2+Z.^2));
k_1yn_5_4 = (y2_5_4-Y)./((y2_5_4-Y).^2+(a_xn_5_4-X).^2+Z.^2).^0.5;
k_2yn_5_4 = (y1_5_4-Y)./((y1_5_4-Y).^2+(a_xn_5_4-X).^2+Z.^2).^0.5;

Hx_yn_5_4 = (Z.*k_yn_5_4.*(k_1yn_5_4 - k_2yn_5_4))*I;
Hy_yn_5_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_5_4 = ((a_xn_5_4-X).*k_yn_5_4.*(k_1yn_5_4 - k_2yn_5_4))*I;
%Adding field of Coil_5
Hx_5_4 = Hx_xp_5_4 + Hx_xn_5_4 + Hx_yp_5_4 + Hx_yn_5_4;
Hy_5_4 = Hy_xp_5_4 + Hy_xn_5_4 + Hy_yp_5_4 + Hy_yn_5_4;
Hz_5_4 = Hz_xp_5_4 + Hz_xn_5_4 + Hz_yp_5_4 + Hz_yn_5_4;


% Line along X - axis
% --------------------------------------------------------------Coil_6
x1_6_4 = -6 * g;
x2_6_4 = 6 * g;
a_yp_6_4 = 6 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_x_6_4 = x2_6_4 - x1_6_4;
k_p_6_4 = 1/(4*pi*((a_yp_6_4-Y).^2+Z.^2));
k_1xp_6_4 = (x2_6_4-X)./((x2_6_4-X).^2+(a_yp_6_4-Y).^2+Z.^2).^0.5;
k_2xp_6_4 = (x1_6_4-X)./((x1_6_4-X).^2+(a_yp_6_4-Y).^2+Z.^2).^0.5;

Hx_xp_6_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_6_4 = (-Z.*k_p_6_4.*(k_1xp_6_4 - k_2xp_6_4))*I;
Hz_xp_6_4 = (-(a_yp_6_4-Y).*k_p_6_4.*(k_1xp_6_4 - k_2xp_6_4))*I;

a_yn_6_4 = -6 * g - 22 * g;
k_n_6_4 = 1/(4*pi*((a_yn_6_4-Y).^2+Z.^2));
k_1xn_6_4 = (x2_6_4-X)./((x2_6_4-X).^2+(a_yn_6_4-Y).^2+Z.^2).^0.5;
k_2xn_6_4 = (x1_6_4-X)./((x1_6_4-X).^2+(a_yn_6_4-Y).^2+Z.^2).^0.5;

Hx_xn_6_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_6_4 = (Z.*k_n_6_4.*(k_1xn_6_4 - k_2xn_6_4))*I;
Hz_xn_6_4 = ((a_yn_6_4-Y).*k_n_6_4.*(k_1xn_6_4 - k_2xn_6_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_6_4 = -6 * g - 22 * g;
y2_6_4 = 6 * g - 22 * g;
a_xp_6_4 = 6 * g;          %Distance of coil from (0,0)
coil_length_y_6_4 = y2_6_4 - y1_6_4;

k_yp_6_4 = 1/(4*pi*((a_xp_6_4-X).^2+Z.^2));
k_1yp_6_4 = (y2_6_4-Y)./((y2_6_4-Y).^2+(a_xp_6_4-X).^2+Z.^2).^0.5;
k_2yp_6_4 = (y1_6_4-Y)./((y1_6_4-Y).^2+(a_xp_6_4-X).^2+Z.^2).^0.5;

Hx_yp_6_4 = -(Z.*k_yp_6_4.*(k_1yp_6_4 - k_2yp_6_4))*I;
Hy_yp_6_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_6_4 = (-(a_xp_6_4-X).*k_yp_6_4.*(k_1yp_6_4 - k_2yp_6_4))*I;

a_xn_6_4 = -6 * g;
k_yn_6_4 = 1/(4*pi*((a_xn_6_4-X).^2+Z.^2));
k_1yn_6_4 = (y2_6_4-Y)./((y2_6_4-Y).^2+(a_xn_6_4-X).^2+Z.^2).^0.5;
k_2yn_6_4 = (y1_6_4-Y)./((y1_6_4-Y).^2+(a_xn_6_4-X).^2+Z.^2).^0.5;

Hx_yn_6_4 = (Z.*k_yn_6_4.*(k_1yn_6_4 - k_2yn_6_4))*I;
Hy_yn_6_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_6_4 = ((a_xn_6_4-X).*k_yn_6_4.*(k_1yn_6_4 - k_2yn_6_4))*I;
%Adding field of Coil_6
Hx_6_4 = Hx_xp_6_4 + Hx_xn_6_4 + Hx_yp_6_4 + Hx_yn_6_4;
Hy_6_4 = Hy_xp_6_4 + Hy_xn_6_4 + Hy_yp_6_4 + Hy_yn_6_4;
Hz_6_4 = Hz_xp_6_4 + Hz_xn_6_4 + Hz_yp_6_4 + Hz_yn_6_4;


% Line along X - axis
% --------------------------------------------------------------Coil_7
x1_7_4 = -7 * g;
x2_7_4 = 7 * g;
a_yp_7_4 = 7 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_x_7_4 = x2_7_4 - x1_7_4;
k_p_7_4 = 1/(4*pi*((a_yp_7_4-Y).^2+Z.^2));
k_1xp_7_4 = (x2_7_4-X)./((x2_7_4-X).^2+(a_yp_7_4-Y).^2+Z.^2).^0.5;
k_2xp_7_4 = (x1_7_4-X)./((x1_7_4-X).^2+(a_yp_7_4-Y).^2+Z.^2).^0.5;

Hx_xp_7_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_7_4 = (-Z.*k_p_7_4.*(k_1xp_7_4 - k_2xp_7_4))*I;
Hz_xp_7_4 = (-(a_yp_7_4-Y).*k_p_7_4.*(k_1xp_7_4 - k_2xp_7_4))*I;

a_yn_7_4 = -7 * g - 22 * g;
k_n_7_4 = 1/(4*pi*((a_yn_7_4-Y).^2+Z.^2));
k_1xn_7_4 = (x2_7_4-X)./((x2_7_4-X).^2+(a_yn_7_4-Y).^2+Z.^2).^0.5;
k_2xn_7_4 = (x1_7_4-X)./((x1_7_4-X).^2+(a_yn_7_4-Y).^2+Z.^2).^0.5;

Hx_xn_7_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_7_4 = (Z.*k_n_7_4.*(k_1xn_7_4 - k_2xn_7_4))*I;
Hz_xn_7_4 = ((a_yn_7_4-Y).*k_n_7_4.*(k_1xn_7_4 - k_2xn_7_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_7_4 = -7 * g - 22 * g;
y2_7_4 = 7 * g - 22 * g;
a_xp_7_4 = 7 * g;          %Distance of coil from (0,0)
coil_length_y_7_4 = y2_7_4 - y1_7_4;

k_yp_7_4 = 1/(4*pi*((a_xp_7_4-X).^2+Z.^2));
k_1yp_7_4 = (y2_7_4-Y)./((y2_7_4-Y).^2+(a_xp_7_4-X).^2+Z.^2).^0.5;
k_2yp_7_4 = (y1_7_4-Y)./((y1_7_4-Y).^2+(a_xp_7_4-X).^2+Z.^2).^0.5;

Hx_yp_7_4 = -(Z.*k_yp_7_4.*(k_1yp_7_4 - k_2yp_7_4))*I;
Hy_yp_7_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_7_4 = (-(a_xp_7_4-X).*k_yp_7_4.*(k_1yp_7_4 - k_2yp_7_4))*I;

a_xn_7_4 = -7 * g;
k_yn_7_4 = 1/(4*pi*((a_xn_7_4-X).^2+Z.^2));
k_1yn_7_4 = (y2_7_4-Y)./((y2_7_4-Y).^2+(a_xn_7_4-X).^2+Z.^2).^0.5;
k_2yn_7_4 = (y1_7_4-Y)./((y1_7_4-Y).^2+(a_xn_7_4-X).^2+Z.^2).^0.5;

Hx_yn_7_4 = (Z.*k_yn_7_4.*(k_1yn_7_4 - k_2yn_7_4))*I;
Hy_yn_7_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_7_4 = ((a_xn_7_4-X).*k_yn_7_4.*(k_1yn_7_4 - k_2yn_7_4))*I;
%Adding field of Coil_7
Hx_7_4 = Hx_xp_7_4 + Hx_xn_7_4 + Hx_yp_7_4 + Hx_yn_7_4;
Hy_7_4 = Hy_xp_7_4 + Hy_xn_7_4 + Hy_yp_7_4 + Hy_yn_7_4;
Hz_7_4 = Hz_xp_7_4 + Hz_xn_7_4 + Hz_yp_7_4 + Hz_yn_7_4;


% Line along X - axis
% --------------------------------------------------------------Coil_8
x1_8_4 = -8 * g;
x2_8_4 = 8 * g;
a_yp_8_4 = 8 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_x_8_4 = x2_8_4 - x1_8_4;
k_p_8_4 = 1/(4*pi*((a_yp_8_4-Y).^2+Z.^2));
k_1xp_8_4 = (x2_8_4-X)./((x2_8_4-X).^2+(a_yp_8_4-Y).^2+Z.^2).^0.5;
k_2xp_8_4 = (x1_8_4-X)./((x1_8_4-X).^2+(a_yp_8_4-Y).^2+Z.^2).^0.5;

Hx_xp_8_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_8_4 = (-Z.*k_p_8_4.*(k_1xp_8_4 - k_2xp_8_4))*I;
Hz_xp_8_4 = (-(a_yp_8_4-Y).*k_p_8_4.*(k_1xp_8_4 - k_2xp_8_4))*I;

a_yn_8_4 = -8 * g - 22 * g;
k_n_8_4 = 1/(4*pi*((a_yn_8_4-Y).^2+Z.^2));
k_1xn_8_4 = (x2_8_4-X)./((x2_8_4-X).^2+(a_yn_8_4-Y).^2+Z.^2).^0.5;
k_2xn_8_4 = (x1_8_4-X)./((x1_8_4-X).^2+(a_yn_8_4-Y).^2+Z.^2).^0.5;

Hx_xn_8_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_8_4 = (Z.*k_n_8_4.*(k_1xn_8_4 - k_2xn_8_4))*I;
Hz_xn_8_4 = ((a_yn_8_4-Y).*k_n_8_4.*(k_1xn_8_4 - k_2xn_8_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_8_4 = -8 * g - 22 * g;
y2_8_4 = 8 * g - 22 * g;
a_xp_8_4 = 8 * g;          %Distance of coil from (0,0)
coil_length_y_8_4 = y2_8_4 - y1_8_4;

k_yp_8_4 = 1/(4*pi*((a_xp_8_4-X).^2+Z.^2));
k_1yp_8_4 = (y2_8_4-Y)./((y2_8_4-Y).^2+(a_xp_8_4-X).^2+Z.^2).^0.5;
k_2yp_8_4 = (y1_8_4-Y)./((y1_8_4-Y).^2+(a_xp_8_4-X).^2+Z.^2).^0.5;

Hx_yp_8_4 = -(Z.*k_yp_8_4.*(k_1yp_8_4 - k_2yp_8_4))*I;
Hy_yp_8_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_8_4 = (-(a_xp_8_4-X).*k_yp_8_4.*(k_1yp_8_4 - k_2yp_8_4))*I;

a_xn_8_4 = -8 * g;
k_yn_8_4 = 1/(4*pi*((a_xn_8_4-X).^2+Z.^2));
k_1yn_8_4 = (y2_8_4-Y)./((y2_8_4-Y).^2+(a_xn_8_4-X).^2+Z.^2).^0.5;
k_2yn_8_4 = (y1_8_4-Y)./((y1_8_4-Y).^2+(a_xn_8_4-X).^2+Z.^2).^0.5;

Hx_yn_8_4 = (Z.*k_yn_8_4.*(k_1yn_8_4 - k_2yn_8_4))*I;
Hy_yn_8_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_8_4 = ((a_xn_8_4-X).*k_yn_8_4.*(k_1yn_8_4 - k_2yn_8_4))*I;
%Adding field of Coil_8
Hx_8_4 = Hx_xp_8_4 + Hx_xn_8_4 + Hx_yp_8_4 + Hx_yn_8_4;
Hy_8_4 = Hy_xp_8_4 + Hy_xn_8_4 + Hy_yp_8_4 + Hy_yn_8_4;
Hz_8_4 = Hz_xp_8_4 + Hz_xn_8_4 + Hz_yp_8_4 + Hz_yn_8_4;



% Line along X - axis
% --------------------------------------------------------------Coil_9
x1_9_4 = -9 * g;
x2_9_4 = 9 * g;
a_yp_9_4 = 9 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_x_9_4 = x2_9_4 - x1_9_4;
k_p_9_4 = 1/(4*pi*((a_yp_9_4-Y).^2+Z.^2));
k_1xp_9_4 = (x2_9_4-X)./((x2_9_4-X).^2+(a_yp_9_4-Y).^2+Z.^2).^0.5;
k_2xp_9_4 = (x1_9_4-X)./((x1_9_4-X).^2+(a_yp_9_4-Y).^2+Z.^2).^0.5;

Hx_xp_9_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_9_4 = (-Z.*k_p_9_4.*(k_1xp_9_4 - k_2xp_9_4))*I;
Hz_xp_9_4 = (-(a_yp_9_4-Y).*k_p_9_4.*(k_1xp_9_4 - k_2xp_9_4))*I;

a_yn_9_4 = -9 * g - 22 * g;
k_n_9_4 = 1/(4*pi*((a_yn_9_4-Y).^2+Z.^2));
k_1xn_9_4 = (x2_9_4-X)./((x2_9_4-X).^2+(a_yn_9_4-Y).^2+Z.^2).^0.5;
k_2xn_9_4 = (x1_9_4-X)./((x1_9_4-X).^2+(a_yn_9_4-Y).^2+Z.^2).^0.5;

Hx_xn_9_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_9_4 = (Z.*k_n_9_4.*(k_1xn_9_4 - k_2xn_9_4))*I;
Hz_xn_9_4 = ((a_yn_9_4-Y).*k_n_9_4.*(k_1xn_9_4 - k_2xn_9_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_9_4 = -9 * g - 22 * g;
y2_9_4 = 9 * g - 22 * g;
a_xp_9_4 = 9 * g;          %Distance of coil from (0,0)
coil_length_y_9_4 = y2_9_4 - y1_9_4;

k_yp_9_4 = 1/(4*pi*((a_xp_9_4-X).^2+Z.^2));
k_1yp_9_4 = (y2_9_4-Y)./((y2_9_4-Y).^2+(a_xp_9_4-X).^2+Z.^2).^0.5;
k_2yp_9_4 = (y1_9_4-Y)./((y1_9_4-Y).^2+(a_xp_9_4-X).^2+Z.^2).^0.5;

Hx_yp_9_4 = -(Z.*k_yp_9_4.*(k_1yp_9_4 - k_2yp_9_4))*I;
Hy_yp_9_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_9_4 = (-(a_xp_9_4-X).*k_yp_9_4.*(k_1yp_9_4 - k_2yp_9_4))*I;

a_xn_9_4 = -9 * g;
k_yn_9_4 = 1/(4*pi*((a_xn_9_4-X).^2+Z.^2));
k_1yn_9_4 = (y2_9_4-Y)./((y2_9_4-Y).^2+(a_xn_9_4-X).^2+Z.^2).^0.5;
k_2yn_9_4 = (y1_9_4-Y)./((y1_9_4-Y).^2+(a_xn_9_4-X).^2+Z.^2).^0.5;

Hx_yn_9_4 = (Z.*k_yn_9_4.*(k_1yn_9_4 - k_2yn_9_4))*I;
Hy_yn_9_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_9_4 = ((a_xn_9_4-X).*k_yn_9_4.*(k_1yn_9_4 - k_2yn_9_4))*I;
%Adding field of Coil_9
Hx_9_4 = Hx_xp_9_4 + Hx_xn_9_4 + Hx_yp_9_4 + Hx_yn_9_4;
Hy_9_4 = Hy_xp_9_4 + Hy_xn_9_4 + Hy_yp_9_4 + Hy_yn_9_4;
Hz_9_4 = Hz_xp_9_4 + Hz_xn_9_4 + Hz_yp_9_4 + Hz_yn_9_4;


% Line along X - axis
% --------------------------------------------------------------Coil_10
x1__10_4 = -10 * g;
x2__10_4 = 10 * g;
a_yp__10_4 = 10 * g - 22 * g;          %Distance of coil from (0,0)
coil_length_x__10_4 = x2__10_4 - x1__10_4;
k_p__10_4 = 1/(4*pi*((a_yp__10_4-Y).^2+Z.^2));
k_1xp__10_4 = (x2__10_4-X)./((x2__10_4-X).^2+(a_yp__10_4-Y).^2+Z.^2).^0.5;
k_2xp__10_4 = (x1__10_4-X)./((x1__10_4-X).^2+(a_yp__10_4-Y).^2+Z.^2).^0.5;

Hx_xp__10_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp__10_4 = (-Z.*k_p__10_4.*(k_1xp__10_4 - k_2xp__10_4))*I;
Hz_xp__10_4 = (-(a_yp__10_4-Y).*k_p__10_4.*(k_1xp__10_4 - k_2xp__10_4))*I;

a_yn__10_4 = -10 * g - 22 * g; 
k_n__10_4 = 1/(4*pi*((a_yn__10_4-Y).^2+Z.^2));
k_1xn__10_4 = (x2__10_4-X)./((x2__10_4-X).^2+(a_yn__10_4-Y).^2+Z.^2).^0.5;
k_2xn__10_4 = (x1__10_4-X)./((x1__10_4-X).^2+(a_yn__10_4-Y).^2+Z.^2).^0.5;

Hx_xn__10_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn__10_4 = (Z.*k_n__10_4.*(k_1xn__10_4 - k_2xn__10_4))*I;
Hz_xn__10_4 = ((a_yn__10_4-Y).*k_n__10_4.*(k_1xn__10_4 - k_2xn__10_4))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1__10_4 = -10 * g - 22 * g;
y2__10_4 = 10 * g - 22 * g;
a_xp__10_4 = 10 * g;          %Distance of coil from (0,0)
coil_length_y__10_4 = y2__10_4 - y1__10_4;

k_yp__10_4 = 1/(4*pi*((a_xp__10_4-X).^2+Z.^2));
k_1yp__10_4 = (y2__10_4-Y)./((y2__10_4-Y).^2+(a_xp__10_4-X).^2+Z.^2).^0.5;
k_2yp__10_4 = (y1__10_4-Y)./((y1__10_4-Y).^2+(a_xp__10_4-X).^2+Z.^2).^0.5;

Hx_yp__10_4 = -(Z.*k_yp__10_4.*(k_1yp__10_4 - k_2yp__10_4))*I;
Hy_yp__10_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp__10_4 = (-(a_xp__10_4-X).*k_yp__10_4.*(k_1yp__10_4 - k_2yp__10_4))*I;

a_xn__10_4 = -10 * g;
k_yn__10_4 = 1/(4*pi*((a_xn__10_4-X).^2+Z.^2));
k_1yn__10_4 = (y2__10_4-Y)./((y2__10_4-Y).^2+(a_xn__10_4-X).^2+Z.^2).^0.5;
k_2yn__10_4 = (y1__10_4-Y)./((y1__10_4-Y).^2+(a_xn__10_4-X).^2+Z.^2).^0.5;

Hx_yn__10_4 = (Z.*k_yn__10_4.*(k_1yn__10_4 - k_2yn__10_4))*I;
Hy_yn__10_4 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn__10_4 = ((a_xn__10_4-X).*k_yn__10_4.*(k_1yn__10_4 - k_2yn__10_4))*I;
%Adding field of Coil_10
Hx__10_4 = Hx_xp__10_4 + Hx_xn__10_4 + Hx_yp__10_4 + Hx_yn__10_4;
Hy__10_4 = Hy_xp__10_4 + Hy_xn__10_4 + Hy_yp__10_4 + Hy_yn__10_4;
Hz__10_4 = Hz_xp__10_4 + Hz_xn__10_4 + Hz_yp__10_4 + Hz_yn__10_4;


% ----Adding all coil fields----
HX_4 = Hx_1_4 + Hx_2_4 + Hx_3_4 + Hx_4_4 + Hx_5_4 + Hx_6_4 + Hx_7_4 + Hx_8_4 + Hx_9_4 + Hx__10_4;
HY_4 = Hy_1_4 + Hy_2_4 + Hy_3_4 + Hy_4_4 + Hy_5_4 + Hy_6_4 + Hy_7_4 + Hy_8_4 + Hy_9_4 + Hy__10_4;
HZ_4 = Hz_1_4 + Hz_2_4 + Hz_3_4 + Hz_4_4 + Hz_5_4 + Hz_6_4 + Hz_7_4 + Hz_8_4 + Hz_9_4 + Hz__10_4;
%}

%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 5th 10 turn coil field data
%-%--------%--------%--------%--------%--------%--------%--------%--------
%
% Line along X - axis
% --------------------------------------------------------------Coil_1
x1_1_5 = -g;
x2_1_5 = g;
a_yp_1_5 = g + 22 * g;          %Distance of coil from (0,0)
coil_length_x_1_5 = x2_1_5 - x1_1_5;
k_p_1_5 = 1/(4*pi*((a_yp_1_5-Y).^2+Z.^2));
k_1xp_1_5 = (x2_1_5-X)./((x2_1_5-X).^2+(a_yp_1_5-Y).^2+Z.^2).^0.5;
k_2xp_1_5 = (x1_1_5-X)./((x1_1_5-X).^2+(a_yp_1_5-Y).^2+Z.^2).^0.5;

Hx_xp_1_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_1_5 = (-Z.*k_p_1_5.*(k_1xp_1_5 - k_2xp_1_5))*I;
Hz_xp_1_5 = (-(a_yp_1_5-Y).*k_p_1_5.*(k_1xp_1_5 - k_2xp_1_5))*I;

a_yn_1_5 = -g + 22 * g;
k_n_1_5 = 1/(4*pi*((a_yn_1_5-Y).^2+Z.^2));
k_1xn_1_5 = (x2_1_5-X)./((x2_1_5-X).^2+(a_yn_1_5-Y).^2+Z.^2).^0.5;
k_2xn_1_5 = (x1_1_5-X)./((x1_1_5-X).^2+(a_yn_1_5-Y).^2+Z.^2).^0.5;

Hx_xn_1_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_1_5 = (Z.*k_n_1_5.*(k_1xn_1_5 - k_2xn_1_5))*I;
Hz_xn_1_5 = ((a_yn_1_5-Y).*k_n_1_5.*(k_1xn_1_5 - k_2xn_1_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_1_5 = -g + 22 * g;
y2_1_5 = g+ 22 * g;
a_xp_1_5 = g;          %Distance of coil from (0,0)
coil_length_y_1_5 = y2_1_5 - y1_1_5;

k_yp_1_5 = 1/(4*pi*((a_xp_1_5-X).^2+Z.^2));
k_1yp_1_5 = (y2_1_5-Y)./((y2_1_5-Y).^2+(a_xp_1_5-X).^2+Z.^2).^0.5;
k_2yp_1_5 = (y1_1_5-Y)./((y1_1_5-Y).^2+(a_xp_1_5-X).^2+Z.^2).^0.5;

Hx_yp_1_5 = -(Z.*k_yp_1_5.*(k_1yp_1_5 - k_2yp_1_5))*I;
Hy_yp_1_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_1_5 = (-(a_xp_1_5-X).*k_yp_1_5.*(k_1yp_1_5 - k_2yp_1_5))*I;

a_xn_1_5 = -g;
k_yn_1_5 = 1/(4*pi*((a_xn_1_5-X).^2+Z.^2));
k_1yn_1_5 = (y2_1_5-Y)./((y2_1_5-Y).^2+(a_xn_1_5-X).^2+Z.^2).^0.5;
k_2yn_1_5 = (y1_1_5-Y)./((y1_1_5-Y).^2+(a_xn_1_5-X).^2+Z.^2).^0.5;

Hx_yn_1_5 = (Z.*k_yn_1_5.*(k_1yn_1_5 - k_2yn_1_5))*I;
Hy_yn_1_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_1_5 = ((a_xn_1_5-X).*k_yn_1_5.*(k_1yn_1_5 - k_2yn_1_5))*I;


% Adding field of the coil
Hx_1_5 = Hx_xp_1_5 + Hx_xn_1_5 + Hx_yp_1_5 + Hx_yn_1_5;
Hy_1_5 = Hy_xp_1_5 + Hy_xn_1_5 + Hy_yp_1_5 + Hy_yn_1_5;
Hz_1_5 = Hz_xp_1_5 + Hz_xn_1_5 + Hz_yp_1_5 + Hz_yn_1_5;



% --------------------------------------------------------------Coil_2
x1_2_5 = -2 * g;
x2_2_5 = 2 * g;
a_yp_2_5 = 2 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_x_2_5 = x2_2_5 - x1_2_5;
k_p_2_5 = 1/(4*pi*((a_yp_2_5-Y).^2+Z.^2));
k_1xp_2_5 = (x2_2_5-X)./((x2_2_5-X).^2+(a_yp_2_5-Y).^2+Z.^2).^0.5;
k_2xp_2_5 = (x1_2_5-X)./((x1_2_5-X).^2+(a_yp_2_5-Y).^2+Z.^2).^0.5;

Hx_xp_2_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_2_5 = (-Z.*k_p_2_5.*(k_1xp_2_5 - k_2xp_2_5))*I;
Hz_xp_2_5 = (-(a_yp_2_5-Y).*k_p_2_5.*(k_1xp_2_5 - k_2xp_2_5))*I;

a_yn_2_5 = -2 * g + 22 * g;
k_n_2_5 = 1/(4*pi*((a_yn_2_5-Y).^2+Z.^2));
k_1xn_2_5 = (x2_2_5-X)./((x2_2_5-X).^2+(a_yn_2_5-Y).^2+Z.^2).^0.5;
k_2xn_2_5 = (x1_2_5-X)./((x1_2_5-X).^2+(a_yn_2_5-Y).^2+Z.^2).^0.5;

Hx_xn_2_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_2_5 = (Z.*k_n_2_5.*(k_1xn_2_5 - k_2xn_2_5))*I;
Hz_xn_2_5 = ((a_yn_2_5-Y).*k_n_2_5.*(k_1xn_2_5 - k_2xn_2_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_2_5 = -2 * g + 22 * g;
y2_2_5 = 2 * g + 22 * g;
a_xp_2_5 = 2 * g;          %Distance of coil from (0,0)
coil_length_y_2_5 = y2_2_5 - y1_2_5;

k_yp_2_5 = 1/(4*pi*((a_xp_2_5-X).^2+Z.^2));
k_1yp_2_5 = (y2_2_5-Y)./((y2_2_5-Y).^2+(a_xp_2_5-X).^2+Z.^2).^0.5;
k_2yp_2_5 = (y1_2_5-Y)./((y1_2_5-Y).^2+(a_xp_2_5-X).^2+Z.^2).^0.5;

Hx_yp_2_5 = -(Z.*k_yp_2_5.*(k_1yp_2_5 - k_2yp_2_5))*I;
Hy_yp_2_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_2_5 = (-(a_xp_2_5-X).*k_yp_2_5.*(k_1yp_2_5 - k_2yp_2_5))*I;

a_xn_2_5 = -2 * g;
k_yn_2_5 = 1/(4*pi*((a_xn_2_5-X).^2+Z.^2));
k_1yn_2_5 = (y2_2_5-Y)./((y2_2_5-Y).^2+(a_xn_2_5-X).^2+Z.^2).^0.5;
k_2yn_2_5 = (y1_2_5-Y)./((y1_2_5-Y).^2+(a_xn_2_5-X).^2+Z.^2).^0.5;

Hx_yn_2_5 = (Z.*k_yn_2_5.*(k_1yn_2_5 - k_2yn_2_5))*I;
Hy_yn_2_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_2_5 = ((a_xn_2_5-X).*k_yn_2_5.*(k_1yn_2_5 - k_2yn_2_5))*I;
%Adding field of Coil_2
Hx_2_5 = Hx_xp_2_5 + Hx_xn_2_5 + Hx_yp_2_5 + Hx_yn_2_5;
Hy_2_5 = Hy_xp_2_5 + Hy_xn_2_5 + Hy_yp_2_5 + Hy_yn_2_5;
Hz_2_5 = Hz_xp_2_5 + Hz_xn_2_5 + Hz_yp_2_5 + Hz_yn_2_5;


% Line along X - axis
% --------------------------------------------------------------Coil_3
x1_3_5 = -3 * g;
x2_3_5 = 3 * g;
a_yp_3_5 = 3 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_x_3_5 = x2_3_5 - x1_3_5;
k_p_3_5 = 1/(4*pi*((a_yp_3_5-Y).^2+Z.^2));
k_1xp_3_5 = (x2_3_5-X)./((x2_3_5-X).^2+(a_yp_3_5-Y).^2+Z.^2).^0.5;
k_2xp_3_5 = (x1_3_5-X)./((x1_3_5-X).^2+(a_yp_3_5-Y).^2+Z.^2).^0.5;

Hx_xp_3_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_3_5 = (-Z.*k_p_3_5.*(k_1xp_3_5 - k_2xp_3_5))*I;
Hz_xp_3_5 = (-(a_yp_3_5-Y).*k_p_3_5.*(k_1xp_3_5 - k_2xp_3_5))*I;

a_yn_3_5 = -3 * g + 22 * g;
k_n_3_5 = 1/(4*pi*((a_yn_3_5-Y).^2+Z.^2));
k_1xn_3_5 = (x2_3_5-X)./((x2_3_5-X).^2+(a_yn_3_5-Y).^2+Z.^2).^0.5;
k_2xn_3_5 = (x1_3_5-X)./((x1_3_5-X).^2+(a_yn_3_5-Y).^2+Z.^2).^0.5;

Hx_xn_3_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_3_5 = (Z.*k_n_3_5.*(k_1xn_3_5 - k_2xn_3_5))*I;
Hz_xn_3_5 = ((a_yn_3_5-Y).*k_n_3_5.*(k_1xn_3_5 - k_2xn_3_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_3_5 = -3 * g + 22 * g;
y2_3_5 = 3 * g + 22 * g;
a_xp_3_5 = 3 * g;          %Distance of coil from (0,0)
coil_length_y_3_5 = y2_3_5 - y1_3_5;

k_yp_3_5 = 1/(4*pi*((a_xp_3_5-X).^2+Z.^2));
k_1yp_3_5 = (y2_3_5-Y)./((y2_3_5-Y).^2+(a_xp_3_5-X).^2+Z.^2).^0.5;
k_2yp_3_5 = (y1_3_5-Y)./((y1_3_5-Y).^2+(a_xp_3_5-X).^2+Z.^2).^0.5;

Hx_yp_3_5 = -(Z.*k_yp_3_5.*(k_1yp_3_5 - k_2yp_3_5))*I;
Hy_yp_3_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_3_5 = (-(a_xp_3_5-X).*k_yp_3_5.*(k_1yp_3_5 - k_2yp_3_5))*I;

a_xn_3_5 = -3 * g;
k_yn_3_5 = 1/(4*pi*((a_xn_3_5-X).^2+Z.^2));
k_1yn_3_5 = (y2_3_5-Y)./((y2_3_5-Y).^2+(a_xn_3_5-X).^2+Z.^2).^0.5;
k_2yn_3_5 = (y1_3_5-Y)./((y1_3_5-Y).^2+(a_xn_3_5-X).^2+Z.^2).^0.5;

Hx_yn_3_5 = (Z.*k_yn_3_5.*(k_1yn_3_5 - k_2yn_3_5))*I;
Hy_yn_3_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_3_5 = ((a_xn_3_5-X).*k_yn_3_5.*(k_1yn_3_5 - k_2yn_3_5))*I;
%Adding field of Coil_3
Hx_3_5 = Hx_xp_3_5 + Hx_xn_3_5 + Hx_yp_3_5 + Hx_yn_3_5;
Hy_3_5 = Hy_xp_3_5 + Hy_xn_3_5 + Hy_yp_3_5 + Hy_yn_3_5;
Hz_3_5 = Hz_xp_3_5 + Hz_xn_3_5 + Hz_yp_3_5 + Hz_yn_3_5;


% Line along X - axis
% --------------------------------------------------------------Coil_4
x1_4_5 = -4 * g;
x2_4_5 = 4 * g;
a_yp_4_5 = 4 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_x_4_5 = x2_4_5 - x1_4_5;
k_p_4_5 = 1/(4*pi*((a_yp_4_5-Y).^2+Z.^2));
k_1xp_4_5 = (x2_4_5-X)./((x2_4_5-X).^2+(a_yp_4_5-Y).^2+Z.^2).^0.5;
k_2xp_4_5 = (x1_4_5-X)./((x1_4_5-X).^2+(a_yp_4_5-Y).^2+Z.^2).^0.5;

Hx_xp_4_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_4_5 = (-Z.*k_p_4_5.*(k_1xp_4_5 - k_2xp_4_5))*I;
Hz_xp_4_5 = (-(a_yp_4_5-Y).*k_p_4_5.*(k_1xp_4_5 - k_2xp_4_5))*I;

a_yn_4_5 = -4 * g + 22 * g;
k_n_4_5 = 1/(4*pi*((a_yn_4_5-Y).^2+Z.^2));
k_1xn_4_5 = (x2_4_5-X)./((x2_4_5-X).^2+(a_yn_4_5-Y).^2+Z.^2).^0.5;
k_2xn_4_5 = (x1_4_5-X)./((x1_4_5-X).^2+(a_yn_4_5-Y).^2+Z.^2).^0.5;

Hx_xn_4_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_4_5 = (Z.*k_n_4_5.*(k_1xn_4_5 - k_2xn_4_5))*I;
Hz_xn_4_5 = ((a_yn_4_5-Y).*k_n_4_5.*(k_1xn_4_5 - k_2xn_4_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_4_5 = -4 * g + 22 * g;
y2_4_5 = 4 * g + 22 * g;
a_xp_4_5 = 4 * g;          %Distance of coil from (0,0)
coil_length_y_4_5 = y2_4_5 - y1_4_5;

k_yp_4_5 = 1/(4*pi*((a_xp_4_5-X).^2+Z.^2));
k_1yp_4_5 = (y2_4_5-Y)./((y2_4_5-Y).^2+(a_xp_4_5-X).^2+Z.^2).^0.5;
k_2yp_4_5 = (y1_4_5-Y)./((y1_4_5-Y).^2+(a_xp_4_5-X).^2+Z.^2).^0.5;

Hx_yp_4_5 = -(Z.*k_yp_4_5.*(k_1yp_4_5 - k_2yp_4_5))*I;
Hy_yp_4_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_4_5 = (-(a_xp_4_5-X).*k_yp_4_5.*(k_1yp_4_5 - k_2yp_4_5))*I;

a_xn_4_5 = -4 * g;
k_yn_4_5 = 1/(4*pi*((a_xn_4_5-X).^2+Z.^2));
k_1yn_4_5 = (y2_4_5-Y)./((y2_4_5-Y).^2+(a_xn_4_5-X).^2+Z.^2).^0.5;
k_2yn_4_5 = (y1_4_5-Y)./((y1_4_5-Y).^2+(a_xn_4_5-X).^2+Z.^2).^0.5;

Hx_yn_4_5 = (Z.*k_yn_4_5.*(k_1yn_4_5 - k_2yn_4_5))*I;
Hy_yn_4_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_4_5 = ((a_xn_4_5-X).*k_yn_4_5.*(k_1yn_4_5 - k_2yn_4_5))*I;
%Adding field of Coil_4
Hx_4_5 = Hx_xp_4_5 + Hx_xn_4_5 + Hx_yp_4_5 + Hx_yn_4_5;
Hy_4_5 = Hy_xp_4_5 + Hy_xn_4_5 + Hy_yp_4_5 + Hy_yn_4_5;
Hz_4_5 = Hz_xp_4_5 + Hz_xn_4_5 + Hz_yp_4_5 + Hz_yn_4_5;


% Line along X - axis
% --------------------------------------------------------------Coil_5
x1_5_5 = -5 * g;
x2_5_5 = 5 * g;
a_yp_5_5 = 5 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_x_5_5 = x2_5_5 - x1_5_5;
k_p_5_5 = 1/(4*pi*((a_yp_5_5-Y).^2+Z.^2));
k_1xp_5_5 = (x2_5_5-X)./((x2_5_5-X).^2+(a_yp_5_5-Y).^2+Z.^2).^0.5;
k_2xp_5_5 = (x1_5_5-X)./((x1_5_5-X).^2+(a_yp_5_5-Y).^2+Z.^2).^0.5;

Hx_xp_5_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_5_5 = (-Z.*k_p_5_5.*(k_1xp_5_5 - k_2xp_5_5))*I;
Hz_xp_5_5 = (-(a_yp_5_5-Y).*k_p_5_5.*(k_1xp_5_5 - k_2xp_5_5))*I;

a_yn_5_5 = -5 * g + 22 * g;
k_n_5_5 = 1/(4*pi*((a_yn_5_5-Y).^2+Z.^2));
k_1xn_5_5 = (x2_5_5-X)./((x2_5_5-X).^2+(a_yn_5_5-Y).^2+Z.^2).^0.5;
k_2xn_5_5 = (x1_5_5-X)./((x1_5_5-X).^2+(a_yn_5_5-Y).^2+Z.^2).^0.5;

Hx_xn_5_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_5_5 = (Z.*k_n_5_5.*(k_1xn_5_5 - k_2xn_5_5))*I;
Hz_xn_5_5 = ((a_yn_5_5-Y).*k_n_5_5.*(k_1xn_5_5 - k_2xn_5_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_5_5 = -5 * g + 22 * g;
y2_5_5 = 5 * g + 22 * g;
a_xp_5_5 = 5 * g;          %Distance of coil from (0,0)
coil_length_y_5_5 = y2_5_5 - y1_5_5;

k_yp_5_5 = 1/(4*pi*((a_xp_5_5-X).^2+Z.^2));
k_1yp_5_5 = (y2_5_5-Y)./((y2_5_5-Y).^2+(a_xp_5_5-X).^2+Z.^2).^0.5;
k_2yp_5_5 = (y1_5_5-Y)./((y1_5_5-Y).^2+(a_xp_5_5-X).^2+Z.^2).^0.5;

Hx_yp_5_5 = -(Z.*k_yp_5_5.*(k_1yp_5_5 - k_2yp_5_5))*I;
Hy_yp_5_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_5_5 = (-(a_xp_5_5-X).*k_yp_5_5.*(k_1yp_5_5 - k_2yp_5_5))*I;

a_xn_5_5 = -5 * g;
k_yn_5_5 = 1/(4*pi*((a_xn_5_5-X).^2+Z.^2));
k_1yn_5_5 = (y2_5_5-Y)./((y2_5_5-Y).^2+(a_xn_5_5-X).^2+Z.^2).^0.5;
k_2yn_5_5 = (y1_5_5-Y)./((y1_5_5-Y).^2+(a_xn_5_5-X).^2+Z.^2).^0.5;

Hx_yn_5_5 = (Z.*k_yn_5_5.*(k_1yn_5_5 - k_2yn_5_5))*I;
Hy_yn_5_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_5_5 = ((a_xn_5_5-X).*k_yn_5_5.*(k_1yn_5_5 - k_2yn_5_5))*I;
%Adding field of Coil_5
Hx_5_5 = Hx_xp_5_5 + Hx_xn_5_5 + Hx_yp_5_5 + Hx_yn_5_5;
Hy_5_5 = Hy_xp_5_5 + Hy_xn_5_5 + Hy_yp_5_5 + Hy_yn_5_5;
Hz_5_5 = Hz_xp_5_5 + Hz_xn_5_5 + Hz_yp_5_5 + Hz_yn_5_5;


% Line along X - axis
% --------------------------------------------------------------Coil_6
x1_6_5 = -6 * g;
x2_6_5 = 6 * g;
a_yp_6_5 = 6 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_x_6_5 = x2_6_5 - x1_6_5;
k_p_6_5 = 1/(4*pi*((a_yp_6_5-Y).^2+Z.^2));
k_1xp_6_5 = (x2_6_5-X)./((x2_6_5-X).^2+(a_yp_6_5-Y).^2+Z.^2).^0.5;
k_2xp_6_5 = (x1_6_5-X)./((x1_6_5-X).^2+(a_yp_6_5-Y).^2+Z.^2).^0.5;

Hx_xp_6_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_6_5 = (-Z.*k_p_6_5.*(k_1xp_6_5 - k_2xp_6_5))*I;
Hz_xp_6_5 = (-(a_yp_6_5-Y).*k_p_6_5.*(k_1xp_6_5 - k_2xp_6_5))*I;

a_yn_6_5 = -6 * g + 22 * g;
k_n_6_5 = 1/(4*pi*((a_yn_6_5-Y).^2+Z.^2));
k_1xn_6_5 = (x2_6_5-X)./((x2_6_5-X).^2+(a_yn_6_5-Y).^2+Z.^2).^0.5;
k_2xn_6_5 = (x1_6_5-X)./((x1_6_5-X).^2+(a_yn_6_5-Y).^2+Z.^2).^0.5;

Hx_xn_6_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_6_5 = (Z.*k_n_6_5.*(k_1xn_6_5 - k_2xn_6_5))*I;
Hz_xn_6_5 = ((a_yn_6_5-Y).*k_n_6_5.*(k_1xn_6_5 - k_2xn_6_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_6_5 = -6 * g + 22 * g;
y2_6_5 = 6 * g + 22 * g;
a_xp_6_5 = 6 * g;          %Distance of coil from (0,0)
coil_length_y_6_5 = y2_6_5 - y1_6_5;

k_yp_6_5 = 1/(4*pi*((a_xp_6_5-X).^2+Z.^2));
k_1yp_6_5 = (y2_6_5-Y)./((y2_6_5-Y).^2+(a_xp_6_5-X).^2+Z.^2).^0.5;
k_2yp_6_5 = (y1_6_5-Y)./((y1_6_5-Y).^2+(a_xp_6_5-X).^2+Z.^2).^0.5;

Hx_yp_6_5 = -(Z.*k_yp_6_5.*(k_1yp_6_5 - k_2yp_6_5))*I;
Hy_yp_6_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_6_5 = (-(a_xp_6_5-X).*k_yp_6_5.*(k_1yp_6_5 - k_2yp_6_5))*I;

a_xn_6_5 = -6 * g;
k_yn_6_5 = 1/(4*pi*((a_xn_6_5-X).^2+Z.^2));
k_1yn_6_5 = (y2_6_5-Y)./((y2_6_5-Y).^2+(a_xn_6_5-X).^2+Z.^2).^0.5;
k_2yn_6_5 = (y1_6_5-Y)./((y1_6_5-Y).^2+(a_xn_6_5-X).^2+Z.^2).^0.5;

Hx_yn_6_5 = (Z.*k_yn_6_5.*(k_1yn_6_5 - k_2yn_6_5))*I;
Hy_yn_6_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_6_5 = ((a_xn_6_5-X).*k_yn_6_5.*(k_1yn_6_5 - k_2yn_6_5))*I;
%Adding field of Coil_6
Hx_6_5 = Hx_xp_6_5 + Hx_xn_6_5 + Hx_yp_6_5 + Hx_yn_6_5;
Hy_6_5 = Hy_xp_6_5 + Hy_xn_6_5 + Hy_yp_6_5 + Hy_yn_6_5;
Hz_6_5 = Hz_xp_6_5 + Hz_xn_6_5 + Hz_yp_6_5 + Hz_yn_6_5;


% Line along X - axis
% --------------------------------------------------------------Coil_7
x1_7_5 = -7 * g;
x2_7_5 = 7 * g;
a_yp_7_5 = 7 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_x_7_5 = x2_7_5 - x1_7_5;
k_p_7_5 = 1/(4*pi*((a_yp_7_5-Y).^2+Z.^2));
k_1xp_7_5 = (x2_7_5-X)./((x2_7_5-X).^2+(a_yp_7_5-Y).^2+Z.^2).^0.5;
k_2xp_7_5 = (x1_7_5-X)./((x1_7_5-X).^2+(a_yp_7_5-Y).^2+Z.^2).^0.5;

Hx_xp_7_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_7_5 = (-Z.*k_p_7_5.*(k_1xp_7_5 - k_2xp_7_5))*I;
Hz_xp_7_5 = (-(a_yp_7_5-Y).*k_p_7_5.*(k_1xp_7_5 - k_2xp_7_5))*I;

a_yn_7_5 = -7 * g + 22 * g;
k_n_7_5 = 1/(4*pi*((a_yn_7_5-Y).^2+Z.^2));
k_1xn_7_5 = (x2_7_5-X)./((x2_7_5-X).^2+(a_yn_7_5-Y).^2+Z.^2).^0.5;
k_2xn_7_5 = (x1_7_5-X)./((x1_7_5-X).^2+(a_yn_7_5-Y).^2+Z.^2).^0.5;

Hx_xn_7_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_7_5 = (Z.*k_n_7_5.*(k_1xn_7_5 - k_2xn_7_5))*I;
Hz_xn_7_5 = ((a_yn_7_5-Y).*k_n_7_5.*(k_1xn_7_5 - k_2xn_7_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_7_5 = -7 * g + 22 * g;
y2_7_5 = 7 * g + 22 * g;
a_xp_7_5 = 7 * g;          %Distance of coil from (0,0)
coil_length_y_7_5 = y2_7_5 - y1_7_5;

k_yp_7_5 = 1/(4*pi*((a_xp_7_5-X).^2+Z.^2));
k_1yp_7_5 = (y2_7_5-Y)./((y2_7_5-Y).^2+(a_xp_7_5-X).^2+Z.^2).^0.5;
k_2yp_7_5 = (y1_7_5-Y)./((y1_7_5-Y).^2+(a_xp_7_5-X).^2+Z.^2).^0.5;

Hx_yp_7_5 = -(Z.*k_yp_7_5.*(k_1yp_7_5 - k_2yp_7_5))*I;
Hy_yp_7_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_7_5 = (-(a_xp_7_5-X).*k_yp_7_5.*(k_1yp_7_5 - k_2yp_7_5))*I;

a_xn_7_5 = -7 * g;
k_yn_7_5 = 1/(4*pi*((a_xn_7_5-X).^2+Z.^2));
k_1yn_7_5 = (y2_7_5-Y)./((y2_7_5-Y).^2+(a_xn_7_5-X).^2+Z.^2).^0.5;
k_2yn_7_5 = (y1_7_5-Y)./((y1_7_5-Y).^2+(a_xn_7_5-X).^2+Z.^2).^0.5;

Hx_yn_7_5 = (Z.*k_yn_7_5.*(k_1yn_7_5 - k_2yn_7_5))*I;
Hy_yn_7_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_7_5 = ((a_xn_7_5-X).*k_yn_7_5.*(k_1yn_7_5 - k_2yn_7_5))*I;
%Adding field of Coil_7
Hx_7_5 = Hx_xp_7_5 + Hx_xn_7_5 + Hx_yp_7_5 + Hx_yn_7_5;
Hy_7_5 = Hy_xp_7_5 + Hy_xn_7_5 + Hy_yp_7_5 + Hy_yn_7_5;
Hz_7_5 = Hz_xp_7_5 + Hz_xn_7_5 + Hz_yp_7_5 + Hz_yn_7_5;


% Line along X - axis
% --------------------------------------------------------------Coil_8
x1_8_5 = -8 * g;
x2_8_5 = 8 * g;
a_yp_8_5 = 8 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_x_8_5 = x2_8_5 - x1_8_5;
k_p_8_5 = 1/(4*pi*((a_yp_8_5-Y).^2+Z.^2));
k_1xp_8_5 = (x2_8_5-X)./((x2_8_5-X).^2+(a_yp_8_5-Y).^2+Z.^2).^0.5;
k_2xp_8_5 = (x1_8_5-X)./((x1_8_5-X).^2+(a_yp_8_5-Y).^2+Z.^2).^0.5;

Hx_xp_8_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_8_5 = (-Z.*k_p_8_5.*(k_1xp_8_5 - k_2xp_8_5))*I;
Hz_xp_8_5 = (-(a_yp_8_5-Y).*k_p_8_5.*(k_1xp_8_5 - k_2xp_8_5))*I;

a_yn_8_5 = -8 * g + 22 * g;
k_n_8_5 = 1/(4*pi*((a_yn_8_5-Y).^2+Z.^2));
k_1xn_8_5 = (x2_8_5-X)./((x2_8_5-X).^2+(a_yn_8_5-Y).^2+Z.^2).^0.5;
k_2xn_8_5 = (x1_8_5-X)./((x1_8_5-X).^2+(a_yn_8_5-Y).^2+Z.^2).^0.5;

Hx_xn_8_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_8_5 = (Z.*k_n_8_5.*(k_1xn_8_5 - k_2xn_8_5))*I;
Hz_xn_8_5 = ((a_yn_8_5-Y).*k_n_8_5.*(k_1xn_8_5 - k_2xn_8_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_8_5 = -8 * g + 22 * g;
y2_8_5 = 8 * g + 22 * g;
a_xp_8_5 = 8 * g;          %Distance of coil from (0,0)
coil_length_y_8_5 = y2_8_5 - y1_8_5;

k_yp_8_5 = 1/(4*pi*((a_xp_8_5-X).^2+Z.^2));
k_1yp_8_5 = (y2_8_5-Y)./((y2_8_5-Y).^2+(a_xp_8_5-X).^2+Z.^2).^0.5;
k_2yp_8_5 = (y1_8_5-Y)./((y1_8_5-Y).^2+(a_xp_8_5-X).^2+Z.^2).^0.5;

Hx_yp_8_5 = -(Z.*k_yp_8_5.*(k_1yp_8_5 - k_2yp_8_5))*I;
Hy_yp_8_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_8_5 = (-(a_xp_8_5-X).*k_yp_8_5.*(k_1yp_8_5 - k_2yp_8_5))*I;

a_xn_8_5 = -8 * g;
k_yn_8_5 = 1/(4*pi*((a_xn_8_5-X).^2+Z.^2));
k_1yn_8_5 = (y2_8_5-Y)./((y2_8_5-Y).^2+(a_xn_8_5-X).^2+Z.^2).^0.5;
k_2yn_8_5 = (y1_8_5-Y)./((y1_8_5-Y).^2+(a_xn_8_5-X).^2+Z.^2).^0.5;

Hx_yn_8_5 = (Z.*k_yn_8_5.*(k_1yn_8_5 - k_2yn_8_5))*I;
Hy_yn_8_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_8_5 = ((a_xn_8_5-X).*k_yn_8_5.*(k_1yn_8_5 - k_2yn_8_5))*I;
%Adding field of Coil_8
Hx_8_5 = Hx_xp_8_5 + Hx_xn_8_5 + Hx_yp_8_5 + Hx_yn_8_5;
Hy_8_5 = Hy_xp_8_5 + Hy_xn_8_5 + Hy_yp_8_5 + Hy_yn_8_5;
Hz_8_5 = Hz_xp_8_5 + Hz_xn_8_5 + Hz_yp_8_5 + Hz_yn_8_5;



% Line along X - axis
% --------------------------------------------------------------Coil_9
x1_9_5 = -9 * g;
x2_9_5 = 9 * g;
a_yp_9_5 = 9 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_x_9_5 = x2_9_5 - x1_9_5;
k_p_9_5 = 1/(4*pi*((a_yp_9_5-Y).^2+Z.^2));
k_1xp_9_5 = (x2_9_5-X)./((x2_9_5-X).^2+(a_yp_9_5-Y).^2+Z.^2).^0.5;
k_2xp_9_5 = (x1_9_5-X)./((x1_9_5-X).^2+(a_yp_9_5-Y).^2+Z.^2).^0.5;

Hx_xp_9_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp_9_5 = (-Z.*k_p_9_5.*(k_1xp_9_5 - k_2xp_9_5))*I;
Hz_xp_9_5 = (-(a_yp_9_5-Y).*k_p_9_5.*(k_1xp_9_5 - k_2xp_9_5))*I;

a_yn_9_5 = -9 * g + 22 * g;
k_n_9_5 = 1/(4*pi*((a_yn_9_5-Y).^2+Z.^2));
k_1xn_9_5 = (x2_9_5-X)./((x2_9_5-X).^2+(a_yn_9_5-Y).^2+Z.^2).^0.5;
k_2xn_9_5 = (x1_9_5-X)./((x1_9_5-X).^2+(a_yn_9_5-Y).^2+Z.^2).^0.5;

Hx_xn_9_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn_9_5 = (Z.*k_n_9_5.*(k_1xn_9_5 - k_2xn_9_5))*I;
Hz_xn_9_5 = ((a_yn_9_5-Y).*k_n_9_5.*(k_1xn_9_5 - k_2xn_9_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1_9_5 = -9 * g + 22 * g;
y2_9_5 = 9 * g + 22 * g;
a_xp_9_5 = 9 * g;          %Distance of coil from (0,0)
coil_length_y_9_5 = y2_9_5 - y1_9_5;

k_yp_9_5 = 1/(4*pi*((a_xp_9_5-X).^2+Z.^2));
k_1yp_9_5 = (y2_9_5-Y)./((y2_9_5-Y).^2+(a_xp_9_5-X).^2+Z.^2).^0.5;
k_2yp_9_5 = (y1_9_5-Y)./((y1_9_5-Y).^2+(a_xp_9_5-X).^2+Z.^2).^0.5;

Hx_yp_9_5 = -(Z.*k_yp_9_5.*(k_1yp_9_5 - k_2yp_9_5))*I;
Hy_yp_9_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp_9_5 = (-(a_xp_9_5-X).*k_yp_9_5.*(k_1yp_9_5 - k_2yp_9_5))*I;

a_xn_9_5 = -9 * g;
k_yn_9_5 = 1/(4*pi*((a_xn_9_5-X).^2+Z.^2));
k_1yn_9_5 = (y2_9_5-Y)./((y2_9_5-Y).^2+(a_xn_9_5-X).^2+Z.^2).^0.5;
k_2yn_9_5 = (y1_9_5-Y)./((y1_9_5-Y).^2+(a_xn_9_5-X).^2+Z.^2).^0.5;

Hx_yn_9_5 = (Z.*k_yn_9_5.*(k_1yn_9_5 - k_2yn_9_5))*I;
Hy_yn_9_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn_9_5 = ((a_xn_9_5-X).*k_yn_9_5.*(k_1yn_9_5 - k_2yn_9_5))*I;
%Adding field of Coil_9
Hx_9_5 = Hx_xp_9_5 + Hx_xn_9_5 + Hx_yp_9_5 + Hx_yn_9_5;
Hy_9_5 = Hy_xp_9_5 + Hy_xn_9_5 + Hy_yp_9_5 + Hy_yn_9_5;
Hz_9_5 = Hz_xp_9_5 + Hz_xn_9_5 + Hz_yp_9_5 + Hz_yn_9_5;


% Line along X - axis
% --------------------------------------------------------------Coil_10
x1__10_5 = -10 * g;
x2__10_5 = 10 * g;
a_yp__10_5 = 10 * g + 22 * g;          %Distance of coil from (0,0)
coil_length_x__10_5 = x2__10_5 - x1__10_5;
k_p__10_5 = 1/(4*pi*((a_yp__10_5-Y).^2+Z.^2));
k_1xp__10_5 = (x2__10_5-X)./((x2__10_5-X).^2+(a_yp__10_5-Y).^2+Z.^2).^0.5;
k_2xp__10_5 = (x1__10_5-X)./((x1__10_5-X).^2+(a_yp__10_5-Y).^2+Z.^2).^0.5;

Hx_xp__10_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp__10_5 = (-Z.*k_p__10_5.*(k_1xp__10_5 - k_2xp__10_5))*I;
Hz_xp__10_5 = (-(a_yp__10_5-Y).*k_p__10_5.*(k_1xp__10_5 - k_2xp__10_5))*I;

a_yn__10_5 = -10 * g + 22 * g; 
k_n__10_5 = 1/(4*pi*((a_yn__10_5-Y).^2+Z.^2));
k_1xn__10_5 = (x2__10_5-X)./((x2__10_5-X).^2+(a_yn__10_5-Y).^2+Z.^2).^0.5;
k_2xn__10_5 = (x1__10_5-X)./((x1__10_5-X).^2+(a_yn__10_5-Y).^2+Z.^2).^0.5;

Hx_xn__10_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn__10_5 = (Z.*k_n__10_5.*(k_1xn__10_5 - k_2xn__10_5))*I;
Hz_xn__10_5 = ((a_yn__10_5-Y).*k_n__10_5.*(k_1xn__10_5 - k_2xn__10_5))*I;

% --------------------------------------------------------------
% Line along Y - axis
y1__10_5 = -10 * g + 22 * g;
y2__10_5 = 10 * g + 22 * g;
a_xp__10_5 = 10 * g;          %Distance of coil from (0,0)
coil_length_y__10_5 = y2__10_5 - y1__10_5;

k_yp__10_5 = 1/(4*pi*((a_xp__10_5-X).^2+Z.^2));
k_1yp__10_5 = (y2__10_5-Y)./((y2__10_5-Y).^2+(a_xp__10_5-X).^2+Z.^2).^0.5;
k_2yp__10_5 = (y1__10_5-Y)./((y1__10_5-Y).^2+(a_xp__10_5-X).^2+Z.^2).^0.5;

Hx_yp__10_5 = -(Z.*k_yp__10_5.*(k_1yp__10_5 - k_2yp__10_5))*I;
Hy_yp__10_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp__10_5 = (-(a_xp__10_5-X).*k_yp__10_5.*(k_1yp__10_5 - k_2yp__10_5))*I;

a_xn__10_5 = -10 * g;
k_yn__10_5 = 1/(4*pi*((a_xn__10_5-X).^2+Z.^2));
k_1yn__10_5 = (y2__10_5-Y)./((y2__10_5-Y).^2+(a_xn__10_5-X).^2+Z.^2).^0.5;
k_2yn__10_5 = (y1__10_5-Y)./((y1__10_5-Y).^2+(a_xn__10_5-X).^2+Z.^2).^0.5;

Hx_yn__10_5 = (Z.*k_yn__10_5.*(k_1yn__10_5 - k_2yn__10_5))*I;
Hy_yn__10_5 = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn__10_5 = ((a_xn__10_5-X).*k_yn__10_5.*(k_1yn__10_5 - k_2yn__10_5))*I;
%Adding field of Coil_10
Hx__10_5 = Hx_xp__10_5 + Hx_xn__10_5 + Hx_yp__10_5 + Hx_yn__10_5;
Hy__10_5 = Hy_xp__10_5 + Hy_xn__10_5 + Hy_yp__10_5 + Hy_yn__10_5;
Hz__10_5 = Hz_xp__10_5 + Hz_xn__10_5 + Hz_yp__10_5 + Hz_yn__10_5;


% ----Adding all coil fields----
HX_5 = Hx_1_5 + Hx_2_5 + Hx_3_5 + Hx_4_5 + Hx_5_5 + Hx_6_5 + Hx_7_5 + Hx_8_5 + Hx_9_5 + Hx__10_5;
HY_5 = Hy_1_5 + Hy_2_5 + Hy_3_5 + Hy_4_5 + Hy_5_5 + Hy_6_5 + Hy_7_5 + Hy_8_5 + Hy_9_5 + Hy__10_5;
HZ_5 = Hz_1_5 + Hz_2_5 + Hz_3_5 + Hz_4_5 + Hz_5_5 + Hz_6_5 + Hz_7_5 + Hz_8_5 + Hz_9_5 + Hz__10_5;
%}


% ----Aggregate field of Multiple Turn Coils----
HX = Hx + HX_2 + HX_3 + HX_4 + HX_5;
HY = Hy + HY_2 + HY_3 + HY_4 + HY_5;
HZ = Hz + HZ_2 + HZ_3 + HZ_4 + HZ_5;

% -------Plotting the fields--------

figure
% quiver3(X,Y,Z,Hx_1,Hy_1,Hz_1,1.3)
quiver3(X,Y,Z,Hx,Hy,Hz,1.3)
hold on
%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 1st 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------
%---------Coil_1---------
plot(0,a_yp_1,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_1,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_1,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_1,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_1 x2_1],[a_yp_1 a_yp_1],'linewidth',3,'color','r');
line([x1_1 x2_1],[a_yn_1 a_yn_1],'linewidth',3,'color','r');
line([a_xn_1 a_xn_1],[y1_1 y2_1],'linewidth',3,'color','r');
line([a_xp_1 a_xp_1],[y1_1 y2_1],'linewidth',3,'color','r');

%---------Coil_2---------
plot(0,a_yp_2,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_2,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_2,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_2,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_2 x2_2],[a_yp_2 a_yp_2],'linewidth',3,'color','r');
line([x1_2 x2_2],[a_yn_2 a_yn_2],'linewidth',3,'color','r');
line([a_xn_2 a_xn_2],[y1_2 y2_2],'linewidth',3,'color','r');
line([a_xp_2 a_xp_2],[y1_2 y2_2],'linewidth',3,'color','r');

%---------Coil_3---------
plot(0,a_yp_3,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_3,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_3,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_3,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_3 x2_3],[a_yp_3 a_yp_3],'linewidth',3,'color','r');
line([x1_3 x2_3],[a_yn_3 a_yn_3],'linewidth',3,'color','r');
line([a_xn_3 a_xn_3],[y1_3 y2_3],'linewidth',3,'color','r');
line([a_xp_3 a_xp_3],[y1_3 y2_3],'linewidth',3,'color','r');

%---------Coil_4---------
plot(0,a_yp_4,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_4,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_4,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_4,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_4 x2_4],[a_yp_4 a_yp_4],'linewidth',3,'color','r');
line([x1_4 x2_4],[a_yn_4 a_yn_4],'linewidth',3,'color','r');
line([a_xn_4 a_xn_4],[y1_4 y2_4],'linewidth',3,'color','r');
line([a_xp_4 a_xp_4],[y1_4 y2_4],'linewidth',3,'color','r');

%---------Coil_5---------
plot(0,a_yp_5,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_5,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_5,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_5,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_5 x2_5],[a_yp_5 a_yp_5],'linewidth',3,'color','r');
line([x1_5 x2_5],[a_yn_5 a_yn_5],'linewidth',3,'color','r');
line([a_xn_5 a_xn_5],[y1_5 y2_5],'linewidth',3,'color','r');
line([a_xp_5 a_xp_5],[y1_5 y2_5],'linewidth',3,'color','r');

%---------Coil_6---------
plot(0,a_yp_6,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_6,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_6,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_6,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_6 x2_6],[a_yp_6 a_yp_6],'linewidth',3,'color','r');
line([x1_6 x2_6],[a_yn_6 a_yn_6],'linewidth',3,'color','r');
line([a_xn_6 a_xn_6],[y1_6 y2_6],'linewidth',3,'color','r');
line([a_xp_6 a_xp_6],[y1_6 y2_6],'linewidth',3,'color','r');

%---------Coil_7---------
plot(0,a_yp_7,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_7,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_7,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_7,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_7 x2_7],[a_yp_7 a_yp_7],'linewidth',3,'color','r');
line([x1_7 x2_7],[a_yn_7 a_yn_7],'linewidth',3,'color','r');
line([a_xn_7 a_xn_7],[y1_7 y2_7],'linewidth',3,'color','r');
line([a_xp_7 a_xp_7],[y1_7 y2_7],'linewidth',3,'color','r');

%---------Coil_8---------
plot(0,a_yp_8,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_8,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_8,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_8,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_8 x2_8],[a_yp_8 a_yp_8],'linewidth',3,'color','r');
line([x1_8 x2_8],[a_yn_8 a_yn_8],'linewidth',3,'color','r');
line([a_xn_8 a_xn_8],[y1_8 y2_8],'linewidth',3,'color','r');
line([a_xp_8 a_xp_8],[y1_8 y2_8],'linewidth',3,'color','r');

%---------Coil_9---------
plot(0,a_yp_9,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_9,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_9,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_9,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_9 x2_9],[a_yp_9 a_yp_9],'linewidth',3,'color','r');
line([x1_9 x2_9],[a_yn_9 a_yn_9],'linewidth',3,'color','r');
line([a_xn_9 a_xn_9],[y1_9 y2_9],'linewidth',3,'color','r');
line([a_xp_9 a_xp_9],[y1_9 y2_9],'linewidth',3,'color','r');

%---------Coil_10---------
plot(0,a_yp_10,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_10,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_10,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_10,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_10 x2_10],[a_yp_10 a_yp_10],'linewidth',3,'color','r');
line([x1_10 x2_10],[a_yn_10 a_yn_10],'linewidth',3,'color','r');
line([a_xn_10 a_xn_10],[y1_10 y2_10],'linewidth',3,'color','r');
line([a_xp_10 a_xp_10],[y1_10 y2_10],'linewidth',3,'color','r');
%}

%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 2nd 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------

%---------Coil_1---------

line([x1_1_2 x2_1_2],[a_yp_1_2 a_yp_1_2],'linewidth',3,'color','r');
line([x1_1_2 x2_1_2],[a_yn_1_2 a_yn_1_2],'linewidth',3,'color','r');
line([a_xn_1_2 a_xn_1_2],[y1_1_2 y2_1_2],'linewidth',3,'color','r');
line([a_xp_1_2 a_xp_1_2],[y1_1_2 y2_1_2],'linewidth',3,'color','r');

%---------Coil_2---------

line([x1_2_2 x2_2_2],[a_yp_2_2 a_yp_2_2],'linewidth',3,'color','r');
line([x1_2_2 x2_2_2],[a_yn_2_2 a_yn_2_2],'linewidth',3,'color','r');
line([a_xn_2_2 a_xn_2_2],[y1_2_2 y2_2_2],'linewidth',3,'color','r');
line([a_xp_2_2 a_xp_2_2],[y1_2_2 y2_2_2],'linewidth',3,'color','r');

%---------Coil_3---------

line([x1_3_2 x2_3_2],[a_yp_3_2 a_yp_3_2],'linewidth',3,'color','r');
line([x1_3_2 x2_3_2],[a_yn_3_2 a_yn_3_2],'linewidth',3,'color','r');
line([a_xn_3_2 a_xn_3_2],[y1_3_2 y2_3_2],'linewidth',3,'color','r');
line([a_xp_3_2 a_xp_3_2],[y1_3_2 y2_3_2],'linewidth',3,'color','r');

%---------Coil_4---------

line([x1_4_2 x2_4_2],[a_yp_4_2 a_yp_4_2],'linewidth',3,'color','r');
line([x1_4_2 x2_4_2],[a_yn_4_2 a_yn_4_2],'linewidth',3,'color','r');
line([a_xn_4_2 a_xn_4_2],[y1_4_2 y2_4_2],'linewidth',3,'color','r');
line([a_xp_4_2 a_xp_4_2],[y1_4_2 y2_4_2],'linewidth',3,'color','r');

%---------Coil_5---------

line([x1_5_2 x2_5_2],[a_yp_5_2 a_yp_5_2],'linewidth',3,'color','r');
line([x1_5_2 x2_5_2],[a_yn_5_2 a_yn_5_2],'linewidth',3,'color','r');
line([a_xn_5_2 a_xn_5_2],[y1_5_2 y2_5_2],'linewidth',3,'color','r');
line([a_xp_5_2 a_xp_5_2],[y1_5_2 y2_5_2],'linewidth',3,'color','r');

%---------Coil_6---------

line([x1_6_2 x2_6_2],[a_yp_6_2 a_yp_6_2],'linewidth',3,'color','r');
line([x1_6_2 x2_6_2],[a_yn_6_2 a_yn_6_2],'linewidth',3,'color','r');
line([a_xn_6_2 a_xn_6_2],[y1_6_2 y2_6_2],'linewidth',3,'color','r');
line([a_xp_6_2 a_xp_6_2],[y1_6_2 y2_6_2],'linewidth',3,'color','r');

%---------Coil_7---------
line([x1_7_2 x2_7_2],[a_yp_7_2 a_yp_7_2],'linewidth',3,'color','r');
line([x1_7_2 x2_7_2],[a_yn_7_2 a_yn_7_2],'linewidth',3,'color','r');
line([a_xn_7_2 a_xn_7_2],[y1_7_2 y2_7_2],'linewidth',3,'color','r');
line([a_xp_7_2 a_xp_7_2],[y1_7_2 y2_7_2],'linewidth',3,'color','r');

%---------Coil_8---------
line([x1_8_2 x2_8_2],[a_yp_8_2 a_yp_8_2],'linewidth',3,'color','r');
line([x1_8_2 x2_8_2],[a_yn_8_2 a_yn_8_2],'linewidth',3,'color','r');
line([a_xn_8_2 a_xn_8_2],[y1_8_2 y2_8_2],'linewidth',3,'color','r');
line([a_xp_8_2 a_xp_8_2],[y1_8_2 y2_8_2],'linewidth',3,'color','r');

%---------Coil_9---------
line([x1_9_2 x2_9_2],[a_yp_9_2 a_yp_9_2],'linewidth',3,'color','r');
line([x1_9_2 x2_9_2],[a_yn_9_2 a_yn_9_2],'linewidth',3,'color','r');
line([a_xn_9_2 a_xn_9_2],[y1_9_2 y2_9_2],'linewidth',3,'color','r');
line([a_xp_9_2 a_xp_9_2],[y1_9_2 y2_9_2],'linewidth',3,'color','r');

%---------Coil_10---------
line([x1__10_2 x2__10_2],[a_yp__10_2 a_yp__10_2],'linewidth',3,'color','r');
line([x1__10_2 x2__10_2],[a_yn__10_2 a_yn__10_2],'linewidth',3,'color','r');
line([a_xn__10_2 a_xn__10_2],[y1__10_2 y2__10_2],'linewidth',3,'color','r');
line([a_xp__10_2 a_xp__10_2],[y1__10_2 y2__10_2],'linewidth',3,'color','r');
%}

%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 3rd 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------

%---------Coil_1---------

line([x1_1_3 x2_1_3],[a_yp_1_3 a_yp_1_3],'linewidth',3,'color','r');
line([x1_1_3 x2_1_3],[a_yn_1_3 a_yn_1_3],'linewidth',3,'color','r');
line([a_xn_1_3 a_xn_1_3],[y1_1_3 y2_1_3],'linewidth',3,'color','r');
line([a_xp_1_3 a_xp_1_3],[y1_1_3 y2_1_3],'linewidth',3,'color','r');

%---------Coil_2---------

line([x1_2_3 x2_2_3],[a_yp_2_3 a_yp_2_3],'linewidth',3,'color','r');
line([x1_2_3 x2_2_3],[a_yn_2_3 a_yn_2_3],'linewidth',3,'color','r');
line([a_xn_2_3 a_xn_2_3],[y1_2_3 y2_2_3],'linewidth',3,'color','r');
line([a_xp_2_3 a_xp_2_3],[y1_2_3 y2_2_3],'linewidth',3,'color','r');

%---------Coil_3---------

line([x1_3_3 x2_3_3],[a_yp_3_3 a_yp_3_3],'linewidth',3,'color','r');
line([x1_3_3 x2_3_3],[a_yn_3_3 a_yn_3_3],'linewidth',3,'color','r');
line([a_xn_3_3 a_xn_3_3],[y1_3_3 y2_3_3],'linewidth',3,'color','r');
line([a_xp_3_3 a_xp_3_3],[y1_3_3 y2_3_3],'linewidth',3,'color','r');

%---------Coil_4---------

line([x1_4_3 x2_4_3],[a_yp_4_3 a_yp_4_3],'linewidth',3,'color','r');
line([x1_4_3 x2_4_3],[a_yn_4_3 a_yn_4_3],'linewidth',3,'color','r');
line([a_xn_4_3 a_xn_4_3],[y1_4_3 y2_4_3],'linewidth',3,'color','r');
line([a_xp_4_3 a_xp_4_3],[y1_4_3 y2_4_3],'linewidth',3,'color','r');

%---------Coil_5---------

line([x1_5_3 x2_5_3],[a_yp_5_3 a_yp_5_3],'linewidth',3,'color','r');
line([x1_5_3 x2_5_3],[a_yn_5_3 a_yn_5_3],'linewidth',3,'color','r');
line([a_xn_5_3 a_xn_5_3],[y1_5_3 y2_5_3],'linewidth',3,'color','r');
line([a_xp_5_3 a_xp_5_3],[y1_5_3 y2_5_3],'linewidth',3,'color','r');

%---------Coil_6---------

line([x1_6_3 x2_6_3],[a_yp_6_3 a_yp_6_3],'linewidth',3,'color','r');
line([x1_6_3 x2_6_3],[a_yn_6_3 a_yn_6_3],'linewidth',3,'color','r');
line([a_xn_6_3 a_xn_6_3],[y1_6_3 y2_6_3],'linewidth',3,'color','r');
line([a_xp_6_3 a_xp_6_3],[y1_6_3 y2_6_3],'linewidth',3,'color','r');

%---------Coil_7---------
line([x1_7_3 x2_7_3],[a_yp_7_3 a_yp_7_3],'linewidth',3,'color','r');
line([x1_7_3 x2_7_3],[a_yn_7_3 a_yn_7_3],'linewidth',3,'color','r');
line([a_xn_7_3 a_xn_7_3],[y1_7_3 y2_7_3],'linewidth',3,'color','r');
line([a_xp_7_3 a_xp_7_3],[y1_7_3 y2_7_3],'linewidth',3,'color','r');

%---------Coil_8---------
line([x1_8_3 x2_8_3],[a_yp_8_3 a_yp_8_3],'linewidth',3,'color','r');
line([x1_8_3 x2_8_3],[a_yn_8_3 a_yn_8_3],'linewidth',3,'color','r');
line([a_xn_8_3 a_xn_8_3],[y1_8_3 y2_8_3],'linewidth',3,'color','r');
line([a_xp_8_3 a_xp_8_3],[y1_8_3 y2_8_3],'linewidth',3,'color','r');

%---------Coil_9---------
line([x1_9_3 x2_9_3],[a_yp_9_3 a_yp_9_3],'linewidth',3,'color','r');
line([x1_9_3 x2_9_3],[a_yn_9_3 a_yn_9_3],'linewidth',3,'color','r');
line([a_xn_9_3 a_xn_9_3],[y1_9_3 y2_9_3],'linewidth',3,'color','r');
line([a_xp_9_3 a_xp_9_3],[y1_9_3 y2_9_3],'linewidth',3,'color','r');

%---------Coil_10---------
line([x1__10_3 x2__10_3],[a_yp__10_3 a_yp__10_3],'linewidth',3,'color','r');
line([x1__10_3 x2__10_3],[a_yn__10_3 a_yn__10_3],'linewidth',3,'color','r');
line([a_xn__10_3 a_xn__10_3],[y1__10_3 y2__10_3],'linewidth',3,'color','r');
line([a_xp__10_3 a_xp__10_3],[y1__10_3 y2__10_3],'linewidth',3,'color','r');
%}

%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 4th 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------

%---------Coil_1---------

line([x1_1_4 x2_1_4],[a_yp_1_4 a_yp_1_4],'linewidth',3,'color','r');
line([x1_1_4 x2_1_4],[a_yn_1_4 a_yn_1_4],'linewidth',3,'color','r');
line([a_xn_1_4 a_xn_1_4],[y1_1_4 y2_1_4],'linewidth',3,'color','r');
line([a_xp_1_4 a_xp_1_4],[y1_1_4 y2_1_4],'linewidth',3,'color','r');

%---------Coil_2---------

line([x1_2_4 x2_2_4],[a_yp_2_4 a_yp_2_4],'linewidth',3,'color','r');
line([x1_2_4 x2_2_4],[a_yn_2_4 a_yn_2_4],'linewidth',3,'color','r');
line([a_xn_2_4 a_xn_2_4],[y1_2_4 y2_2_4],'linewidth',3,'color','r');
line([a_xp_2_4 a_xp_2_4],[y1_2_4 y2_2_4],'linewidth',3,'color','r');

%---------Coil_3---------

line([x1_3_4 x2_3_4],[a_yp_3_4 a_yp_3_4],'linewidth',3,'color','r');
line([x1_3_4 x2_3_4],[a_yn_3_4 a_yn_3_4],'linewidth',3,'color','r');
line([a_xn_3_4 a_xn_3_4],[y1_3_4 y2_3_4],'linewidth',3,'color','r');
line([a_xp_3_4 a_xp_3_4],[y1_3_4 y2_3_4],'linewidth',3,'color','r');

%---------Coil_4---------

line([x1_4_4 x2_4_4],[a_yp_4_4 a_yp_4_4],'linewidth',3,'color','r');
line([x1_4_4 x2_4_4],[a_yn_4_4 a_yn_4_4],'linewidth',3,'color','r');
line([a_xn_4_4 a_xn_4_4],[y1_4_4 y2_4_4],'linewidth',3,'color','r');
line([a_xp_4_4 a_xp_4_4],[y1_4_4 y2_4_4],'linewidth',3,'color','r');

%---------Coil_5---------

line([x1_5_4 x2_5_4],[a_yp_5_4 a_yp_5_4],'linewidth',3,'color','r');
line([x1_5_4 x2_5_4],[a_yn_5_4 a_yn_5_4],'linewidth',3,'color','r');
line([a_xn_5_4 a_xn_5_4],[y1_5_4 y2_5_4],'linewidth',3,'color','r');
line([a_xp_5_4 a_xp_5_4],[y1_5_4 y2_5_4],'linewidth',3,'color','r');

%---------Coil_6---------

line([x1_6_4 x2_6_4],[a_yp_6_4 a_yp_6_4],'linewidth',3,'color','r');
line([x1_6_4 x2_6_4],[a_yn_6_4 a_yn_6_4],'linewidth',3,'color','r');
line([a_xn_6_4 a_xn_6_4],[y1_6_4 y2_6_4],'linewidth',3,'color','r');
line([a_xp_6_4 a_xp_6_4],[y1_6_4 y2_6_4],'linewidth',3,'color','r');

%---------Coil_7---------
line([x1_7_4 x2_7_4],[a_yp_7_4 a_yp_7_4],'linewidth',3,'color','r');
line([x1_7_4 x2_7_4],[a_yn_7_4 a_yn_7_4],'linewidth',3,'color','r');
line([a_xn_7_4 a_xn_7_4],[y1_7_4 y2_7_4],'linewidth',3,'color','r');
line([a_xp_7_4 a_xp_7_4],[y1_7_4 y2_7_4],'linewidth',3,'color','r');

%---------Coil_8---------
line([x1_8_4 x2_8_4],[a_yp_8_4 a_yp_8_4],'linewidth',3,'color','r');
line([x1_8_4 x2_8_4],[a_yn_8_4 a_yn_8_4],'linewidth',3,'color','r');
line([a_xn_8_4 a_xn_8_4],[y1_8_4 y2_8_4],'linewidth',3,'color','r');
line([a_xp_8_4 a_xp_8_4],[y1_8_4 y2_8_4],'linewidth',3,'color','r');

%---------Coil_9---------
line([x1_9_4 x2_9_4],[a_yp_9_4 a_yp_9_4],'linewidth',3,'color','r');
line([x1_9_4 x2_9_4],[a_yn_9_4 a_yn_9_4],'linewidth',3,'color','r');
line([a_xn_9_4 a_xn_9_4],[y1_9_4 y2_9_4],'linewidth',3,'color','r');
line([a_xp_9_4 a_xp_9_4],[y1_9_4 y2_9_4],'linewidth',3,'color','r');

%---------Coil_10---------
line([x1__10_4 x2__10_4],[a_yp__10_4 a_yp__10_4],'linewidth',3,'color','r');
line([x1__10_4 x2__10_4],[a_yn__10_4 a_yn__10_4],'linewidth',3,'color','r');
line([a_xn__10_4 a_xn__10_4],[y1__10_4 y2__10_4],'linewidth',3,'color','r');
line([a_xp__10_4 a_xp__10_4],[y1__10_4 y2__10_4],'linewidth',3,'color','r');
%}

%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 5th 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------

%---------Coil_1---------

line([x1_1_5 x2_1_5],[a_yp_1_5 a_yp_1_5],'linewidth',3,'color','r');
line([x1_1_5 x2_1_5],[a_yn_1_5 a_yn_1_5],'linewidth',3,'color','r');
line([a_xn_1_5 a_xn_1_5],[y1_1_5 y2_1_5],'linewidth',3,'color','r');
line([a_xp_1_5 a_xp_1_5],[y1_1_5 y2_1_5],'linewidth',3,'color','r');

%---------Coil_2---------

line([x1_2_5 x2_2_5],[a_yp_2_5 a_yp_2_5],'linewidth',3,'color','r');
line([x1_2_5 x2_2_5],[a_yn_2_5 a_yn_2_5],'linewidth',3,'color','r');
line([a_xn_2_5 a_xn_2_5],[y1_2_5 y2_2_5],'linewidth',3,'color','r');
line([a_xp_2_5 a_xp_2_5],[y1_2_5 y2_2_5],'linewidth',3,'color','r');

%---------Coil_3---------

line([x1_3_5 x2_3_5],[a_yp_3_5 a_yp_3_5],'linewidth',3,'color','r');
line([x1_3_5 x2_3_5],[a_yn_3_5 a_yn_3_5],'linewidth',3,'color','r');
line([a_xn_3_5 a_xn_3_5],[y1_3_5 y2_3_5],'linewidth',3,'color','r');
line([a_xp_3_5 a_xp_3_5],[y1_3_5 y2_3_5],'linewidth',3,'color','r');

%---------Coil_4---------

line([x1_4_5 x2_4_5],[a_yp_4_5 a_yp_4_5],'linewidth',3,'color','r');
line([x1_4_5 x2_4_5],[a_yn_4_5 a_yn_4_5],'linewidth',3,'color','r');
line([a_xn_4_5 a_xn_4_5],[y1_4_5 y2_4_5],'linewidth',3,'color','r');
line([a_xp_4_5 a_xp_4_5],[y1_4_5 y2_4_5],'linewidth',3,'color','r');

%---------Coil_5---------

line([x1_5_5 x2_5_5],[a_yp_5_5 a_yp_5_5],'linewidth',3,'color','r');
line([x1_5_5 x2_5_5],[a_yn_5_5 a_yn_5_5],'linewidth',3,'color','r');
line([a_xn_5_5 a_xn_5_5],[y1_5_5 y2_5_5],'linewidth',3,'color','r');
line([a_xp_5_5 a_xp_5_5],[y1_5_5 y2_5_5],'linewidth',3,'color','r');

%---------Coil_6---------

line([x1_6_5 x2_6_5],[a_yp_6_5 a_yp_6_5],'linewidth',3,'color','r');
line([x1_6_5 x2_6_5],[a_yn_6_5 a_yn_6_5],'linewidth',3,'color','r');
line([a_xn_6_5 a_xn_6_5],[y1_6_5 y2_6_5],'linewidth',3,'color','r');
line([a_xp_6_5 a_xp_6_5],[y1_6_5 y2_6_5],'linewidth',3,'color','r');

%---------Coil_7---------
line([x1_7_5 x2_7_5],[a_yp_7_5 a_yp_7_5],'linewidth',3,'color','r');
line([x1_7_5 x2_7_5],[a_yn_7_5 a_yn_7_5],'linewidth',3,'color','r');
line([a_xn_7_5 a_xn_7_5],[y1_7_5 y2_7_5],'linewidth',3,'color','r');
line([a_xp_7_5 a_xp_7_5],[y1_7_5 y2_7_5],'linewidth',3,'color','r');

%---------Coil_8---------
line([x1_8_5 x2_8_5],[a_yp_8_5 a_yp_8_5],'linewidth',3,'color','r');
line([x1_8_5 x2_8_5],[a_yn_8_5 a_yn_8_5],'linewidth',3,'color','r');
line([a_xn_8_5 a_xn_8_5],[y1_8_5 y2_8_5],'linewidth',3,'color','r');
line([a_xp_8_5 a_xp_8_5],[y1_8_5 y2_8_5],'linewidth',3,'color','r');

%---------Coil_9---------
line([x1_9_5 x2_9_5],[a_yp_9_5 a_yp_9_5],'linewidth',3,'color','r');
line([x1_9_5 x2_9_5],[a_yn_9_5 a_yn_9_5],'linewidth',3,'color','r');
line([a_xn_9_5 a_xn_9_5],[y1_9_5 y2_9_5],'linewidth',3,'color','r');
line([a_xp_9_5 a_xp_9_5],[y1_9_5 y2_9_5],'linewidth',3,'color','r');

%---------Coil_10---------
line([x1__10_5 x2__10_5],[a_yp__10_5 a_yp__10_5],'linewidth',3,'color','r');
line([x1__10_5 x2__10_5],[a_yn__10_5 a_yn__10_5],'linewidth',3,'color','r');
line([a_xn__10_5 a_xn__10_5],[y1__10_5 y2__10_5],'linewidth',3,'color','r');
line([a_xp__10_5 a_xp__10_5],[y1__10_5 y2__10_5],'linewidth',3,'color','r');
%}

title('Field around the coil (I in CW)')
xlabel('X-axis','fontsize',14)
ylabel('Y-axis','fontsize',14)
zlabel('Z-axis','fontsize',14)
hold off


%{
figure
dfh = HZ(:,:,size(Z,1)/2-1);
[X1,Y1] = meshgrid(b);
surf(X1,Y1,dfh)
hold on 
%.
%--------%--------%--------%--------%--------%--------%--------%----------
% 1st 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------
%---------Coil_1---------
plot(0,a_yp_1,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_1,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_1,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_1,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_1 x2_1],[a_yp_1 a_yp_1],'linewidth',3,'color','r');
line([x1_1 x2_1],[a_yn_1 a_yn_1],'linewidth',3,'color','r');
line([a_xn_1 a_xn_1],[y1_1 y2_1],'linewidth',3,'color','r');
line([a_xp_1 a_xp_1],[y1_1 y2_1],'linewidth',3,'color','r');

%---------Coil_2---------
plot(0,a_yp_2,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_2,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_2,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_2,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_2 x2_2],[a_yp_2 a_yp_2],'linewidth',3,'color','r');
line([x1_2 x2_2],[a_yn_2 a_yn_2],'linewidth',3,'color','r');
line([a_xn_2 a_xn_2],[y1_2 y2_2],'linewidth',3,'color','r');
line([a_xp_2 a_xp_2],[y1_2 y2_2],'linewidth',3,'color','r');

%---------Coil_3---------
plot(0,a_yp_3,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_3,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_3,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_3,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_3 x2_3],[a_yp_3 a_yp_3],'linewidth',3,'color','r');
line([x1_3 x2_3],[a_yn_3 a_yn_3],'linewidth',3,'color','r');
line([a_xn_3 a_xn_3],[y1_3 y2_3],'linewidth',3,'color','r');
line([a_xp_3 a_xp_3],[y1_3 y2_3],'linewidth',3,'color','r');

%---------Coil_4---------
plot(0,a_yp_4,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_4,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_4,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_4,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_4 x2_4],[a_yp_4 a_yp_4],'linewidth',3,'color','r');
line([x1_4 x2_4],[a_yn_4 a_yn_4],'linewidth',3,'color','r');
line([a_xn_4 a_xn_4],[y1_4 y2_4],'linewidth',3,'color','r');
line([a_xp_4 a_xp_4],[y1_4 y2_4],'linewidth',3,'color','r');

%---------Coil_5---------
plot(0,a_yp_5,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_5,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_5,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_5,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_5 x2_5],[a_yp_5 a_yp_5],'linewidth',3,'color','r');
line([x1_5 x2_5],[a_yn_5 a_yn_5],'linewidth',3,'color','r');
line([a_xn_5 a_xn_5],[y1_5 y2_5],'linewidth',3,'color','r');
line([a_xp_5 a_xp_5],[y1_5 y2_5],'linewidth',3,'color','r');

%---------Coil_6---------
plot(0,a_yp_6,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_6,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_6,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_6,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_6 x2_6],[a_yp_6 a_yp_6],'linewidth',3,'color','r');
line([x1_6 x2_6],[a_yn_6 a_yn_6],'linewidth',3,'color','r');
line([a_xn_6 a_xn_6],[y1_6 y2_6],'linewidth',3,'color','r');
line([a_xp_6 a_xp_6],[y1_6 y2_6],'linewidth',3,'color','r');

%---------Coil_7---------
plot(0,a_yp_7,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_7,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_7,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_7,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_7 x2_7],[a_yp_7 a_yp_7],'linewidth',3,'color','r');
line([x1_7 x2_7],[a_yn_7 a_yn_7],'linewidth',3,'color','r');
line([a_xn_7 a_xn_7],[y1_7 y2_7],'linewidth',3,'color','r');
line([a_xp_7 a_xp_7],[y1_7 y2_7],'linewidth',3,'color','r');

%---------Coil_8---------
plot(0,a_yp_8,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_8,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_8,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_8,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_8 x2_8],[a_yp_8 a_yp_8],'linewidth',3,'color','r');
line([x1_8 x2_8],[a_yn_8 a_yn_8],'linewidth',3,'color','r');
line([a_xn_8 a_xn_8],[y1_8 y2_8],'linewidth',3,'color','r');
line([a_xp_8 a_xp_8],[y1_8 y2_8],'linewidth',3,'color','r');

%---------Coil_9---------
plot(0,a_yp_9,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_9,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_9,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_9,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_9 x2_9],[a_yp_9 a_yp_9],'linewidth',3,'color','r');
line([x1_9 x2_9],[a_yn_9 a_yn_9],'linewidth',3,'color','r');
line([a_xn_9 a_xn_9],[y1_9 y2_9],'linewidth',3,'color','r');
line([a_xp_9 a_xp_9],[y1_9 y2_9],'linewidth',3,'color','r');

%---------Coil_10---------
plot(0,a_yp_10,'>','markersize',10,"MarkerFaceColor",'g');
plot(0,a_yn_10,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xp_10,0,'<','markersize',10,"MarkerFaceColor",'g');
plot(a_xn_10,0,'>','markersize',10,"MarkerFaceColor",'g');
line([x1_10 x2_10],[a_yp_10 a_yp_10],'linewidth',3,'color','r');
line([x1_10 x2_10],[a_yn_10 a_yn_10],'linewidth',3,'color','r');
line([a_xn_10 a_xn_10],[y1_10 y2_10],'linewidth',3,'color','r');
line([a_xp_10 a_xp_10],[y1_10 y2_10],'linewidth',3,'color','r');
%}

%{
%--------%--------%--------%--------%--------%--------%--------%----------
% 2nd 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------

%---------Coil_1---------

line([x1_1_2 x2_1_2],[a_yp_1_2 a_yp_1_2],'linewidth',3,'color','r');
line([x1_1_2 x2_1_2],[a_yn_1_2 a_yn_1_2],'linewidth',3,'color','r');
line([a_xn_1_2 a_xn_1_2],[y1_1_2 y2_1_2],'linewidth',3,'color','r');
line([a_xp_1_2 a_xp_1_2],[y1_1_2 y2_1_2],'linewidth',3,'color','r');

%---------Coil_2---------

line([x1_2_2 x2_2_2],[a_yp_2_2 a_yp_2_2],'linewidth',3,'color','r');
line([x1_2_2 x2_2_2],[a_yn_2_2 a_yn_2_2],'linewidth',3,'color','r');
line([a_xn_2_2 a_xn_2_2],[y1_2_2 y2_2_2],'linewidth',3,'color','r');
line([a_xp_2_2 a_xp_2_2],[y1_2_2 y2_2_2],'linewidth',3,'color','r');

%---------Coil_3---------

line([x1_3_2 x2_3_2],[a_yp_3_2 a_yp_3_2],'linewidth',3,'color','r');
line([x1_3_2 x2_3_2],[a_yn_3_2 a_yn_3_2],'linewidth',3,'color','r');
line([a_xn_3_2 a_xn_3_2],[y1_3_2 y2_3_2],'linewidth',3,'color','r');
line([a_xp_3_2 a_xp_3_2],[y1_3_2 y2_3_2],'linewidth',3,'color','r');

%---------Coil_4---------

line([x1_4_2 x2_4_2],[a_yp_4_2 a_yp_4_2],'linewidth',3,'color','r');
line([x1_4_2 x2_4_2],[a_yn_4_2 a_yn_4_2],'linewidth',3,'color','r');
line([a_xn_4_2 a_xn_4_2],[y1_4_2 y2_4_2],'linewidth',3,'color','r');
line([a_xp_4_2 a_xp_4_2],[y1_4_2 y2_4_2],'linewidth',3,'color','r');

%---------Coil_5---------

line([x1_5_2 x2_5_2],[a_yp_5_2 a_yp_5_2],'linewidth',3,'color','r');
line([x1_5_2 x2_5_2],[a_yn_5_2 a_yn_5_2],'linewidth',3,'color','r');
line([a_xn_5_2 a_xn_5_2],[y1_5_2 y2_5_2],'linewidth',3,'color','r');
line([a_xp_5_2 a_xp_5_2],[y1_5_2 y2_5_2],'linewidth',3,'color','r');

%---------Coil_6---------

line([x1_6_2 x2_6_2],[a_yp_6_2 a_yp_6_2],'linewidth',3,'color','r');
line([x1_6_2 x2_6_2],[a_yn_6_2 a_yn_6_2],'linewidth',3,'color','r');
line([a_xn_6_2 a_xn_6_2],[y1_6_2 y2_6_2],'linewidth',3,'color','r');
line([a_xp_6_2 a_xp_6_2],[y1_6_2 y2_6_2],'linewidth',3,'color','r');

%---------Coil_7---------
line([x1_7_2 x2_7_2],[a_yp_7_2 a_yp_7_2],'linewidth',3,'color','r');
line([x1_7_2 x2_7_2],[a_yn_7_2 a_yn_7_2],'linewidth',3,'color','r');
line([a_xn_7_2 a_xn_7_2],[y1_7_2 y2_7_2],'linewidth',3,'color','r');
line([a_xp_7_2 a_xp_7_2],[y1_7_2 y2_7_2],'linewidth',3,'color','r');

%---------Coil_8---------
line([x1_8_2 x2_8_2],[a_yp_8_2 a_yp_8_2],'linewidth',3,'color','r');
line([x1_8_2 x2_8_2],[a_yn_8_2 a_yn_8_2],'linewidth',3,'color','r');
line([a_xn_8_2 a_xn_8_2],[y1_8_2 y2_8_2],'linewidth',3,'color','r');
line([a_xp_8_2 a_xp_8_2],[y1_8_2 y2_8_2],'linewidth',3,'color','r');

%---------Coil_9---------
line([x1_9_2 x2_9_2],[a_yp_9_2 a_yp_9_2],'linewidth',3,'color','r');
line([x1_9_2 x2_9_2],[a_yn_9_2 a_yn_9_2],'linewidth',3,'color','r');
line([a_xn_9_2 a_xn_9_2],[y1_9_2 y2_9_2],'linewidth',3,'color','r');
line([a_xp_9_2 a_xp_9_2],[y1_9_2 y2_9_2],'linewidth',3,'color','r');

%---------Coil_10---------
line([x1__10_2 x2__10_2],[a_yp__10_2 a_yp__10_2],'linewidth',3,'color','r');
line([x1__10_2 x2__10_2],[a_yn__10_2 a_yn__10_2],'linewidth',3,'color','r');
line([a_xn__10_2 a_xn__10_2],[y1__10_2 y2__10_2],'linewidth',3,'color','r');
line([a_xp__10_2 a_xp__10_2],[y1__10_2 y2__10_2],'linewidth',3,'color','r');
%}

%{
%--------%--------%--------%--------%--------%--------%--------%----------
% 3rd 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------

%---------Coil_1---------

line([x1_1_3 x2_1_3],[a_yp_1_3 a_yp_1_3],'linewidth',3,'color','r');
line([x1_1_3 x2_1_3],[a_yn_1_3 a_yn_1_3],'linewidth',3,'color','r');
line([a_xn_1_3 a_xn_1_3],[y1_1_3 y2_1_3],'linewidth',3,'color','r');
line([a_xp_1_3 a_xp_1_3],[y1_1_3 y2_1_3],'linewidth',3,'color','r');

%---------Coil_2---------

line([x1_2_3 x2_2_3],[a_yp_2_3 a_yp_2_3],'linewidth',3,'color','r');
line([x1_2_3 x2_2_3],[a_yn_2_3 a_yn_2_3],'linewidth',3,'color','r');
line([a_xn_2_3 a_xn_2_3],[y1_2_3 y2_2_3],'linewidth',3,'color','r');
line([a_xp_2_3 a_xp_2_3],[y1_2_3 y2_2_3],'linewidth',3,'color','r');

%---------Coil_3---------

line([x1_3_3 x2_3_3],[a_yp_3_3 a_yp_3_3],'linewidth',3,'color','r');
line([x1_3_3 x2_3_3],[a_yn_3_3 a_yn_3_3],'linewidth',3,'color','r');
line([a_xn_3_3 a_xn_3_3],[y1_3_3 y2_3_3],'linewidth',3,'color','r');
line([a_xp_3_3 a_xp_3_3],[y1_3_3 y2_3_3],'linewidth',3,'color','r');

%---------Coil_4---------

line([x1_4_3 x2_4_3],[a_yp_4_3 a_yp_4_3],'linewidth',3,'color','r');
line([x1_4_3 x2_4_3],[a_yn_4_3 a_yn_4_3],'linewidth',3,'color','r');
line([a_xn_4_3 a_xn_4_3],[y1_4_3 y2_4_3],'linewidth',3,'color','r');
line([a_xp_4_3 a_xp_4_3],[y1_4_3 y2_4_3],'linewidth',3,'color','r');

%---------Coil_5---------

line([x1_5_3 x2_5_3],[a_yp_5_3 a_yp_5_3],'linewidth',3,'color','r');
line([x1_5_3 x2_5_3],[a_yn_5_3 a_yn_5_3],'linewidth',3,'color','r');
line([a_xn_5_3 a_xn_5_3],[y1_5_3 y2_5_3],'linewidth',3,'color','r');
line([a_xp_5_3 a_xp_5_3],[y1_5_3 y2_5_3],'linewidth',3,'color','r');

%---------Coil_6---------

line([x1_6_3 x2_6_3],[a_yp_6_3 a_yp_6_3],'linewidth',3,'color','r');
line([x1_6_3 x2_6_3],[a_yn_6_3 a_yn_6_3],'linewidth',3,'color','r');
line([a_xn_6_3 a_xn_6_3],[y1_6_3 y2_6_3],'linewidth',3,'color','r');
line([a_xp_6_3 a_xp_6_3],[y1_6_3 y2_6_3],'linewidth',3,'color','r');

%---------Coil_7---------
line([x1_7_3 x2_7_3],[a_yp_7_3 a_yp_7_3],'linewidth',3,'color','r');
line([x1_7_3 x2_7_3],[a_yn_7_3 a_yn_7_3],'linewidth',3,'color','r');
line([a_xn_7_3 a_xn_7_3],[y1_7_3 y2_7_3],'linewidth',3,'color','r');
line([a_xp_7_3 a_xp_7_3],[y1_7_3 y2_7_3],'linewidth',3,'color','r');

%---------Coil_8---------
line([x1_8_3 x2_8_3],[a_yp_8_3 a_yp_8_3],'linewidth',3,'color','r');
line([x1_8_3 x2_8_3],[a_yn_8_3 a_yn_8_3],'linewidth',3,'color','r');
line([a_xn_8_3 a_xn_8_3],[y1_8_3 y2_8_3],'linewidth',3,'color','r');
line([a_xp_8_3 a_xp_8_3],[y1_8_3 y2_8_3],'linewidth',3,'color','r');

%---------Coil_9---------
line([x1_9_3 x2_9_3],[a_yp_9_3 a_yp_9_3],'linewidth',3,'color','r');
line([x1_9_3 x2_9_3],[a_yn_9_3 a_yn_9_3],'linewidth',3,'color','r');
line([a_xn_9_3 a_xn_9_3],[y1_9_3 y2_9_3],'linewidth',3,'color','r');
line([a_xp_9_3 a_xp_9_3],[y1_9_3 y2_9_3],'linewidth',3,'color','r');

%---------Coil_10---------
line([x1__10_3 x2__10_3],[a_yp__10_3 a_yp__10_3],'linewidth',3,'color','r');
line([x1__10_3 x2__10_3],[a_yn__10_3 a_yn__10_3],'linewidth',3,'color','r');
line([a_xn__10_3 a_xn__10_3],[y1__10_3 y2__10_3],'linewidth',3,'color','r');
line([a_xp__10_3 a_xp__10_3],[y1__10_3 y2__10_3],'linewidth',3,'color','r');
%}

%{
%--------%--------%--------%--------%--------%--------%--------%----------
% 4th 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------

%---------Coil_1---------

line([x1_1_4 x2_1_4],[a_yp_1_4 a_yp_1_4],'linewidth',3,'color','r');
line([x1_1_4 x2_1_4],[a_yn_1_4 a_yn_1_4],'linewidth',3,'color','r');
line([a_xn_1_4 a_xn_1_4],[y1_1_4 y2_1_4],'linewidth',3,'color','r');
line([a_xp_1_4 a_xp_1_4],[y1_1_4 y2_1_4],'linewidth',3,'color','r');

%---------Coil_2---------

line([x1_2_4 x2_2_4],[a_yp_2_4 a_yp_2_4],'linewidth',3,'color','r');
line([x1_2_4 x2_2_4],[a_yn_2_4 a_yn_2_4],'linewidth',3,'color','r');
line([a_xn_2_4 a_xn_2_4],[y1_2_4 y2_2_4],'linewidth',3,'color','r');
line([a_xp_2_4 a_xp_2_4],[y1_2_4 y2_2_4],'linewidth',3,'color','r');

%---------Coil_3---------

line([x1_3_4 x2_3_4],[a_yp_3_4 a_yp_3_4],'linewidth',3,'color','r');
line([x1_3_4 x2_3_4],[a_yn_3_4 a_yn_3_4],'linewidth',3,'color','r');
line([a_xn_3_4 a_xn_3_4],[y1_3_4 y2_3_4],'linewidth',3,'color','r');
line([a_xp_3_4 a_xp_3_4],[y1_3_4 y2_3_4],'linewidth',3,'color','r');

%---------Coil_4---------

line([x1_4_4 x2_4_4],[a_yp_4_4 a_yp_4_4],'linewidth',3,'color','r');
line([x1_4_4 x2_4_4],[a_yn_4_4 a_yn_4_4],'linewidth',3,'color','r');
line([a_xn_4_4 a_xn_4_4],[y1_4_4 y2_4_4],'linewidth',3,'color','r');
line([a_xp_4_4 a_xp_4_4],[y1_4_4 y2_4_4],'linewidth',3,'color','r');

%---------Coil_5---------

line([x1_5_4 x2_5_4],[a_yp_5_4 a_yp_5_4],'linewidth',3,'color','r');
line([x1_5_4 x2_5_4],[a_yn_5_4 a_yn_5_4],'linewidth',3,'color','r');
line([a_xn_5_4 a_xn_5_4],[y1_5_4 y2_5_4],'linewidth',3,'color','r');
line([a_xp_5_4 a_xp_5_4],[y1_5_4 y2_5_4],'linewidth',3,'color','r');

%---------Coil_6---------

line([x1_6_4 x2_6_4],[a_yp_6_4 a_yp_6_4],'linewidth',3,'color','r');
line([x1_6_4 x2_6_4],[a_yn_6_4 a_yn_6_4],'linewidth',3,'color','r');
line([a_xn_6_4 a_xn_6_4],[y1_6_4 y2_6_4],'linewidth',3,'color','r');
line([a_xp_6_4 a_xp_6_4],[y1_6_4 y2_6_4],'linewidth',3,'color','r');

%---------Coil_7---------
line([x1_7_4 x2_7_4],[a_yp_7_4 a_yp_7_4],'linewidth',3,'color','r');
line([x1_7_4 x2_7_4],[a_yn_7_4 a_yn_7_4],'linewidth',3,'color','r');
line([a_xn_7_4 a_xn_7_4],[y1_7_4 y2_7_4],'linewidth',3,'color','r');
line([a_xp_7_4 a_xp_7_4],[y1_7_4 y2_7_4],'linewidth',3,'color','r');

%---------Coil_8---------
line([x1_8_4 x2_8_4],[a_yp_8_4 a_yp_8_4],'linewidth',3,'color','r');
line([x1_8_4 x2_8_4],[a_yn_8_4 a_yn_8_4],'linewidth',3,'color','r');
line([a_xn_8_4 a_xn_8_4],[y1_8_4 y2_8_4],'linewidth',3,'color','r');
line([a_xp_8_4 a_xp_8_4],[y1_8_4 y2_8_4],'linewidth',3,'color','r');

%---------Coil_9---------
line([x1_9_4 x2_9_4],[a_yp_9_4 a_yp_9_4],'linewidth',3,'color','r');
line([x1_9_4 x2_9_4],[a_yn_9_4 a_yn_9_4],'linewidth',3,'color','r');
line([a_xn_9_4 a_xn_9_4],[y1_9_4 y2_9_4],'linewidth',3,'color','r');
line([a_xp_9_4 a_xp_9_4],[y1_9_4 y2_9_4],'linewidth',3,'color','r');

%---------Coil_10---------
line([x1__10_4 x2__10_4],[a_yp__10_4 a_yp__10_4],'linewidth',3,'color','r');
line([x1__10_4 x2__10_4],[a_yn__10_4 a_yn__10_4],'linewidth',3,'color','r');
line([a_xn__10_4 a_xn__10_4],[y1__10_4 y2__10_4],'linewidth',3,'color','r');
line([a_xp__10_4 a_xp__10_4],[y1__10_4 y2__10_4],'linewidth',3,'color','r');
%}

%{
%--------%--------%--------%--------%--------%--------%--------%----------
% 5th 10 turn coil plotting data
%-%--------%--------%--------%--------%--------%--------%--------%--------

%---------Coil_1---------

line([x1_1_5 x2_1_5],[a_yp_1_5 a_yp_1_5],'linewidth',3,'color','r');
line([x1_1_5 x2_1_5],[a_yn_1_5 a_yn_1_5],'linewidth',3,'color','r');
line([a_xn_1_5 a_xn_1_5],[y1_1_5 y2_1_5],'linewidth',3,'color','r');
line([a_xp_1_5 a_xp_1_5],[y1_1_5 y2_1_5],'linewidth',3,'color','r');

%---------Coil_2---------

line([x1_2_5 x2_2_5],[a_yp_2_5 a_yp_2_5],'linewidth',3,'color','r');
line([x1_2_5 x2_2_5],[a_yn_2_5 a_yn_2_5],'linewidth',3,'color','r');
line([a_xn_2_5 a_xn_2_5],[y1_2_5 y2_2_5],'linewidth',3,'color','r');
line([a_xp_2_5 a_xp_2_5],[y1_2_5 y2_2_5],'linewidth',3,'color','r');

%---------Coil_3---------

line([x1_3_5 x2_3_5],[a_yp_3_5 a_yp_3_5],'linewidth',3,'color','r');
line([x1_3_5 x2_3_5],[a_yn_3_5 a_yn_3_5],'linewidth',3,'color','r');
line([a_xn_3_5 a_xn_3_5],[y1_3_5 y2_3_5],'linewidth',3,'color','r');
line([a_xp_3_5 a_xp_3_5],[y1_3_5 y2_3_5],'linewidth',3,'color','r');

%---------Coil_4---------

line([x1_4_5 x2_4_5],[a_yp_4_5 a_yp_4_5],'linewidth',3,'color','r');
line([x1_4_5 x2_4_5],[a_yn_4_5 a_yn_4_5],'linewidth',3,'color','r');
line([a_xn_4_5 a_xn_4_5],[y1_4_5 y2_4_5],'linewidth',3,'color','r');
line([a_xp_4_5 a_xp_4_5],[y1_4_5 y2_4_5],'linewidth',3,'color','r');

%---------Coil_5---------

line([x1_5_5 x2_5_5],[a_yp_5_5 a_yp_5_5],'linewidth',3,'color','r');
line([x1_5_5 x2_5_5],[a_yn_5_5 a_yn_5_5],'linewidth',3,'color','r');
line([a_xn_5_5 a_xn_5_5],[y1_5_5 y2_5_5],'linewidth',3,'color','r');
line([a_xp_5_5 a_xp_5_5],[y1_5_5 y2_5_5],'linewidth',3,'color','r');

%---------Coil_6---------

line([x1_6_5 x2_6_5],[a_yp_6_5 a_yp_6_5],'linewidth',3,'color','r');
line([x1_6_5 x2_6_5],[a_yn_6_5 a_yn_6_5],'linewidth',3,'color','r');
line([a_xn_6_5 a_xn_6_5],[y1_6_5 y2_6_5],'linewidth',3,'color','r');
line([a_xp_6_5 a_xp_6_5],[y1_6_5 y2_6_5],'linewidth',3,'color','r');

%---------Coil_7---------
line([x1_7_5 x2_7_5],[a_yp_7_5 a_yp_7_5],'linewidth',3,'color','r');
line([x1_7_5 x2_7_5],[a_yn_7_5 a_yn_7_5],'linewidth',3,'color','r');
line([a_xn_7_5 a_xn_7_5],[y1_7_5 y2_7_5],'linewidth',3,'color','r');
line([a_xp_7_5 a_xp_7_5],[y1_7_5 y2_7_5],'linewidth',3,'color','r');

%---------Coil_8---------
line([x1_8_5 x2_8_5],[a_yp_8_5 a_yp_8_5],'linewidth',3,'color','r');
line([x1_8_5 x2_8_5],[a_yn_8_5 a_yn_8_5],'linewidth',3,'color','r');
line([a_xn_8_5 a_xn_8_5],[y1_8_5 y2_8_5],'linewidth',3,'color','r');
line([a_xp_8_5 a_xp_8_5],[y1_8_5 y2_8_5],'linewidth',3,'color','r');

%---------Coil_9---------
line([x1_9_5 x2_9_5],[a_yp_9_5 a_yp_9_5],'linewidth',3,'color','r');
line([x1_9_5 x2_9_5],[a_yn_9_5 a_yn_9_5],'linewidth',3,'color','r');
line([a_xn_9_5 a_xn_9_5],[y1_9_5 y2_9_5],'linewidth',3,'color','r');
line([a_xp_9_5 a_xp_9_5],[y1_9_5 y2_9_5],'linewidth',3,'color','r');

%---------Coil_10---------
line([x1__10_5 x2__10_5],[a_yp__10_5 a_yp__10_5],'linewidth',3,'color','r');
line([x1__10_5 x2__10_5],[a_yn__10_5 a_yn__10_5],'linewidth',3,'color','r');
line([a_xn__10_5 a_xn__10_5],[y1__10_5 y2__10_5],'linewidth',3,'color','r');
line([a_xp__10_5 a_xp__10_5],[y1__10_5 y2__10_5],'linewidth',3,'color','r');
%}
% hold off
%}
