# Newton-raphson-method
This code implements a root-finding algorithm known as the **Newton-Raphson Method** for solving equations. The Newton-Raphson method is an iterative technique used to find the root of a real-valued function \( f(x) \). The method starts with an initial guess and iteratively refines this guess until it converges to a solution.

### Explanation of the Code:

1. **Initial Setup**:
   - The `close all; clear all; clc` commands clear any open figures, clear the workspace, and clear the command window, respectively.
   
2. **User Input**:
   - The user is prompted to input the **mathematical function** (as a string) whose root is to be found. For example, if the user enters `x^2 - 4`, the string `S` will hold that expression.
   - The function string is then converted into an **inline function** using `inline(S)`, allowing the code to evaluate the function at any given value of `x`.
   - The user is also prompted to provide an **initial guess (`xo`)** for the root. This is the starting point for the iterative method.
   - The user is asked to input an **allowed error (`error`)**, which determines the accuracy to which the root should be approximated. The iteration stops when the error is less than the allowed tolerance.

3. **Symbolic Derivative**:
   - The `str2sym(S)` function converts the input string `S` into a symbolic expression using the **Symbolic Math Toolbox**. This symbolic expression `c` is then used to compute the **derivative** of the function using the `diff(c)` function.
   - The derivative of the function is represented by `y`, and the code converts it into an inline function using `F = inline(y)`. This inline function represents the derivative \( f'(x) \), which is needed in the Newton-Raphson method.

4. **Newton-Raphson Iteration**:
   - The loop runs for a maximum of 100 iterations (set by `for i = 1:100`). Within each iteration:
     - The new approximation of the root, `x1`, is computed using the Newton-Raphson formula:
       \[
       x_1 = x_0 - \frac{f(x_0)}{f'(x_0)}
       \]
       This formula updates the current guess `x0` to the new value `x1`.
     - The error, `err`, is calculated as the relative error:
       \[
       \text{err} = \left| \frac{x_1 - x_0}{x_0} \right|
       \]
       This measures how much the approximation has changed between two consecutive iterations.
     - If the error is less than the allowed error (`error`), the loop terminates by setting `i = 101` (which forces the loop to exit).

5. **Output**:
   - Once the iteration has converged (the error is below the allowed threshold), the root `x1` is printed as the solution of the equation.

### How the Newton-Raphson Method Works:
- The method uses the function value and its derivative to iteratively improve the estimate of the root.
- The **Newton-Raphson update formula** is:
  \[
  x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}
  \]
  This step is repeated until the error is sufficiently small (i.e., until the root is approximated with the desired accuracy).

### Example Workflow:

Let’s assume the user enters the following:
- **Function**: \( f(x) = x^2 - 4 \)
- **Initial guess**: \( x_0 = 3 \)
- **Allowed error**: \( 0.0001 \)

Steps:
1. **First Iteration**: The algorithm computes the derivative \( f'(x) = 2x \). The new guess \( x_1 \) is calculated:
   \[
   x_1 = 3 - \frac{f(3)}{f'(3)} = 3 - \frac{(3^2 - 4)}{(2 \cdot 3)} = 3 - \frac{5}{6} \approx 2.167
   \]
   The error is computed as the absolute difference between `x1` and `xo` divided by `xo`.

2. **Subsequent Iterations**: The method continues to iterate, refining the guess for the root. With each iteration, the error decreases, and the root approximation improves.

3. **Stopping Condition**: The loop stops once the relative error is less than the allowed error, and the root is printed.

### Example Output:
If the function is \( f(x) = x^2 - 4 \), and the initial guess is 3, the root is approximated to \( 2 \) (since \( x^2 - 4 = 0 \) has roots at \( x = 2 \) and \( x = -2 \)).

The output will be:
```
the root of the equation is : 2
```

### Conclusion:
The **Newton-Raphson Method** is an efficient iterative technique for finding the roots of equations. This code allows the user to input any mathematical function, provide an initial guess and error tolerance, and then uses the method to find the root of the function to the specified accuracy. The method converges quickly if the initial guess is close to the actual root and the function behaves well.
