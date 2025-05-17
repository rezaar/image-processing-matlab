clear all
close all
clc

i=imread ('saturn.png');
i=rgb2gray(i);
i=im2double(i);
n=imnoise(i,'salt & pepper',0.1);
m=imnoise(i,'gaussian',0.1,0.5);
o=imnoise(n,"gaussian",0.5);

kr=3;
kc=3;


%Arithmetic Mean Filter

w=ones(kr,kc)/(kr*kc);
amf1=imfilter(n,w,"replicate","same");
amf2=imfilter(m,w,"replicate","same");
amf3=imfilter(o,w,"replicate","same");

%Geometric Mean Filter
n1=im2double(n);
m1=im2double(m);
o1=im2double(o);
W=ones(kr,kc);

gmf1=exp(imfilter(log(n1),W,"replicate")).^(1/(kr*kc));
gmf2=exp(imfilter(log(m1),W,"replicate")).^(1/(kr*kc));
gmf3=exp(imfilter(log(o1),W,"replicate")).^(1/(kr*kc));

%Harmonic Mean Filter

hmf1=(kr*kc)./imfilter(1./(n1+eps),W,'replicate');
hmf2=(kr*kc)./imfilter(1./(m1+eps),W,'replicate');
hmf3=(kr*kc)./imfilter(1./(o1+eps),W,'replicate');

%ContraHarmonic Mean Filter 
Q=1;

chmf1=imfilter(n1.^(Q+1),W,"replicate")./imfilter(n1.^(Q+1),W,"replicate");
chmf2=imfilter(m1.^(Q+1),W,"replicate")./imfilter(m1.^(Q+1),W,"replicate");
chmf3=imfilter(o1.^(Q+1),W,"replicate")./imfilter(o1.^(Q+1),W,"replicate");

%Median Filter

median1=medfilt2(n,[kr kc]);
median2=medfilt2(m,[kr kc]);
median3=medfilt2(o,[kr kc]);

mse1=immse (amf1 , i);
mse2=immse (amf2 , i);
mse3=immse (amf3 , i);
mse4=immse (gmf1 , i);
mse5=immse (gmf2 , i);
mse6=immse (gmf3 , i);
mse7=immse (hmf1 , i);
mse8=immse (hmf2 , i);
mse9=immse (hmf3 , i);
mse10=immse (chmf1 , i);
mse11=immse (chmf2 , i);
mse12=immse (chmf3 , i);
mse13=immse (median1 , i);
mse14=immse (median2 , i);
mse15=immse (median3 , i);

fig = figure();
colNames = {'salt and pepper', 'gaussian', 'mix'};
data = {mse1, mse2, mse3

    ;mse4, mse5,mse6;mse7,mse8,mse9; mse10, mse11,mse12;mse13,mse14,mse15        

    ;};   
table = uitable(fig, 'Data', data, 'ColumnName', colNames);
table.Position = [80 80 200 200];

