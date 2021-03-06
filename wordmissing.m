% get missing data percentages from our data set 

% read in data
[s,content,true,clade] = nexus2stype('RingeSwadesh100finescreenbinbayes.nex');

M = (content.array == 2);
miss = sum(M, 2); % sum of no. of missing values in matrix acorss taxa

% empty vector to fill in percentages 
perc = zeros(1, content.NS); 

miss_lang = {};

for i = 1:content.NS
    perc(i) = miss(i)/content.L
    
    if (miss(i) >  0.1 * content.L)
        miss_lang(end + 1) = content.language(i);
    end
end

% langauges with over 10% missing
miss_lang
% percentages of missing data across all languages 
perc 

% labels of taxa with high no. missing data
%3,4,5,7,9,15,20,22,24
