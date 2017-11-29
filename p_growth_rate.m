function [ dpdt ] = p_growth_rate( T, rho, Ntot, dp, ddpdt, M )
% P_GROWTH_RATE H�yrynpaineen kasvunopeus
% T�m� funktio laskee h�yrynpaineen muutosnopeuden kondensaatiokas-
% vun aikana.
%
% INPUT
% T - ymp�rist�n l�mp�tila (K)
% rho - veden tiheys (kg/m^3)
% Ntot - hiukkasten lukum��r�pitoisuus (#/cm^3)
% dp - hiukkasen halkaisija (m)
% ddpdt - hiukkasen halkaisijan muutosnopeus (m/s)
% M - veden moolimassa (kg/mol)
%
% OUTPUT
% dpdt - Osapaineen muutosnopeus (Pa/s)
%
% Joni Kalliokoski 13.8.2014
R = 8.3144621;
dpdt = -(R*T*rho*Ntot*pi*dp^2*ddpdt)/(2*M);
end

