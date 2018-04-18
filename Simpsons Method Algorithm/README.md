# Simpson's Composite 1/3 Rule Algorithm
This function approximates the integral of experimental data using Simpson's Composite 1/3 Rule as well as the trapezoidal method if necessary. The trapezoidal rule is only used when there are an even number of data points, and it is only used to calculate the area of the odd(last) segment.

## Input and Output Descriptions:

Inputs:
1. x - x matrix for the data points -*Must be evenly spaced*-
2. y - y matrix for the data points -*Must be same length as the x matrix*-

Outputs:
1. I - calculated integral

### Limitations and Known Problems:
1. This algorithm will only calculate the integral of data that has evenly spaced x values. 
