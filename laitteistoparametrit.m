function [SR,y,deltaP] = laitteistoparametrit(dp)

% Ratkaise saturaatiosuhteet, sek� adiabaattisessa laajenemisessa
% vaadittavat painesuhteet ja -erot.

Ti = 23 + 273.15; % alkul�mp�tila, K
Pf = 990 * 1e-3 * 1e5; % loppupaine, Pa
gamma = 1.4; % ilman adiabaattivakio

% ratkaistaan painesuhteet
%           psw(Ti) * Pf
% SR(Tf) = --------------,
%           psw(Tf) * Pi
% Tf = Ti * (Pf/Pi)^(1 - 1/gamma)
% kirjoitetaan x = Pf/Pi

y = zeros(size(dp));
f = @(x,d) tasapainoPsw(Ti) * x / (tasapainoPsw(Ti * x^(1 - 1/gamma)))...
    - supersaturaatio(d,Ti * x^(1 - 1/gamma));

% ratkaistaan funktion f nollakohta jokaisella hiukkaskoolla
for i = 1:length(dp)
    koko = dp(i);
    y(i) = fzero(@(x) f(x,koko),5);
end

% nyt y-vektori sis�lt�� painesuhteet Pf/Pi
% ratkaistaan paine-erot Pi - Pf
deltaP = (Pf ./ y - Pf) * 1e-5 * 1e3;

% ratkaistaan painesuhteita vastaavat saturaatiosuhteet
SR = supersaturaatio(dp,Ti * y.^(1 - 1/gamma));

end