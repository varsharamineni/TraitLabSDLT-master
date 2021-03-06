function freq = state2freq(state)

% state - MCMC state
% function takes state and creates vector of frequencies needed for lkd

% freq - vector of length no. of leaves, 
% is the frequencies of traits that are
% present in 1,2,...L of the leaves 

s = state.tree;
leaves = state.leaves;

%empty matrix to store cognate sequence data at leaves
% state.NS - number of Leaves
% state.L no. of cognate classes
mat = zeros(state.L, state.NS);

% fill in mat 
i = 1;
for l = leaves
    cogs = s(l).dat;
    cogs(cogs > 1) = 0; % take missing values as 0
    mat(:,i) = cogs;
    i = i+1;
end

freq = sum(mat, 2).'; % get frequencies 
a = unique(freq); 
a = a(a ~= 0); % remove 0 freq

data = [a; histc(freq(:),a).']; % create table

vec = zeros(1,state.NS);

vec(data(1,:))= data(2,:);

freq = vec; % final vector of frequencies 


end
