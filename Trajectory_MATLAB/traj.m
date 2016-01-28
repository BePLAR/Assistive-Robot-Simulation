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
%Joints = struct;

global joint_values_right
joint_values_right=[0 18 0 0 0 0];
global joint_values_left
joint_values_left=[0 18 0 0 0 0];


%% Robot trajectory Movements
%Home Position
%substituted_Right = subs(finalExpressionForRt,{t,x,Cb,k,kT,a,v},{1,0,40,2,4,1,1});
%rotq3=-45;
%for Q3=0:-5:rotq3;

%[X, Y, Z]=state1(0, 0, -45, 0, 0, 0);

%end



%joint_values_right(5)=joint_values_right(5)+Rot;

rotq4=-45;
for Q4=0:-5:rotq4;

[X, Y, Z]=state1(0, 0, 0, Q4, 0 ,0,Q4);

end
joint_values_right(4)=joint_values_right(4)+rotq3;
joint_values_left(4)=joint_values_left(4)+rotq3;

rotq3=-45;
for Q3=0:-5:rotq3;

[X, Y, Z]=state1(0, 0,Q3,joint_values_right(4), 0, 0,joint_values_left(4));

end
joint_values_right(3)=joint_values_right(3)+rotq3;
joint_values_left(3)=joint_values_left(3)+rotq3;
%Q5 angle about elbow 

rotq5=-45;
for Q5=0:-5:rotq5;

[X, Y, Z]=state1(0, 0,joint_values_left(3), joint_values_right(4), Q5, 0,joint_values_left(4));

end
joint_values_right(5)=joint_values_right(5)+rotq5;
joint_values_left(5)=joint_values_left(5)+rotq5;
%Q5 angle about elbow 
Rot=-45;
for Q6=0:-5:Rot;

[X, Y, Z]=state1(0, 0, joint_values_left(3), joint_values_right(4), joint_values_left(5) ,Q6,joint_values_left(4));

end
joint_values_right(6)=joint_values_right(6)+Rot;
joint_values_left(6)=joint_values_left(6)+Rot;
Rot=-15;
for Q2=0:-1:Rot;

[X, Y, Z]=state1(0, Q2, joint_values_left(3), joint_values_right(4), joint_values_left(5) ,joint_values_left(6),joint_values_left(4));

end
joint_values_right(2)=joint_values_right(2)+Rot;
joint_values_left(2)=joint_values_left(2)+Rot;
Rot=45;
for Q4=0:5:Rot
    [X, Y, Z]=state1(0, Q2, joint_values_left(3), joint_values_right(4)+Q4, joint_values_left(5) ,joint_values_left(6),joint_values_left(4)-Q4);
end
