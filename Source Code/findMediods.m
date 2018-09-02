%this function gets a matrix of distances and a matrix o all the known mediods and finds the next mediod
function next=findMediods(A,mediods)
I=size(A,1);
J=size(A,2);
K=size(mediods,2);
minSum=1E20; %will hold the minimum sum of the potenatial mediod
lastMinVal=1E6;%will hold the minimum sum of the last potenatial mediod checked
for i=1:I %for of rows in A matyrix
    if isNew(i,mediods)==1 %check if i is a known mediod
        sum=0;%holds the sum of the potenatial mediod
        for j=1:J % for of columns in A matrix
            lastMinVal=1E20;
            for k=1:K %for of values in mediods
                minVal=min(A(mediods(k),j),A(i,j));%finding the minVal between the two values
%                 i
%                 j
%                 mediods(k)
%                 A(mediods(k),j)
%                 A(i,j)
%                 lastMinVal 
%                 minVal 
                
                if lastMinVal > minVal 
                    lastMinVal = minVal; 
%                     minVal
                end %end of if
            end % end of for of K
            sum=sum+lastMinVal;
        end %end of for of J
        %    end %end of if
%         minSum
%         sum
        if sum < minSum 
            minSum = sum; 
            %disp('************************************************')
            %minSum;
            next=i;
        end %end of if
    end %end of if
end %end of for                
                