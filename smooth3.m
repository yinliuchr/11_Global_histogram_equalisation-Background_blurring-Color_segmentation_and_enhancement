function res = smooth3(input_image, filter_size )
close all;
b = im2double(imread('messi_binary.jpg'));
c = imcomplement(b);
a = im2double(input_image);
a_hsv = rgb2hsv(a);         %ȡhsvͼ
a_half = a_hsv;
a_half(:,:,1) = imfilter(a_hsv(:,:,1), ones(filter_size)/(filter_size * filter_size),'replicate');
a_half(:,:,3) = imfilter(a_hsv(:,:,3), ones(filter_size)/(filter_size * filter_size),'replicate');
%�����ɫ�������ȷ��������˲�

res = a_hsv;
res(:,:,1) = a_half(:,:,1) .* c + a_hsv(:,:,1) .* b;
res(:,:,3) = a_half(:,:,3) .* c + a_hsv(:,:,3) .* b; %��ɫ�������ȷ������е��Ӵ���
res = hsv2rgb(res);                 %�õ����

imshow(res,[]);

end


