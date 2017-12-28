function [ddpdt] = hiukkaskoko(dp,p,Td)

% input
% dp - hiukkasen halkaisija ajanhetkell� (m)
% p - veden osapaine ajanhetkell� (Pa)
% Td - hiukkasen pintal�mp�tila (K)

T = 23 + 273;                   % l�mp�tila, K
M = (2 * 1.008 + 15.999)*1e-3;  % veden moolimassa, kg/mol
rho = 1000;                     % veden tiheys, kg/m^3
R = 8.3144598;                  % kaasuvakio, J/mol*K
D = 0.282e-4;                   % Veden diffuusiokerroin (m^2/s)

% H�yrynpaine hiukkasen pinnalla ajanhetkell�
pd = tasapainoPsw(Td) * supersaturaatio(dp,Td);
lambda = free_path(T,D,M); %FuchsSutuginia varten

ddpdt = ( (4*D*M) / (R*rho*dp) ) * ( (p./T) - (pd/Td) ) * FuchsSutugin( dp, lambda );





end