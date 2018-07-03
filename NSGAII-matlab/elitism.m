function [Rpopulation front]=elitism(population,Qpopulation,genesize,objectnum)
limit=length(population);
objectfunnum=length(population(1).fitness);
for i=limit+1:2*limit;
    population(i)=Qpopulation(i-limit);
end
 population=fitness(population,genesize,objectnum);
[population,front]=rank(population);
population=crowddistance(front,population,objectfunnum);
j=1;%新生成的Rpopulation中的下指标
k=1;%用于front中的指标
while j<=limit;
    if j+length(front(k).f)-1<=limit;
        for i=1:length(front(k).f);
                Rpopulation(j)=population(front(k).f(i));
                j=j+1;
        end
    else 
        for i=1:length(front(k).f);
            tempsort(i,1)=population(front(k).f(i)).distance;
            tempsort(i,2)=front(k).f(i);
        end
        tempsort=-sortrows(-tempsort,1);
        front(k).f=tempsort(:,2);
        upbound=limit-j+1;
        for i=1:upbound;
            Rpopulation(j)=population(front(k).f(i));
            j=j+1;
        end
    end
    k=k+1;
end
            
        
    
    
