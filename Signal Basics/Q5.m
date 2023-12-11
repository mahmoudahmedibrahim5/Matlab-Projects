n=-4:2; 
x=[1,-2,4,6,-5,8,10];
n2=-6:6; 
y1=zeros(1,length(n2)); 
y2=zeros(1,length(n2));
y3=zeros(1,length(n2));
n1=n-2; y1(find(n2>=min(n1)&n2<=max(n1)==1))=x;
n1=n+4; y2(find(n2>=min(n1)&n2<=max(n1)==1))=x;
n1=n;   y3(find(n2>=min(n1)&n2<=max(n1)==1))=x;
x1= 3*y1+y2+2*y3;
figure; stem(n2,x1);

n2=-8:3; 
y1=zeros(1,length(n2)); 
y2=zeros(1,length(n2));
y3=zeros(1,length(n2));
y4=zeros(1,length(n2));
n1=n-4; y1(find(n2>=min(n1)&n2<=max(n1)==1))=x;
n1=n+1; y2(find(n2>=min(n1)&n2<=max(n1)==1))=x;
n1=-n-2;y3(find(n2>=min(n1)&n2<=max(n1)==1))=x;
n1=n;   y4(find(n2>=min(n1)&n2<=max(n1)==1))=x;
x2= y1.*y2+y3.*y4;
figure; stem(n2,x2);

n2=-4:7;
x3=zeros(1,length(n2));
for i=1:1:5
    y=zeros(1,length(n2)); 
    n1=n+i; y(find(n2>=min(n1)&n2<=max(n1)==1))=x;
    x3=x3+(y.*n2);
end 
figure; stem(n2,x3);
