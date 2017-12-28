% Piirr� pienin tiivistyv� hiukkaskoko saturaatiosuhteen funktiona

T = 23 + 273;                   % l�mp�tila, K
M = (2 * 1.008 + 15.999)*1e-3;  % veden moolimassa, kg/mol
gamma = pintajannitys(T);       % veden pintaj�nnitys, N/m
rho = 1000;                     % veden tiheys, kg/m^3
R = 8.3144598;                  % kaasuvakio, J/mol*K

dp = logspace(-9,-6,500);

SR = exp((4 .* M .* gamma) ./ (rho .* R .* T .* dp));

figure
plot(dp,SR)
set(gca,'XScale','log')