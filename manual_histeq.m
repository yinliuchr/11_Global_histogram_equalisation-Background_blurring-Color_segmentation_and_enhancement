function f = manual_histeq( a )

a = imread(a);                     %��ȡһ��ͼƬ
[M N] = size(a);                   %��ȡ��С
p = zeros(1,256);     

%�ھ���a���ҳ����ڸ����Ҷȵ����ظ������������������õ���һ����ԭֱ��ͼ
for k = 0:255
    p(k+1) = length(find(a==k)) / (M * N);  %����������Ŵ�1��ʼ�����Ҷȼ���0��ʼ�������� p(k+1)����д��
end

s = zeros(1,256);           
s(1) = p(1);                    
for i = 2:256
    s(i) = s(i-1) + p(i);                   %����ۼƸ���
end

s1 = round(s * 256);                        %��С����Ϊ���������

result = a;
for i = 0:255
    result(find(a==i)) = s1(i+1);           %��ԭ��ͼ������ص�Ҷȼ�ӳ�䵽�����ĻҶȼ�
end
f = result;
end

