% plot test of u recursion 


% tree 
% mu values 

mu_vals = 0:0.02:1

tree_length = 2:100
theta = 0.01

for l = tree_length
    mat = zeros(length(mu_vals, 2*l)
    for m = mu_vals
        sol = test_u_recursion(ExpTree(l, theta), m)
        mat(i,:) = sol
    end
    tests
end
