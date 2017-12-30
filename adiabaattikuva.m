% adiabaattinen prosessi

clear variables
close all

gamma = 1.4;
P = 1:0.1:9;

V = 1 ./ P.^(1/gamma);
T = 1 ./ P.^(1/gamma - 1);

figure
yyaxis left

p1 = plot(P,V,'LineWidth',2);
ax = gca;

xlabel('paine','Interpreter','latex','FontSize',16)
ylabel('tilavuus','Interpreter','latex','FontSize',16)

ax.XLim = [0 10];
ax.YLim = [0.1 1.1];
ax.YColor = 'b';
ax.XTick = [];
ax.YTick = [];

yyaxis right

plot(P,T,'LineWidth',2)
ylabel('l{\"a}mp{\"o}tila','Interpreter','latex','FontSize',16)

ax.YLim = [0.9 2];
ax.YTick = [];

figname = 'adiabaatti';
filepath = ['../' figname];

export_fig(filepath,'-pdf','-transparent')