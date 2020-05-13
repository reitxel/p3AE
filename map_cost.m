function z=map_cost(a,w)
z=0;
    for i=1:6
        for j=1:6
            z= z + w(i,j)*sqrt((i-a(1))^2 + (j-a(2))^2);
        end
    end
end