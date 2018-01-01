function Td = pintalampo(dp,p)

T = 23 + 273;                   % l�mp�tila, K
M = (2 * 1.008 + 15.999)*1e-3;  % veden moolimassa, kg/mol
R = 8.3144598;                  % kaasuvakio, J/mol*K
D = 0.282e-4;                   % veden diffuusiokerroin, (m^2/s)
L = 2260e3;                     % veden h�yrystymisl�mp�, (J/kg)
ka = 0.0257;                    % ilman l�mm�njohtavuus, (W/(m*K))

% Kommentoitu pois koska p pit�� tuoda parametrina diffyht�l�� varten
%p = supersaturaatio(dp,T) * tasapainoPsw(T);
lambda = free_path(T,D,M);

f = @(x) x - T - D*M*L/(R*ka) .* ...
    (p./T - (supersaturaatio(dp,x) .* tasapainoPsw(x)) ./ x) .* ...
    FuchsSutugin(dp,lambda);

Td = fzero(f,T);

end