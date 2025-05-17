clear all;

f=imread('fabric.png');
f=rgb2gray(f);
cnt=zeros(256,1);
pr=zeros(256,1);
[r c]=size(f);
n=r*c;
for ii=1:r
    for jj=1:c
         pos=f(ii,jj);
         cnt(pos+1,1)=cnt(pos+1)+1; %for histogram
         pr(pos+1,1)=cnt(pos+1,1)/n; %for probability
    end
end
subplot(2,2,1),stem(cnt),title('before equalization'),xlabel('L'),ylabel('nk');
subplot(2,2,2),imshow(f),title('before equalization');


%pr=cnt/(n);
cnts=zeros(256,1);
sk=zeros(256,1);
sum=0;
for i=1:size(pr)
    sum=sum+cnt(i);
        s=sum/(n);
        sk(i,1)=round(s*255);
    
end

for k=1:256
    m=sk(k,1);
   %m=uint16(m);
   cnts(m+1,1)=cnts(m+1,1)+cnt(k,1);
end
%=subplot(2,1,2),imshow(cnt);
hnew=uint8(zeros(r,c));
for i=1:r
    for j=1:c
        hnew(i,j)=sk(f(i,j)+1,1);
    end
end


subplot(2,2,3),stem(cnts),title('after equalization'),,xlabel('L'),ylabel('nk');
subplot(2,2,4),imshow(hnew),title('after equalization');