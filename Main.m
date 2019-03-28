data=load('data.txt');
X=data(:,2:12);
y=data(:,13);
 
[m, n] = size(X);
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);
[cost, grad] = costFunction(initial_theta, X, y);

options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

t=MfccReal();
t=[1,t(2:12)];
h=sigmoid(t*theta);

if(h>0.50)
    disp('ON');
    writeDigitalPin(a,'D13',1);
else if(h<0.5)
    disp('OFF');
    writeDigitalPin(a,'D13',0);
    end
end