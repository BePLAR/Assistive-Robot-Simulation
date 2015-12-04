%Trans1 function takes inputs of DH parameters in order d,q(theta),a,
%Y(alpha), computes the individual rotation and translational matrices in z
%and x direction and computes the complete transformation matrix.
%The function returns the value as T.
% The angle inputs are in terms of degree.
function [T]= Trans1(d,q,a,Y)
Rotz=[cos(q), -sin(q), 0, 0; sin(q), cos(q), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
Transz=[1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, d; 0, 0, 0, 1];
Transx=[1, 0, 0, a; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
Rotx=[1, 0, 0, 0; 0, cos(Y), -sin(Y), 0; 0, sin(Y), cos(Y), 0; 0, 0, 0, 1];
T=Rotz*Transz*Transx*Rotx;
end


