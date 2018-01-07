clear all; 
close all; 


yOneVector = csvread('yOneVector.dat'); 
yTwoVector = csvread('yTwoVector.dat'); 
yThreeVector = csvread('yThreeVector.dat'); 
X = csvread('xMatrix.dat'); 
betaOneVector = csvread('betaOneVector.dat'); 
betaTwoVector = csvread('betaTwoVector.dat'); 
betaThreeVector = csvread('betaThreeVector.dat'); 




betaOneQCQP = sdpvar(7,1);
betaTwoQCQP = sdpvar(7,1); 
betaThreeQCQP = sdpvar(7,1); 


xSquare = transpose(X)*X; 


epsilonSquareOne = 0;
epsilonSquareTwo = 0; 
epsilonSquareThree = 0; 
    epsilonSquareOne = 0.5*transpose(betaOneQCQP)*xSquare*betaOneQCQP - transpose(betaOneQCQP)*transpose(X)*yOneVector;
    epsilonSquareTwo = 0.5*transpose(betaTwoQCQP)*xSquare*betaTwoQCQP - transpose(betaTwoQCQP)*transpose(X)*yTwoVector;
    epsilonSquareThree = 0.5*transpose(betaThreeQCQP)*xSquare*betaThreeQCQP - transpose(betaThreeQCQP)*transpose(X)*yThreeVector;

    
    

constr1 = [transpose(betaOneQCQP)*betaOneQCQP<=transpose(betaOneVector)*betaOneVector];
constr2 = [transpose(betaTwoQCQP)*betaTwoQCQP<=transpose(betaTwoVector)*betaTwoVector];
constr3 = [transpose(betaThreeQCQP)*betaThreeQCQP<=transpose(betaThreeVector)*betaThreeVector];


options = sdpsettings('solver', 'fmincon','verbose',2,'usex0',1);


diagn1   = optimize(constr1, epsilonSquareOne, options);
diagn2   = optimize(constr2, epsilonSquareTwo, options);
diagn3   = optimize(constr3, epsilonSquareThree, options);


betaOneQCQPDouble = double(betaOneQCQP); 
betaTwoQCQPDouble = double(betaTwoQCQP); 
betaThreeQCQPDouble = double(betaThreeQCQP); 


figure(1);
p = plot(1:182,yOneVector,'r-',1:182,X*betaOneQCQPDouble,'b-'); 
xlabel('Year [Q2-1970,...,Q3-2016]'); 
ylabel('small cars sold'); 
set(gca,'XTickLabel',[]);