function [parent, hist_f] = binary_evolution_map(func, map, niter, n) 
% [parent, hist_f] = binary_evolution(@counting_ones, 100, 1000)
% ahora no generamos cada estado independientemente del previo
% sino que hay una relacion de madre-descendencia
    p=1/n;
    hist_f = zeros(1,niter);
    parent = randi(6,2,1); %genera una matriz con valores de 0 a 6, de 2 columnas y 1 dimension
    f_parent = func(parent, map);
    hist_f(1) = f_parent; %hacemos un historico para registrar todas las fitness y ver la trayectoria evolutiva
    for i = 2:niter
        bits = rand(1,2)>p; %logical array, 1 cuando supera la tasa de mutacion, entonces muta
        if bits(1)==1 && bits(2)==1
            x=randi(6,2,1);
        elseif bits(1)==1 && bits(2)==0
            x=[randi(6),parent(2)];
        elseif bits(1)==0 && bits(2)==1
            x=[parent(1),randi(6)];
        else
            x=parent;
        end
        f_x = func (x,map);
        landscape(x(1),x(2))=f_x;
        if (f_x <= f_parent)
            parent = x;
            f_parent = f_x;
            %landscape(x(1),x(2))=f_parent; %asigno la función que minimiza la de coste a las coordenadas del vector x
        end
        hist_f(i) = f_parent;
        figure(1); %creo una figura para visualizar el histórico, tardá unos segundos en realizarse debido a tantas interacciones
        %plot (hist_f)
    end
    figure(2); %creo otra figura para el landscape
    surf(-landscape) %lo grafico al reves para visualizarlo mejor (sino es muy oscuro)
    view(3) %3D
    colorbar %me muestra la barra lateral de leyenda de color
end