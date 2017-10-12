function res = smooth1(input_image, filter_size )

b = im2double(imread('messi_binary.jpg'));     %读入不完全的灰度图，前景白，用于取人像
c = imcomplement(b);                           %背景白，用于取虚化后的背景
a = im2double(input_image);
a_half = imfilter(a, ones(filter_size)/(filter_size * filter_size),'replicate');    %直接对原图滤波，相当于对rgb3通道分别滤波
res = zeros(size(a));

for i = 1:3
    res(:,:,i) = a_half(:,:,i) .* c + a(:,:,i) .* b;        %对3通道分别处理把清晰的人像和虚化的背景取出叠加
end

imshow(res,[]);

end

