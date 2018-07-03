%%单点交叉,临近的每两个之间进行交换，并不失一般性
function population=crossover(population,cross_rate)
for i=1:2:length(population)
    if(rand<cross_rate)
        cross_position=round(1+(length(population(i).popu)-1)*rand);
        for j=cross_position:length(population(i).popu)
            temp=population(i).popu(j);
            population(i).popu(j)=population(i+1).popu(j);
            population(i+1).popu(j)=temp;
        end
    end
end
        

