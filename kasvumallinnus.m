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
L = 1;                          % Ekstinkitomatka (m)
tmax = 4;                       % Mallinnetaan aikav�lill� 0-4s
T = 23 + 273.15;                % L�mp�tila (K)
Psw = tasapainoPsw(T);          % Kyll�inen h�yrynpaine (Pa)

P0s = SRs .* Psw;               % Alkuh�yrynpaineet (Pa)
dp0 = 20 * a * 1e-9;            % Hiukkasen alkukoko (nm)

% Ratkaistaan differentiaalisysteemi kullakin alkuh�yrynpaineella
P01 = P0s(1);
[t1,dp1,p1]=oderatkaisija(T,N,tmax,P01,dp0);

P02 = P0s(2);
[t2,dp2,p2]=oderatkaisija(T,N,tmax,P02,dp0);

P03 = P0s(3);
[t3,dp3,p3]=oderatkaisija(T,N,tmax,P03,dp0);

% Piirret��n kuvaajat
figure
set(gcf,'DefaultTextInterpreter','latex')

subplot(3,1,1)

hold on
h1 = plot(t1,dp1*1e6,'DisplayName',['$p_w$(' num2str(dp(1)*1e9) ' nm)']);
h2 = plot(t2,dp2*1e6,'DisplayName',['$p_w$(' num2str(dp(2)*1e9) ' nm)']);
h3 = plot(t3,dp3*1e6,'DisplayName',['$p_w$(' num2str(dp(3)*1e9) ' nm)']);

xlabel('$t$ (s)')
ylabel('$d_p$ ($\mu$m)')
leg1 = legend([h1 h2 h3],'Location','best');
set(leg1,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')

hold off

subplot(3,1,2)

hold on

h4 = plot(t1,p1*1e-3,'DisplayName',['$p_w$(' num2str(dp(1)*1e9) ' nm)']);
h5 = plot(t2,p2*1e-3,'DisplayName',['$p_w$(' num2str(dp(2)*1e9) ' nm)']);
h6 = plot(t3,p3*1e-3,'DisplayName',['$p_w$(' num2str(dp(3)*1e9) ' nm)']);

xlabel('$t$ (s)')
ylabel('$P$ (kPa)')
leg2 = legend([h4 h5 h6],'Location','best');
set(leg2,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')

hold off

% ekstinktio-osuus

lambda = 635 * 1e-9;
L = 0.20;

% refractive index by interpolation from Hale and Querry (1973)
x = [600 650] * 1e-9;
rey = [1.332 1.331];
imy = [1.09 1.64] * 1e-8;
n = interp1(x,rey,lambda);
k = interp1(x,imy,lambda);

m = complex(n,k);

Qext1 = zeros(size(dp1));
Qext2 = zeros(size(dp2));
Qext3 = zeros(size(dp3));

alpha1 = pi * dp1 / lambda;
alpha2 = pi * dp2 / lambda;
alpha3 = pi * dp3 / lambda;

for i = 1:length(dp1)
    result = Mie(m,alpha1(i));
    Qext1(i) = result(4);
end

for i = 1:length(dp2)
    result = Mie(m,alpha2(i));
    Qext2(i) = result(4);
end

for i = 1:length(dp3)
    result = Mie(m,alpha3(i));
    Qext3(i) = result(4);
end

bext1 = pi * dp1.^2 * N .* Qext1 / 4;
trans1 = exp(-bext1 * L);

bext2 = pi * dp2.^2 * N .* Qext2 / 4;
trans2 = exp(-bext2 * L);

bext3 = pi * dp3.^2 * N .* Qext3 / 4;
trans3 = exp(-bext3 * L);

subplot(3,1,3)

hold on

h7 = plot(t1,trans1);
h8 = plot(t2,trans2);
h9 = plot(t3,trans3);
