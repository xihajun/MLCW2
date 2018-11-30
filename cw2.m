imdata = imread('https://images0.cnblogs.com/blog/614265/201408/241708117531878.png');
I=im2bw(imdata);
%I = double(I) / 255;
r = normrnd(0,1,size(I));
J=I+0;
J = I+r;
imshow(J)

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

[M,N]=size(J);

for k = 1:20
    for i = randperm(M,M)
        for j = randperm(N,N)
            p = exp(E(i,j,1,linju(i,j,M,N,J),J))/(exp(E(i,j,1,linju(i,j,M,N,J),J))+exp(E(i,j,-1,linju(i,j,M,N,J),J)));
            if p<rand(1)
                J(i,j)=1;
            else
                J(i,j)=-1;
            end
        end
    end
    k
end
figure
imshow(J)



h=1;
beta = 1;
sigma = 1;
[M,N]=size(J)
T=J;
J=T;
for i = randperm(M,M)
    for j = randperm(N,N)
        if E(i,j,1,linju(i,j,M,N,J),J)<E(i,j,-1,linju(i,j,M,N,J),J)
            J(i,j)=1;
        else
            J(i,j)=-1;
        end
    end
    imshow(J)
end
figure
imshow(J)



J=T;
for i = 1:M
    for j = 1:N
        if E(i,j,1,linju(i,j,M,N,J),J)<E(i,j,-1,linju(i,j,M,N,J),J)
            J(i,j)=1;
        else
            J(i,j)=-1;
        end
    end
end
figure
imshow(J)

for i = 1 : 582
    for j =1:1087
        if dist(J(i,j),1)<dist(J(i,j),0)
            J(i,j)=1;
        else
            J(i,j)=0;
        end
    end
end