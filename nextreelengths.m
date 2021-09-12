function lengths = nextreelengths(nexusfile, folder)

% folder where your output from traitlab mcmc run is located
% creates vector of total tree lengths - from posterior tree samples

% read all trees from nex file 
alltrees = readalltrees(fullfile(folder, nexusfile));

N = length(alltrees);

lengths = zeros(1,N);

% obtain tree lengths
for i = 1:N
    [s,errmess]=rnextree(alltrees{i});
    state = tree2state(s);
    lengths(i) = TreeLength(s, state.root);
end

% to save file use:
% dlmwrite(fullfile(folder, 'treelength.txt'), 
% lengths.', 'precision',5,'delimiter',',')

end
