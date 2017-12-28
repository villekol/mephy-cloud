function dy = diffsysteemi(t,y,T,N,dp0,P0s)
% Apufunktio differentiaalisysteemin ratkaisua varten. Tätä funktiota
% kutsustaan oderatkaisijassa, ja tähän muodostetaan diff systeemi.

% input
% y(1)- hiukkasen koko (m)
% y(2) - veden höyrynpaineet (Pa)
% T - ympäristön lämpötila
% N - hiukkaslukumääräpitoisuus (#/m^3)
% dp0 - halkaisija alussa
% p0 - veden höyrynpaineet alussa (Pa)

% output
% dy - muutosnopeudet hiukkaskoolle ja veden höyrynpaineelle
Td = pintalampo(y(1),y(2));          % Hiukkasten pinnan lämpötila (K)

dy = zeros(2,1);

dy(1) = hiukkaskoko(y(1),y(2),Td);   % Opintomonisteen yhtälö 6
dy(2) = paineenmuutos(N,y(1),dy(1),T);

% Mallikoodin mukainen pätkä:
% jos hiukkanen haluaisi haihtua, mutta se on alkuperäisessä koossaan, 
% niin halkaisijaa ei pienennetä. Oletetaan, ei-haihtuva ydinhiukkanen.
if dy(1) < 0 && y(1) <= dp0
    dy(1) = 0;
    dy(2) = 0;
end

end