sympref('FloatingPointOutput',true);
syms d E1(d) E2(d) E(d) lambda(d);
Eg_bulk=1.74*1.60218e-19;
h=6.62607015e-34; %plank's constant
e=1.602176634e-19; %electronic charge
epsilon_0=8.854187817e-12; %epsilon not
pi=3.141592653589793238;
c=299792458; %speed of light(metre/sec)

%CdSe constants
Me=0.13*9.10938356e-31; %effective mass of electron
Mh=0.3*9.10938356e-31; %effective mass of hole
epsilon=6.23; %epsilon

%band gap energy dependence on crystal size
E1(d)=((h^2/(2*d^2))*(Me^-1+Mh^-1));
E2(d)=-((0.9*e^2)/(pi*epsilon*epsilon_0*d));
E(d)=Eg_bulk+E1(d)+E2(d);
lambda(d)=(h*c)/E(d); %absorption wavelength

%get values of E,E1,E2,lambda with variation of d in range[1-20](nanometres)
d1=linspace(1e-9,20e-9,10)';
E11=double(E1(d1));
E22=double(E2(d1));
EE=double(E(d1));
lambda2=double(lambda(d1));
t=table(d1,E11,E22,EE,lambda2)

%plotting(E,E1,E2,d) function call to plot all E,E1,E2 in a single plot
%plotting
function plotting(E,E1,E2,d)
interval=[0 1e-9]; %d limit for plotting
fplot(E(d),interval)
hold on
fplot(E1(d),interval)
fplot(E2(d),interval)
hold off
end

