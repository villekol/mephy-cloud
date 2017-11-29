function [ t,dp,pw ] = RatkaiseKasvu( T,D,M,L,ka,rho,gamma,Ntot,tmax,dp0,p0 )
% RatkaiseKasvu Hiukkasen kondensaatiolaskennan laskuri
% Tämä funktio ratkaisee hiukkasen kondensaatiokasvun tilanteessa, jossa
% oletetaan, että kaikki vesi menee hiukkasiin.
%
% INPUT
% T - ympäristön lämpötila (K)
% D - veden diffuusiokerroin (m^2/s)
% M - veden moolimassa (kg/mol)
% L - veden höyrystymislämpö (J/kg)
% ka - ilman lämmönjohtavuus (W/(m*k))
% rho - vedentiheys (kg/m^3)
% gamma - veden pintajännitys (N/m)
% Ntot - hiukkasten lukumääräpitoisuus (#/cm^3)
% tmax - maksimiaika, mihin kasvua lasketaan
% dp0 - hiukkasen halkaisija alussa (m)
% p0 - veden osapaine alussa (Pa)
%
% OUTPUT
% t - aika(s)
% dp - hiukkasen halkaisija hetkellä t (m)
% pw - veden osapaine hetkellä t (Pa)
%
% Joni Kalliokoski 13.8.2014
options = odeset('RelTol',1e-6,'AbsTol',[1e-11 0.01],'InitialStep',1e-7,'Refine',10);
[t,Y] = ode15s(@(t,y)dyKasvu(t,y,T,D,M,L,ka,rho,gamma,Ntot,dp0),[0 tmax],[dp0 p0],options);
dp = Y(:,1);
pw = Y(:,2);

end

