% plot test of u recursion 


% tree 
% mu values 

m = 0.0005;
theta = 0.001;

tree_length = 5:5:50;

mat = zeros(2*length(tree_length), 2*max(tree_length) - 1);

i = 1
for l = tree_length
    sol = test_u_recursion(ExpTree(l, theta), m);
    mat(i,1:(2*l-1)) = sol.';
    i = i+1
end

m = 0.03
i = length(tree_length) + 1
for l = tree_length
    sol = test_u_recursion(ExpTree(l, theta), m);
    mat(i,1:(2*l-1)) = sol.';
    i = i+1
end
