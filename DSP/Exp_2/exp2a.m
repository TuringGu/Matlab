%exp2a.m: The verification of time domain sampling theory
Tp = 64/1000;            %Observation time Tp = 64ms
%Generate the sample sequence x(n) which the length is M
%Fs = 1000;    T = 1/Fs;
Fs = 1000;  T = 1/Fs;
M = Tp * Fs;    n = 0: M-1;
A = 444.128;    alph = pi * 50 * 2^0.5; omega = pi * 50 * 2^0.5;
xnt = A * exp(-alph * n * T).*sin(omega * n * T);
Xk = T * fft(xnt, M);   %M point FFT[xnt]
yn = 'xa(nT)';  subplot(3, 2, 1);
tstem(xnt, yn);         %Calling the function tstem() to drawing
box on; title('(a) Fs = 1000Hz');
k = 0: M-1; fk = k/Tp;
subplot(3, 2, 2);   plot(fk, abs(Xk));  title('(a) T * FT[xa(nT)], Fs = 1000Hz');
xlabel('f(Hz)');    ylabel('Range'); axis([0, Fs, 0, 1.2*max(abs(Xk))]);
%================================================================================
%The program of Fs = 300Hz or Fs = 200Hz is the same as the Fs = 1000Hz

%Fs = 300;    T = 1/Fs;
Fs = 300;  T = 1/Fs;
M = Tp * Fs;    n = 0: M-1;
A = 444.128;    alph = pi * 50 * 2^0.5; omega = pi * 50 * 2^0.5;
xnt = A * exp(-alph * n * T).*sin(omega * n * T);
Xk = T * fft(xnt, M);   %M point FFT[xnt]
yn = 'xa(nT)';  subplot(3, 2, 3);
tstem(xnt, yn);         %Calling the function tstem() to drawing
box on; title('(a) Fs = 300Hz');
k = 0: M-1; fk = k/Tp;
subplot(3, 2, 4);   plot(fk, abs(Xk));  title('(a) T * FT[xa(nT)], Fs = 300Hz');
xlabel('f(Hz)');    ylabel('Range'); axis([0, Fs, 0, 1.2*max(abs(Xk))]);
%================================================================================

%Fs = 200;    T = 1/Fs;
Fs = 200;  T = 1/Fs;
M = Tp * Fs;    n = 0: M-1;
A = 444.128;    alph = pi * 50 * 2^0.5; omega = pi * 50 * 2^0.5;
xnt = A * exp(-alph * n * T).*sin(omega * n * T);
Xk = T * fft(xnt, M);   %M point FFT[xnt]
yn = 'xa(nT)';  subplot(3, 2, 5);
tstem(xnt, yn);         %Calling the function tstem() to drawing
box on; title('(a) Fs = 200Hz');
k = 0: M-1; fk = k/Tp;
subplot(3, 2, 6);   plot(fk, abs(Xk));  title('(a) T * FT[xa(nT)], Fs = 200Hz');
xlabel('f(Hz)');    ylabel('Range'); axis([0, Fs, 0, 1.2*max(abs(Xk))]);