% % number of training samples to generate.
% nsamples = n_trial;
%  
% % create some training data for three classes.
% training = data;
%  
% % sample mean
% sample_means = cell(length(training),1);
% sample_means{1} = mu_i(:,1);
% sample_means{2} = mu_i(:,2);
% sample_means{3} = mu_i(:,3);
% 
%  
% xrange = [0 20];
% yrange = [0 20];
% % step size for how finely you want to visualize the decision boundary.
% inc = 0.1;
%  
% % generate grid coordinates. this will be the basis of the decision
% % boundary visualization.
% [x, y] = meshgrid(xrange(1):inc:xrange(2), yrange(1):inc:yrange(2));
%  
% % size of the (x, y) image, which will also be the size of the 
% % decision boundary image that is used as the plot background.
% image_size = size(x);
%  
% xy = [x(:) y(:)]; % make (x,y) pairs as a bunch of row vectors.
% 
% xy = [reshape(x, image_size(1)*image_size(2),1) reshape(y, image_size(1)*image_size(2),1)];
% 
% numxypairs = length(xy); % number of (x,y) pairs
%  
% % distance measure evaluations for each (x,y) pair.
% dist = [];
%  
% % loop through each class and calculate distance measure for each (x,y)
% % from the class prototype.
% for i=1:length(training),
%  
%     % calculate the city block distance between every (x,y) pair and
%     % the sample mean of the class.
%     % the sum is over the columns to produce a distance for each (x,y)
%     % pair.
%     disttemp = sum(abs(xy - repmat(sample_means{i}, [numxypairs 1])), 2);
%  
%     % concatenate the calculated distances.
%     dist = [dist disttemp];
%  
% end
%  
% % for each (x,y) pair, find the class that has the smallest distance.
% % this will be the min along the 2nd dimension.
% [m,idx] = min(dist, [], 2);
% 
% decisionmap = reshape(idx, image_size);
% 
% figure;
%  
% %show the image
% imagesc(xrange,yrange,decisionmap);
% hold on;
% set(gca,'ydir','normal');
%  
% % colormap for the classes:
% % class 1 = light red, 2 = light green, 3 = light blue
% cmap = [1 0.8 0.8; 0.95 1 0.95; 0.9 0.9 1]
% colormap(cmap);
%  
% % plot the class training data.
% plot(training{1}(:,1),training{1}(:,2), 'r.');
% plot(training{2}(:,1),training{2}(:,2), 'go');
% plot(training{3}(:,1),training{3}(:,2), 'b*');
%  
% % include legend
% legend('Class 1', 'Class 2', 'Class 3','Location','NorthOutside', ...
%     'Orientation', 'horizontal');
%  
% % label the axes.
% xlabel('x');
% ylabel('y');