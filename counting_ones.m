function f = counting_ones(a)
%a: vector{0,1} -> codifica una seq binarua de n-bits
% Ex: counting_ones(rand(1,10)> 0.5)
f = sum(a > 0); %filtramos las posiciones del vector mayores que cero
end