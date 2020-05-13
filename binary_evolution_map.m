function [parent, hist_f] = binary_evolution_map(func, map, niter) 
% [parent, hist_f] = binary_evolution(@counting_ones, 100, 1000)
% ahora no generamos cada estado independientemente del previo
% sino que hay una relacion de madre-descendencia
    hist_f = zeros(1,niter);
    parent = randi(6,2,1); %genera una matriz con valores de 0 a 6, de 2 columnas y 1 dimension
    f_parent = func(parent, map);
    hist_f(1) = f_parent; %hacemos un historico para registrar todas las fitness y ver la trayectoria evolutiva
    for i = 2:niter
        bits = randi([-1,1],2,1); %generamos un vector aleatorio de bits
        x = parent+bits; 
        f_x = func (x,map);
        if (f_x <= f_parent)
            parent = x;
            f_parent = f_x;
        end
        hist_f(i) = f_parent;
        plot (hist_f)
    end
end