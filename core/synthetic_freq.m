function synth_data = synthetic_freq(L, theta, mu, lambda, N)

tree = ExpTree(L, theta); % create tree with l leaves, branching rate theta
state = tree2state(tree); % obtain state values of tree

mat = zeros(N, state.NS) ; % empty matrix to store data

i = 1;
while i <= N
    content = pop('content');
    
    [seq,content.language,content.cognate,content.NS,content.L] = ...
    MutationsRH(mu, 1, lambda, tree, []);

    content.array = words2array(seq,tree,content.L); 
    % rows - leaves
    % cols - traits

    % remove data that didn't survive into more than 0 leaves
    content = ObserveData(content,[],[],0);

    freqs = sum(content.array, 1); % sum along cols

    a = unique(freqs); 
    
    mat(i,a) = histc(freqs(:),a).';  % frequency of frequencies
    
    i = i + 1;
end 

synth_data = sum(mat)/N;

% getting means - to checking likelihood function
vec = synth_data;
[lkd, means] = freq_lkd(vec, tree, mu, lambda);


% plotting

% plot synthetic data
bar(1:content.NS, synth_data, 'EdgeAlpha',.4, 'FaceAlpha',.4)

hold on

%plot poisson means
bar(1:content.NS, means, 'EdgeAlpha',.4, 'FaceAlpha',.4)

lgd = legend('Synthetic Data','Poisson Means');
lgd.FontSize = 12;
title(['no. of leaves  = ', num2str(L), ' ', '\mu = ', num2str(mu),' ', '\lambda = ', ...
    num2str(lambda),' ', '\theta = ', num2str(theta) ]);
ax = gca;
ax.FontSize = 15;

hold off


end
