function lkd = freq_lkd_multi(n, s, mu)

% returns the log likelihood of the observed frequencies 
% multinomial - lambda is integrated out 

% n vector of frequencies 
% s - tree structure 
% mu - death rate

global LEAF

state = tree2state(s);
L = state.NS; % get no. of leaves
R = state.root; % get label of root node

% fill in probability values using recursion function
s = u_recursion(s, mu, R);

means = zeros(1, L); % empty vector to store means

% summing over every branch 
for i = state.nodes
    
    t = s(i).time;
    
    c1 = s(i).child(1);
    c2 = s(i).child(2);
    
    V = 1 - exp(-mu * [t - s(c1).time, t - s(c1).time]);
    
    means = means + (s(c1).u1(2:L+1) * V(1)) + (s(c2).u1(2:L+1) * V(2));
    
end

% adam to root node
means = means + s(R).u1(2:L+1);

% scaling the means 
means = 1/mu * means;

% multinomial pdf 
in = mnpdf(n, means/sum(means));

% final log lkd
lkd = log(in);

end