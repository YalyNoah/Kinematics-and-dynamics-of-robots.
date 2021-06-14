%Inverse kinematics (4.1.6)

%const
d1=0.5;
a2=0.3;
a3=0.25;
d5=0.15;

%The user enters coordinates (we used the points from the forword
%kinematics)
x=0;
y=3/10;
z=9/20;
Rn=[0 0 1;0 -1 0;1 0 0];

%First 3 degrees of freedom
%T1
t1=atan2(y,x);% (+-y)right or left arm 
T1=t1*180/pi %radian to degrees

%T2
cos2=(x-a2*cos(t1))/a3*cos(t1); 
sin2=sqrt(1-(cos2)^2);
sin2=real(sin2);
t2=atan2(sin2,cos2);
t2b=atan2(-sin2,cos2); %Top or bottom arm 
T2=t2*180/pi

%d2
d2=z-d1+a3*sin(t2)

%First 3 degrees of freedom
%R0_4*R=R5_7
A1=[cos(t1) -sin(t1) 0 0 ; sin(t1) cos(t1) 0 0; 0 0 1 d1; 0 0 0 1];
A2=[1 0 0 0; 0 1 0 0; 0 0 1 d2; 0 0 0 1];
A3=[1 0 0 a2; 0 0 1 0; 0 -1 0 0; 0 0 0 1];   
A4=[cos(t2) 0 -sin(t2) a3*cos(t2); sin(t2) 0 cos(t2) a3*sin(t2); 0 -1 0 0; 0 0 0 1]; 
    
R1=A1(1:3,1:3);
R2=A2(1:3,1:3);
R3=A3(1:3,1:3);
R4=A4(1:3,1:3);

R0_4=R1*R2*R3*R4;
Rt=transpose(R0_4)*Rn;

%T4
t4=atan2(sqrt(Rt(1,3)^2+Rt(2,3)^2),Rt(3,3)); %Top or bottom arm
T4=t4*180/pi

%T3
t3=atan2(Rt(2,3)/sin(t4),Rt(1,3)/sin(t4));
T3=t3*180/pi

%T5
t5=atan2(Rt(3,2)/sin(t4), -Rt(3,1)/sin(t4));
T5=t5*180/pi


