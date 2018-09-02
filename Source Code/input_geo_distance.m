function dist = input_geo_distance(sig, beta, mm)

rows= size(sig,1);%the matrix size(rows);
cols= size(sig,2);%the matrix size(cols);
b= 0.25*((mm+2*beta)/(mm+2));

for i=1:rows%the windows we have in each painting (in our case its 64 windows)
          for k=1:rows%calculate the distance between window{w}(s,j) to all windows in painting{i} 
              for j=1:cols
                 a=sig(k,j);
                 c=sig(i,j);
                 r=sig(k,j)/sig(i,j);
                 r=log(r);
                 GD(j)=sqrt((3*b-0.25)*r*r+0*2*(b-0.25)*r*r);
              end
              dist(i,k)=sum(GD);
          end
end
end