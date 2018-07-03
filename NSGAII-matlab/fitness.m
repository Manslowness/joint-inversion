%% 适应度函数需要根据具体问题进行修改

%% 设置自变量的上下限
function population=fitness(population,genesize,objectnum)
upper=4;
downer=-4;
for i=1:length(population);
    x=transcribe(population(i).popu,genesize,objectnum,upper,downer);
  %  population(i).fitness(1)=-10*exp(-0.2*sqrt(x(1)^2+x(2)^2))-10*exp(-0.2*sqrt(x(2)^2+x(3)^2));
  %  population(i).fitness(2)=abs(x(1))^0.8+5*sin(x(1)^3)+abs(x(2))^0.8+5*sin(x(2)^3)+abs(x(3))^0.8+5*sin(x(3)^3);
     population(i).fitness(1)=1-exp(-(x(1)-1/sqrt(3))^2-(x(2)-1/sqrt(3))^2-(x(3)-1/sqrt(3))^2);
     population(i).fitness(2)=1-exp(-(x(1)+1/sqrt(3))^2-(x(2)+1/sqrt(3))^2-(x(3)+1/sqrt(3))^2);
    end