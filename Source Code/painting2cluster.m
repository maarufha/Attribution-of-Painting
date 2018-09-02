function cluster=painting2cluster(idx2, numFiles, K)
image2cluster=double(zeros(numFiles,K));

for i = 1:size(idx2,1)
    for j = 1:size(idx2,2)
        image2cluster(i,idx2(i,j)) =image2cluster(i,idx2(i,j))+1;
    end
    maxCC(i)=image2cluster(i,1);
    for k = 1:K %associate each painting to a cluster
       if (maxCC(i)<=image2cluster(i,k))
          maxCC(i)=image2cluster(i,k);
          cluster(i)=k;
       end
    end
end
end