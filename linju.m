function Set = linju(i,j,M,N,J,size=4)
    if size==4
        if (i==1&&j==1)
            n = [1,2;2,1];
        elseif i==1 && j==N
            n = [1,N-1;2,N];
        elseif i==M&&j==1
            n = [M-1,1;M,2];
        elseif i==M&&j==N
            n = [M,N-1;M-1,N];
        elseif i==1
            n = [1,j-1;1,j+1;2,j];
        elseif i==M
            n = [M,j-1;M,j+1;M-1,j];
        elseif j==1
            n = [i-1,1;i+1,1;i,2];
        elseif j==N
            n = [i-1,N;i+1,N;i,N-1];
        else
            n=[i-1,j;i+1,j;i,j-1;i,j+1];
        end
    Set =[];
    for i = 1:length(n)
        Set = [Set J(n(i,1),n(i,2))];
    end
end
