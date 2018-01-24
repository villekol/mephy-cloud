function [data] = luemittaus(kansionimi)

% Lue yhteen mittaukseen liittyva data kansiosta kansionimi (esim. 01).
% Palautusarvo on structure array, jossa kentat
%   pero - mitattu paine-ero
%   pabs - mitattu absoluuttinen paine
%   sign - mitattu ekstinktiosignaali
%
% Data on sijoitettava current working directoryn ylakansioon.
% Kaikki datakansiot kerataan "data"-nimiseen kansioon.

polku = ['../data/' kansionimi];

tiedostot = dir(polku);
data = struct;
laskuri = 0;

for i = 1:length(tiedostot)
    
    tiedosto = tiedostot(i);
    
    if strcmp(tiedosto.name(end),'t')
        
        laskuri = laskuri + 1;
        
        f = fopen([tiedosto.folder '/' tiedosto.name],'r');
        tiedot = fscanf(f,'%f');
        fclose(f);
        
        tiedot = reshape(tiedot,[],3);
        
        data(laskuri).pero = tiedot(:,1);
        data(laskuri).pabs = tiedot(:,2);
        data(laskuri).sign = tiedot(:,3);
        
    end
    
end

end