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
plot(A(:,1),A(;,2),'bs')
hold on
grid on
plot(B(:,1,:),B(:,2),'r+')
plot(C(:,1),C(:,2),'go');
plot(D(:,1),D(:,2),'m*')
%text labels for classes
text(.5-q,.5+2*q,'class A')
text(.5+q,.5+2*q,'class B')
text(.5+q,.5-2*q,'class C')
text(.5-q,.5-2*q,'class D')