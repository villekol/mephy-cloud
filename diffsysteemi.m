function dy = diffsysteemi(t,y,T,N,dp0,P0s)
% Apufunktio differentiaalisysteemin ratkaisua varten. T�t� funktiota
% kutsustaan oderatkaisijassa, ja t�h�n muodostetaan diff systeemi.

% input
% y(1)- hiukkasen koko (m)
% y(2) - veden h�yrynpaineet (Pa)
% T - ymp�rist�n l�mp�tila
% N - hiukkaslukum��r�pitoisuus (#/m^3)
% dp0 - halkaisija alussa
% p0 - veden h�yrynpaineet alussa (Pa)

% output
% dy - muutosnopeudet hiukkaskoolle ja veden h�yrynpaineelle
Td = pintalampo(y(1),y(2));          % Hiukkasten pinnan l�mp�tila (K)

dy = zeros(2,1);

dy(1) = hiukkaskoko(y(1),y(2),Td);   % Opintomonisteen yht�l� 6
dy(2) = paineenmuutos(N,y(1),dy(1),T);

% Mallikoodin mukainen p�tk�:
% jos hiukkanen haluaisi haihtua, mutta se on alkuper�isess� koossaan, 
% niin halkaisijaa ei pienennet�. Oletetaan, ei-haihtuva ydinhiukkanen.
if dy(1) < 0 && y(1) <= dp0
    dy(1) = 0;
    dy(2) = 0;
end

end