% tutkitaan mittausdataa

close all
clear variables

% jakaumamittauskansioita on yhteensa 12

N = 12;

for i = 1:N
    
    nimi = ['0' int2str(i)];
    nimi = nimi(end-1:end);
    
    data = luemittaus(nimi);
    
    for j = 1:length(data)
        
        signaali = data(j).sign;
        
        figure
        hold on
        
        plot(signaali)
        plot(smooth(signaali,100,'sgolay'))
        
        title([nimi ', ' int2str(j)])
        
        hold off
        
    end
    
end