clear all
close all
clc

i=imread ('saturn.png');
i=rgb2gray(i);
m=imnoise(i,'gaussian',1,5);
q=imnoise(i,'gaussian',1,5);
p=imnoise(i,'gaussian',1,5);
r=imnoise(i,'gaussian',1,5);
o=imnoise(i,'gaussian',1,5);
n=imnoise(i,'gaussian',1,5);
s=imnoise(i,'gaussian',1,5);

A=imadd(m,q);
a=A/2;
B=imadd(A,p);
b=B/3;
C=imadd(B,r);
c=C/4;
D=imadd(C,o);
d=D/5;
E=imadd(D,n);
e=E/6;
F=imadd(E,s);
f=F/7;
mse1=immse (a , i);
mse2=immse (b , i);
mse3=immse (c , i);
mse4=immse (d , i);
mse5=immse (e , i);
mse6=immse (f , i);

x=[2 3 4 5 6 7];
y=[mse1 mse2 mse3 mse4 mse5 mse6];
plot(x,y);



