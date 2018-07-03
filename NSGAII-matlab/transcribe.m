function x=transcribe(populationvec,genesize,objectnum,upper,downer)
index=1;
% π”√gray¬Î
for i=1:objectnum;
    temp=0;
    for j=index:index+genesize-1;
       if j==index;
            bin=populationvec(j);
        else 
            bin=xor(int8(bin),int8(populationvec(j)));
        end
        temp=temp+bin*2^(index+genesize-1-j);
    end
    x(i)=downer+(upper-downer)*temp/(2^genesize);
    index=index+genesize;
end
