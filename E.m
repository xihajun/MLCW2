function result = E(i,j,k,set,J)
    h=1;beta=1;sigma=0.1;
    temp = sum(set*k);
    result = h*(sum(set)+k)-beta*temp-sigma*k*J(i,j);%-beta*(sum(set)+k)
    %result = h*k-beta*temp-sigma*k*J(i,j);%the result is basically the
    %same
end