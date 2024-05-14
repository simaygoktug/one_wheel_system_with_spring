% Sistem parametreleri
J = 1;  % kg*m^2
c = 2;  % Ns/m
k = 3;  % N/m
r = 0.5;  % m

% Durum uzayı temsili
A = [0 1; -k*r/J -c/J];
B = [0; 1/J];
C = [1 0];
D = 0;

% Kontrol matrisi
K = [273.5 28];  % Daha önce hesapladığımız değerler

% Kapalı çevrim A matrisi
Acl = A - B*K;

% Simülasyon süresi ve referans sinyali
t = 0:0.01:20;  % 20 saniyelik simülasyon
f = 0.1;  % Hz
r_signal = 5 + 2*sin(2*pi*f*t);  % Referans sinyali

% Başlangıç durumu
x0 = [0; 0];

% Durum uzayı denklemlerinin tanımı
sys_cl = ss(Acl, B, C, D);

% Simülasyonu çalıştırma
[y, t, x] = lsim(sys_cl, r_signal, t, x0);

% Simülasyon sonuçlarını çizdir
figure;
plot(t, y);
title('Kapalı Çevrim Sistem Cevabı');
xlabel('Zaman (s)');
ylabel('Çıkış y(t)');
grid on;
