%% Classify SVM
SubjectID = 1;
avgFeaturesPerSubject = dimensionReductionAverage(featureData);
features = squeeze(avgFeaturesPerSubject(SubjectID,:,:));

labels = getLabels(deapData);
labels = squeeze(labels(SubjectID,:,:));


%% Normalize
temp = bsxfun(@minus,features,mean(features));
norm_features = bsxfun(@rdivide,temp,std(features));
% Optional normalize to 1
% norm_features = normc(features);

%% Binarize Labels for SVM classification
labels = labels > 5;

%% Split data for testing and classification
training_size = 30;
n = size(norm_features,1);
train_data = norm_features(1:training_size,:);
test_data = norm_features(training_size+1:end,:);

train_labels = labels(1:training_size,:);
test_labels = labels(training_size+1:end,:);
%% Classify Valence
SVMModelValence = fitcsvm(train_data, train_labels(:,1),'KernelFunction','rbf','Standardize',true);
[predicted_labels_train,scores] = predict(SVMModelValence, train_data);
[predicted_labels,scores] = predict(SVMModelValence, test_data);

%%
SVMModelValence = fitcsvm(features, labels(:,1),'KernelFunction','rbf','Standardize',true,'CrossVal','on','KFold',10);
indGenError = kfoldLoss(SVMModelValence,'mode','individual')
avgGeneralizationError = kfoldLoss(SVMModelValence)

%CVSVMModelValence = crossval(SVMModelValence);
%[predicted_labels_train,scores] = predict(CVSVMModelValence, train_data);
%[predicted_labels,scores] = predict(SVMModelValence, test_data);

%% Classify Valence
