function[sumVar]=sumRGB_Variance(variance)

a=size(variance{1},1);
b=size(variance{1},2);
for i=1:size(variance{1},1)
      for j=1:size(variance{1},2)
          sumVar(i,j)=(variance{1,1}(i,j)+variance{1,2}(i,j)+variance{1,3}(i,j))/3;
      end
end
end


