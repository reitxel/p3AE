%% binary montecarlo
n=100;
niter=100;
[best,hist_f] = binary_montecarlo(@counting_ones, n, niter);

%% binary evolution
n=100;
niter=1000;
[parent, hist_f] = binary_evolution(@counting_ones, n, niter);


%% P3: Qüestió 1, montecarlo
niter=1000;
map=[3,0,1,4,2,1;2,1,1,2,3,2;5,3,3,0,1,2;8,5,2,1,0,0;10,6,3,1,3,1;0,2,3,1,1,1];
[astar, hist_f] = binary_montecarlo_map(@map_cost, map, niter);

%% P3: Qüestió 1, evolution
n=6;
niter=1000;
map=[3,0,1,4,2,1;2,1,1,2,3,2;5,3,3,0,1,2;8,5,2,1,0,0;10,6,3,1,3,1;0,2,3,1,1,1];
[parent, hist_f] = binary_evolution_map(@map_cost, map, niter, n);
