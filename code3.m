close all,clear all,clc,format compact
%number of samples of each class
K=30;
%define classes
q=.6; %offset of classes
A=[rand(1,K)-q;rand(1,K)+q];
B=[rand(1,K)+q;rand(1,K)+q];
C=[rand(1,K)+q;rand(1,K)-q];
D=[rand(1,K)-q;rand(1,K)-q];
%plot classses
plot(A(1,:),A(2,:),'bs')
hold on
grid on
plot(B(1,:),B(2,:),'r+')
plot(C(1,:),C(2,:),'go');
plot(D(1,:),D(2,:),'m*')
%text labels for classes
text(.5-q,.5+2*q,'class A')
text(.5+q,.5+2*q,'class B')
text(.5+q,.5-2*q,'class C')
text(.5-q,.5-2*q,'class D')
%define output coding for classes
a=[0 1];
b=[1 1]';
c=[1 0]';
d=[0 0]';
%define inputs(combine samples from four classes)
P=[A B C D];
%define targets
T=[repmat(a,1,length(A))...
    repmat(b,1,length(B))repmat(c,1,length(C))
    ...repmat(d,1.length(D))];
    %plotpv(P,T);
    %create a perceptron
    net=perceptron;
    %train a perceptron
    E=1;
    net.