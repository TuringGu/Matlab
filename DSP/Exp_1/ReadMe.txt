实验一：系统响应及系统稳定性

实验目的 
(1) 掌握求系统响应的方法。
(2) 掌握时域离散系统的时域特性。
(3) 分析、观察及检验系统的稳定性。

实验步骤     
(1) 编制程序。
(2) 给定一个低通滤波器的差分方程，输入信号，求其系统响应和系统单位脉冲响应，并画出波形。
(3) 给定系统的单位脉冲响应，用线性卷积法求其分别对系统的输出响应，并绘制波形。
(4) 给定一谐振器的差分方程，用实验方法检查系统是否稳定。再给定输入信号，求出系统的输出响应，并绘制波形。

分析与讨论及思考题的解答
(1) 综合起来，在时域求系统响应的方法有两种
① 通过差分方程求得系统输出(注意要合理选择初始条件)。
② 已知系统的单位脉冲响应，通过求输入信号和系统单位脉冲响应的线性卷积求得系统输出。
(2) 实际中要检验系统稳定性，方法是在输入端加入单位阶跃序列，观察输出波形。若波形稳定在一个长数值上，系统稳定，否则不稳定。易知第三个实验是稳定的。
(3) 谐振器具有对某个频率进行谐振的性质，本实验中的谐振器频率是0.4rad，因此稳定波形为sin(0.4n)。
(4) 如果输入信号为无限长序列，系统的单位脉冲响应是有限长序列，可用分段线性卷积法求系统的响应。
(5) 如果信号经过低通滤波器，则信号的高频分量被滤掉，时域信号的变化减缓，在有阶跃处附近产生过渡变化时间。因此，当输入矩形序列时，输出序列的开始和终了都产生了明显的上升和下降时间。
