function [parent, hist_f] = binary_evolution(func, n, niter) 
% [parent, hist_f] = binary_evolution(@counting_ones, 100, 1000)
% ahora no generamos cada estado independientemente del previo
% sino que hay una relacion de madre-descendencia
    p = 1/n; %mutation rate < error threeshold
    hist_f = zeros(1,niter);
    parent = rand(n,1) >0.5;
    f_parent = func(parent);
    hist_f(1) = f_parent; %hacemos un historico para registrar todas las fitness y ver la trayectoria evolutiva
    for i = 2:niter
        bits = (rand(n,1) < p); %generamos un vector aleatorio de bits
        % x := invert every bit of vector a* with probability p
        x = mod (parent + bits, 2); %MUTACION: suma del genoma del padre más los bits aleaorios
        f_x = func (x);
        if (f_x >= f_parent)
            parent = x;
            f_parent = f_x;
        end
        hist_f(i) = f_parent;
    end
end