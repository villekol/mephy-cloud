function [ out ] = FuchsSutugin( dp, lambda )
% FUCHSSUTUGIN Fuchs-Sutuginin korjauskerroin
% [ out ] = FuchsSutugin( dp, lambda ) Laskee Fuchs-Sutuginin
% korjauskertoimen dp halkaisijaiselle hiukkaselle, kun vapaamatka on
% lambda
%
% INPUT
% T - hiukkasen halkaisija (m)
% lambda - vapaa matka (m)
%
% OUTPUT
% out - Fuchs-Sutuginin korjauskerroin (-)
%
% Joni Kalliokoski 13.8.2014
Kn = 2*lambda./dp;
out = (1 + Kn) ./ (1 + 1.71*Kn + 1.33*Kn.^2);


end

