X=[1 0 0 0 -1; 2 0 0 0 -2; 3 0 0 0 -3; 4 0 0 0 -4; 5 0 0 0 -5;]
Y=X' 
Z=[Y(:,[1 2 3]) Y(:,[2 1])]
W=[X(:,1).*2 X(:,[2 3 4])+100 X(:,5)./-10]