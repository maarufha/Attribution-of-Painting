function    sigma= correlation(cH)

 AA=zeros(size(cH,1)*size(cH,2),1);

%from matrix cH to vector AA
 
BB=cH.'; 
AA=BB(:);
 
 sigma=var(AA);
end