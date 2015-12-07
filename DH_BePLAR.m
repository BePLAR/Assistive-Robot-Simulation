%%%%%%%%%%%%%%%-----------------BePLAR------------------%%%%%%%%%%%%%%%%%%%
%This program displays the stick model of the BePLAR robot with all the 
%joints highlighted.
%Last Edit: 11/01/2015

%% Robot Description
%The Robot consists of total 11 DOF which are described as follows:
%      Movable differential base    1 DOF
%      Tilt mechanism               1 DOF
%      Right Arm                    4 DOF
%      Left Arm                     4 DOF


%% Right Arm DH Table
%Input joint variables for trunk and right arm
%joint_values_right1=Rotation angle about vertical trunk
%joint_values_right2=Prismatic joint variable for height adjustment
%joint_values_right3=Rotation angle about shoulder to spread the arms
%joint_values_right4=Rotation angle about shoulder to move arms forward
%joint_values_right5=Rotation angle about elbow to lift the patient 
%joint_values_right6=Rotation angle about wrist to provide holding grip
%joint_values_right=[0 18 -60 45 -45 0];

clear;clc;close all;
syms joint_values_right1 joint_values_right2 joint_values_right3 joint_values_right4 joint_values_right5 joint_values_right6
%Putting in the DH matrix calculated pattern d theta a  alpha
DH_right=[28,0,0,pi/2;
    0,pi/2,0,-pi/2;
    0,-pi/2+joint_values_right1,0,0;
    0,0,0,-pi/2;
    0,-pi/2,0,0;
    joint_values_right2,0,0,0;
    0,0,15,0;
    0,joint_values_right3,0,pi/2;
    0,pi/2,0,-pi/2;
    0 -pi/2+joint_values_right4 -15 0;
    0, joint_values_right5,-25,0;
    0, -joint_values_right6,-11,0];
T1=[1,0,0,0;
    0,1,0,0;
    0,0,1,0;
    0,0,0,1;];
X_right=[0,0,0,0,0,0,0,0,0,0,0,0,0];
Y_right=[0,0,0,0,0,0,0,0,0,0,0,0,0];
Z_right=[0,0,0,0,0,0,0,0,0,0,0,0,0];


for i=1:12
    j=1;
    %A function 'Trans' is used to calculate the complete transformation matrix
    T=Trans1(DH_right(i,j),DH_right(i,j+1),DH_right(i,j+2),DH_right(i,j+3));
    %As we know that in T matrix first  values of column 4 represents the
    %position vector, we shall extract these values seperately.
    T1=T1*T;
    T1=simplify(T1);
       disp(T1)
     P= [1,1,1;
         0,0,0;
         1,1,1;
         1,1,1;
         1,1,1;
         1,1,1];
     
T1=vpa(T1,4);
Q_Right=[diff(T1(1:3,4),joint_values_right1), diff(T1(1:3,4),joint_values_right2), diff(T1(1:3,4),joint_values_right3), diff(T1(1:3,4),joint_values_right4),diff(T1(1:3,4),joint_values_right5), diff(T1(1:3,4),joint_values_right6)];
Q_Right=transpose(Q_Right); 
J_Right=[Q_Right;P];
disp(J_Right)
end

%% Left Arm DH Table 
%Input joint variables for trunk and left arm
%joint_values_left1=Rotation angle about vertical trunk
%joint_values_left2=Prismatic joint variable for height adjustment
%joint_values_left3=Rotation angle about shoulder to spread the arms
%joint_values_left4=Rotation angle about shoulder to move arms forward
%joint_values_left5=Rotation angle about elbow to lift the patient 
%joint_values_left6=Rotation angle about wrist to provide holding grip
%The first 2 joints would always assume same value in left & right arm DH
%Table
joint_values_left=[0 18 0 60 0 0];
syms joint_values_left1 joint_values_left2 joint_values_left3 joint_values_left4 joint_values_left5 joint_values_left6
DH_left=[28,0,0,pi/2;
    0,pi/2,0,-pi/2;
    0,-pi/2+joint_values_left1,0,0;
    0,0,0,-pi/2;
    0,-pi/2,0,0;
    joint_values_left2,0,0,0;
    0,0,-15,0;
    0,joint_values_left3,0,pi/2;
    0,pi/2,0,-pi/2;
    0 -pi/2+joint_values_left4 -15 0;
    0, joint_values_left5,-25,0;
    0, -joint_values_left6,-11,0];
X_left=[0,0,0,0,0,0,0,0,0,0,0,0];
Y_left=[0,0,0,0,0,0,0,0,0,0,0,0];
Z_left=[0,0,0,0,0,0,0,0,0,0,0,0];
T2=[1,0,0,0;
    0,1,0,0;
    0,0,1,0;
    0,0,0,1;];
for i=1:12
    j=1;
    T=Trans1(DH_left(i,j),DH_left(i,j+1),DH_left(i,j+2),DH_left(i,j+3));
    %As we know that in T matrix first  values of column 4 represents the
    %position vector, we shall extract these values seperately.
    T2=T2*T;
    T2=simplify(T2);
    disp(T2)
    % P is the last 3 rows of the Jacobian Matrix
     P= [1,1,1;
         0,0,0;
         1,1,1;
         1,1,1;
         1,1,1;
         1,1,1];
     %disp(P)
T2=vpa(T2,4);
%
Q_Left=[diff(T2(1:3,4),joint_values_left1), diff(T2(1:3,4),joint_values_left2), diff(T2(1:3,4),joint_values_left3), diff(T2(1:3,4),joint_values_left4),diff(T2(1:3,4),joint_values_left5), diff(T2(1:3,4),joint_values_left6)];
Q_Left=transpose(Q_Left); 
J_Left=[Q_Left;P];
disp(J_Left) 
end
