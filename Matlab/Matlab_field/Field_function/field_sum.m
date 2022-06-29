function [Hx, Hy, Hz] = field_sum(Hx_xp , Hx_xn , Hx_yp , Hx_yn, Hy_xp , Hy_xn , Hy_yp , Hy_yn, Hz_xp , Hz_xn , Hz_yp , Hz_yn)
Hx = Hx_xp + Hx_xn + Hx_yp + Hx_yn;
Hy = Hy_xp + Hy_xn + Hy_yp + Hy_yn;
Hz = Hz_xp + Hz_xn + Hz_yp + Hz_yn;
end