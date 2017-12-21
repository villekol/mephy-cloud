function jannitys = pintajannitys(T)

%laskee veden pintajännityksen

Tc = 647.096;
B = 235.8*1e-3;
b = -0.625;
mu = 1.256;

tau = 1 - T./Tc;
jannitys = B * tau.^mu .* (1 - b*tau);

end