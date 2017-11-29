function [lambda] = free_path( T, D, M)
% FREE_PATH Laskee vapaan matkan molekyylille
% [lambda] = free_path( D, M, T ) laskee lämpötilassa T (K) vapaan matkan
% molekyylille, jonka diffuusiokerroin on D (m^2/s), moolimassa on M (kg/mol)
%
% INPUT
% T - lämpötila (K)
% D - diffuusiokerroin (m^2/s)
% M - moolimassa (kg/mol)
%
% OUTPUT
% lambda - vapaa matka (m)
%
% Joni Kalliokoski 13.8.2014

R = 8.3144621;
lambda = 3.*D.*sqrt((pi.*M)./(8.*R.*T));


end

