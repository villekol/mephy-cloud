function [dpdt] = paineenmuutos(N,dp,ddpdt,T)

% input
% N - hiukkasten lukum��r�pitoisuus (#/m^3)
% dp - hiukkasen halkaisija (m)
% ddpdt - hiukkasen halkaisijan muutosnopeus (m/s)
% T - ymp�rist�n l�mp�tila (K)

% output
% dpdt - h�yrynpaineen muutosnopeus

M = 18.016e-3;                  % Veden moolimassa (kg/mol)
rho = 1000;                     % Veden tiheys (kg/m^3)
R = 8.3144621;                  % Kaasuvakio

dpdt = -(R * T * rho * N * pi * dp^2 * ddpdt)/(2 * M);

end