% Tämä on esimerkikki, kuinka voidaan ratkaista hankala yhtälö numeerisesti.
%
% Sampo Saari 14.10.2014

%Luodaan x-vektori
x=1:0.01:10;

%Funktio y(x), jota ei voi analyyttisesti ratkaista
y=x.^2.*log((sin(x).^2+1).*x)+1./x+log(x)+1e-4.*x.^5;

%Näyttää tältä
figure(1)
plot(x,y)

%Ratkaistaan x:n arvo kohdassa y=200
YY=200;
XX=interp1(y,x,YY)

