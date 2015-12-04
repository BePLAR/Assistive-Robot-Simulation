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
%joint_values_right(1)=Rotation angle about vertical trunk
%joint_values_right(2)=Prismatic joint variable for height adjustment
%joint_values_right(3)=Rotation angle about shoulder to spread the arms
%joint_values_right(4)=Rotation angle about shoulder to move arms forward
%joint_values_right(5)=Rotation angle about elbow to lift the patient 
%joint_values_right(6)=Rotation angle about wrist to provide holding grip
joint_values_right=[0 18 -60 45 -45 0];
%Putting in the DH matrix calculated pattern d theta a  alpha
DH_right=[28,0,0,90;
    0,90,0,-90;
    0,-90+joint_values_right(1),0,0;
    0,0,0,-90;
    0,-90,0,0;
    joint_values_right(2),0,0,0;
    0,0,15,0;
    0,joint_values_right(3),0,90;
    0,90,0,-90;
    0 -90+joint_values_right(4) -15 0;
    0, joint_values_right(5),-25,0;
    0, -joint_values_right(6),-11,0];
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
    X_right(i+1)=T1(1,4);
    Y_right(i+1)=T1(2,4);
    Z_right(i+1)=T1(3,4) ; 
end
%% Left Arm DH Table 
%Input joint variables for trunk and left arm
%joint_values_left(1)=Rotation angle about vertical trunk
%joint_values_left(2)=Prismatic joint variable for height adjustment
%joint_values_left(3)=Rotation angle about shoulder to spread the arms
%joint_values_left(4)=Rotation angle about shoulder to move arms forward
%joint_values_left(5)=Rotation angle about elbow to lift the patient 
%joint_values_left(6)=Rotation angle about wrist to provide holding grip
%The first 2 joints would always assume same value in left & right arm DH
%Table
joint_values_left=[0 18 0 60 0 0];
DH_left=[28,0,0,90;
    0,90,0,-90;
    0,-90+joint_values_left(1),0,0;
    0,0,0,-90;
    0,-90,0,0;
    joint_values_left(2),0,0,0;
    0,0,-15,0;
    0,joint_values_left(3),0,90;
    0,90,0,-90;
    0 -90+joint_values_left(4) -15 0;
    0, joint_values_left(5),-25,0;
    0, -joint_values_left(6),-11,0];
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
    X_left(i+1)=T2(1,4);
    Y_left(i+1)=T2(2,4);
    Z_left(i+1)=T2(3,4) ; 
end

display('Position Vector is:')
figure
scatter3(X_right,Y_right,Z_right,'filled','MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
line(X_right,Y_right,Z_right,'LineWidth',2.5,'Color',[.9 .5 .5])
hold on
scatter3(X_left,Y_left,Z_left,'filled','MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
line(X_left,Y_left,Z_left,'LineWidth',2.5)
axis equal
title('BePLAR Position: Releasing')
xlabel('x')
ylabel('y')
zlabel('z')
