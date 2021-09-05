function actSolution = test_u_recursion(tree, mu)

state = tree2state(tree);
n_nodes = length(state.nodes)

s = u_recursion(tree, mu, state.root);

actSolution = zeros(1,n_nodes + state.NS);

i = 1;
for j = state.nodes
    actSolution(i) = sum(s(j).u1);
    i = i+1;
end

i = n_nodes+1;
for j = state.leaves
    actSolution(i) = sum(s(j).u1);
    i = i+1;
end

end