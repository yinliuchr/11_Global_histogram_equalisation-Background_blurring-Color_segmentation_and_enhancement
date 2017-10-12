function result = res( a,b,c )      % a 为原图，b为轮廓二值图（人像为1，白色；背景为0，黑色），c为原图进行滤波后的图
d = imcomplement(b);                % d为轮廓二值图（背景为1，白色；人像为0，黑色）
background = d.*c;                  %把虚化的背景提取出来；
messi = b.*a;                       %把原图的人像提取出来
result = background + messi;        %相加得到最终结果
imshow(result);
end

