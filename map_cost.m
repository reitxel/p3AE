function z=map_cost(a,w)
z=0;
    for x_i=1:6
        for y_i=1:6
            z=z+w(x_i,y_i)*sqrt((x_i-a(1))^2 +(y_i-a(2))^2);
        end
    end
end