function [t,ddp, dpp] = oderatkaisija(T, N, tmax, P0, dp0)

% INPUT
% T - ympäristön lämpötila (K)
% N - hiukkasten lukumääräputoisuus (#/m^3)
% tmax - mallinnukseen käytetty aika (s)
% P0 - veden höyrynpaine alkutilanteessa. (Pa)
% dp0 - hiukkasen halkaisija alussa (m)
% dp - hiukkasen halkaisija muuttujana (m)
% p - veden osapaineet muuttujina (Pa)

% OUTPUT
% t - aika (s)
% ddp - hiukkasen koko hetkellä t (m)
% dpp - paine hetkellä t (Pa)

% Esimerkkikoodin mukaiset asetukset
options = odeset('RelTol',1e-6,'AbsTol',[1e-11 0.01],'InitialStep',1e-7,'Refine',10);

[t,Y] = ode15s(@(t,Y)diffsysteemi(Y,T,N,dp0),[0 tmax],[dp0 P0],options);
ddp = Y(:,1);
dpp = Y(:,2);


end


