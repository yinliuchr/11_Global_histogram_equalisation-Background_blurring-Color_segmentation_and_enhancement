close all;
I = imread('bull.jpg');         
I = im2double(I);                                                               %����ͼƬ��ת������
hsv = rgb2hsv(I);                                                               %ת��hsv
M = size(hsv,1);
N = size(hsv,2);
figure(1), imshow(I);

% choose point of interest
h1 = impoint;                                                                   %��ͼ����ѡһ���㣨ȡ�ں첼�ϣ�
pos1 = wait(h1);                       
pos1 = round(pos1);                                                             %ȡ�����õ����λ��
a = [hsv(pos1(2),pos1(1),1) hsv(pos1(2),pos1(1),2) hsv(pos1(2),pos1(1),3)];     %�ѵ��hsv�õ�������1*3��������
R = 90 / 255;                                                                   % radius

hue = abs(hsv(:,:,1) - a(1));                                               %�õ�ɫ���Ĳ�
hue(hue > 0.5) = 1 - hue(hue > 0.5);                                            %��Ϊ��Բ������ѭ���ģ�����ɫ�������0.5
D = hue.^2 + (hsv(:,:,2) - a(2)).^2 + (hsv(:,:,3) - a(3)).^2;         
mask = D <= R * R;                                                              %��Ƴ�һ����ģ��ͨ��mask�����ҵ���ѡ����hsv��Ƚ�С�ĵ�

% ѡ�����Ȥ���������õ������û�ѡ��һ������
figure(2),imshow(mask);                                                     
h2 = imrect;                                                                    %���û�ѡһ������
pos2 = wait(h2);
pos2 = round(pos2);
roi = false(size(mask));                                                        %��ʼ������Ȥ��������ȫ0
roi(pos2(2) : pos2(2) + pos2(4),pos2(1) : pos2(1) + pos2(3)) = 1;               %ʹ��������ֵΪ1
mask = mask & roi;                                                              %�����㣬�õ�������������ѡ����hsvֵ�ӽ��ĵ㣬ֻ����Щ�����µ�ģ���ϱ���ֵΪ1
imwrite(mask,'mask0.jpg');
                                                                  
J0 = hsv;
J0(:,:,1) = zeros(M,N);
J0(:,:,2) = zeros(M,N);                                                         %��hsvͼ��hue��saturation�����0��ʹ����ͼ��ɻҶ�ͼ

idx = find(mask);                                                               %�ҳ��������ڵġ���㡱
J0(idx) = hsv(idx);                                                                
J0(idx + M * N) = hsv(idx + M * N);                                             %��hsvǰ2�������ֱ�ԭ���������㻹ԭΪ��ɫ  

J = hsv2rgb(J0);                                                                %ת��rgbͼ��
figure(3),imshow(J, []);
imwrite(J,'bull_final0.jpg');
