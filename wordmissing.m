c[s,content,true,clade] = nexus2stype('RingeSwadesh100finescreenbinbayes.nex');

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
content.language

%3,4,5,7,9,15,20,22,24
% 1, 3, 4, 5, 7, 8, 12, 17, 19, 22, 28, 29, 30, 25, 22