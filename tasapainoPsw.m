function ps = tasapainoPsw(T)

%Veden höyrynpaine Pascalin kaavasta

ps = exp(77.34491296 - 7235.424651./T - 8.2*log(T) + 0.0057113.*T);

end