function [SR,ps] = supersaturaatio(dp,T)

M = (2 * 1.008 + 15.999)*1e-3;  % veden moolimassa, kg/mol
gamma = pintajannitys(T);       % veden pintajännitys, N/m
rho = 1000;                     % veden tiheys, kg/m^3
R = 8.3144598;                  % kaasuvakio, J/mol*K

% lasketaan saturaatiohöyrynpaine ps
ps = tasapainoPsw(T);

% lasketaan supersaturaatiosuhde
SR = exp(4*M*gamma ./ (rho*R*T*dp*1e-9));

end