function  mainFunction(srcFiles2, Im, K, w, artists)

%devide the image to nXm wondows
%n - the number of the windows(rows)
%m - the number of the windows(cols)
%beta - the shape parameter 
%Laplacian distribution beta =0.5, Gaussian PDF beta=1;
%mm-dimentionality of the probability space 
% for a color image mm=3 , for a gray image mm=1

n=sqrt(w);
m=sqrt(w);
beta=0.5;  %Laplacian distribution beta = 0.5, Gaussian PDF beta=1;
mm=3;      % for a gray image mm=1, for a color image mm=3

srcFiles = dir([srcFiles2,'\*.jpg']); %the folder where images stored
numFiles = length(srcFiles);

    
%get the variances matrices
Var_RGB=RGB_mat(srcFiles,srcFiles2, numFiles, n, m);


% geodisc distance algoeithim, the output will be the distance between each
% window to all windows in all paintings
dist = geo_distance(Var_RGB, beta,mm);

%sum the geodisic distance into 1 big matrix
%each row in destAll matrix represent the distance between winodw in
%painting to all other windows in the rest paintings in our database
distAll=AllDistance(dist, n, m, numFiles);

% idx = vector that represent the cluster
% C = the medoids (if k=4 we will get 4 rows each one is the medoid(i) i=1,2,3,4)
% sumd = the sum for each painting distances 
% d = distance from the center for each window
% medoids = the row number for each medoid
% info = string information about the PAM algorithm
[idx, C, sumd, d, medoids, info] = kMedoids(distAll,K);

% convert the vector to matrix of(m!,w) where m is the number of paintings
% and w is the number of windows in each painting, in our case w=64
for k = 1:numFiles
    idx2 = vec2mat(idx,n*m);
end

% here we will get the The number of occurrences in painting(i) to
% cluster(j), where j=1,2....K
cluster=painting2cluster(idx2, numFiles, K);

Im=strcat(Im);
Im=imread(Im);
%Im=imread('rembrandt4.jpg');
input = imresize(Im,[1024 1024]);
%figure, imshow( mydata{k})
input_RGB{1} =  input(:,:,1); % Red channel
input_RGB{2} =  input(:,:,2); % Green channel
input_RGB{3} =  input(:,:,3); % Blue channel

%*************************************************************
%1. divide each painting to 128*128 windows
%2. run wavelet transform for each window
%3. compute variance for CH,CV,CD for each window
input_variance{1}  =  varianceAlgorithm ( input_RGB{1}, n, m); %Red matrix painting
input_variance{2}  =  varianceAlgorithm ( input_RGB{2}, n, m); %Green matrix painting
input_variance{3}  =  varianceAlgorithm ( input_RGB{3}, n, m); %Blue matrix painting


% sum the three RGB variance matrices into one matrix
input_Var_RGB=sumRGB_Variance(input_variance);

%calculate the distance between the input_variance and the database_variances 
input_dist = input_geo_distance(input_Var_RGB, beta, mm);

%calculate the distances between the input painting to each medoid in the %cluster
input2c=input2cluster(input_dist, C, K);
 
%to find the closest cluster to the input painting
[val, index] = max(input2c);

%pareto function return the closests 5 paintings to the input painting
[S, count]=pareto(input_Var_RGB, Var_RGB, cluster, index, n*m);
%S=pareto2(input_dist, cluster, dist, index, n*m);


%Some times our algorithm cannot associate the painting to cluster
%So we display error message
if(count==0)
    figure
    imshow(Im),title('There are no similar paintings in the cluster. Please run again')
else
%extract the closest 5 paintings
    P=sum(S,2);
    indexs=zeros(1,size(cluster,2));
    cnt=0;
    for r=1:size(indexs,2)
        if(cluster(r)==index)
            cnt=cnt+1;
            indexs(r)=P(cnt);
        end
    end
    indexs2=zeros(1,size(cluster,2));
    if(size(S,1)>5)
        nn=5;
    else
        nn=size(S,1);
    end
    for i=1:nn
        [va, in] = max(indexs);
        indexs(in)=0;
        indexs2(in)=1;
    end
        

    %here we check to whom painter the pareto function belongs, find
    %the number of accuracy of the 5 must suitable painting to whom
    %artist it belongs to.
    %artists={'dali','rembrandt','vangogh', 'renoir', 'aivazovsky'};
    %artists={'balck','white'};
    %artists={'monet','renoir'};
    figure
    cnt=0;
    artistList=zeros(1,size(artists,2));
    for j=1:size(indexs2,2)
        if(indexs2(j)==1)
           cnt=cnt+1;
           subplot(3,2,cnt)
           I=imread(strcat([srcFiles2,'\'],srcFiles(j).name));
           imshow(I),title(srcFiles(j).name);
           In=strncmp(artists, strcat(srcFiles(j).name(1:size(srcFiles(j).name,2)-6)),size(srcFiles(j).name,2)-5);
           [val, index] = max(In);
           artistList(index)=artistList(index)+1;
        end
    end
    [val, index] = max(artistList);
    figure
    imshow(Im),title(['The input painting associated to ',artists{index} ,' by ', int2str(artistList(index)*(100/nn)), '%'])
end
