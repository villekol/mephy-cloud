function [ Td ] = droplet_temp(T, D, M, L, ka, p,dp,rho,gamma  )
% DROPLET_TEMP Hiukkasen pintalämpötila
% Tämä funktio laskee hiukkasen pintalämpötilan kondensaatiokasvun aikana.
%
% INPUT
% T - ympäristön lämpötila (K)
% D - veden diffuusiokerroin (m^2/s)
% M - veden moolimassa (kg/mol)
% L - veden höyrystymislämpö (J/kg)
% ka - ilman lämmönjohtavuus (W/(m*k))
% p - ympäristön veden osapaine (Pa)
% dp - hiukkasen halkaisija (m)
% rho - veden tiheys (kg/m^3)
% gamma - veden pintajännitys (N/m)
%
% OUTPUT
% Td - Hiukkasen pintalämpötila (K)
%
% Joni Kalliokoski 13.8.2014
lambda = free_path( T, D, M);
R = 8.3144621;
f = @(x)(x - T - ((D*M*L)/(R*ka))* ( (p/T)- (water_pvap( x)*kelvin_ratio( dp,x,rho,gamma,M )./x) ) * FuchsSutugin( dp, lambda ));
Td = fzero(f,T);

end

