% ekstinktiotehokkuus hiukkaskoon funktiona

clear variables
close all

lambda = 635 * 1e-9;
N = 1e10;
L = 1;

% refractive index by interpolation from Hale and Querry (1973)
x = [600 650] * 1e-9;
rey = [1.332 1.331];
imy = [1.09 1.64] * 1e-8;
n = interp1(x,rey,lambda);
k = interp1(x,imy,lambda);

m = complex(n,k);

dp = logspace(0,5,10001) * 1e-9;
Qext = zeros(size(dp));

alpha = pi * dp / lambda;

for i = 1:length(dp)
    
    result = Mie(m,alpha(i));
    Qext(i) = result(4);
    
end

figure
set(gcf,'DefaultTextInterpreter','latex')

loglog(dp*1e6,Qext,'LineWidth',2)
set(gca,'TickLabelInterpreter','latex','FontSize',16,...
    'XTick',logspace(-3,2,6),'YTick',logspace(-10,2,7))
xlim(logspace(-3,2,2))
ylim(logspace(-10,2,2))

xlabel('Hiukkaskoko $d_p$ ($\mu$m)','FontSize',16)
ylabel('Ekstinktiotehokkuus $Q_{\mathrm{ext}}$','FontSize',16)

filename = 'ekstinktiotehokkuus';
filepath = ['../' filename];
export_fig(filepath,'-pdf','-transparent')

figure
set(gcf,'DefaultTextInterpreter','latex')

hold on

bext = pi * dp.^2 * N .* Qext / 4;
trans = exp(-bext * L);

plot(dp*1e6,trans,'LineWidth',2)
set(gca,'XScale','log','FontSize',16,'TickLabelInterpreter','latex',...
    'XTick',logspace(-3,2,6))
xlim(logspace(-3,2,2))

line([1e-3 2.0],[0.933 0.933],'Color','k','LineStyle','--')
line([2.0 2.0],[0 0.933],'Color','k','LineStyle','--')

line([1e-3 3.8],[0.770 0.770],'Color','k','LineStyle','--')
line([3.8 3.8],[0 0.770],'Color','k','LineStyle','--')

line([1e-3 5.7],[0.561 0.561],'Color','k','LineStyle','--')
line([5.7 5.7],[0 0.561],'Color','k','LineStyle','--')

line([1e-3 7.5],[0.369 0.369],'Color','k','LineStyle','--')
line([7.5 7.5],[0 0.369],'Color','k','LineStyle','--')

xlabel('Hiukkaskoko $d_p$ ($\mu$m)','FontSize',16)
ylabel('Transmittanssi $I/I_0$','FontSize',16)

filename = 'transmittanssi';
filepath = ['../' filename];
export_fig(filepath,'-pdf','-transparent')
