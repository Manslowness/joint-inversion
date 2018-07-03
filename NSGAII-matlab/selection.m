function Qpopulation=selection(population)

for i=1:length(population);
    temp1=round(1+(length(population)-1)*rand);
    temp2=round(1+(length(population)-1)*rand);
    if population(temp1).rank<population(temp2).rank
        Qpopulation(i)=population(temp1);
    else if population(temp1).rank>population(temp2).rank
            Qpopulation(i)=population(temp2);
        end
    end
    if population(temp1).rank==population(temp2).rank
         if population(temp1).distance<population(temp2).distance
             Qpopulation(i)=population(temp1);
         else Qpopulation(i)=population(temp2);
         end
    end
end