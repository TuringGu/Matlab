function mstem(Xk)  
%mstem(Xk)绘制频域采样序列向量Xk的幅频特性图  
M=length(Xk); 
k=0:M-1;wk=2*k/M; %产生M点DFT对应的采样点频率（关于pi归一化值） 
stem(wk,abs(Xk),'.');box on; %绘制M点DFT的幅频特性图 
xlabel('w/\pi');ylabel('幅度'); 
axis([0,2,0,1.2*max(abs(Xk))]); 