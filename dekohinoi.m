function [aika,dekohinoitu] = dekohinoi(signaali)

% Poista kohina mittaussignaalista. Signaali on pystyvektori.
% Palautusarvoina ovat aikavektori (keinotekoinen) ja
% kohinavapaa signaali.
%
% Kohina poistetaan diskreetin Fourier-muunnoksen avulla.
% Signaali muunnetaan taajuustasoon ja siita leikataan korkeat
% taajuudet pois.
%
% Numeerinen toteutus tehdaan Shmuel Ben-Ezran (2009) julkaisemalla
% MATLAB-funktiolla fftf. Tama on saatavissa File Exchangesta.
% Funktioon on tehty tata implementointia varten tuloksen
% skaalaukseen liittyvia muutoksia. Lisaksi on poistettu
% kaytosta kuvaajan piirto.

% luodaan aikavektori, kun tiedetaan naytteenottotaajuudeksi 10 kHz
N = length(signaali);
aika = (1:N)' / (10e3);

% valitaan leikkaustaajuus (Hz)
leikkaus = 200;

[dekohinoitu,~,~,~] = fftf(aika,signaali,leikkaus);

end