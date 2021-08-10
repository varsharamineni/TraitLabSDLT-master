function test_u_recursion(tree)

state = tree2state(tree);

s = u_recursion(tree, 0.01, state.root);

actSolution = zeros(1,length(state.nodes));

i = 1;
for j = state.nodes
    actSolution(i) = sum(s(j).u1);
    i = i+1;
end

actSolution

end