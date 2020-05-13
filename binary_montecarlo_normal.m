function [astar, f_best]=binary_montecarlo_normal(func, n, niter))

%este algoritmo no nos asegura encontrar el optimo, es necesario invertir
%cierto tiempo ---> niter min
    %si ponemos pocas interacciones la posibilidad de encontrar el optimo es
    %muy baja, pero si ponemos muchas se estaría pareciendo a una algoritmo de
    %cerca exhaustiva
    astar=rand(n,1)>0.5;
    for (i=2:niter)
        x=rand(n,1) >0.5; %random samplic: primero calculamos el estado aleatoriamente
        if (f_x >= f_best) % comprobamos que la fitness del estado actual es más grande de la que hemos encontrado hasta ahora como óptima
            astar = x; %si se cumple, el nuevo estado es mejor y reemplaza a la variable astar (que apunta a la secuencia de que máxima la fitness)
        end
    end
    f_best=func(astar)
end