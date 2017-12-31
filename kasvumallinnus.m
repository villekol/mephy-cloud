%% Hiukkasen koon muutoksen mallinnus

a = 2; % op.nrojen viimeiset merkit 2 ja 3

% Mallinnetaan alkujaan 20*a (nm) kokoista hiukkasta höyrynpaineissa, jotka
% vastaavat kokojen 5*a, 10*a ja 20*a saturaatiosuhteita

SRs = [1.7196 1.2726 1.1203];   % Saturaatiosuhteet
N = 10000 * 1e+6;               % Hiukkaspitoisuus (#/m^3)
tmax = 4;                       % Mallinnetaan aikavälillä 0-4s
T = 296.15;                     % Lämpötila (K)
Psw = tasapainoPsw(T);          % Kylläinen höyrynpaine (Pa)

P0s = SRs .* Psw;               % Alkuhöyrynpaineet (Pa)
dp0 = 20 * a * 1e-9;            % Hiukkasen alkukoko (nm)

P01 = P0s(1);
[t1,dp1,p1]=oderatkaisija(T,N,tmax,P01,dp0);

P02 = P0s(2);
[t2,dp2,p2]=oderatkaisija(T,N,tmax,P02,dp0);

P03 = P0s(3);
[t3,dp3,p3]=oderatkaisija(T,N,tmax,P03,dp0);

figure
hold on
subplot(3,2,1)
title('P1')
plot(t1,dp1,'-k')
xlabel('t (s)')
ylabel('d_p (m)')

subplot(3,2,2)
plot(t1,p1,'-k')
xlabel('t (s)')
ylabel('P (Pa)')

subplot(3,2,3)
plot(t2,dp2,'-k')
xlabel('t (s)')
ylabel('d_p (m)')

subplot(3,2,4)
plot(t2,p2,'-k')
xlabel('t (s)')
ylabel('P (Pa)')

subplot(3,2,5)
plot(t3,dp3,'-k')
xlabel('t (s)')
ylabel('d_p (m)')

subplot(3,2,6)
plot(t3,p3,'-k')
xlabel('t (s)')
ylabel('P (Pa)')




