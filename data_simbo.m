% Set up global variables and workspace
GlobalSwitches; GlobalValues;
addpath core guifiles borrowing;

% Generate an isochronous ten-leaf tree with exponential branching rate 0.001
L = 10;
theta = 1e-3;
s = ExpTree(L, theta);

% Adding offset leaves
leaves = find([s.type] == LEAF);
s(leaves(1)).time = rand * s(s(leaves(1)).parent).time;
draw(s);

% Alternatively, one could read in a tree. For example,
%   s = nexus2stype(['data', filesep, 'SIM_B.nex']); draw(s);

% Adding catastrophes. The catastrophe location gives the relative position of
% a catastrophe a long the branch from s(i).time to s(s(i).parent).time. Do not
% try to put a catastrophe on the branch linking the root and Adam nodes!
nodes = find([s.type] < ROOT);
s(nodes(1)).cat = 1; s(nodes(1)).catloc = [0.2];
s(nodes(10)).cat = 1; s(nodes(10)).catloc = [0.5];

% Read branching, catastrophe events etc. into struct _tEvents_ and
% corresponding right-left ordering of leaves in plane _rl_
[tEvents, rl] = stype2Events(s);

% Parameters of SDLT process
tr = [0.1;  ...  % lambda
      3e-4; ...  % mu
      0.0005; ...  % beta
      0.221199]; % kappa
xi = fliplr([s(rl).xi]); % Missing data parameters.

% Generate _N * L_ array of binary site patterns, where _N_ is the total number
% of traits generated across the tree and the _l_th column of _D_ is the
% _L + 1 - l_th entry of _rl_
D = simBorCatDeath(tEvents, tr);

% Removing empty site-patterns
D = D(sum(D, 2) > 0, :);

% Masking matrix to incorporate missing data
M = (rand(size(D)) > repmat(xi, size(D, 1), 1));
D(M) = 2;

% Adding data to leaves
for l = 1:L
  s(rl(l)).dat = D(:, L + 1 - l)';
end

% Write to Nexus file
sFile = stype2nexus(s, '', 'BOTH', '', '');
fid = fopen(['data', filesep, 'SIM1_rootLB.nex'], 'w');
fprintf(fid, sFile);
fclose(fid);