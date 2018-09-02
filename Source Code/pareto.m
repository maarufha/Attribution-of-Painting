function  [S, count]=pareto(input_Var_RGB, Var_RGB, cluster, index, windows)
    
%index2painters=double(zeros(1,length(cluster)));
count=0;
%calculate the distance between the input painting to each painting in the
%suitable cluster
for i=1:length(cluster)
    if(cluster(i)==index)
       count=count+1;
       for j=1:size(input_Var_RGB,1)
           for k=1:size(input_Var_RGB,2)
               clusterDist{count}(j,k)=abs(Var_RGB{i}(j,k)-input_Var_RGB(j,k));
           end
       end
    end
end 

%now find the best pareto solution
%   
%   y
%   *
%   *                 *
%   *      *        *
%   *             *
%   *    *      *               *
%   *         *             
%   *       *           *
%   *     *  @                  *
%   *   *
%   * *                         *
%   ********************************>x
%
%  here the best solution is @ because we need the closest painting 
%  to the linear line where x=y
%
%
%we need to check if in painting(i) and painting(j) where i~=j
%if each window(i)<=window(j)
for i=1:count
    idx=0;
    for j=1:count
        if(i~=j)
           idx=idx+1;
           for k=1:size(input_Var_RGB,1)
                   if(clusterDist{i}(k,1)<=clusterDist{j}(k,1)&&clusterDist{i}(k,2)<=clusterDist{j}(k,2)&&clusterDist{i}(k,3)<=clusterDist{j}(k,3)) 
                     vect{i,idx}(k)=1;
                   else
                     vect{i,idx}(k)=0;
                   end
           end
        end
    end
end
S=0;
for i=1:count
       for j=1:(count-1)
           S(i,j)=sum(vect{i,j});
       end
end
end
