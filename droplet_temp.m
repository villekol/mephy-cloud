function [ Td ] = droplet_temp(T, D, M, L, ka, p,dp,rho,gamma  )
% DROPLET_TEMP Hiukkasen pintal�mp�tila
% T�m� funktio laskee hiukkasen pintal�mp�tilan kondensaatiokasvun aikana.
%
% INPUT
% T - ymp�rist�n l�mp�tila (K)
% D - veden diffuusiokerroin (m^2/s)
% M - veden moolimassa (kg/mol)
% L - veden h�yrystymisl�mp� (J/kg)
% ka - ilman l�mm�njohtavuus (W/(m*k))
% p - ymp�rist�n veden osapaine (Pa)
% dp - hiukkasen halkaisija (m)
% rho - veden tiheys (kg/m^3)
% gamma - veden pintaj�nnitys (N/m)
%
% OUTPUT
% Td - Hiukkasen pintal�mp�tila (K)
%
% Joni Kalliokoski 13.8.2014
lambda = free_path( T, D, M);
R = 8.3144621;
f = @(x)(x - T - ((D*M*L)/(R*ka))* ( (p/T)- (water_pvap( x)*kelvin_ratio( dp,x,rho,gamma,M )./x) ) * FuchsSutugin( dp, lambda ));
Td = fzero(f,T);

end

