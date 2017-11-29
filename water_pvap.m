function [ pvap ] = water_pvap( T )
% WATER_PVAP Veden h�yrynpaine
% [ pvap ] = water_pvap( T ) laskee veden h�yrynpaineen l�mp�tilassa T (K)
% Pascaleina
%
% INPUT
% T - l�mp�tila (K)
%
% OUTPUT
% pvap - veden h�yrynpaine (Pa)
%
% Joni Kalliokoski 13.8.2014
pvap = exp(77.34491296-7235.424651./T-8.2*log(T)+0.0057113*T);
end

