% Esimerkkitiedosto ekstinktiotehokkuuksien laskentaan
% Joni Kalliokoski, 9.9.2014

m=1.33+0.001i; % veden taitekerroin
lambda=635; % valon aallonpituus (nm)
dp = logspace(1,4,1000); % hiukkaskokovektori, joissa ekstintiotehokuudet
                         % lasketaan (nm)

% Lasketaan Mie-parametrit:
Qext = zeros(size(dp)); %Alustetaan ekstintiovektori
for k = 1:numel(dp)
    result = Mie(m, pi*dp(k)/lambda); %Mie-parametrien laskenta
    Qext(k) = result(4); %Funktio palauttaa vektorin, jonka 4. alkio
    % on haluttu ekstinktiotehokkuus, muita arvoja ei tässä työssä tarvita.
end

%Piirretään ekstintiotehokkuus hiukkaskoon funktiona
loglog(dp,Qext,'-k')
xlabel('d_p (nm)')
ylabel('Q_{ext}')