% Saturaatiosuhdekuva

close all
clear variables

dp = logspace(1,5,1001) * 1e-9;

[SR,~,~] = laitteistoparametrit(dp);

figure
set(gcf,'DefaultTextInterpreter','latex')

plot(dp*1e6,SR,'LineWidth',2)
set(gca,'XScale','log','TickLabelInterpreter','latex','FontSize',16,...
    'XTick',logspace(-3,2,6))
xlim([1e-3 1e2])

xlabel('Hiukkaskoko $d_p$ ($\mu$m)','FontSize',16)
ylabel('Saturaatiosuhde $S_R$','FontSize',16)

filename = 'saturaatiosuhde';
filepath = ['../' filename];
export_fig(filepath,'-pdf','-transparent')