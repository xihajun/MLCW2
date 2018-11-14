imdata = imread('https://images0.cnblogs.com/blog/614265/201408/241708117531878.png');
I=im2bw(imdata);
%I = double(I) / 255;
r = normrnd(0,1,size(I));
J = I+r;
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
