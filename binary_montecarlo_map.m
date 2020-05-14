function [astar, hist_f] = binary_montecarlo_map(func, map, niter)
% [best,hist_f] = binary_montecarlo(@counting_ones, 100, 100)
% Performs a binary Monte Carlo search. Given objective func, 
% bitstring length n, and number of iterations, this algorithm 
% will try to find the bitstring that maximizes func.
%------
%la evolucion temporal del algoritmo nos ayudará a saber si los parámetros
%seleccionados son adecuados o no
hist_f = zeros(1,niter); %vector que hace un historico de todas las fitness que hemos encontrado, tiene la medida total al nº total de interacciones
astar = randi(6,2,1);
f_best = func(astar,map);
hist_f(1) = f_best;

    for (i=2:niter)
        s=randi(6,2,1);
        f_x = func(s,map);
        landscape(s(1),s(2))=f_x;
        if (f_x < f_best)
            astar = s;
            f_best = f_x;
             %asigno las coordenadas del vector random s a la funcion minimizada de cost
        end
        hist_f(i) = f_best; %en cada interaccion del bucle almaceno la mejor fitness que hemos encontrado hasta el momento
        figure(1);
        %plot(hist_f) 
        %drawnow() 
    end
    figure(2); %creo otra figura para el landscape
    surf(-landscape) %lo grafico al reves para visualizarlo mejor (sino es muy oscuro)
    view(3) %3D
    colorbar %me muestra la barra lateral de leyenda de color
end