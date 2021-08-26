function lengths = nextreelengths(nexusfile, folder)
% creates and saves treelength.txt file in 'folder' where the tloutput.nex
% used is located

%folder = '/Users/varsharamineni/Documents/GitHub/TraitLabSDLT-master/results/no miss results/yule 3mill'
%folder = '../results/no miss results/yule 3 mill'

%addpath('results',..,'yule 3 mill')

alltrees = readalltrees(fullfile(folder, nexusfile));

N = length(alltrees);

lengths = zeros(1,N);

for i = 1:N
    [s,errmess]=rnextree(alltrees{i});
    state = tree2state(s);
    lengths(i) = TreeLength(s, state.root);
end

dlmwrite(fullfile(folder, 'treelength.txt'), lengths.', 'precision',5,'delimiter',',')

end
