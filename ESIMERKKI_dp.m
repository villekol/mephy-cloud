% Tämä on esimerkikki, kuinka hiukkasten kasvu ratkaistaan sekä kuinka
% ratkaisusta piirretään kuvat.
%
% Joni Kalliokoski 14.8.2014

% Laskentaan tarvittavia arvoja
T = 296.15; %Lämpötila (K)
D = 0.282e-4; %Veden diffuusiokerroin (m^2/s)
M = 18.016e-3; %Veden moolimassa (kg/mol)
L = 2260e3; %Veden höyrystymislämpö (J/kg)
ka = 0.0257; %Ilman lämmönjohtavuus (W/(m*K))
rho = 1000; %Veden tiheys (kg/m^3)
gamma = 72.8e-3; %Veden pintajännitys (N/m)
Ntot = 1e10; %Hiukkasten lukumääräpitoisuus (#/m^3)
tmax = 2; %Mihin ajanhetkeen laskentaa suoritetaan (s)

%Alkuarvot hiukkasen halkaisijalle (m) ja veden osapaineelle (Pa). 
%Huomaa, että tässä tapauksessa saturaatiosuhde alussa 1.2.
dp0 = 100e-9;
p0 = 1.2*water_pvap(T);

%Ratkaistaan hiukkasten kasvu
[ t,dp,pw ] = RatkaiseKasvu( T,D,M,L,ka,rho,gamma,Ntot,tmax,dp0,p0 );

%Piiretään hiukkasen halkaisijasta ja veden osapaineesta kuvaajat
%ajan funktiona. subplot komennolla voidaan piirtää useampia kuvaajia
%vierekkäin samaan kuvaan. Katso lisää komennolla "doc subplot", ilman
%heittomerkkejä.

subplot(1,2,1)
plot(t,dp,'-k')
xlabel('t (s)')
ylabel('d_p (m)')

subplot(1,2,2)
plot(t,pw,'-k')
xlabel('t (s)')
ylabel('P_w (Pa)')