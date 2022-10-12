function seq = m_seq(coef)
% 用来生成m序列
% coef为反馈系数，要求二进制，例如4级本原多项式，可输入[0,0,1,1]
% 2022年10月

m = length(coef);
len = 2^m - 1;  % 最终生成的m序列的长度
backQ = 0;      % 对应寄存器运算后的值，传给第一个寄存器。
seq = zeros(1,len); % 为m序列预分配空间
registers = [zeros(1,m-1) 1]; % 为寄存器初始化分配初值
for i = 1:len
    seq(i) = registers(m);        % 将最后一个寄存器的值送到m序列空间
    backQ  = mod(sum(coef.*registers),2);   % 寄存器的值进行异或运算
    registers(2:length(registers)) = registers(1:length(registers)-1);
    registers(1) = backQ;  % 将异或的值存入第一个寄存器
end

end
