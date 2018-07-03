function population=crowddistance(front,population,objectfunnum)
for k=1:length(front);
    for i=1:length(front(k).f);%对于一个前沿
        population(front(k).f(i)).distance=0;
        temp(i).fitness=population(front(k).f(i)).fitness;
    end
    for j=1:objectfunnum
        tempsort=[];
        tempfront=[];
        for i=1:length(front(k).f);
            tempsort(i,1)= temp(i).fitness(j);
            tempsort(i,2)=front(k).f(i);
        end
        tempsort=sortrows(tempsort,1);
        tempfront=tempsort(:,2);
        population(tempfront(1)).distance=1e20;
        population(tempfront(length(tempfront))).distance=1e20;
       if abs(-tempsort(1,1)+tempsort(length(tempfront),1))<1e-16;
            normalize=1;
        else
            normalize=-tempsort(1,1)+tempsort(length(tempfront),1);
        end
		if length(tempfront)>=3;
			for i=2:length(tempfront)-1;
				population(tempfront(i)).distance=population(tempfront(i)).distance+(tempsort(i+1,1)-tempsort(i-1,1))/(normalize);
			end
		end
    end
end
        