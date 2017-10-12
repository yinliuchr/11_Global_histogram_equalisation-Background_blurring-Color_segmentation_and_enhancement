close all;
clear;
a = imread('messi.jpg');

a1 = smooth1(a,31);
a2 = smooth1(a,63);
a3 = smooth1(a,127);                %分别用不同尺寸模板进行rgb滤波

a4 = smooth2(a,31);
a5 = smooth2(a,63);
a6 = smooth2(a,127);                %分别用不同尺寸模板进行hsv滤波

close all;

subplot(3,3,2),imshow(a,[]),title('Original pic');
subplot(3,3,4),imshow(a1,[]),title('rgb 31');
subplot(3,3,5),imshow(a2,[]),title('rgb 63');
subplot(3,3,6),imshow(a3,[]),title('rgb 127');
subplot(3,3,7),imshow(a4,[]),title('hsv 31');
subplot(3,3,8),imshow(a5,[]),title('hsv 63');
subplot(3,3,9),imshow(a6,[]),title('hsv 127');
