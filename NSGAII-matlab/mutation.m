%%µ•µ„±‰“Ï
function population=mutation(population,mutate_rate)
for i=1:length(population)
    for j=1:length(population(i).popu)
        if(rand<mutate_rate)
            population(i).popu(j)=1-population(i).popu(j);
        end
    end
end