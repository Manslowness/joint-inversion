function [population,front]=rank(population)
front(1).f=[];
for i=1:length(population);
    population(i).nk=0;
    population(i).rank=0;
    sk(i).popunum=[];
end
for i=1:length(population);
    %population(i).nk=0;
    for j=1:length(population);
        if(population(i).fitness(1)<=population(j).fitness(1)&&population(i).fitness(2)<=population(j).fitness(2)&&(population(i).fitness(1)<population(j).fitness(1)||population(i).fitness(2)<population(j).fitness(2)));
            sk(i).popunum=[sk(i).popunum j];
        else if(population(j).fitness(1)<=population(i).fitness(1)&&population(j).fitness(2)<=population(i).fitness(2)&&(population(j).fitness(1)<population(i).fitness(1)||population(j).fitness(2)<population(i).fitness(2)));
            population(i).nk=population(i).nk+1;
            end
        end
    end
    if population(i).nk==0;
        population(i).rank=1;
        front(1).f=[front(1).f i];%population(i)];%%%所有的sk和front都保存population中的下标
    end
end
i=1;
while (~isempty(front(i).f));
    Q=[];
    for j=1:length(front(i).f);
        if (isempty(sk(front(i).f(j)).popunum));
            continue;
        end
        for k=1:length(sk(front(i).f(j)).popunum);
            population(sk(front(i).f(j)).popunum(k)).nk= population(sk(front(i).f(j)).popunum(k)).nk-1;
            if population(sk(front(i).f(j)).popunum(k)).nk==0;
                population(sk(front(i).f(j)).popunum(k)).rank=i+1;
                Q=[Q sk(front(i).f(j)).popunum(k)];
            end
        end
    end
    i=i+1;
    if isempty(Q)
        break;
    end
    front(i).f=Q;
end
%nrpopulation=population;
        