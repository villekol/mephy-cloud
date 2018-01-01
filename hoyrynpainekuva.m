% veden kylläinen höyrynpaine

clear variables
close all

T = 13:0.1:47;
T = T + 273.15;

psw = tasapainoPsw(T);

figure

plot(T - 273.15,psw * 1e-3,'LineWidth',3)
xlabel('L{\"a}mp{\"o}tila ($^{\circ}$C)','Interpreter','latex',...
    'FontSize',16)
ylabel('Veden kyll{\"a}inen h{\"o}yrynpaine (kPa)',...
    'Interpreter','latex','FontSize',16)

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.FontSize = 16;

figname = 'vesikyllainen';
filepath = ['../' figname];

export_fig(filepath,'-pdf','-transparent')