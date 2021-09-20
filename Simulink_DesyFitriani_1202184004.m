clear
st = 10e-3;
spp = 10;
A = 220;
f = 50;
t = 2;
n = 0;
phase = 0;
bias = 0;
for k = 0:st:t
    n = n+1;
    O(n) = A*sin(f*k+phase)+bias;
    wt(n) = k;
end
plot(wt,O)
xlabel('waktu(detik)')
ylabel('Amplitudo (Volt)')
grid on

%penambahan Gain pada Sinus
clear
st = 10e-3;
spp = 10;
A = 220;
f = 50;
t = 2;
n = 0;
G = 2;
phase = 0;
bias = 0;
for k = 0:st:t
    n = n+1;
    O(n) = A*sin(f*k+phase)+bias;
    O1(n) = G*O(n);
    wt(n) = k;
end
plot(wt,O,'m',wt,O1,'y')
xlabel('waktu(detik)')
ylabel('Amplitudo(Volt)')
grid on
guide