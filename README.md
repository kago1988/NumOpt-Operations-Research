# NumOpt-Operations-Research
How to fit a ridge-regression model  with the application of a QCQP-Solver (MATLAB, library: yaLMIp) 

This is the main-source code for a simple paper that I wrote. 

The paper shows a typical task-setting from the field of operations research 
which is the basis for an example of how to fit a ridge regression model 
with the application of a QCQP-Solver. 

The idea arose from a student-project within the lecture "Numerical Optimization" which is 
frequently held at the University of Freiburg.

The numeric data-vectors which are being used were created artificially. The correspondent 
command lines that were utilized to create the data are presented in the appendix. 

Highlights are: 
  -high-dimensional numeric data-vectors (dimension 185) 
  -non-linear data-vector transformation 
  -transformation of a QP into a QCQP with arguments of convergence and arguments of SVD 
  -application of a QCQP-solver (yaLMIp).
