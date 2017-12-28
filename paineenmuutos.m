function [dpdt] = paineenmuutos(N,dp,ddpdt,T)

% input
% N - hiukkasten lukumääräpitoisuus (#/m^3)
% dp - hiukkasen halkaisija (m)
% ddpdt - hiukkasen halkaisijan muutosnopeus (m/s)
% T - ympäristön lämpötila (K)

% output
% dpdt - höyrynpaineen muutosnopeus

M = 18.016e-3;                  % Veden moolimassa (kg/mol)
rho = 1000;                     % Veden tiheys (kg/m^3)
R = 8.3144621;                  % Kaasuvakio

dpdt = -(R * T * rho * N * pi * dp^2 * ddpdt)/(2 * M);

end