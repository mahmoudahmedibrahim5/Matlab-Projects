n=0:25;
x1=zeros(1,26);
for i=0:1:10
    y1= n==2.*i; 
    y2= n==2.*i+1;
    x1=x1+((i+1).*(y1-y2));
end 
figure; stem(n,x1);

n=-5:10;
y1= n>=-5;
y2= n>=6;
y3= n==0;
y4= n>=4;
y5= n>=10;

x2=(n.^2).*(y1-y2)+10.*y3+(20.*(0.5).^n).*(y4-y5);
figure; stem(n,x2);

n=0:20;
x3=((0.9).^n).*cos(0.2*pi.*n+pi/3);
figure; stem(n,x3);


n=1:20;
x=[1,2,3,2];
temp=x'*ones(1,5); %5 is the number of periods
x4=temp(:);
figure; stem(n,x4);