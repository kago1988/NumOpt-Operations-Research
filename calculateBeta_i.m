clear all; 
close all; 

gdpVector = csvread('numeric vectors and plots/gdpVector.dat'); 
exportVolumeVector = csvread('numeric vectors and plots/exportVolumeVector.dat'); 
exhaustGasVector = csvread('numeric vectors and plots/exhaustGasVector.dat'); 
popularityVector = csvread('numeric vectors and plots/popularityVector.dat'); 
carOfTheQuarterVector = csvread('numeric vectors and plots/carOfTheQuarterVector.dat'); 
expandToNewCountryVector = csvread('numeric vectors and plots/expandToNewCountryVector.dat'); 
yOneVector = csvread('yOneVector.dat'); 
yTwoVector = csvread('yTwoVector.dat'); 
yThreeVector = csvread('yThreeVector.dat'); 


gdpVector = transpose(gdpVector(1:182)); 
exportVolumeVector = transpose(exportVolumeVector(1:182)); 
exhaustGasVector = transpose(exhaustGasVector(1:182)); 
popularityVector = transpose(popularityVector(1:182)); 
carOfTheQuarterVector = transpose(carOfTheQuarterVector(1:182)); 
expandToNewCountryVector = transpose(expandToNewCountryVector(1:182)); 


oneVector = ones(182,1); 


X = horzcat(oneVector,gdpVector,exportVolumeVector,exhaustGasVector,popularityVector,carOfTheQuarterVector,expandToNewCountryVector);


% we set lambda = 1. 


betaOneVector = (transpose(X)*X + eye(7))^(-1)*transpose(X)*yOneVector;
betaTwoVector = (transpose(X)*X + eye(7))^(-1)*transpose(X)*yTwoVector;
betaThreeVector = (transpose(X)*X + eye(7))^(-1)*transpose(X)*yThreeVector;


csvwrite('xMatrix.dat',X); 


csvwrite('betaOneVector.dat',betaOneVector); 
csvwrite('betaTwoVector.dat',betaTwoVector); 
csvwrite('betaThreeVector.dat',betaThreeVector); 