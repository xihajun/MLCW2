for i = 1 : 582
    for j =1:1087
        if dist(J(i,j),1)<dist(J(i,j),0)
            J(i,j)=1;
        else
            J(i,j)=0;
        end
    end
end
