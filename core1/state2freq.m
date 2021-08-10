function freq = state2freq(state)

% function takes state and creates vector of frequencies 
% freq - vector of length no. of leaves - frequencies of traits that are
% present in 1,2,...L of the leaves 

s = state.tree;
leaves = state.leaves;

%empty matrix to store cognate sequence data at leaves
% state.NS - number of Leaves
% state.L no. of cognate classes
mat = zeros(state.L, state.NS);

% fill in mat 
% missing data coded as 2 - change to 0
i = 1;
for l = leaves
    cogs = s(l).dat;
    cogs(cogs > 1) = 0;
    mat(:,i) = cogs;
    i = i+1;
end

freq = sum(mat, 2).'; % get frequencies 
a = unique(freq); 
a = a(a ~= 0); % remove 0 freq

data = [a; histc(freq(:),a).'];

vec = zeros(1,state.NS);

vec(data(1,:))= data(2,:);

freq = vec;


end
