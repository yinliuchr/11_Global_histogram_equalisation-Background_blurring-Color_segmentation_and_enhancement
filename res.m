function result = res( a,b,c )      % a Ϊԭͼ��bΪ������ֵͼ������Ϊ1����ɫ������Ϊ0����ɫ����cΪԭͼ�����˲����ͼ
d = imcomplement(b);                % dΪ������ֵͼ������Ϊ1����ɫ������Ϊ0����ɫ��
background = d.*c;                  %���黯�ı�����ȡ������
messi = b.*a;                       %��ԭͼ��������ȡ����
result = background + messi;        %��ӵõ����ս��
imshow(result);
end

