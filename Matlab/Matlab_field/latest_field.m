clear all;
clc;
% Analysing field along a single wire...
% Constants 
I = 0.55;       %Current flowing in the wire
g = 200e-6;     %Coil spacing
m0 = 4*pi*10e-7;
c = -1400e-6:280e-6:1400e-6;
[X,Y,Z] = meshgrid(c);

% c = -200e-6:100e-6:600e-6; - For 2 coils 
% c = -600e-6:100e-6:600e-6; - For 3 coils 
% c = -800e-6:150e-6:800e-6; - For 4 coils
% c = -1000e-6:250e-6:1000e-6; - For 5 coils
% c = -1200e-6:200e-6:1200e-6;  or -1400e-6:140e-6:1400e-6 or -1400e-6:280e-6:1400e-6- For 6 coils

%.
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
%}

%.
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

%}

%.
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

%}

%.
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

%}

%.
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

%}

%.
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

%}

% ----Adding all coil fields----
Hx = Hx_1 + Hx_2 + Hx_3 + Hx_4 + Hx_5 + Hx_6;
Hy = Hy_1 + Hy_2 + Hy_3 + Hy_4 + Hy_5 + Hy_6;
Hz = Hz_1 + Hz_2 + Hz_3 + Hz_4 + Hz_5 + Hz_6;

% -------Plotting the fields--------
figure
% quiver3(X,Y,Z,Hx_1,Hy_1,Hz_1,1.3)
quiver3(X,Y,Z,Hx,Hy,Hz,2)
hold on
% %---------Coil_1---------
% plot(0,a_yp_1,'>','markersize',10,"MarkerFaceColor",'g');
% plot(0,a_yn_1,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xp_1,0,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xn_1,0,'>','markersize',10,"MarkerFaceColor",'g');
% line([x1_1 x2_1],[a_yp_1 a_yp_1],'linewidth',3,'color','r');
% line([x1_1 x2_1],[a_yn_1 a_yn_1],'linewidth',3,'color','r');
% line([a_xn_1 a_xn_1],[y1_1 y2_1],'linewidth',3,'color','r');
% line([a_xp_1 a_xp_1],[y1_1 y2_1],'linewidth',3,'color','r');
% %{
% %---------Coil_2---------
% plot(0,a_yp_2,'>','markersize',10,"MarkerFaceColor",'g');
% plot(0,a_yn_2,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xp_2,0,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xn_2,0,'>','markersize',10,"MarkerFaceColor",'g');
% line([x1_2 x2_2],[a_yp_2 a_yp_2],'linewidth',3,'color','r');
% line([x1_2 x2_2],[a_yn_2 a_yn_2],'linewidth',3,'color','r');
% line([a_xn_2 a_xn_2],[y1_2 y2_2],'linewidth',3,'color','r');
% line([a_xp_2 a_xp_2],[y1_2 y2_2],'linewidth',3,'color','r');
% %}
% 
% %.
% %---------Coil_3---------
% plot(0,a_yp_3,'>','markersize',10,"MarkerFaceColor",'g');
% plot(0,a_yn_3,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xp_3,0,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xn_3,0,'>','markersize',10,"MarkerFaceColor",'g');
% line([x1_3 x2_3],[a_yp_3 a_yp_3],'linewidth',3,'color','r');
% line([x1_3 x2_3],[a_yn_3 a_yn_3],'linewidth',3,'color','r');
% line([a_xn_3 a_xn_3],[y1_3 y2_3],'linewidth',3,'color','r');
% line([a_xp_3 a_xp_3],[y1_3 y2_3],'linewidth',3,'color','r');
% %}
% 
% %.
% %---------Coil_4---------
% plot(0,a_yp_4,'>','markersize',10,"MarkerFaceColor",'g');
% plot(0,a_yn_4,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xp_4,0,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xn_4,0,'>','markersize',10,"MarkerFaceColor",'g');
% line([x1_4 x2_4],[a_yp_4 a_yp_4],'linewidth',3,'color','r');
% line([x1_4 x2_4],[a_yn_4 a_yn_4],'linewidth',3,'color','r');
% line([a_xn_4 a_xn_4],[y1_4 y2_4],'linewidth',3,'color','r');
% line([a_xp_4 a_xp_4],[y1_4 y2_4],'linewidth',3,'color','r');
% %}
% 
% %.
% %---------Coil_5---------
% plot(0,a_yp_5,'>','markersize',10,"MarkerFaceColor",'g');
% plot(0,a_yn_5,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xp_5,0,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xn_5,0,'>','markersize',10,"MarkerFaceColor",'g');
% line([x1_5 x2_5],[a_yp_5 a_yp_5],'linewidth',3,'color','r');
% line([x1_5 x2_5],[a_yn_5 a_yn_5],'linewidth',3,'color','r');
% line([a_xn_5 a_xn_5],[y1_5 y2_5],'linewidth',3,'color','r');
% line([a_xp_5 a_xp_5],[y1_5 y2_5],'linewidth',3,'color','r');
% %}
% 
% %.
% %---------Coil_6---------
% plot(0,a_yp_6,'>','markersize',10,"MarkerFaceColor",'g');
% plot(0,a_yn_6,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xp_6,0,'<','markersize',10,"MarkerFaceColor",'g');
% plot(a_xn_6,0,'>','markersize',10,"MarkerFaceColor",'g');
% line([x1_6 x2_6],[a_yp_6 a_yp_6],'linewidth',3,'color','r');
% line([x1_6 x2_6],[a_yn_6 a_yn_6],'linewidth',3,'color','r');
% line([a_xn_6 a_xn_6],[y1_6 y2_6],'linewidth',3,'color','r');
% line([a_xp_6 a_xp_6],[y1_6 y2_6],'linewidth',3,'color','r');
% %}
% 
% title('Field around the coil (I in CW)')
% xlabel('X-axis','fontsize',14)
% ylabel('Y-axis','fontsize',14)
% zlabel('Z-axis','fontsize',14)
% hold off
% 
% 
% % figure
% % dfh = Hz_1(:,:,1);
% % [X1,Y1] = meshgrid(c);
% % surf(X1,Y1,dfh)
% % hold on
% % line([x1_1 x2_1],[a_yp_1 a_yp_1],'linewidth',3,'color','r');
% % line([x1_1 x2_1],[a_yn_1 a_yn_1],'linewidth',3,'color','r');
% % line([a_xn_1 a_xn_1],[y1_1 y2_1],'linewidth',3,'color','r');
% % line([a_xp_1 a_xp_1],[y1_1 y2_1],'linewidth',3,'color','r');
% % G1=plot(0,a_yp_1,'>','markersize',10,"MarkerFaceColor",'g');
% % G2=plot(0,a_yn_1,'<','markersize',10,"MarkerFaceColor",'g');
% % G3=plot(a_xp_1,0,'<','markersize',10,"MarkerFaceColor",'g');
% % G4=plot(a_xn_1,0,'>','markersize',10,"MarkerFaceColor",'g');
% % title('Field')
% % xlabel('X-axis','fontsize',14)
% % ylabel('Y-axis','fontsize',14)
% % zlabel('Z-axis','fontsize',14)
% % hold off