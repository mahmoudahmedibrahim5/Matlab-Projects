V=input('Enter a column vector ');
V([end-2 end-1 end],1)= V([end-2 end-1 end],1)+2
V([end-3 end-2 end-1 end],1)= V([end end-1 end-2 end-3],1)
V(2:2:length(V))= V(1:2:length(V)-1)+V(2:2:length(V))