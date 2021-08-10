function [llkd,X]=LogLkd(state,lambda)

%call LogLkd(state) to get the integrated LL used in Markov() etc
%call LogLkd(state,[]) or LogLkd(state,lambda) to compute log(likelihood)
%assumes 'state' is properly set up - if really necessary, run
%state=MarkRcurs(state,state.nodes,true) to clean the state.
%
%At present it doesnt return the lambda value used in the former [] case.
%this might make sense (it would make the Lambda() function redundant)
%but would involve a trawl through all locations calling LogLkd() to correct the
%number of outputs. GKN 4 Jan 07


global LOSTONES MCMCCAT MISDAT;


s=state.tree;
Root=state.root;

Adam=s(Root).parent;
s(Adam).u=0;

if LOSTONES
  s(Adam).LamInt = s(Root).LamInt + s(Root).Tu;
else
  s(Adam).LamInt = s(Root).LamInt + s(Root).u;
end

%s(Adam).CatLamInt=s(Root).CatLamInt;
%s(Adam).w should stay equal to zeros(1,L)

ne=[s(Root).ActI{:}];
nd=length(ne);

s(Adam).PD(ne)=s(Root).PD(ne)+s(Root).w(ne);
%s(Adam).PDcat(ne)=s(Root).PDcat(ne);
%PDFromAdam(ne)=s(Root).w(ne)/(state.mu+state.rho*state.kappa);
%if MCMCCAT
    X=(s(Adam).LamInt + state.kappa*s(Root).CatLamInt)/state.mu;
%else
%    X=s(Adam).LamInt/state.mu;
%end

if MISDAT
    MissingNorm=sum([state.tree(state.leaves).nmis].*log(1-[state.tree(state.leaves).xi]))+sum((state.L-[state.tree(state.leaves).nmis]).*log([state.tree(state.leaves).xi]));
else
    MissingNorm=0;
end



if nargin==1 || isempty(lambda)
   %here is the calculation we usually make (for the MCMC and by default throughout)
   %we should not call the following the loglkd as we integrate lambda out with 1/lambda prior
   if nd>0
      
       %if MCMCCAT
       
       % new likelihood - V
           llkd = MissingNorm + freq_lkd_multi(state2freq(state), s, state.mu); 
           

   else
       %disp('nd=0 in LogLkd.m');
       llkd = 0;

  end 

elseif nargin==2
   %this is the log likelihood, which we only use when we need the real thing for debugging
 
        [liklihood, means] = freq_lkd(state2freq(state), s, state.mu, lambda);
        llkd = MissingNorm + liklihood; 

end

% if llkd>0
%     disp('Error in LogLkd: Log lkd is positive');
%     keyboard;
% end

%if llkd==-Inf
%    disp('Error in LogLkd: LogLkd=-Inf');keyboard;
%end

if imag(llkd) %|| isinf(llkd))
    disp('Error in LogLkd: Log lkd has imaginary part or is infinite');
    keyboard;
end

