function [astar, hist_f] = binary_montecarlo(func, n, niter)
% [best,hist_f] = binary_montecarlo(@counting_ones, 100, 100)
% Performs a binary Monte Carlo search. Given objective func, 
% bitstring length n, and number of iterations, this algorithm 
% will try to find the bitstring that maximizes func.
%------
%la evolucion temporal del algoritmo nos ayudará a saber si los parámetros
%seleccionados son adecuados o no
hist_f = zeros(1,niter); %vector que hace un historico de todas las fitness que hemos encontrado, tiene la medida total al nº total de interacciones
astar = rand(n,1) > 0.5;
f_best = func(astar);
hist_f(1) = f_best;

    for (i=2:niter)
        x = rand(n,1) > 0.5; 
        f_x = func(x);
        if (f_x >= f_best)
            astar = x;
            f_best = f_x;
        end
    hist_f(i) = f_best; %en cada interaccion del bucle almaceno la mejor fitness que hemos encontrado hasta el momento
    % plot(hist_f) % drawnow() end
    end
end