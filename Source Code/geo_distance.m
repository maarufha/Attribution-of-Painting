function dist = geo_distance(sig, beta, mm)

rows= size(sig{1},1);%the matrix size(rows);
cols= size(sig{1},2);%the matrix size(cols);
b= 0.25*((mm+2*beta)/(mm+2));
numOfPaintings =size(sig,2);

for w=1:numOfPaintings%number of paintings
    count=0;%to jump 64 cell in the same row for each window distance calculation
    for s=1:rows%the windows we have in each painting (in our case its 64 windows)
        for i=1:numOfPaintings%pointer for painting number i
            if(w~=i)%to claculate the distance between different paintings only
                 count=count+1;
                 for k=1:rows%calculate the distance between window{w}(s,j) to all windows in painting{i} 
                     for j=1:cols
                         a=sig{i}(k,j);
                         c=sig{w}(s,j);
                         r=sig{i}(k,j)/sig{w}(s,j);
                         r=log(r);
                         GD(j)=sqrt((3*b-0.25)*r*r+0*2*(b-0.25)*r*r);
                     end
                 dist{w}(count,k)=sum(GD);
                end
            end
        end
    end
end
end