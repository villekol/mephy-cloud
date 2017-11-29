function [ kr ] = kelvin_ratio( dp,T,rho,gamma,M )
% KELVIN_RATIO Laskee kelvin suhteen
% [ kr ] = kelvin_ratio( dp,T,rho,gamma,M ) laskee kelvin suhteen
%
% INPUT
% dp - hiukkasen halkaisija (m)
% T - lämpötila (K)
% rho - tiheys (kg/m^3)
% gamma - pintajännitys (N/m)
% M - moolimassa (kg/mol)
%
% OUTPUT
% lambda - vapaa matka (m)
%
% Joni Kalliokoski 13.8.2014
R = 8.3144621;
kr = exp((4.*M.*gamma)./(rho.*R.*T.*dp));


end

