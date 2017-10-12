function f = manual_histeq( a )

a = imread(a);                     %读取一张图片
[M N] = size(a);                   %读取大小
p = zeros(1,256);     

%在矩阵a中找出等于各个灰度的像素个数并除以总像素数得到归一化的原直方图
for k = 0:255
    p(k+1) = length(find(a==k)) / (M * N);  %由于向量序号从1开始，而灰度级从0开始，故用了 p(k+1)这种写法
end

s = zeros(1,256);           
s(1) = p(1);                    
for i = 2:256
    s(i) = s(i-1) + p(i);                   %算出累计概率
end

s1 = round(s * 256);                        %把小数化为最靠近的整数

result = a;
for i = 0:255
    result(find(a==i)) = s1(i+1);           %把原来图像各像素点灰度级映射到均衡后的灰度级
end
f = result;
end

