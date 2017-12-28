function ps = tasapainoPs(T,neste)

switch neste % Aerosol Measurement, taulukko 17-1
    case 'vesi'
        a = 10.23;
        b = 1750;
        c = 38;
end

ps = 10^(a - b/(T - c));

end