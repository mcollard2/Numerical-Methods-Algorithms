# False Position Algorithm
This function approximates the roots of a given function using the false
position method. 

## Input and Output Descriptions

Inputs:

1. func - the function being evaluated
2. xl - the lower guess
3. xu - the upper guess
4. es - the desired relative error            --*Default = .00001%*
5. maxiter - the number of iterations desired --*Default = 200*

Outputs:

1. root - the estimated root location
2. fx - the function evaluated at the root location
3. ea - the approximate relative error (as a percent)
4. iter - the number of iterations that were performed
        
### Limitations and Known Problems:
1. Error output is slightly too low. 
2. Iteration counter needs to be fixed. 

      
  
