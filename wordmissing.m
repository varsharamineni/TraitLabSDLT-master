[s,content,true,clade] = nexus2stype('RingeSwadesh100finescreenbinbayes.nex');

M = (content.array == 2);
miss = sum(M, 2);

perc = zeros(1, content.NS);

miss_lang = {};

for i = 1:content.NS
    perc(i) = miss(i)/content.L
    
    if (miss(i) >  0.1 * content.L)
        miss_lang(end + 1) = content.language(i);
    end
end

miss_lang
perc

%3,4,5,7,9,15,20,22,24