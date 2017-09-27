%exp3.m: spectrum analysing the signal by using FFT
clear all;  close all;
%Part1========================================================
x1n = [ones(1, 4)];                     %Generating sequence vector x1(n) = R4(n)
M = 8;  xa = 1: (M/2);  xb = (M/2): -1: 1;  x2n = [xa, xb];
x3n = [xb, xa];
X1k8 = fft(x1n, 8);                     %Calculating the 8 points DFT of x1n
X1k16 = fft(x1n, 16);                   %Calculating the 16 points DFT of x1n
X2k8 = fft(x2n, 8);                     %Calculating the 8 points DFT of x2n
X2k16 = fft(x2n, 16);                   %Calculating the 16 points DFT of x2n
X3k8 = fft(x3n, 8);                     %Calculating the 8 points DFT of x3n
X3k16 = fft(x3n, 16);                   %Calculating the 16 points DFT of x3n
%The following outputs the amplitude-frequency characteristic graph
subplot(2, 2, 1);   mstem(X1k8);        %Plot the 8 points DFT of the amplitude-frequency characteristic graph
title('(1a) 8 points DFT[x_1(n)]');  xlabel('omiga/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X1k8))]);

subplot(2, 2, 3);   mstem(X1k16);       %Plot the 16 points DFT of the amplitude-frequency characteristic graph
title('(1b) 16 points DFT[x_1(n)]');  xlabel('omika/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X1k16))]);

figure(2)
subplot(2, 2, 1);   mstem(X2k8);        %Plot the 8 points DFT of the amplitude-frequency characteristic graph
title('(2a) 8 points DFT[x_2(n)]');  xlabel('omika/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X2k8))]);

subplot(2, 2, 2);   mstem(X2k16);       %Plot the 16 points DFT of the amplitude-frequency characteristic graph
title('(2b) 16 points DFT[x_2(n)]');  xlabel('omika/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X2k16))]);

subplot(2, 2, 3);   mstem(X3k8);        %Plot the 8 points DFT of the amplitude-frequency characteristic graph
title('(3a) 8 points DFT[x_3(n)]');  xlabel('omika/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X3k8))]);

subplot(2, 2, 4);   mstem(X3k16);       %Plot the 16 points DFT of the amplitude-frequency characteristic graph
title('(3b) 8 points DFT[x_3(n)]');  xlabel('omika/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X3k16))]);

%************************************************

%Part2: spectrum analysis of periodic sequences
N = 8; n = 0: N-1;                      %Transform interval of FFT: N = 8
x4n = cos(pi * n/4);
x5n = cos(pi * n/4) + cos(pi * n/8);
X4k8 = fft(x4n);                        %Calculating the 8 points DFT of x4n
X5k8 = fft(x5n);                        %Calculating the 8 points DFT of x5n

N = 16; n = 0: N-1;                     %Transform interval of FFT: N = 16
x4n = cos(pi * n/4);
x5n = cos(pi * n/4) + cos(pi * n/8);
X4k16 = fft(x4n);                       %Calculating the 16 points DFT of x4n
X5k16 = fft(x5n);                       %Calculating the 16 points DFT of x5n

figure(3);
subplot(2, 2, 1);   mstem(X4k8);        %Plot the 8 points DFT of the amplitude-frequency characteristic graph
title('(4a) 8 points DFT[x_4(n)]');  xlabel('omika/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X4k8))]);


subplot(2, 2, 3);   mstem(X4k16);       %Plot the 16 points DFT of the amplitude-frequency characteristic graph
title('(4b) 16 points DFT[x_4(n)]');  xlabel('omika/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X4k16))]);


subplot(2, 2, 2);   mstem(X5k8);        %Plot the 8 points DFT of the amplitude-frequency characteristic graph
title('(5a) 8 points DFT[x_5(n)]');  xlabel('omika/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X5k8))]);


subplot(2, 2, 4);   mstem(X5k16);       %Plot the 16 points DFT of the amplitude-frequency characteristic graph
title('(5b) 16 points DFT[x_5(n)]');  xlabel('omika/pi'); ylabel('range');
axis([0, 2, 0, 1.2*max(abs(X5k16))]);

%=============================================================

%(3)The simulation of periodic signal spectrum analysis
figure(4);
Fs = 64;    T = 1/Fs;                   %Transform interval of FFT: N = 16

N = 16; n = 0: N-1;
x6nT = cos(8 * pi * n *T) + cos(16 * pi * n * T) + cos(20 * pi * n * T);    %16 points samplimg of x6(t)16
X6k16 = fft(x6nT);                      %Calculating the 16 points DFT of x6nT
X6k16 = fftshift(X6k16);                %Move the zero frequency to the center of the spectrum
Tp = N * T; F = 1/Tp;                   %Frequency resolution F
k = -N/2: N/2-1;    fk = k * F;         %Generate the 16 points DFT's frequency of the corresponding sampling points
subplot(3, 1, 1);   stem(fk, abs(X6k16), '.'); box on;  %Plot the 8 points DFT of the amplitude-frequency characteristic graph
title('(6a) 16 points |DFT[x_6(nT)]|');  xlabel('f(Hz)');    ylabel('range');
axis([- N * F/2 - 1, N * F/2 - 1, 0, 1.2 * max(abs(X6k16))]);

N = 32; n = 0: N-1;                     %Transform interval of FFT: N = 16
x6nT = cos(8 * pi * n * T) + cos(16 * pi * n * T) + cos(20 * pi * n * T);   %32 points samplimg of x6(t)32
X6k32 = fft(x6nT);                      %Calculating the 32 points DFT of x6nT
X6k32 = fftshift(X6k32);                %Move the zero frequency to the center of the spectrum
Tp = N * T; F = 1/Tp;                   %Frequency resolution F
k = -N/2: N/2-1;    fk = k * F;         %Generate the 16 points DFT's frequency of the corresponding sampling points
subplot(3, 1, 2);   stem(fk, abs(X6k32), '.');  box on; %Plot the 8 points DFT of the amplitude-frequency characteristic graph
title('(6b) 32 points |DFT[x_6(nT)]|');  xlabel('f(Hz)');    ylabel('range');
axis([-N*F/2-1, N*F/2-1, 0, 1.2*max(abs(X6k32))]);

N = 64; n = 0: N-1;                     %Transform interval of FFT: N = 16
x6nT = cos(8 * pi * n * T) + cos(16 * pi * n * T) + cos(20 * pi * n * T);   %64 points samplimg of x6(t)64
X6k64 = fft(x6nT);                      %Calculating the 64 points DFT of x6nT
X6k64 = fftshift(X6k64);                %Move the zero frequency to the center of the spectrum
Tp = N * T; F = 1/Tp;                   %Frequency resolution F
k = -N/2: N/2-1;    fk = k * F;         %Generate the 16 points DFT's frequency of the corresponding sampling points
subplot(3, 1, 3);   stem(fk, abs(X6k64), '.');  box on; %Plot the 8 points DFT of the amplitude-frequency characteristic graph
title('(6c) 64 points |DFT[x_6(nT)]|');  xlabel('f(Hz)');    ylabel('range');
axis([-N*F/2-1, N*F/2-1, 0, 1.2*max(abs(X6k64))]);