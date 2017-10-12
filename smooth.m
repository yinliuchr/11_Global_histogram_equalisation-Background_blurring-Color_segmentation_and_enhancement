function  smooth( a )

imshow(a)

a1 = imfilter(a,ones(31));
figure,imshow(a1,[]);

a2 = imfilter(a,ones(63));
figure,imshow(a2,[]);

a3 = imfilter(a,ones(127));
figure,imshow(a3,[]);


b1 = imfilter(a,ones(31),'replicate');
figure,imshow(b1,[]);

b2 = imfilter(a,ones(63),'replicate');
figure,imshow(b2,[]);


c1 = imfilter(a,ones(31),'symmetric');
figure,imshow(c1,[]);

c2 = imfilter(a,ones(63),'symmetric');
figure,imshow(c2,[]);


d1 = imfilter(a,ones(31),'circular');
figure,imshow(d1,[]);

d2 = imfilter(a,ones(63),'circular');
figure,imshow(d2,[]);


w1 = fspecial('disk',31);
e1 = imfilter(a,w1,'replicate');
figure,imshow(e1,[]);

w2 = fspecial('unsharp');
e2 = imfilter(a,w2,'replicate');
figure,imshow(e2,[]);

w3 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
e3 = imfilter(a,w3,'replicate');
e3 = a + e3;
figure,imshow(e3,[]);


g1 = medfilt2(a,[31 31]);
figure,imshow(g1);

g2 = medfilt2(a,[63 63]);
figure,imshow(g2);

g3 = medfilt2(a,[31 31],'indexed');
figure,imshow(g3);

g4 = medfilt2(a,[63 63],'indexed');
figure,imshow(g4);

g5 = medfilt2(a,[31 31],'symmetric');
figure,imshow(g5);

g6 = medfilt2(a,[63 63],'symmetric');
figure,imshow(g6);

end

