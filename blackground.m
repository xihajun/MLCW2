I = imread('\\ads.bris.ac.uk\filestore\MyFiles\StudentPG1\mw18386\Downloads\COMS30007-master\images\2-dct-chiro-balls.jpg');
BW = I;
I=im2double(I);
figure;imshow(I);
%read fore green back


R=BW(:,:,1);
[REDcounts,x] = imhist(R);
G=BW(:,:,2);
[Greencounts,y] = imhist(R);
B=BW(:,:,3);
[Bluecounts,z] = imhist(R);

A=(G<20&B<20&R>250);
[x,y]=find(A==1);
A = [x y];%hold on;plot(y,x,'*')% y,x return the foreground
%real im
I = imread('http://dynamiccontractiontechnique.com/wp-content/uploads/2018/03/2-dct-chiro-balls.jpg');
I=im2double(I);

BW = I;
R=BW(:,:,1);
subplot(131)
R1=histogram(R(A),20,'Normalization','probability');
G=BW(:,:,2);
G1=histogram(G(A),20,'Normalization','probability');
B=BW(:,:,3);
B1=histogram(B(A),20,'Normalization','probability');

figure;
subplot(131);histogram(R(A),20,'Normalization','probability');title('histogram of Red');
subplot(132);histogram(G(A),20,'Normalization','probability');title('histogram of Green');
subplot(133);histogram(B(A),20,'Normalization','probability');title('histogram of Blue');
