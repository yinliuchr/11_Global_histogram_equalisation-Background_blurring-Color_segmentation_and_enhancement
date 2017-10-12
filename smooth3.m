function res = smooth3(input_image, filter_size )
close all;
b = im2double(imread('messi_binary.jpg'));
c = imcomplement(b);
a = im2double(input_image);
a_hsv = rgb2hsv(a);         %取hsv图
a_half = a_hsv;
a_half(:,:,1) = imfilter(a_hsv(:,:,1), ones(filter_size)/(filter_size * filter_size),'replicate');
a_half(:,:,3) = imfilter(a_hsv(:,:,3), ones(filter_size)/(filter_size * filter_size),'replicate');
%上面对色调，亮度分量进行滤波

res = a_hsv;
res(:,:,1) = a_half(:,:,1) .* c + a_hsv(:,:,1) .* b;
res(:,:,3) = a_half(:,:,3) .* c + a_hsv(:,:,3) .* b; %把色调、亮度分量进行叠加处理
res = hsv2rgb(res);                 %得到结果

imshow(res,[]);

end


