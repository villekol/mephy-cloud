function [ ddpdt ] = dp_growth_rate( dp, T, rho, gamma, M, D, p, Td)
% DP_GROWTH_RATE Hiukkasen halkaisijan muutosnopeus
% T�m� funktio laskee hiukkasen halkaisijan muutosnopeuden kondensaatiokas-
% vun aikana.
%
% INPUT
% dp - hiukkasen halkaisija (m)
% T - ymp�rist�n l�mp�tila (K)
% rho - vedentiheys (kg/m^3)
% gamma - veden pintaj�nnitys (N/m)
% M - veden moolimassa (kg/mol)
% D - veden diffuusiokerroin (m^2/s)
% p - ymp�rist�n veden osapaine (Pa)
% Td - hiukkasen pintal�mp�tila (K)
%
% OUTPUT
% ddpdt - Hiukkasen halkaisijan muutosnopeus (m/s)
%
% Joni Kalliokoski 13.8.2014

%Lasketaan h�yrynpaine hiukkasen pinnalla
pd = water_pvap( Td )*kelvin_ratio( dp,Td,rho,gamma,M );
lambda = free_path( T, D, M);
R = 8.3144621;

ddpdt = ( (4*D*M) / (R*rho*dp) ) * ( (p/T)- (pd/Td) ) * FuchsSutugin( dp, lambda );

end

