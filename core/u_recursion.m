function s = u_recursion(s, mu, i)

% adds field u1 to  s (tree structure)
% output probabilities that a trait born on node i ends up on [0,1,2,...L] leaves
% mu - death rate

global LEAF;

state = tree2state(s); %get tree states
L = state.NS; %number of languages 

if s(i).type == LEAF 

    s(i).u1 = zeros(1, L+1);
    s(i).u1(2) = 1; % prob of surviving to one leaf on leaf node = 1
    
   % s(i).d is no. of descendant leaves
    s(i).d = 1;
    
end

if s(i).type > LEAF 

  % 1st child node
  c1 = s(i).child(1);
  s = u_recursion(s, mu, c1); % recursion on child node 1
  
  dt1 = s(i).time - s(c1).time;
  ef1 = exp( -mu*dt1 );

  % 2nd child node
  c2 = s(i).child(2);
  s = u_recursion(s, mu, c2); % recursion on child node 2
  
  dt2 = s(i).time - s(c2).time;
  ef2 = exp( -mu*dt2 );
  
  % s(i).d no. of descendent leafs
  s(i).d = s(c1).d + s(c2).d;
  d = s(i).d;
  
  % fill in values
  
  s(i).u1 = zeros(1,L+1);
  
  u_sum = ones(1,d);
  
  for j = 1:d
      u_sum(j) = sum(fliplr(s(c1).u1(1:j)) .*  (s(c2).u1(1:j)));
  end
  
  
  s(i).u1(1:d) = (ef1 * (1-ef2) * s(c1).u1(1:d)) + ...
      (ef2 * (1-ef1) * s(c2).u1(1:d)) + (ef1*ef2* u_sum);
  
  % 0 leaves
  s(i).u1(1) = s(i).u1(1) + (1-ef1)*(1-ef2);
  
  % max no. of leaves descended node i 
  s(i).u1(d+1) = ef1 * ef2 * s(c1).u1(s(c1).d + 1) * s(c2).u1(s(c2).d + 1);
  
end    


end
