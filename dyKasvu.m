function dy = dyKasvu(t,y,T,D,M,L,ka,rho,gamma,Ntot,dp0)
% DY_KASVU Differentiaaliyhtälösysteemi kondensaatiokasvun laskentaan
% Tämä funktio on differentiaaliyhtälösysteemi hiukkasen kondensaatio-
% kasvun laskentaan, mikä syötetään parametriksi differentiaaliyhtälöryhmän
% ratkaisijalle (ode15s). 
%
% INPUT
% t - aika (s)
% y - y(1) hiukkasen halkaisija (m) ja y(2) ympäristön veden osapaine (Pa)
% T - ympäristön lämpötila (K)
% D - veden diffuusiokerroin (m^2/s)
% M - veden moolimassa (kg/mol)
% L - veden höyrystymislämpö (J/kg)
% ka - ilman lämmönjohtavuus (W/(m*k))
% rho - vedentiheys (kg/m^3)
% gamma - veden pintajännitys (N/m)
% Ntot - hiukkasten lukumääräpitoisuus (#/cm^3)
% dp0 - hiukkasen halkaisija alussa (m)
%
% OUTPUT
% dy - muutosnopeudet. 1. alkio on hiukkasen halkaisija (m) ja 2. alkio
% ympäristön veden osapaine (Pa) 
%
% Joni Kalliokoski 13.8.2014

dy = zeros(2,1);
Td = droplet_temp(T, D, M, L, ka, y(2),y(1),rho,gamma  );
dy(1) = dp_growth_rate( y(1), T, rho, gamma, M, D, y(2), Td);
dy(2) = p_growth_rate( T, rho, Ntot, y(1), dy(1), M );

% jos hiukkanen haluaisi haihtua, mutta se on alkuperäisessä koossaan, 
% niin halkaisijaa ei pienennetä. Oletetaan, ei-haihtuva ydinhiukkanen.
if dy(1) < 0 && y(1) <= dp0
    dy(1) = 0;
    dy(2) = 0;
end

end

