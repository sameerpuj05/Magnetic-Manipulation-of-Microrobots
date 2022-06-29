function [Hx_xp, Hy_xp, Hz_xp, Hx_xn, Hy_xn, Hz_xn] = field_x(X, Y, Z, I,n,gx, m0 , gz)
k = 0.4e-3;
xp_1 = -0.8e-3 - (n-1)*k;
xp_2 = 0.8e-3 + (n-1)*k;
a_yp = gx; 
a_zp = gz;
k_p = 1./(4*pi*((a_yp-Y).^2+(a_zp-Z).^2));
kxp = (xp_2-X)./((xp_2-X).^2+(a_yp-Y).^2+(a_zp-Z).^2).^0.5;
k_2xp = (xp_1-X)./((xp_1-X).^2+(a_yp-Y).^2+(a_zp-Z).^2).^0.5;

Hx_xp = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xp = (-(a_zp-Z).*k_p.*(kxp - k_2xp))*I*m0;
Hz_xp = (-(a_yp-Y).*k_p.*(kxp - k_2xp))*I*m0;

a_yn = -gx;
xn_1 = -1e-3 - (n-1)*k;
xn_2 = 1e-3 + (n-1)*k;
k_n = 1./(4*pi*((a_yn-Y).^2+(a_zp-Z).^2));
kxn = (xn_2-X)./((xn_2-X).^2+(a_yn-Y).^2+(a_zp-Z).^2).^0.5;
k_2xn = (xn_1-X)./((xn_1-X).^2+(a_yn-Y).^2+(a_zp-Z).^2).^0.5;

Hx_xn = zeros(size(X,1),size(Y,1),size(Z,1));
Hy_xn = ((a_zp-Z).*k_n.*(kxn - k_2xn))*I*m0;
Hz_xn = ((a_yn-Y).*k_n.*(kxn - k_2xn))*I*m0;

end