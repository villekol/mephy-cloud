% adiabaattinen prosessi

gamma = 1.4;
P = 1:0.1:9;

V = 1 ./ P.^(1/gamma);
T = 1 ./ P.^(1/gamma - 1);

figure
yyaxis left

p1 = plot(P,V,'LineWidth',2);
ax = gca;

xlabel('paine')
ylabel('tilavuus')

ax.XLim = [0 10];
ax.YLim = [0.1 1.1];
ax.YColor = 'b';
ax.XTick = [];
ax.YTick = [];

yyaxis right

plot(P,T,'LineWidth',2)
ylabel('lämpötila')

ax.YLim = [0.9 2];
ax.YTick = [];

% TODO: font size!