function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%This function approximates the roots of a given function using the false
%position method. 
%   Inputs:
%        func - the function being evaluated
%        xl - the lower guess
%        xu - the upper guess
%        es - the desired relative error *Default = .00001%*
%        maxiter - the number of iterations desired *Default = 200*
%   Outputs:
%        root - the estimated root location
%        fx - the function evaluated at the root location
%        ea - the approximate relative error (as a percent)
%        iter - how many iterations were performed

 %Define necessary variables
 ea = 100;
 syms root;
 iter = 0;
 
%Check that inputs are valid and appropriate in number
if nargin < 3
    error('Not enough input arguments.')
elseif nargin < 4
    es = .00001;
    maxiter = 200;
elseif nargin < 5
    maxiter = 200;
end
 if ((func(xl)<0) && (func(xu)<0)) || ((func(xl)>0) && (func(xu)>0))
     error('Initial guesses provided do not bracket a root.')
 end
 
 %Approximates the root. Iterates until the maximum number of iterations is
 %reached or the error falls under specified amount. Keeps track of 
 %iterations.
 while ea>es && maxiter>=iter 
     root_prior = root;
     root = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
     if func(root)<0
         xu = root;
     elseif func(root)>0
         xl = root;
     else 
         ea = 0;
     end
     if iter>1 && ea~=0 
     ea = abs(((root-root_prior)/root))*100;
     end
     iter = iter+1;
 end
 fx = func(root);
end
