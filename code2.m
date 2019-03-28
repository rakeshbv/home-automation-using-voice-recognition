close all,clear all,clc,format compact
%number of samples of each class
N=20;
%define inputs and outputs
offset=5; %offset for second class
x=[randn(2,N) randn(2,N)+offset]; %inputs
y=[zeros(1,N) ones(1,N)];
%outputs
%plot input samples with PLOTPV(plot perceptron input/target vectors)
%%figure(1)
plotpv(x,y);
%create and train perceptron
net=perceptron;
net=train(net,x,y);
view(net);
%plot decision boundary
figure(1)
plotpc(net.IW{1},net.b{1});