function [idx, C, sumd, d, midx, info] = kMedoids (X, K)
I=X;
%I=load ('ce1.txt'); %load the data
%X= (I-min(I(:))) ./ (max(I(:)-min(I(:))));%normalaize the data

opts= statset('Display', 'iter'); %show the iteration in the command window
    
[idx, C, sumd, d, midx, info] = kmedoids(X, K, 'Distance', 'euclidean', 'Options', opts);

sumd=sum(sumd);

figure;
plot(I(idx==1,1),I(idx==1,2), 'r.', 'MarkerSize',7)
hold on
plot(I(idx==2,1),I(idx==2,2), 'b.', 'MarkerSize',7)
plot(I(idx==3,1),I(idx==3,2), 'g.', 'MarkerSize',7)
plot(I(idx==4,1),I(idx==4,2), 'y.', 'MarkerSize',7)
plot(I(idx==5,1),I(idx==5,2), 'k.', 'MarkerSize',7)

plot(C(:,1),C(:,2),'co',...
    'MarkerSize',7,'LineWidth',1.5)
   legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Cluster 5','Medoids',...
       'Location', 'NW');
title('K-Medoids Clustering');
hold off
end
