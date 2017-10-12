function res = smooth1(input_image, filter_size )

b = im2double(imread('messi_binary.jpg'));     %���벻��ȫ�ĻҶ�ͼ��ǰ���ף�����ȡ����
c = imcomplement(b);                           %�����ף�����ȡ�黯��ı���
a = im2double(input_image);
a_half = imfilter(a, ones(filter_size)/(filter_size * filter_size),'replicate');    %ֱ�Ӷ�ԭͼ�˲����൱�ڶ�rgb3ͨ���ֱ��˲�
res = zeros(size(a));

for i = 1:3
    res(:,:,i) = a_half(:,:,i) .* c + a(:,:,i) .* b;        %��3ͨ���ֱ����������������黯�ı���ȡ������
end

imshow(res,[]);

end

