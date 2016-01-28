%Trans function takes inputs of DH parameters in order d,q(theta),a,
%Y(alpha), computes the individual rotation and translational matrices in z
%and x direction and computes the complete transformation matrix.
%The function returns the value as T.
% The angle inputs are in terms of degree.
function [T]= Trans1(d,q,a,Y)
%Here all the values are multiplied by factor (pi/180) to convert it to
%radians
Rotz=[cosd(q), -sind(q), 0, 0; sind(q), cosd(q), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
Transz=[1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, d; 0, 0, 0, 1];
Transx=[1, 0, 0, a; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
Rotx=[1, 0, 0, 0; 0, cosd(Y), -sind(Y), 0; 0, sind(Y), cosd(Y), 0; 0, 0, 0, 1];
T=Rotz*Transz*Transx*Rotx;
end


