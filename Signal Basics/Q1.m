t=linspace(0,1,100);
x1=ones(1,200);
x2=sin(pi*t/2+pi/2)+3;
tnew=linspace(-2,3,500);
x=[4*x1 x2 3*x1];
figure
plot(tnew,x)