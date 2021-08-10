function synth_data = synthetic_freq(tree, mu, lambda)


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

synth_data = [a; histc(freqs(:),a).']; % frequency of frequencies

% getting means - checking likelihood function
vec = zeros(1,content.NS);
vec(synth_data(1,:))= synth_data(2,:);
[lkd, means] = freq_lkd(vec, tree, mu, lambda);

% plotting

% plot synthetic data
bar(synth_data(1,:), synth_data(2,:), 'EdgeAlpha',.4, 'FaceAlpha',.4)

hold on

%plot poisson means
bar(1:content.NS, means, 'EdgeAlpha',.4, 'FaceAlpha',.4)

lgd = legend('Synthetic Data','Poisson Means');
lgd.FontSize = 15;
title('Synthetic frequency data vs Poisson Means');
ax = gca;
ax.FontSize = 15;

hold off


end
