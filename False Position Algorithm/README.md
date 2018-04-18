# False Position Algorithm
This function approximates the roots of a given function using the false
position method. 

## Input and Output Descriptions

Inputs:

func - the function being evaluated
xl - the lower guess
xu - the upper guess
es - the desired relative error            *Default = .00001%*
maxiter - the number of iterations desired *Default = 200*

Outputs:

root - the estimated root location
fx - the function evaluated at the root location
ea - the approximate relative error (as a percent)
iter - the number of iterations that were performed
        
### Limitations and Known Problems:
1. Error output is slightly too low. 
2. Iteration counter needs to be fixed. 

      
  
