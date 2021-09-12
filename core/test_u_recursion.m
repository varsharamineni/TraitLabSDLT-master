function actSolution = test_u_recursion(tree, mu)
% testing the u_recursion function 
% that probabilities sum to 1
% mu - death rate
% output: vector of length 2L -1, L no. of leaves on tree
% where we expect each entry to be 1

% get labels of nodes of tree
state = tree2state(tree);
n_nodes = length(state.nodes);

% input into u_recursion function
s = u_recursion(tree, mu, state.root);

% empty vector to store values
actSolution = zeros(1,n_nodes + state.NS);

% sum over probabilities for internal nodes
i = 1;
for j = state.nodes
    actSolution(i) = sum(s(j).u1);
    i = i+1;
end

% sum over probabilities for leaf nodes
i = n_nodes+1;
for j = state.leaves
    actSolution(i) = sum(s(j).u1);
    i = i+1;
end

end