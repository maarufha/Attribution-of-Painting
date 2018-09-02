function sum_c = input2cluster(input_dist, C, K)


%the idea here is to sum the distance from window i to cluster k.. for each
%cluster we will have 64 distances. then we will take the minimun distance
%and associate the painting to the minimum i distances

rows=size(input_dist,1);
cols=size(input_dist,2);

for s=1:K
    for i=1:rows
    count=1;
    for j=s:s
        for k=1:cols
            %for each window in input painting calculate the distance
            %between window i to medoid(k), where k is the number of
            %clusters
            input2cluster{s}(i,count)=0;
            for r=1:(size(C,2)/cols)
                input2cluster{s}(i,count)=input2cluster{s}(i,count) + abs(C(j,k+(rows*(r-1)))-input_dist(i,k));
            end
            
            count=count+1;
        end 
    end
    %sum the distances in each row
    %input2cluster{s}(i,count)=abs(sum(input2cluster{s}(i)));
    end
    input2cluster{s}=input2cluster{s}';
    sumRows{s}=abs(sum(input2cluster{s}));
end

%matrix with K*Rows to get the distance sum for each row in input painting
sum_dist=double(zeros(K,rows));
%vector to sum the similar windows in each sum_dist rows
%then we will associate the input painting to the maximum similar cluster
sum_c=double(zeros(1,K));
for s=1:K
   for i=1: rows
           %the minimum distance between each 2 windows we assume
           %minDist=1
           if((sumRows{s}(i)/(size(C,2)))<=1.5)
           sum_dist(s,i)=1;
           end
        end
        for k=1:rows
            sum_c(s)=sum_c(s)+sum_dist(s,k);
      end
   end
end
  

