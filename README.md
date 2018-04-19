# Numerical-Method-Algorithms
This collection of algorithms was created throughout fall semester of 2018 and can be used to accurately estimate or manipulate data. Among the possible estimation algorithms are simpson, false position, and golden search methods. The final code, luFactor, allows for easy manipulations of n x n matrices. 
## Simpsons.m
Accurately finds the integral of a inputted matrix using a combination Simpson's 1/3 rule and trapzoid rule if required. This algorithm can be implemented for any sized matrix required.

  INPUTS
  - Vector of independant variables (x)
  - Vector of dependant variables (y)
  
  OUTPUTS
  - Approximate integral

## falsePositionpractice.m
With a given function this algroithm will deterime its root within a given interval. The determined answer will be within a desired amount of error, if not the default is 0.0001 of the actual number.

  INPUTS
  - Function
  - Lower guess
  - Upper guess
  - Desired relative error
  - Number of iterations
 
  OUTPUTS
  - Predicted root location
  - Funtion at root
  - Approximate relative error
  - Number of iterations performed

## goldenSearch.m
This function is used to find a minimum that is restrained within a given interval with an error of 0.001.

  INPUTS
  - function (f)
  - lower bound (xL)
  - Upper bound (xR)
  
  OUTPUTS
  - min 
  
## luFactor.m
Given a 3 x 3 matrix the function will determine the necessary upper, lower, and pivot matrices required. This is useful because once these are found new variables can be inputted to determine their effect on a system.

  INPUTS
  - 3 x 3 matrix
  
  OUTOUTS
  - Lower matrix
  - Upper matrix
  - Pivot matrix
