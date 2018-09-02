function distAll = AllDistance(dist, n, m, numFiles)
distAll=double(zeros(size(dist{1},2)*(numFiles),size(dist{1},1)));
% sum the geodisic distance into 1 big matrix
%each row in destAll matrix represent the distance between winodw in
%painting to all other windows in the rest paintings in our database
row=0;
col=1;
nn=0;
for i=1:numFiles
    nn=nn+1;
    for k=1:size(dist{1},2)
        row=row+1;
        col=1;
        for t=1:(numFiles-1)
            for j=1:(size(dist{1},2))
                distAll(row,col)=dist{nn}(k+(n*m*(t-1)),j);
                col=col+1;
            end
        end
    end
end
end