%% Hiukkasen koon muutoksen mallinnus

close all
clear variables

a = 2; % op.nrojen viimeiset merkit 2 ja 3

% Mallinnetaan alkujaan 20*a (nm) kokoista hiukkasta h�yrynpaineissa, jotka
% vastaavat kokojen 5*a, 10*a ja 20*a saturaatiosuhteita

dp = a * [5 10 20 50 100] * 1e-9;

[kaikkiSRs,suhdeP,deltaP] = laitteistoparametrit(dp); % Saturaatiosuhteet
SRs = kaikkiSRs(1:3);           % Saturaatiosuhteet mallinnukseen
N = 10000 * 1e+6;               % Hiukkaspitoisuus (#/m^3)
tmax = 4;                       % Mallinnetaan aikav�lill� 0-4s
T = 23 + 273.15;                % L�mp�tila (K)
Psw = tasapainoPsw(T);          % Kyll�inen h�yrynpaine (Pa)

P0s = SRs .* Psw;               % Alkuh�yrynpaineet (Pa)
dp0 = 20 * a * 1e-9;            % Hiukkasen alkukoko (nm)

P01 = P0s(1);
[t1,dp1,p1]=oderatkaisija(T,N,tmax,P01,dp0);

P02 = P0s(2);
[t2,dp2,p2]=oderatkaisija(T,N,tmax,P02,dp0);

P03 = P0s(3);
[t3,dp3,p3]=oderatkaisija(T,N,tmax,P03,dp0);

figure
set(gcf,'DefaultTextInterpreter','latex')

subplot(2,1,1)

hold on
h1 = plot(t1,dp1*1e6,'DisplayName',['$p_w$(' num2str(dp(1)*1e9) ' nm)']);
h2 = plot(t2,dp2*1e6,'DisplayName',['$p_w$(' num2str(dp(2)*1e9) ' nm)']);
h3 = plot(t3,dp3*1e6,'DisplayName',['$p_w$(' num2str(dp(3)*1e9) ' nm)']);

xlabel('$t$ (s)')
ylabel('$d_p$ ($\mu$m)')
leg1 = legend([h1 h2 h3],'Location','best');
set(leg1,'Interpreter','latex')

hold off

subplot(2,1,2)

hold on
h4 = plot(t1,p1*1e-3,'DisplayName',['$p_w$(' num2str(dp(1)*1e9) ' nm)']);
h5 = plot(t2,p2*1e-3,'DisplayName',['$p_w$(' num2str(dp(2)*1e9) ' nm)']);
h6 = plot(t3,p3*1e-3,'DisplayName',['$p_w$(' num2str(dp(3)*1e9) ' nm)']);

xlabel('$t$ (s)')
ylabel('$P$ (kPa)')
leg2 = legend([h4 h5 h6],'Location','best');
set(leg2,'Interpreter','latex')

hold off
