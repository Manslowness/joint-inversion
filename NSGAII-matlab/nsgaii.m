clear
clc
close all
%%Ŀ�꺯��
%%��������
tic
objectfunnum=2;
objectnum=3;%ά��
upper=4;
downer=-4;
population_size=100;
genesize=6;
chromosome_size=genesize*objectnum;
generation_size=200;
cross_rate=0.9;
mutate_rate=1/chromosome_size;
%��ʼ����Ⱥ
for i=1:population_size;
    population(i).popu=zeros(1,chromosome_size);
    for j=1:chromosome_size;
        population(i).popu(j)=round(rand);
    end
end
%��ʼ��Ⱥ����
%������Ӧ��
  population=fitness(population,genesize,objectnum);
 [population,front]=rank(population);
for i=1:generation_size;
    i
    %population=fitness(population,genesize,objectnum);
    %[population,front]=rank(population);
    %������Ӧ�Ⱥ����������Ѿ��ھ�Ӣ��������ʵ����
 population=crowddistance(front,population,objectfunnum);
 Qpopulation=selection(population);
 Qpopulation=crossover(Qpopulation,cross_rate);
 Qpopulation=mutation(Qpopulation,mutate_rate);
Rpopulation=elitism(population,Qpopulation,genesize,objectnum);
population=Rpopulation;
end
[population,front]=rank(population);
toc
for i=1:length(front(1).f)
f1(i)=population(front(1).f(i)).fitness(1);
f2(i)=population(front(1).f(i)).fitness(2);
end
plot(f1,f2,'*k')
figure
hold on
for i=1:length(population);
    x(i).x=transcribe(population(i).popu,genesize,objectnum,upper,downer);
     scatter(x(i).x(1),x(i).x(2));   
    end
hold off


