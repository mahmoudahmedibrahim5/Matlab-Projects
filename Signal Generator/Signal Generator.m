 fs=input('Enter the sampling frequency');
start=input('Enter the start of the time');
endo=input('Enter the end of the time');
bp=input('Enter the number of the breakpoints');
pos=zeros(1,bp);

for i=1:1:bp                            %loop for taking the positions of the breakpoints from the user
    pos(i)=input('Position of breakpoint');
end

region=zeros(2,bp+1);                   %2-dimentional array for the start sample and end sample of every region
region(1,1)=1;
region(2,bp+1)=(endo-start)*fs;

t_region=zeros(2,bp+1);                 %2-dimentional array for the start time and end time of every region
t_region(1,1)=start;
t_region(2,bp+1)=endo;

if bp~=0
    for i=2:bp+1                        %assigning the start and the end of every region
        region(1,i)=(pos(i-1)-start)*fs;
        region(2,i-1)=(pos(i-1)-start)*fs;
        
        t_region(1,i)=pos(i-1);
        t_region(2,i-1)=pos(i-1);
    end
end

signal=ones(region(1,1),region(2,bp+1)-1);

for i=1:1:bp+1
    typ=menu('Enter the type of the signal','1-DC signal','2-Ramp signal','3-General order polynomial','4-exponential signal','5-sinusoidal signal');
    t=linspace(t_region(1,i),t_region(2,i),region(2,i)-region(1,i)+1);
    if typ==1 
        amp=input('Enter the amplitude of the DC signal');
        signal(region(1,i):region(2,i))=ones(1,region(2,i)-region(1,i)+1).*amp;
        
    end
    if typ==2
        slope=input('Enter the slope of the signal');
        inter=input('Enter the intercept of the signal');
        signal(region(1,i):region(2,i))=t.*slope+inter;
    end        
    if typ==3
        amp=input('Enter the amplitude of the signal');
        pow=input('Enter the power of the signal');
        inter=input('Enter the intercept of the signal');
        signal(region(1,i):region(2,i))=amp*t.^pow+inter;
    end
    if typ==4
        amp=input('Enter the amplitude of the signal');
        expo=input('Enter the exponent');
        signal(region(1,i):region(2,i))=amp*exp(expo.*t);  
    end
    if typ==5
        amp=input('Enter the amplitude of the signal');
        freq=input('Enter the frequency');
        phase=input('Enter the phase angle in degree');
        signal(region(1,i):region(2,i))=amp*sin(2*pi*freq*t+phase*pi/180);
    end    
end

t=linspace(start,endo,(endo-start)*fs);
figure; plot(t,signal);
operation=menu('Enter the required operation','Amplitude Scaling','Time reversal','Time shift','Expanding the signal','Compressing the signal','None');
new_signal=signal;
tnew=t;

if operation==1
    scale_val=input('Enter the scale value');
    new_signal=scale_val.*signal;
    tnew=t;
elseif operation==2
    new_signal=signal(end:-1:1);
    tnew=linspace(-1*endo,-1*start,(endo-start)*fs);
elseif operation==3
    shift_val=input('Enter the shift value');
    new_signal=signal;
    tnew=t+shift_val;
elseif operation==4
    exp_val=input('Enter the expanding value');
    new_signal=resample(signal,exp_val,1);
    tnew=linspace(exp_val*start,exp_val*endo,((endo-start)*fs)*exp_val);
elseif operation==5
    comp_val=input('Enter the compression value');
    new_signal=resample(signal,1,comp_val);
    tnew=linspace(start/comp_val,endo/comp_val,((endo-start)*fs)/comp_val);
end

figure; plot(tnew,new_signal);
