function res = smooth2(input_image, filter_size )
close all;
b = im2double(imread('messi_binary.jpg'));
c = imcomplement(b);
a = im2double(input_image);
a_hsv = rgb2hsv(a);         %取hsv图
a_half = a_hsv;
a_half(:,:,3) = imfilter(a_hsv(:,:,3), ones(filter_size)/(filter_size * filter_size),'replicate');
%考虑到对色调或饱和度滤波意义不大（颜色都变了），上面仅对亮度分量进行滤波

res = a_hsv;
res(:,:,3) = a_half(:,:,3) .* c + a_hsv(:,:,3) .* b; %仅需把亮度分量进行叠加处理
res = hsv2rgb(res);                 %得到结果

imshow(res,[]);

end

