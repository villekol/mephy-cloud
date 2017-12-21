function SR = supersaturaatio(dp,T)

M = (2 * 1.008 + 15.999)*1e-3;  % veden moolimassa, kg/mol
sigma = pintajannitys(T);       % veden pintajännitys, N/m
rho = 1000;                     % veden tiheys, kg/m^3
R = 8.3144598;                  % kaasuvakio, J/mol*K

% lasketaan supersaturaatiosuhde
SR = exp(4*M*sigma ./ (rho*R*T.*dp));

end