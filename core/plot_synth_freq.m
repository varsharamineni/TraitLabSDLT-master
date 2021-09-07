% plot synthetic freq
 
%treelengths = [5,10,20,40,80]

t = tiledlayout(3,1)
nexttile 
synthetic_freq(20, 0.01, 0.001, 0.2, 1000)
nexttile 
synthetic_freq(40, 0.01, 0.003, 0.02, 1000)
nexttile 
synthetic_freq(80, 0.01, 0.0001, 0.3, 1000)

