
imdata = imread('https://images0.cnblogs.com/blog/614265/201408/241708117531878.png');
I=im2bw(imdata);
I=I+0;
imshow(I)
%add noise
r = normrnd(0,1,size(I));
J=I+0;
%J = I+r;
J = imnoise(I,'gaussian',0,0.2)
imshow(J)
[M,N]=size(J);
% initialize
parfor i = 1 : 582
    for j =1:1087
        if dist(J(i,j),1)<dist(J(i,j),0)
            J(i,j)=1;
        else
            J(i,j)=0;
        end
    end
end
J(find(J==0))=-1;
figure
imshow(J)

T=J;
J=T;

%J = imnoise(I,'salt & pepper',0.2);
%imshow(J)
%J(find(J==0))=-1;
mu=rand(size(J));
mu=J;
    parfor i = 1:M
        for j = 1:N
            m(i,j) = sum(100*size(linju(i,j,M,N,J)).*mu(i,j));
            mu(i,j) =tanh(m(i,j)+1/2*(L(sum(linju(i,j,M,N,J))>0)-L(sum(linju(i,j,M,N,J))<0)));
        end
    end
    figure
    imshow(mu)

mu(find((mu-1)<0.001&(mu-1)>-0.001))=1;
mu(find(mu~=1))=-1;
figure
imshow(mu)
