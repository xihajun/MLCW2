I = imread('\\ads.bris.ac.uk\filestore\MyFiles\StudentPG1\mw18386\Downloads\COMS30007-master\images\2-dct-chiro-balls.png');
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
C=(G>250&B+R<20);
[x,y]=find(C==1);
C = [x y];

BW = I;
R=BW(:,:,1);
R1=histogram(R(A),20,'Normalization','probability');
G=BW(:,:,2);
G1=histogram(G(A),20,'Normalization','probability');
B=BW(:,:,3);
B1=histogram(B(A),20,'Normalization','probability');

%hold on;plot(y,x,'*')% y,x return the foreground
BW = I;
R=BW(:,:,1);
R2=histogram(R(C),20,'Normalization','probability');
G=BW(:,:,2);
G2=histogram(G(C),20,'Normalization','probability');
B=BW(:,:,3);
B2=histogram(B(C),20,'Normalization','probability');

%real im
I = imread('http://dynamiccontractiontechnique.com/wp-content/uploads/2018/03/2-dct-chiro-balls.jpg');
I=im2double(I);

figure;
subplot(231);histogram(R(A),20,'Normalization','probability');title('histogram of Red');
subplot(232);histogram(G(A),20,'Normalization','probability');title('histogram of Green');
subplot(233);histogram(B(A),20,'Normalization','probability');title('histogram of Blue');
subplot(234);histogram(R(C),20,'Normalization','probability');title('histogram of Red');
subplot(235);histogram(G(C),20,'Normalization','probability');title('histogram of Green');
subplot(236);histogram(B(C),20,'Normalization','probability');title('histogram of Blue');
%[counts,binLocations] = imhist(I)
%image_mean = sum(counts.*binLocations)/sum(counts);
[counts,binLocations] = imhist(R(A));
meanforeR = sum(counts.*binLocations)/sum(counts);
[counts,binLocations] = imhist(G(A));
meanforeG = sum(counts.*binLocations)/sum(counts);
[counts,binLocations] = imhist(B(A));
meanforeB = sum(counts.*binLocations)/sum(counts);

[counts,binLocations] = imhist(R(C));
meanbackR = sum(counts.*binLocations)/sum(counts);
[counts,binLocations] = imhist(G(C));
meanbackG = sum(counts.*binLocations)/sum(counts);
[counts,binLocations] = imhist(B(C));
meanbackB = sum(counts.*binLocations)/sum(counts);
[M,N]=size(I(:,:,1))
Q = zeros(M,N);
%initialize
for i = 1:M
    for j =1:N
        fore = dist(I(i,j,1),meanforeR)+dist(I(i,j,2),meanforeG)+dist(I(i,j,2),meanforeB);
        back = dist(I(i,j,1),meanbackR)+dist(I(i,j,2),meanbackG)+dist(I(i,j,2),meanbackB);        
        
        if fore<back
            Q(i,j)=1;
        else
            Q(i,j)=-1;
        end
    end
end
figure
imshow(Q)

%failed
[counts,binLocations] = imhist(I(C));
meanback = sum(counts.*binLocations)/sum(counts);
[counts,binLocations] = imhist(I(A));
meanfore = sum(counts.*binLocations)/sum(counts);
Q = zeros(M,N);
%initialize
for i = 1:M
    for j =1:N
        fore = dist(I(i,j,1),meanfore);
        back = dist(I(i,j,1),meanback);
        if fore<back
            Q(i,j)=1;
        else
            Q(i,j)=-1;
        end
    end
end
figure
imshow(Q)


W=zeros(M,N);
for i = randperm(M,M)
    for j = randperm(N,N)
        if E(i,j,1,linju(i,j,M,N,Q),Q)<E(i,j,-1,linju(i,j,M,N,Q),Q)
            W(i,j)=1;
        else
            W(i,j)=-1;
        end
    end
end
figure
imshow(W)

mu=Q;
for t= 1 : 10
    for i = 1:M
        for j = 1:N
            m(i,j) = sum(size(linju(i,j,M,N,Q))*mu(i,j));
            mu(i,j) =tanh(m(i,j)+1/2*(L(sum(linju(i,j,M,N,mu))>0)-L(sum(linju(i,j,M,N,mu))<0)));
        end
    end
    figure
    imshow(mu)
end
figure
imshow(mu)
