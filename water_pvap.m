function [ pvap ] = water_pvap( T )
% WATER_PVAP Veden höyrynpaine
% [ pvap ] = water_pvap( T ) laskee veden höyrynpaineen lämpötilassa T (K)
% Pascaleina
%
% INPUT
% T - lämpötila (K)
%
% OUTPUT
% pvap - veden höyrynpaine (Pa)
%
% Joni Kalliokoski 13.8.2014
pvap = exp(77.34491296-7235.424651./T-8.2*log(T)+0.0057113*T);
end

