b1 = ones(1,5);
a1 = 1;
b2 = ones(1,9);
a2 = 1;
N = 1024;
try
    [H1,w1] = freqz(b1,a1,N);
catch
    H1 = fft([b1 zeros(1,N-length(b1))],N)./fft([a1 zeros(1,N-length(a1))],N);
    w1 = linspace(0,pi,N)';
end
try
    [H2,w2] = freqz(b2,a2,N);
catch
    H2 = fft([b2 zeros(1,N-length(b2))],N)./fft([a2 zeros(1,N-length(a2))],N);
    w2 = linspace(0,pi,N)';
end
z1 = roots(b1);
p1 = roots(a1);
z2 = roots(b2);
p2 = roots(a2);
figure('Position',[100 100 1000 700]);
subplot(2,2,1);
plot(w1/pi,abs(H1));
xlabel('Normalized Frequency');
ylabel('|H_1(e^{j\omega})|');
title('TransferFunction of 5 point MAF');
grid on;
subplot(2,2,2);
theta = linspace(0,2*pi,400);
uc = exp(1i*theta);
plot(real(uc),imag(uc),'--');
hold on;
if ~isempty(z1), plot(real(z1),imag(z1),'o','MarkerSize',8); end
if ~isempty(p1), plot(real(p1),imag(p1),'x','MarkerSize',8); end
hold off;
axis equal;
xlim([-1.2 1.2]);
ylim([-1.2 1.2]);
xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-zero plot of 5 point MAF');
grid on;
subplot(2,2,3);
plot(w2/pi,abs(H2));
xlabel('Normalized Frequency');
ylabel('|H_2(e^{j\omega})|');
title('TransferFunction of 9 point MAF');
grid on;
subplot(2,2,4);
plot(real(uc),imag(uc),'--');
hold on;
if ~isempty(z2), plot(real(z2),imag(z2),'o','MarkerSize',8); end
if ~isempty(p2), plot(real(p2),imag(p2),'x','MarkerSize',8); end
hold off;
axis equal;
xlim([-1.2 1.2]);
ylim([-1.2 1.2]);
xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-zero plot of 9 point MAF');
grid on;
saveas(gcf,'MAF_plots.png');
