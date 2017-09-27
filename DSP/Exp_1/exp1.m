%Exp1: system response and system stability
close all;  clear all;
%=========================================================================================
%Part1: Solution of Difference Equations by call filter,
%The stability of response of U(n) is judged by the system.
A = [1, -0.9];   B = [0.05, 0.05];              %System difference equation coefficient vector B and A
x1n = [1 1 1 1 1 1 1 1 zeros(1, 50)];           %Generating the signal x1n = R8n
x2n = ones(1, 128);                             %Generating the signal x2n = un
hn = impz(B, A, 58);                            %Get the system unit impulse response h(n)
subplot(2, 2, 1);   y='h(n)';   tstem(hn, y);   %Calling the function tstem() to drawing
title('(a) System unit impulse response h(n)');
y1n = filter(B, A, x1n);                        %Get the response of y1n which is system to x1n
subplot(2, 2, 2);   y='y1(n)';  tstem(y1n, y);
title('(b) The response of y1(n) which is system to R8(n)');
y2n = filter(B, A, x2n);                        %Get the response of y2n which is system to x2n
subplot(2, 2, 4);   y= 'y2(n)'; tstem(y2n, y);
title('(C) The response of y2(n) which is system to u(n)');
%=========================================================================================
%Part2: calling the conv() function to calculate convolution
x1n = [1 1 1 1 1 1 1 1];                            %Generating the signal x1n = R8n
h1n = [ones(1,10) zeros(1,10)];
h2n = [1 2.5 2.5 1 zeros(1,10)];
y21n = conv(h1n, x1n);
y22n = conv(h2n, x1n);
figure(2)
subplot(2, 2, 1);   y = 'h1(n)';    tstem(h1n, y);  %Calling the function tstem() to drawing
title('(d) System unit impulse response h1(n)')
subplot(2, 2, 2);   y = 'y21(n)';   tstem(y21n,y);
title('(e) The convolution y21(n) of h1(n) and R8(n)')
subplot(2, 2, 3);   y = 'h2(n)';    tstem(h2n,y);
title('(f) System unit impulse response h2(n)')
subplot(2, 2, 4);   y = 'y22(n)';   tstem(y22n,y);
title('(g) The convolution y22(n) of h2(n) and R8(n)')
%=========================================================================================
%Part3: Resonator analysis
un = ones(1, 256);                                  %Generating signal un
n = 0 : 255;
xsin = sin(0.014 * n) + sin(0.4 * n);               %Generating sine signal
A = [1, -1.8237, 0.9801];   B = [1/100.49, 0, -1/100.49];   %System difference equation coefficient vector B and A
y31n = filter(B, A, un);                            %The response y31n of resonator to un
y32n = filter(B, A, xsin);                          %The response y32n of resonator to sine signal
figure(3);
subplot(2, 1, 1);   y = 'y31(n)';   tstem(y31n, y);
title('(h) The response y31n of resonator to un');
subplot(2, 1, 2);   y = 'y32(n)';   tstem(y32n, y);
title('(i) The response y32n of resonator to sine signal');