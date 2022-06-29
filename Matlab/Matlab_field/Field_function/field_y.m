function [Hx_yp, Hy_yp, Hz_yp, Hx_yn, Hy_yn, Hz_yn] = field_y(X, Y, Z, I,n,gy, m0, gz)
k = 0.4e-3;
yp1 = -0.6e-3 - (n-1)*k;
yp2 = 0.6e-3 + (n-1)*k;
a_xp = gy;
a_zp = gz;
k_yp = 1./(4*pi*((a_xp-X).^2+(a_zp-Z).^2));
kyp = (yp2-Y)./((yp2-Y).^2+(a_xp-X).^2+(a_zp-Z).^2).^0.5;
k_2yp = (yp1-Y)./((yp1-Y).^2+(a_xp-X).^2+(a_zp-Z).^2).^0.5;

Hx_yp = -((a_zp-Z).*k_yp.*(kyp - k_2yp))*I*m0;
Hy_yp = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yp = (-(a_xp-X).*k_yp.*(kyp - k_2yp))*I*m0;

a_xn = -gy;
yn1 = -0.8e-3 - (n-1)*k;
yn2 = 0.8e-3 + (n-1)*k;
k_yn = 1./(4*pi*((a_xn-X).^2+(a_zp-Z).^2));
kyn = (yn2-Y)./((yn2-Y).^2+(a_xn-X).^2+(a_zp-Z).^2).^0.5;
k_2yn = (yn1-Y)./((yn1-Y).^2+(a_xn-X).^2+(a_zp-Z).^2).^0.5;

Hx_yn = ((a_zp-Z).*k_yn.*(kyn - k_2yn))*I*m0;
Hy_yn = zeros(size(X,1),size(Y,1),size(Z,1));
Hz_yn = ((a_xn-X).*k_yn.*(kyn - k_2yn))*I*m0;

end