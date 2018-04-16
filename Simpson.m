function [I] = Simpson(x,y)
%This function approximates the integral of experimental data using
%Simpson's Composite 1/3 Rule as well as the trapezoidal method if
%necessary.
%   Inputs 
%       -x: The x matrix for the data points *MUST BE EVENLY SPACED* 
%       -y: The y matrix *MUST BE SAME LENGTH AS THE X MATRIX*
%   Outputs
%       -I: The calculated integral

if nargin ~= 2 %Ensure correct number of input arguments
    error('Two input arguments are necessary')
end

Lx = length(x);
Ly = length(y);

if Lx ~= Ly 
    error('X and Y inputs must be the same length') 
end 

space = diff(x);
for i=1:length(space)-1
    if space(i) ~= space(i+1) %ensure even spacing
        error('x matrix elements must be evenly spaced')
    end
end

if mod(Lx,2) == 0
    warning('The trapezoidal rule was used') 
    even = 0; %Set matrices nature to odd
else 
    even = 1; %Set matrices nature to even
end

Num1 = 0;
Num2 = 0;
if even == 1 %Utilize Simpson's 1/3 Composition Rule to solve even matrices
    for j = 1:2:Ly-1 
        Num1 = Num1+4*y(j+1);
    end
    for k = 1:2:Ly-2
        Num2 = 2*y(k+2)+Num2;
    end
    I = (y(1)+y(Ly)+Num1+Num2)/(3*Ly)*(x(Lx)-x(1)); %Simpson's Composite 1/3 Rule
end

Num3 = 0;
Num4 = 0;
if even == 0 %Utilize Simpson's 1/3 Composition Rule and the trapizoidal rule to solve odd matrices
    for l = 1:2:Ly-2
        Num3 = Num3+4*y(l+1);
    end
    for m = 1:2:Ly-3
        Num4 = Num4+2*y(m+2);
    end
    I1 = (y(1)+y(Ly-1)+Num3+Num4)/(3*(Ly-1))*(x(Lx-1)-x(1)); %Simpson's Composite 1/3 Rule
    I2 = y(Ly-1)+y(Ly)/2; %Trapezoidal Rule
    I = I1+I2;
end
end
    