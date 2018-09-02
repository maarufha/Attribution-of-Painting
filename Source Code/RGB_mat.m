function Var_RGB=RGB_mat(srcFiles,srcFiles2, numFiles, n, m)
for k = 1:numFiles
    Im=imread(strcat([srcFiles2,'\'],srcFiles(k).name));
    mydata{k} = imresize(Im,[1024 1024]);
    
    %figure, imshow( mydata{k})
    RGB{k}{1} =  mydata{k}(:,:,1); % Red channel
    RGB{k}{2} =  mydata{k}(:,:,2); % Green channel
    RGB{k}{3} =  mydata{k}(:,:,3); % Blue channel
    
    %***********************************************
    %1. divide each painting to 128*128 windows
    %2. run wavelet transform for each window
    %3. compute variance for CH,CV,CD for each window
    variance{k}{1}  =  varianceAlgorithm ( RGB{k}{1}, n, m); %Red matrix painting
    variance{k}{2}  =  varianceAlgorithm ( RGB{k}{2}, n, m);%Green matrix painting
    variance{k}{3}  =  varianceAlgorithm ( RGB{k}{3}, n, m); %Blue matrix painting
    %***********************************************
    
    % sum the three RGB variance matrices into one matrix
    Var_RGB{k}=sumRGB_Variance(variance{k});
end
end
