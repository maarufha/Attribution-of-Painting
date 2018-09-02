function[sig]=varianceAlgorithm(Im, n, m)
b1=mod(size(Im,1),n);
row=(size(Im,1)-b1)/n;
b2=mod(size(Im,2),m);
col=(size(Im,2)-b2)/m;
AA=uint8(zeros(uint8(row),uint8(col)));
count=1;

%figure
 for i=1:row:size(Im,1)-b1
      for j=1:col:size(Im,2)-b2
          for x=1:row
              for y=1:col
                  AA(x,y)=Im(i+x-1,j+y-1);
              end
          end
          %subplot(n,m,count);
         % imshow(AA);
         [CA, CH, CV, CD]=wavellet(AA);
         %[CA2, CH2, CV2, CD2]= dwt2(AA,'haar')
          %calculate the diffrent between the values in the matrix
          sigmaH=correlation(CH);
          sigmaV=correlation(CV);
          sigmaD=correlation(CD);
          sig(count,:)=[sigmaH,sigmaV,sigmaD];

          count=count+1;
      end
 end
end