02% Bi-section method
close all;
clear all;
clc
S=input('Enter the mathamatical function to find its root:','s');
f = inline(S);
xo=input('Enter the guess intervel of Domain of the function xo=');
error=input('Enter the allowed error:');
c=str2sym(S);
y=diff(c);
F=inline(y);
x1=0;
for i=1:100
    x1=xo-f(xo)/F(xo);
    xo=x1;
  err=abs((x1-xo)/xo);
  if error < err
      i=101;
  end
end
fprintf('the root of the equation  is : %d\n',x1)
