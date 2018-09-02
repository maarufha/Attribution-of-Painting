function[sig]=varianceCalc(wave)
count=1;
 for i=1:row:size(wave)
      for j=1:col:size(size(wave{1}),2)
          for x=1:row
              for y=1:col
                  AA(x,y)=Gr(i+x-1,j+y-1);
              end
          end
          [CA, CH, CV, CD]=wavellet(AA);
          %calculate the diffrent between the values in the matrix
          sigmaH=correlation(CH);
          sigmaV=correlation(CV);
          sigmaD=correlation(CD);
          sig(count,:)=[sigmaH,sigmaV,sigmaD];
          count=count+1;
      end
 end
end